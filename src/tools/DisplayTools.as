/**
 * Created by guanll on 2017/9/19.
 */
package tools {
import com.component.EffectPlayer;

import laya.display.Sprite;
import laya.maths.Point;
import laya.ui.TipManager;
import laya.utils.Handler;
import laya.utils.Pool;

import ui.dialog.TipsUI;

import utils.CSSStyleCfg;

public class DisplayTools {
    static var __instance:DisplayTools;
    public function DisplayTools() {
    }

    public static function getInstance():DisplayTools {
        if (__instance == null) {
            __instance = new DisplayTools();
        }
        return __instance;
    }

//    /**
//     * value "+523" 包含字符：+ - 0 1 2 3 4 5 6 7 8 9
//     * color：支持blue green red yellow
//     * 数字图片的大小60*60
//    **/
//    public function createFightNums(value:String,color:String):Sprite{
//        var numsContainer:Sprite = new Sprite();
//        var chars:Array = value.split("");
//        var img:Image;
//        var pathPre:String = "main/numberRes/"+color+"/";
//        for(var i:int = 0;i < chars.length;i++){
//            img = new Image();
//            img.skin = pathPre+chars[i]+".png";
//            img.y = 0;
//            img.x = i*60;
//            numsContainer.addChild(img);
//        }
//        return numsContainer;
//    }
//
//    /**
//     * 生成数字 需要在icon内飘出展示
//     */
//    public function createNumBubble(num:String):Sprite{
//        var txt:Text = new Text();
//        txt.text = num + "";
//        txt.color = "#fbfb08";
//        txt.fontSize = 30;
//        txt.font = "Microsoft YaHei";
//        return txt;
//    }

    public var tipManager:TipManager;
    public function getDefaultTip(tip:String):Handler{
        var s:Sprite = getDefaultTipSp(tip);
        return Handler.create(this,showDefaultTip,[s],false);
    }

    private function getDefaultTipSp(tip:String):Sprite{
        var ui:TipsUI = new TipsUI();
        ui.contentHtml.visible = false;
        ui.content.text = tip;
        ui.content.wordWrap = false;
        ui.content.padding = [5,5,5,5];
        if(ui.content.width > 500){
            ui.content.wordWrap = true;
            ui.content.width = 500;
        }
        ui.width = ui.bg.width = ui.frame.width = ui.content.width + 10;
        ui.height = ui.bg.height = ui.frame.height = ui.content.height + 10;

        return ui;
    }

    private function showDefaultTip(s:Sprite):void{
        tipManager.showDislayTip(s);
    }

    public function getHtmlTip(tip:String):Handler
    {
        var s:Sprite = getHtmlTipSp(tip);
        return Handler.create(this,showDefaultTip,[s],false);
    }

    private function getHtmlTipSp(tip:String):Sprite{
        var ui:TipsUI = new TipsUI();
        ui.content.visible = false;

        ui.contentHtml.style.lineHeight = 40;
        ui.contentHtml.style.width = 500;
        ui.contentHtml.style.color = "#ffeb0a";
        ui.contentHtml.style.fontFamily = CSSStyleCfg.defaultFontName;
        ui.contentHtml.style.fontSize = 32;
        ui.contentHtml.innerHTML = tip;

        ui.width = ui.bg.width = ui.frame.width = ui.contentHtml.width + 10;
        ui.height = ui.bg.height = ui.frame.height = ui.contentHtml.height + 20;

        return ui;
    }

//    public function showDefaultTipDlg(tip:String):Handler{
//        var s:Sprite = getDefaultTipSp(tip);
//        var dlg:Dialog = new Dialog();
//        dlg.addChild(s);
//        dlg.onClosed = overrideDlgOnClosed(dlg);
//        return Handler.create(this,popupDlg,[dlg],false);
//    }
//
//    public function showHtmlTipDlg(tip:String):Handler{
//        var s:Sprite = getHtmlTipSp(tip);
//        var dlg:Dialog = new Dialog();
//        dlg.addChild(s);
//        dlg.onClosed = overrideDlgOnClosed(dlg);
//        return Handler.create(this,popupDlg,[dlg],false);
//    }
//
//    private function popupDlg(d:Dialog):void{
//        d.popup(true);
//    }
//
//    public function overrideDlgOnClosed(dlg:Dialog):Function{
//        return function(type:String = null):void{
//            if(dlg.closeHandler){
//                dlg.closeHandler.clear();
//            }
//            dlg.closeHandler = null;
//        };
//    }

    public function addFangLiuguangEff(owner:Sprite):EffectPlayer{
        var mc:EffectPlayer = Pool.getItemByClass("EffectPlayer", EffectPlayer);
        mc.loadImages(["clip/fang_liuguang/1.png","clip/fang_liuguang/2.png",
            "clip/fang_liuguang/3.png","clip/fang_liuguang/4.png",
            "clip/fang_liuguang/5.png","clip/fang_liuguang/6.png",
            "clip/fang_liuguang/7.png","clip/fang_liuguang/8.png",
             "clip/fang_liuguang/9.png","clip/fang_liuguang/10.png",
             "clip/fang_liuguang/11.png","clip/fang_liuguang/12.png",
             "clip/fang_liuguang/13.png","clip/fang_liuguang/14.png"],"fang_liuguang");
        mc.sizeGrid = "18,18,18,18";
        mc.interval = 160;
        mc.width = owner.width+36;
        mc.height = owner.height+36;
        var point:Point = owner.localToGlobal(Point.TEMP.setTo(0, 0), true);
        mc.x = point.x - 18;
        mc.y = point.y - 18;
        Laya.stage.addChild(mc);
        return mc;
    }

    public function removeFangLiuguangEff(mc:EffectPlayer):void{
        if(mc){
            mc.visible = true;//恢复到默认属性
            mc.stop();
            mc.removeSelf();
            Pool.recover("EffectPlayer",mc);
        }
    }
}
}
