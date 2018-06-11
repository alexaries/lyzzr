/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.view {
import com.component.EffectPlayer;
import com.game.common.operation.Queue;
import com.game.common.view.BaseWindow;
import com.game.common.operation.TimeoutOper;
import com.game.module.task.mediator.TaskDialogMediator;
import com.component.DownTime;
import com.game.module.task.view.cell.TaskDialogCell;
import com.game.module.task.vo.TaskDialogVo;
import com.game.module.task.vo.item.TaskDialogItemVo;
import com.game.utils.ShellUtils;
import com.game.vo.TaskCfg;
import com.signal.SignalDispatcher;

import globals.ConfigLocator;

import laya.events.Event;
import laya.maths.Rectangle;
import laya.net.Loader;
import laya.utils.Handler;
import laya.utils.HitArea;

import net.consts.AppConst;

import com.game.common.mvc.BaseMediator;

import net.data.structs.task.NpcInteractStruct;

import tools.DisplayTools;

import ui.task.TaskDialogUI;

import utils.StringUtil;

public class TaskDialogView extends BaseWindow {

    var ui:TaskDialogUI
    public var data:TaskDialogVo;
    public var doTileListOpenSignal:SignalDispatcher
    //var downTime:DownTime
    public var closeFuncEnable:Boolean;
    private var mc:EffectPlayer;

    public function TaskDialogView() {
        super(["任务素材",{url: AppConst.atlasPath + "module/task.json", type: Loader.ATLAS}]);
        doTileListOpenSignal = new SignalDispatcher();
    }


    override public function dispose():void {
        ui.lstTask.renderHandler.clear();
        //if(downTime){
        //    downTime.stop()
        //    downTime=null;
        //}
        super.dispose();
        doTileListOpenSignal.dispose();
        ui.btnClose.off(Event.CLICK, this, tryDispose);
        ui.bg.off(Event.CLICK, this, onBgClick);
        if(ui.lstTask.renderHandler){
            ui.lstTask.renderHandler.clear();
        }
        ui.offAll();
        if(mc){
            DisplayTools.getInstance().removeFangLiuguangEff(mc);
            mc=null;
        }


    }

    override public function getMediator():BaseMediator {
        return new TaskDialogMediator(this);
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

    function __onComplete():void {
        ui = new TaskDialogUI();
        addChild(ui);
        center();
        ui.lstTask.itemRender = TaskDialogCell;
        ui.lstTask.renderHandler = Handler.create(this, onRenderHandler, null, false);
        ui.btnClose.on(Event.CLICK, this, tryDispose);
        ui.bg.on(Event.CLICK, this, onBgClick);

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

    private function onRenderHandler(cell:TaskDialogCell, index):void {
        cell.init(ui.lstTask.array[index], index,doTileListOpenSignal);
        cell.layoutCell(ui.lstTask.array.length==1);
    }

    public function refresh():void {
        ui.spHalf.visible = data.hasHalf;
        ui.spHead.visible = !data.hasHalf;

        if (data.npc) {
            var halfUrl:String = ShellUtils.toHalfURL(data.npc);
            var headUrl:String = ShellUtils.toHeadURL(data.npc);
            trace("halfUrl", halfUrl)
            trace("headUrl", headUrl)
            ui.mcHalf.skin = halfUrl;
            ui.imgHead.skin = headUrl;


            ui.taTalk.text = data.npc.info ? "    " + data.npc.info : "    ...";
            ui.labLv.text = String(data.npc.level);
            ui.labName.text = data.npc.name;
            ui.labName2.text = data.npc.name;
            ui.labTitle.text = "";
            ui.labTitle2.text = "";
            if (data.npc.title != "") {
                ui.labTitle.text = StringUtil.substitute(ShellUtils.TEMP_TITLE, [(data.npc.title)]);
                ui.labTitle2.text = StringUtil.substitute(ShellUtils.TEMP_TITLE, [(data.npc.title)]);
            }
            var allTalks:Array=data.allTalks;
            if (allTalks) {
                ui.lstTask.array = allTalks;
                if(allTalks.length == 1 || allTalks.length == 2){
                    ui.lstTask.y = 1049;
                }else{
                    ui.lstTask.y = 981;
                }
              //  if(downTime){
              //      downTime.stop()
              //      downTime=null;
             //   }
                for (var i:int = 0; i < allTalks.length; i++) {
                    var item:NpcInteractStruct = allTalks[i];
                    var task:TaskCfg = ConfigLocator.getInstance().taskDic.get(item.interactId);
                    if(task&&item.guideState  ) {
                        var cell:TaskDialogCell =ui.lstTask.getCell(i) as TaskDialogCell;
                        cell.setVO(ui.lstTask.array[i]);
                        cell.layoutCell(ui.lstTask.array.length==1);
                //        downTime=new DownTime(5
                 //               ,Handler.create(cell,cell.refreshMsg ,null,false)
                 //               ,Handler.create(this, onOwerClick ,[item],false)
                //        );
                 //       downTime.start();
                        if(mc==null){
                            mc=  DisplayTools.getInstance().addFangLiuguangEff(cell);
                            if(mc){
                                mc.play(0,true,"fang_liuguang");
                            }
                        }

                        break;
                    }
                }

            }
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


        if(destroyed&&mc){
            DisplayTools.getInstance().removeFangLiuguangEff(mc);
            mc=null;
        }
        return;
    }
    public function onOwerClick(item:NpcInteractStruct):void {
        var taskDialogItemVo:TaskDialogItemVo = new TaskDialogItemVo();
        taskDialogItemVo.talk = item;
        doTileListOpenSignal.dispatch(taskDialogItemVo);
        ui.off(Event.CLICK, this, onOwerClick);

    }



}
}