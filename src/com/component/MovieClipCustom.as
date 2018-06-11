/**
 * Created by huangcb on 2017/9/4.
 */
package com.component {
import com.signal.SignalDispatcher;

import laya.display.Sprite;
import laya.ui.AutoBitmap;
import laya.ui.Clip;
import laya.utils.Pool;

public class MovieClipCustom extends Sprite {

    /**默认图*/
    protected var _bitmap:MovieClipAutoBitmap;
    private var _timeScale:Number = 1;
    var currentMovieClipLabel:MovieClipLabel
    public var onCompleteSignal:SignalDispatcher;

    var loader:MovieClipLoader;
    protected var isDispose:Boolean;
    public function MovieClipCustom() {
        super();
        onCompleteSignal = new SignalDispatcher();
        init();
        MovieClipStage.getInstance().add(this)


    }

    public function loadCond(atlas:ITextureAtlas_atlas):Boolean {
        return true;
    }
    public function init():void {
        graphics = _bitmap =   Pool.getItemByClass("MovieClipAutoBitmap", MovieClipAutoBitmap);
    }
    public function set sizeGrid(value:Array):void {

        if(_bitmap){
            _bitmap.sizeGrid=value;
        }
    }
    public function dispatchEventWith(COMPLETE:String):void {
        onCompleteSignal.dispatch(COMPLETE);
    }



    public function loadAtlas(pathUrl:String, keyId:String, waitPlay:Boolean = false):void {
        if(isDispose) return;
        if(pathUrl.indexOf("null")!=-1){
            trace(pathUrl);
            return;
        }
        var atlasUrl:String=pathUrl + keyId + ".json";
        name=atlasUrl;
        if (loader && loader.getAtlasUrl() == atlasUrl) {
            return;
        }
        if (loader && loader.getAtlasUrl() != atlasUrl) {
            reset();
        }
        loader = new MovieClipLoader(this);
        loader.loadAtlas(pathUrl, keyId, waitPlay);
    }

    public function gotoAndPlay(frame:String, loop:Boolean = false):void {

        if(loader==null){
            return  ;
        }

        loader._currentFrameLabel = frame;
        loader._currentFrameLoop = loop;
        //增加cmd?
        if (hasLabel(frame)) {
            if (currentLabel != null) {
                currentLabel.stop();
            }
            //trace("@gotoAndPlay",frame)
            currentMovieClipLabel = getLabel(frame);
            currentMovieClipLabel.loop = loop;

            stop();
            play()
        } else {
            loader.loadedAtlasAndPlay(frame);
        }

    }

    protected function reset():void {
        if (loader) {
            _bitmap.source=null;
            stop();
            timeScale = 1;
            loader.dispose();
            loader = null;
            currentMovieClipLabel=null;

        }

    }


    public function advanceTime(passedTime:Number):void {

        if(currentFrameLabel=="wuping_shengji"){

                trace("wuping_shengji");
        }
        if(isDispose)return
        if (!isPlaying) return;

            currentLabel.advanceTime(passedTime);
            if( _bitmap&&_bitmap.source!=currentLabel.texture)
                _bitmap.source= currentLabel.texture;

    }


    public function play():void {
        if (currentMovieClipLabel != null)
            currentLabel.play();

    }

    public function stop():void {
        if (currentMovieClipLabel != null)
            currentLabel.stop();
    }


    function getLabel(labelName:String):MovieClipLabel {
        if(loader==null){
            return null;
        }
        return loader.getLabel(labelName);
    }


    public function hasLabel(labelName:String):Boolean {
        return getLabel(labelName) != null;

    }

    public function getFrames(labelName:String):int {
        if (hasLabel(labelName))
            return getLabel(labelName).numFrames;
        return 0;
    }

    public function getTime(labelName:String, count:int):int {
        if (hasLabel(labelName))
            return count * getLabel(labelName).defaultFrameDuration;
        return 0;
    }

    public function get currentFrameLabel():String {
        if(loader==null) return "";
        return loader._currentFrameLabel;
    }

    public function get currentLabel():MovieClipLabel {
        return currentMovieClipLabel;
    }


    public function get isPlaying():Boolean {
        return currentMovieClipLabel != null && currentMovieClipLabel.isPlaying;
    }

    public function get totalFrames():int {
        return currentMovieClipLabel.numFrames;
    }
    public function clear():void {
        reset();
    }

    public function dispose():void {


        destroy();

    }


    override public function destroy(destroyChild:Boolean = true):void {
        if(isDispose) return;
        if(_bitmap){
            Pool.recover("MovieClipAutoBitmap", _bitmap);
            _bitmap.destroy();
            _bitmap=null;
        }
        isDispose=true;
        if (loader) {
            stop();
            loader.dispose();
            loader = null;
        }
        onCompleteSignal.dispose();

        MovieClipStage.getInstance().remove(this);
        super.destroy(destroyChild);
    }
    public function set timeScale(__timeScale:Number):void {
        if (_timeScale != __timeScale) {
            _timeScale = __timeScale;
            if(loader)
                loader.setTimeScale(__timeScale)
        }


    }

    public function get timeScale():Number {
        return _timeScale;
    }
}
}
