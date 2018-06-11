/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.view {
import com.game.common.view.BaseWindow;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.task.mediator.TaskNpcMediator;
import com.game.module.task.view.cell.TaskNpcListCell;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.net.Loader;
import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import laya.utils.HitArea;

import net.consts.AppConst;

import ui.task.TaskNpcUI;

public class TaskNpcView extends BaseWindow {
    public var closeFuncEnable:Boolean;

    var ui:TaskNpcUI;
    public var doTileListOpenSignal:SignalDispatcher

    public function TaskNpcView() {
//        super()
        super(["任务素材",{url: AppConst.atlasPath + "module/task.json", type: Loader.ATLAS}]);

        ui = new TaskNpcUI();
        doTileListOpenSignal = new SignalDispatcher();
    }

    override public function dispose():void {
        ui.npclist.renderHandler.clear();
        ui.npclist.mouseHandler.clear();

        ui.closeBtn.clickHandler.clear();

        doTileListOpenSignal.dispose();
        super.dispose();
    }

    private function onBgClick():void {
        if(!closeFuncEnable){
            return;
        }
        dispose();
    }

    override public function getMediator():BaseMediator {
        return new TaskNpcMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();
    }

    function __onComplete():void {
        ui.closeBtn.clickHandler = Handler.create(this, tryDispose);
        addChild(ui);
        center();
        ui.bg.on(Event.CLICK, this, onBgClick);
        ui.npclist.itemRender = TaskNpcListCell;
        ui.npclist.renderHandler = Handler.create(this, onRenderHandler, null, false);
        ui.npclist.mouseHandler = Handler.create(this, onMouseHandler, null, false);
    }

    public function refresh():void{
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

    private function onMouseHandler(e:Event, index:int):void {
        if (e.type == Event.CLICK)
            doTileListOpenSignal.dispatch(ui.npclist.array[index]);
    }

    private function onRenderHandler(cell:TaskNpcListCell, index):void {
        cell.init(ui.npclist.array[index], index);
    }

    public function set tlNpcSetDataProvider(tlNpcSetDataProvider:Array):void {
        ui.npclist.array = tlNpcSetDataProvider;
    }

    public function setBuildInfo(buildinfo:BuildBaseInfoVO):void {
       ui.txtPlace.text = buildinfo.name;
    }
}
}