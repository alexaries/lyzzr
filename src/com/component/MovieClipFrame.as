/**
 * Created by huangcb on 2017/8/30.
 */
package com.component {
import laya.media.Sound;
import laya.resource.Texture;

public class MovieClipFrame {
    public function MovieClipFrame() {

    }

    public var texture:Texture;
    public var sound:MovieClipSound;
    public var duration:Number;
    public var startTime:Number;
    public var action:Function;

    public function playSound():void {
        if (sound) sound.play(0 );
    }

    public function executeAction(movie:MovieClipLabel, frameID:int):void {
        if (action != null) {
            var numArgs:int = action.length;

            if (numArgs == 0) action();
            else if (numArgs == 1) action(movie);
            else if (numArgs == 2) action(movie, frameID);
            else throw new Error("Frame actions support zero, one or two parameters: " +
                "movie:MovieClip, frameID:int");
        }
    }

    public function init(texture:Texture, duration:Number = 0.1, startTime:Number = 0):void {
        this.texture = texture;
        this.duration = duration;
        this.startTime = startTime;
    }

    public function dispose():void {
        this.texture = null;
        this.duration = 0;
        this.startTime = 0;
    }
}
}
