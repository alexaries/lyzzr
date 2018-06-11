/**
 * Created by huangcb on 2017/9/7.
 */
package com.game.module.task.view {
import com.component.EffectPlayer;
import com.game.common.view.BaseWindow;
import com.game.module.task.mediator.TaskGuidMediator;
import com.game.module.task.utils.TaskUtils;
import com.component.DownTime;
import com.game.module.task.vo.TaskGuideVo;
import com.game.utils.ShellUtils;
import com.game.vo.TaskCfg;
import com.signal.SignalDispatcher;

import lang.LangTxt;

import laya.events.Event;
import laya.html.dom.HTMLDivElement;
import laya.net.Loader;
import laya.utils.Handler;
import laya.utils.HitArea;

import net.consts.AppConst;

import com.game.common.mvc.BaseMediator;

import tools.DisplayTools;

import ui.task.TaskGuideUI;

import utils.CSSStyleCfg;
import utils.StringUtil;

public class TaskGuideView extends BaseWindow {
    public static var TEMP_TITLE:String = "<{0}>";
    public var data:TaskGuideVo;
    var ui:TaskGuideUI;
    public var onLabClickSignal:SignalDispatcher
    public var onBtnFinishSignal:SignalDispatcher

    public var closeFuncEnable:Boolean;

  //  var downTime:DownTime
    public function TaskGuideView() {
        super(["任务素材",{url: AppConst.atlasPath + "module/task.json", type: Loader.ATLAS}]);

        ui = new TaskGuideUI()
        onLabClickSignal = new SignalDispatcher()
        onBtnFinishSignal = new SignalDispatcher();
    }


    override public function dispose():void {
        DisplayTools.getInstance().removeFangLiuguangEff(mc);
     //   if(downTime){
      //      downTime.stop();
    //        downTime=null;
    //    }
        onLabClickSignal.dispose();
        onBtnFinishSignal.dispose();
        ui.bg.off(Event.CLICK, this, onBgClick);
        ui.btnFinish.clickHandler.clear();
        ui.btnFinish.clickHandler = null;
        ui.labTalk.off(Event.CLICK, this, onLabClick);
        super.dispose();

    }

    override public function getMediator():BaseMediator {
        return new TaskGuidMediator(this);
    }


    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
        if (data) {
            refresh();
        }
    }

    override public function onComplete():void {

        __onComplete();
        super.onComplete();

    }

    private var mc:EffectPlayer;
    function __onComplete():void {
        //  eventMap.mapListener(view.labTalk, MouseEvent.CLICK, onLabClick);
        //  eventMap.mapListener(view.btnFinish, MouseEvent.CLICK, onBtnFinish);
        ui.bg.on(Event.CLICK, this, onBgClick);
        ui.btnClose.on(Event.CLICK, this, tryDispose);
        ui.btnFinish.clickHandler = Handler.create(this, onBtnFinish);
        ui.labTalk.on(Event.CLICK, this, onLabClick);
        addChild(ui);
        center();
        if(mc==null){
            mc = DisplayTools.getInstance().addFangLiuguangEff(ui.labTalk);
        }


        var hit:HitArea = new HitArea();
        hit.hit.drawRect(0, 0, ui.bg.width, ui.bg.height, "#000000");
        ui.bg.hitArea = hit;

        hit.unHit.clear();
        hit.unHit.drawRect(110, 637, ui.frameBg.width, ui.frameBg.height, "#000000");

    }


    //小于45级 不能直接关闭界面
    private function onBgClick():void {
        if(!closeFuncEnable){
            return;
        }
        dispose();
    }

    private function onLabClick():void {

        onLabClickSignal.dispatch(null);
      //  if(downTime){
       //     downTime.stop();
        //    downTime=null;
       // }
    }

    private function onBtnFinish():void {
        onBtnFinishSignal.dispatch(null);
    }
    public function refreshMsg(downTimeStr:String):void {
        ui.txtContent.text = (data.talk.interactMsg == "" ? LangTxt.TASK_VIEW_11 : data.talk.interactMsg)+"("+downTimeStr+")";
    }
    public function refresh():void {
        ui.spHalf.visible = data.hasHalf;
        ui.spHead.visible = !data.hasHalf;

        if (data.npc) {
            var halfUrl:String = ShellUtils.toHalfURL(data.npc);
            var headUrl:String = ShellUtils.toHeadURL(data.npc);
            trace("halfUrl", halfUrl);
            trace("headUrl", headUrl);
            ui.mcHalf.skin = halfUrl;
            ui.imgHead.skin = headUrl;

            ui.taTalk.text = data.msg ? "    " + data.msg : "    ...";
            ui.labLv.text = String(data.npc.level);
            ui.labName.text = data.npc.name;
            ui.labName2.text = data.npc.name;
            ui.labTitle.text = "";
            ui.labTitle2.text = "";
            if (data.npc.title != "") {
                ui.labTitle.text = StringUtil.substitute(ShellUtils.TEMP_TITLE, [(data.npc.title)]);
                ui.labTitle2.text = StringUtil.substitute(ShellUtils.TEMP_TITLE, [(data.npc.title)]);
            }


            var award:String = StringUtil.substitute(TaskUtils.TEMP_MAIN_AWARD, [toAward(data.task)]);
            setDefaultCSS(ui.taReward);
            ui.taReward.innerHTML =""// award;
            ui.btnFinish.visible = false;
            ui.taReward.y = ui.taTalk.y + ui.taTalk.textHeight + 5;

            ui.txtContent.text = (data.talk.interactMsg == "" ? LangTxt.TASK_VIEW_11 : data.talk.interactMsg) ;
         //   if(downTime){
         //       downTime.stop();
        //        downTime=null;
        //    }
      //      downTime=new DownTime(5,Handler.create(this,refreshMsg,null,false),Handler.create(this,onLabClick,null,false));
       //     downTime.start();
        }

        if(mc){
            mc.play(0,true,"fang_liuguang");
        }

//        ui.imgTxtBg.visible = closeFuncEnable;
//        ui.txtInfo.visible = closeFuncEnable;
        ui.bg.visible = closeFuncEnable;
        var hit:HitArea = new HitArea();
        if(closeFuncEnable){
            //全部可点
            hit.hit.clear();
            hit.hit.drawRect(0, 0, AppConst.width, AppConst.height, "#000000");
            hit.unHit.clear();
        }else{
            //只有中间区域可点
            hit.unHit.clear();
//            hit.unHit.drawRect(0, 0, AppConst.width, AppConst.height, "#000000");
            hit.hit.clear();
            hit.hit.drawRect(-110,637,ui.frameBg.width,ui.frameBg.height, "#000000");
        }
        ui.hitArea = hit;
        this.hitArea = hit;

    }

    private function setDefaultCSS(s:HTMLDivElement):void {
        s.style.fontFamily = CSSStyleCfg.defaultFontName;
        s.style.lineHeight = 40;
        s.style.color = "#ffd542";
        s.style.fontSize = CSSStyleCfg.defaultFontSize;
        s.style.align = "left";
        s.style.valign = "middle";
        s.style.width = 636;
        s.style.height = 124;
    }

    private function toAward(taskVo:TaskCfg):String {
        var html:String;
        if (taskVo) {
            html = TaskUtils.toTaskAward(taskVo.id).join("&nbsp;&nbsp;&nbsp;&nbsp;");
        }
        return html;
    }
}
}