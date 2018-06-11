/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.view {
import com.game.common.view.BaseView;
import com.game.module.task.mediator.TaskActivityTrackMediator;
import com.game.module.task.view.cell.TaskTrackActivityCell;
import com.game.module.task.vo.item.DailyLimitActItemVo;
import com.game.module.task.vo.item.DailyUnlimitedActItemVo;
import com.signal.SignalDispatcher;

import laya.events.Event;

import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import ui.task.TaskActivityTrackUI;

public class TaskActivityTrackView extends BaseView {

    public var ui:TaskActivityTrackUI;
    public var lstLimitActSignal:SignalDispatcher;
    public var lstUnlimitedActSignal:SignalDispatcher;

    public function TaskActivityTrackView() {
        lstLimitActSignal = new SignalDispatcher();
        lstUnlimitedActSignal = new SignalDispatcher();
        super()
    }

    public function set vo(value:Object):void {

    }

    override public function dispose():void {
        ui.list.renderHandler.clear()
        ui.list.mouseHandler.clear()
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new TaskActivityTrackMediator(this);


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
        ui = new TaskActivityTrackUI();
        addChild(ui)
        ui.list.itemRender = TaskTrackActivityCell;
        ui.list.renderHandler = Handler.create(this, onTaskTrackActivityRenderHandler, null, false);
        ui.list.mouseHandler=   Handler.create(this, onMouseHandler, null, false);
    }

    private function onMouseHandler(e:Event, index:int):void {
        if (e.type == Event.CLICK){
            var vo=ui.list.array[index];
            if (vo instanceof  DailyLimitActItemVo) {
                lstLimitActSignal.dispatch(vo);
            }
            if (vo instanceof  DailyUnlimitedActItemVo) {
                lstUnlimitedActSignal.dispatch(vo);
            }
        }
    }

    private function onTaskTrackActivityRenderHandler(cell:TaskTrackActivityCell, index):void {
        var vo = ui.list.array[index];
        if (vo instanceof  DailyLimitActItemVo) {
            cell.init(vo, index, lstLimitActSignal);
        }

        if (vo instanceof  DailyUnlimitedActItemVo) {
            cell.init(vo, index, lstUnlimitedActSignal);
        }


    }

    public function setTimeActIndex(timeActIndex:int):void {

    }

    public function refresh():void {

    }

    public function setActProvider(tmp:Array):void {
        ui.list.array = tmp;
    }
}
}