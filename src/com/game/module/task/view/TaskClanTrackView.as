/**
 * Created by huangcb on 2018/3/17.
 */
package com.game.module.task.view {
import com.game.common.mvc.BaseMediator;

import com.game.common.view.BaseWindow;
import com.game.module.task.mediator.TaskClanTrackMediator;
import com.game.module.task.view.cell.TaskClanTrackCell;
import com.signal.SignalDispatcher;

import laya.utils.Handler;

import ui.clan.TaskClanTrackUI;


public class TaskClanTrackView extends BaseWindow {
    public var ui:TaskClanTrackUI;

    public var doViewTaGuideSignal:SignalDispatcher;
    public function TaskClanTrackView() {
        doViewTaGuideSignal=new SignalDispatcher();
        super();
    }

    public function setClanTaskList(value:Array):void {
        ui.tasklist.array=value;
        if(value.length < 1)
        {
            ui.noContent.visible = true;
            ui.txtMsg.text = "帮会任务已全部完成啦";
        }
        else
            ui.noContent.visible = false;
    }


    override public function dispose():void {
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new TaskClanTrackMediator(this);
    }


    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {

        ui = new TaskClanTrackUI();
        addChild(ui);

        ui.tasklist.renderHandler = Handler.create(this, onRenderClanTaskHandler, null, false);
        ui.tasklist.itemRender = TaskClanTrackCell;
        ui.tasklist.scrollBar.hide = true;

    }
    private function onRenderClanTaskHandler(cell:TaskClanTrackCell, index):void {
//        cell.init(ui.tasklist.array[index],  doViewTaGuideSignal);
        cell.init(cell.dataSource,  doViewTaGuideSignal);
    }


}
}