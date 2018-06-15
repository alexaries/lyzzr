package com.game.common.view {
import com.component.MovieClipCustom;
import com.game.vo.ActivityVO;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.main.icons.BaseIconViewUI;

public class BaseIconView extends Box {

    public var ui:BaseIconViewUI;
    public var gotoActivitySignal:SignalDispatcher;

    private var _vo:ActivityVO;

    private function gotoActivityHandler():void {
        gotoActivitySignal.dispatch([_vo]);
    }

    public function BaseIconView() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BaseIconViewUI();
        addChild(ui);
        this.ui.on(Event.CLICK, this, gotoActivityHandler);
    }

    public function init(vo:ActivityVO, index:int, signal:SignalDispatcher):void {
        this._vo = vo;
        this.gotoActivitySignal = signal;
        ui.txtName.text = _vo.name;
        ui.imgIcon.skin = _vo.imgUrl;
//        if (_vo.openfunc.guide_name) {
//            this.name = _vo.openfunc.guide_name;
//        } else {
//            this.name = "";
//        }
    }

    /**
     * 显示常态特效 光圈 流光等等
     */
    private var mc:MovieClipCustom;

    public function showNormalEffect(keyId:String):void {
        if (mc && mc.parent) {
            this.removeChild(mc);
        }
        if (!mc) {
            mc = new MovieClipCustom();
        }
        mc.loadAtlas("clip/", "effect", true);
        this.addChild(mc);
        mc.x = 74;
        mc.y = 55;
        mc.gotoAndPlay(keyId, true);
    }

    public function removeNormalEffect():void {
        if (mc && mc.parent) {
            this.removeChild(mc);
            mc.dispose();
            mc = null;
        }
    }

    public function setTxt(str:String):void {
        ui.txtName.text = str;
    }

    public function setBg(url:String):void {
        ui.imgIcon.skin = "";
        ui.imgIcon.skin = url;
    }

    public function setSize(x:int, y:int):void {
        this.size(x, y);
    }

    public function setScale(value:Number):void {
        this.scale(value, value);
    }

//    /**
//     * 图标上飘着随机的加号
//     */
//    private var ques:Array = [];
//    private function createRandomPlus():void{
//        var txt:Text;
//        var list:Array;
//        var que:Queue;
//        txt = plus();
//        txt.x = 10 + Math.random()*85;
//        txt.y = 35 + Math.random()*40;
//        txt.alpha = 1;
//        this.addChild(txt);
//        list = [
//            new TweenOper(txt,1500,{alpha:0,y:-10}),
//            new FunctionOper(this,removeRandomPlus,[txt]),
//            // new FfTimeoutOper(500)
//            ];
//        que = new Queue(list);
//        ques.push(que);
//        que.execute();
//    }
//
//    private var txts:Array = [];
//    private function plus():Text{
//        var txt:Text = txts.pop();
//        if(!txt){
//            txt = new Text();
//        }
//        txt.text = "+";
//        txt.color = "#64f404";
//        txt.fontSize = 40;
//        txt.bold = true;
//        txt.font = "Microsoft YaHei";
//        txt.cacheAsBitmap = true;
//        return txt;
//    }
//
//    private function removeRandomPlus(s:Text=null):void{
//        if(s && s.parent){
//            this.removeChild(s);
//            txts.push(s);
//        }
//        ques = ArrayUtil.filter(ques,function(q:Queue):Boolean{
//            if(q && q.step == Oper.END){
//                q.halt();
//                return false;
//            }
//            return true;
//        });
//        if(ques.length < 6){
//            createRandomPlus();
//        }
//    }
//
//    private function removeAllQueue():Boolean{
//        ques = ArrayUtil.filter(ques,function(q:Queue):Boolean{
//            if(q){
//                q.halt();
//                return false;
//            }
//            return true;
//        });
//
//        return ques.length==0;
//    }

    public function updateName(n:String):void {
        ui.txtName.text = n;
    }
}
}