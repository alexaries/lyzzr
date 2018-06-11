/**
 * Created by huangcb on 2017/11/10.
 */
package com.game.utils {
import com.component.MovieClipCustom;
import com.component.RenderMovieClip;
import com.game.common.operation.Queue;
import com.game.common.operation.MovieClipOper;
import com.game.module.battle.oper.FfQueueMovieClipOper;

import laya.display.Node;
import laya.ui.Label;

import net.consts.AppConst;

import net.consts.StaticConfig;

import utils.CSSStyleCfg;

public class MovieClipUtil {
    static public function showUI(parent:Node,x:int,y:int, keyId:String,_scalex:Number = 1,_scaley:Number = 1,_timeScale:Number = 1):void {

        var pathUrl:String="";
        var mc:MovieClipCustom=new MovieClipCustom();
        mc.loadAtlas("clip/", "effect",true);
        parent.addChild(mc)
        mc.x=x;
        mc.y=y;
        mc.scaleX = _scalex;
        mc.scaleY = _scaley
        mc.timeScale = _timeScale
        new MovieClipOper(mc).execute();
        mc.gotoAndPlay(keyId)
    }

    static  public function levelUpEffect(lv:String):void {
        MovieClipUtil.showUI(  Laya.stage, AppConst.width / 2, AppConst.height / 2, "shengji");
        var label:Label = new Label();
        label.text = lv ;
        Laya.stage.addChild(label);
        label.font = CSSStyleCfg.defaultFontName;
        label.fontSize = 50;
        label.pos(AppConst.width / 2 - 180, AppConst.height / 2 - 360);
        label.color = "#feffec";
        Laya.timer.once(1000, label, label.destroy);
    }


    /**显示一次特效，可设置缩放比*/
    static public function showRenderEff(parent:Node,x:int,y:int, keyId:String,scaleX:Number=0,scaleY:Number=0):void
    {
        var mc:RenderMovieClip=new RenderMovieClip();
        mc.loadAtlas("clip/", "effect",true);
        parent.addChild(mc);
        mc.x=x;
        mc.y=y;
        new MovieClipOper(mc).execute();
        mc.scaleX = scaleX;
        mc.scaleY = scaleY;
        mc.gotoAndPlay(keyId)
    }
}
}
