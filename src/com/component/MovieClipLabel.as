package com.component {

import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.resource.Texture;
import laya.utils.Pool;

import utils.ArrayUtil;

public class MovieClipLabel {
    private var _frames:Vector.<MovieClipFrame>;
    private var _defaultFrameDuration:Number;
    private var _currentTime:Number;
    private var _currentFrameID:int;
    private var _loop:Boolean;
    private var _playing:Boolean;
    private var _muted:Boolean;
    private var _wasStopped:Boolean;
    public var texture:Texture;
    public var name:String;
    public var onCompleteSignal:SignalDispatcher=new SignalDispatcher();

    /** Creates a movie clip from the provided textures and with the specified default framerate.
     *  The movie will have the size of the first frame. */
    public function MovieClipLabel() {


    }

    public function init(textures:Vector.<Texture>, fps:Number):void {
        if (fps <= 0) throw ("Invalid fps: " + fps);
        var numFrames:int = textures.length;

        _defaultFrameDuration = 1.0 / fps;
        _loop = true;
        _playing = true;
        _currentTime = 0.0;
        _currentFrameID = 0;
        _wasStopped = true;
        _frames = new <MovieClipFrame>[];

        for (var i:int = 0; i < numFrames; ++i){
            var mcf:MovieClipFrame= Pool.getItemByClass("MovieClipFrame", MovieClipFrame);
            _frames[i] =mcf;
            mcf.init( textures[i], _defaultFrameDuration, _defaultFrameDuration * i);
        }

    }

    // frame manipulation

    /** Adds an additional frame, optionally with a sound and a custom duration. If the
     *  duration is omitted, the default framerate is used (as specified in the constructor). */
    public function addFrame(texture:Texture, sound:MovieClipSound = null, duration:Number = -1):void {
        addFrameAt(numFrames, texture, sound, duration);
    }

    /** Adds a frame at a certain index, optionally with a sound and a custom duration. */
    public function addFrameAt(frameID:int, texture:Texture, sound:MovieClipSound = null,
                               duration:Number = -1):void {
        if (frameID < 0 || frameID > numFrames) throw ("Invalid frame id");
        if (duration < 0) duration = _defaultFrameDuration;

        var frame:MovieClipFrame =Pool.getItemByClass("MovieClipFrame", MovieClipFrame);
        frame.init(texture, duration);
        frame.sound = sound;
        ArrayUtil.insertAt(_frames, frameID, frame);

        if (frameID == numFrames) {
            var prevStartTime:Number = frameID > 0 ? _frames[frameID - 1].startTime : 0.0;
            var prevDuration:Number = frameID > 0 ? _frames[frameID - 1].duration : 0.0;
            frame.startTime = prevStartTime + prevDuration;
        }
        else
            updateStartTimes();
    }

    /** Removes the frame at a certain ID. The successors will move down. */
    public function removeFrameAt(frameID:int):void {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        if (numFrames == 1) throw  "Movie clip must not be empty" ;

        ArrayUtil.removeAt(_frames, frameID);

        if (frameID != numFrames)
            updateStartTimes();
    }

    /** Returns the texture of a certain frame. */
    public function getFrameTexture(frameID:int):Texture {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        return _frames[frameID].texture;
    }

    /** Sets the texture of a certain frame. */
    public function setFrameTexture(frameID:int, texture:Texture):void {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        _frames[frameID].texture = texture;
    }

    /** Returns the sound of a certain frame. */
    public function getFrameSound(frameID:int):MovieClipSound {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        return _frames[frameID].sound;
    }

    /** Sets the sound of a certain frame. The sound will be played whenever the frame
     *  is displayed. */
    public function setFrameSound(frameID:int, sound:MovieClipSound):void {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        _frames[frameID].sound = sound;
    }

    /** Returns the method that is executed at a certain frame. */
    public function getFrameAction(frameID:int):Function {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        return _frames[frameID].action;
    }

    /** Sets an action that will be executed whenever a certain frame is reached. */
    public function setFrameAction(frameID:int, action:Function):void {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        _frames[frameID].action = action;
    }

    /** Returns the duration of a certain frame (in seconds). */
    public function getFrameDuration(frameID:int):Number {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        return _frames[frameID].duration;
    }

    /** Sets the duration of a certain frame (in seconds). */
    public function setFrameDuration(frameID:int, duration:Number):void {
        if (frameID < 0 || frameID >= numFrames) throw ("Invalid frame id");
        _frames[frameID].duration = duration;
        updateStartTimes();
    }

    /** Reverses the order of all frames, making the clip run from end to start.
     *  Makes sure that the currently visible frame stays the same. */
    public function reverseFrames():void {
        _frames.reverse();
        _currentTime = totalTime - _currentTime;
        _currentFrameID = numFrames - _currentFrameID - 1;
        updateStartTimes();
    }

    // playback methods

    /** Starts playback. Beware that the clip has to be added to a juggler, too! */
    public function play():void {
        _playing = true;
    }

    /** Pauses playback. */
    public function pause():void {
        _playing = false;
    }

    /** Stops playback, resetting "currentFrame" to zero. */
    public function stop():void {
        _playing = false;
        _wasStopped = true;
        currentFrame = 0;
    }

    // helpers

    private function updateStartTimes():void {
        var numFrames:int = this.numFrames;
        var prevFrame:MovieClipFrame = _frames[0];
        prevFrame.startTime = 0;

        for (var i:int = 1; i < numFrames; ++i) {
            _frames[i].startTime = prevFrame.startTime + prevFrame.duration;
            prevFrame = _frames[i];
        }
    }

    // IAnimatable

    /** @inheritDoc */
    public function advanceTime(passedTime:Number):void {
        if (!_playing) return;

        // The tricky part in this method is that whenever a callback is executed
        // (a frame action or a 'COMPLETE' event handler), that callback might modify the clip.
        // Thus, we have to start over with the remaining time whenever that happens.

        var frame:MovieClipFrame = _frames[_currentFrameID];

        if (_wasStopped) {
            // if the clip was stopped and started again,
            // sound and action of this frame need to be repeated.

            _wasStopped = false;
            frame.playSound();

            if (frame.action != null) {
                frame.executeAction(this, _currentFrameID);
                advanceTime(passedTime);
                return;
            }
        }

        if (_currentTime == totalTime) {
            if (_loop) {
                _currentTime = 0.0;
                _currentFrameID = 0;
                frame = _frames[0];
                frame.playSound();
                texture = frame.texture;

                if (frame.action != null) {
                    frame.executeAction(this, _currentFrameID);
                    advanceTime(passedTime);
                    return;
                }
            }
            else return;
        }

        var finalFrameID:int = _frames.length - 1;
        var restTimeInFrame:Number = frame.duration - _currentTime + frame.startTime;
        var dispatchCompleteEvent:Boolean = false;
        var frameAction:Function = null;
        var previousFrameID:int = _currentFrameID;
        var changedFrame:Boolean;

        while (passedTime >= restTimeInFrame) {
            changedFrame = false;
            passedTime -= restTimeInFrame;
            _currentTime = frame.startTime + frame.duration;

            if (_currentFrameID == finalFrameID) {
                if (hasEventListener(Event.COMPLETE)) {
                    dispatchCompleteEvent = true;
                }
                else if (_loop) {
                    _currentTime = 0;
                    _currentFrameID = 0;
                    changedFrame = true;
                }
                else return;
            }
            else {
                _currentFrameID += 1;
                changedFrame = true;
            }

            frame = _frames[_currentFrameID];
            frameAction = frame.action;

            if (changedFrame)
                frame.playSound();

            if (dispatchCompleteEvent) {
                texture = frame.texture;
                dispatchEventWith(Event.COMPLETE);
                advanceTime(passedTime);
                return;
            }
            else if (frameAction != null) {
                texture = frame.texture;
                frame.executeAction(this, _currentFrameID);
                advanceTime(passedTime);
                return;
            }

            restTimeInFrame = frame.duration;

            // prevent a mean floating point problem (issue #851)
            if (passedTime + 0.0001 > restTimeInFrame && passedTime - 0.0001 < restTimeInFrame)
                passedTime = restTimeInFrame;
        }

        if (previousFrameID != _currentFrameID)
            texture = _frames[_currentFrameID].texture;

        _currentTime += passedTime;
    }



    // properties

    /** The total number of frames. */
    public function get numFrames():int {
        return _frames.length;
    }

    /** The total duration of the clip in seconds. */
    public function get totalTime():Number {
        var lastFrame:MovieClipFrame = _frames[_frames.length - 1];
        return lastFrame.startTime + lastFrame.duration;
    }

    /** The time that has passed since the clip was started (each loop starts at zero). */
    public function get currentTime():Number {
        return _currentTime;
    }

    public function set currentTime(value:Number):void {
        if (value < 0 || value > totalTime) throw ("Invalid time: " + value);

        var lastFrameID:int = _frames.length - 1;
        _currentTime = value;
        _currentFrameID = 0;

        while (_currentFrameID < lastFrameID && _frames[_currentFrameID + 1].startTime <= value)
            ++_currentFrameID;

        var frame:MovieClipFrame = _frames[_currentFrameID];
        texture = frame.texture;
    }

    /** Indicates if the clip should loop. @default true */
    public function get loop():Boolean {
        return _loop;
    }

    public function set loop(value:Boolean):void {
        _loop = value;
    }

    /** If enabled, no new sounds will be started during playback. Sounds that are already
     *  playing are not affected. */
    public function get muted():Boolean {
        return _muted;
    }

    public function set muted(value:Boolean):void {
        _muted = value;
    }
 

    /** The index of the frame that is currently displayed. */
    public function get currentFrame():int {
        return _currentFrameID;
    }

    public function set currentFrame(value:int):void {
        if(_frames==null)return;
        if (value < 0 || value >= numFrames) throw ("Invalid frame id");
        currentTime = _frames[value].startTime;
    }

    /** The default number of frames per second. Individual frames can have different
     *  durations. If you change the fps, the durations of all frames will be scaled
     *  relatively to the previous value. */
    public function get fps():Number {
        return 1.0 / _defaultFrameDuration;
    }

    public function set fps(value:Number):void {
        if (value <= 0) throw ("Invalid fps: " + value);

        var newFrameDuration:Number = 1.0 / value;
        var acceleration:Number = newFrameDuration / _defaultFrameDuration;
        _currentTime *= acceleration;
        _defaultFrameDuration = newFrameDuration;

        for (var i:int = 0; i < numFrames; ++i)
            _frames[i].duration *= acceleration;

        updateStartTimes();
    }

    /** Indicates if the clip is still playing. Returns <code>false</code> when the end
     *  is reached. */
    public function get isPlaying():Boolean {
        if (_playing)
            return _loop || _currentTime < totalTime;
        else
            return false;
    }

    /** Indicates if a (non-looping) movie has come to its end. */
    public function get isComplete():Boolean {
        return !_loop && _currentTime >= totalTime;
    }

    public function get defaultFrameDuration():Number {
        return _defaultFrameDuration;
    }

    public function set defaultFrameDuration(value:Number):void {
        _defaultFrameDuration = value;
    }
    private function dispatchEventWith(COMPLETE:String):void {
        onCompleteSignal.dispatch(COMPLETE)
    }

    private function hasEventListener(COMPLETE:String):Boolean {
        return onCompleteSignal.hasEventListener();
    }
    public function dispose():void {
        stop();
        onCompleteSignal.dispose();
        for (var i:int = 0; i < _frames.length; i++) {
            var frame:MovieClipFrame = _frames[i];
            frame.dispose()
            Pool.recover("MovieClipFrame", frame);
        }
        _frames=null;
    }
}
}
