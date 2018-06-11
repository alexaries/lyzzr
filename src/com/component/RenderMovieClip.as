/**
 * Created by huangcb on 2017/11/10.
 */
package com.component {
import laya.resource.Texture;

public class RenderMovieClip extends MovieClipCustom {
    public function RenderMovieClip() {
        super();
    }

    override  public function advanceTime(passedTime:Number):void {


        if(isDispose)return
        if (!isPlaying) return;
        currentLabel.advanceTime(passedTime);

        if(_bitmap&& _bitmap.source!=currentLabel.texture){

            _bitmap.source = currentLabel.texture;

        }


    }
    override public function set height(value:Number):void {
        super.height = value;
        if(_bitmap ){

            _bitmap.height = value;

        }
    }

    override public function set width(value:Number):void {
        super.width = value;
        if(_bitmap ){

            _bitmap.width = value;

        }
    }
    override public function dispose():void {

        super.dispose();
        _bitmap=null;
    }
}
}
