 /**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.view {
import com.async.Deferred;
import com.game.common.view.BaseView;
import com.game.module.task.mediator.TaskTrackMediator;
import com.game.module.task.view.cell.TaskTrackListCell;
import com.game.module.task.vo.TaskTrackVo;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.net.Loader;
import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import net.consts.AppConst;

import ui.task.TaskTrackUI;

public class TaskTrackView extends BaseView {

    private var ui:TaskTrackListCell;
    public var vo:TaskTrackVo;
    public var doViewTaGuideSignal:SignalDispatcher;

    public var deferred:SignalDispatcher;
    public function TaskTrackView() {

        doViewTaGuideSignal = new SignalDispatcher();
        deferred=new SignalDispatcher();

        super(["任务素材",{url: AppConst.atlasPath + "module/task.json", type: Loader.ATLAS}]);



    }


    override public function dispose():void {

        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new TaskTrackMediator(this);
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

        ui = new TaskTrackListCell();
        addChild(ui)
        deferred.getSignal(this).listen(__refresh) ;
        ui.on(Event.CLICK,this,onClick)
    }

    private function onClick():void {
        doViewTaGuideSignal.dispatch(ui.vo)
    }

      function __refresh(taskTrackItemVo:TaskTrackItemVo):void {

        ui.init(taskTrackItemVo)

    }
    public function refresh(taskTrackItemVo:TaskTrackItemVo):void {
        deferred.dispatch(taskTrackItemVo)

    }
}
}