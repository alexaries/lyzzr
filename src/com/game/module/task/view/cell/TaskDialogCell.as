/**
 * Created by huangcb on 2017/9/7.
 */
package com.game.module.task.view.cell {
import com.component.EffectPlayer;
import com.game.module.task.vo.item.TaskDialogItemVo;
import com.game.vo.TaskCfg;
import com.signal.SignalDispatcher;

import globals.ConfigLocator;

import laya.events.Event;
import laya.maths.Point;

import laya.ui.Box;

import net.data.structs.task.NpcInteractStruct;

import tools.DisplayTools;

import ui.task.TaskDialogCellUI;

public class TaskDialogCell extends Box {
    var ui:TaskDialogCellUI;
    private var vo:NpcInteractStruct;

    var doTileListOpenSignal:SignalDispatcher;

    public function TaskDialogCell() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new TaskDialogCellUI();
        ui.on(Event.CLICK, this, onOwerClick);

        addChild(ui);

        this.width = ui.width;
        this.height = ui.height;

    }

    public function onOwerClick():void {
        var taskDialogItemVo:TaskDialogItemVo = new TaskDialogItemVo();
        taskDialogItemVo.talk = vo;
        doTileListOpenSignal.dispatch(taskDialogItemVo);

     //   ui.off(Event.CLICK, this, onOwerClick);

    }


    override public function destroy(destroyChild:Boolean = true):void {

        super.destroy(destroyChild);
    }

    public function init(vo:NpcInteractStruct, inde:int,doTileListOpenSignal:SignalDispatcher):void {
        this.vo = vo;
        this.doTileListOpenSignal=doTileListOpenSignal;

        refresh();
    }

    public function refreshMsg(downTimeStr:String):void {
        if(ui&& ui.interactMsg&&vo)
        ui.interactMsg.text = vo.interactMsg + ""+vo.state+downTimeStr;

    }
    private function refresh():void {
        refreshMsg("");
        var task:TaskCfg = ConfigLocator.getInstance().taskDic.get(vo.interactId);
        if(!task||vo.state==""){
            ui.typeImg.skin = "";

            return;
        }

        switch (task.type) {
            case 1:
                ui.typeImg.skin = "module/task/zhu.png";
                break;
            case 2:
                ui.typeImg.skin = "module/task/zhi.png";
                break;
            case 4:
                ui.typeImg.skin = "module/task/teacher.png";
                break;
            case 5:
                ui.typeImg.skin = "module/task/ya.png";
                break;
            case 6:
                ui.typeImg.skin = "module/task/bang.png";
                break;
            default :
                ui.typeImg.skin = "";
                break;
        }
    }

    public function layoutCell(isBig:Boolean):void{
        ui.content.width = ui.typeImg.width + ui.interactMsg.textWidth;
        ui.interactMsg.align = "center"
        if(isBig){
            ui.bg.width = 903;
            this.width = 903;
            ui.width = 903;
            ui.content.x = (903 - ui.content.width)/2;
            if(ui.typeImg.skin == ""){
                ui.interactMsg.align = "left"
                ui.interactMsg.x = 0
                ui.content.x = (903 - ui.interactMsg.textWidth)/2;

            }
        }else{
            ui.bg.width = 446;
            this.width = 446;
            ui.width = 446;
            ui.content.x = (446 - ui.content.width)/2;
        }


        if(vo.guideState){
            ui.name="duihuakuang_duihua"
        }else{
            ui.name=""
        }
    }

    public function setVO(item:NpcInteractStruct):void {
        this.vo = item;
    }
}
}
