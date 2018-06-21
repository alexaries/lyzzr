/**
 * Created by dingcj on 2017/9/2.
 */
package com.game.module.task.view {
import com.component.EffectPlayer;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.module.task.mediator.TaskDialogMediator;
import com.game.module.task.vo.TaskDialogVo;
import com.signal.SignalDispatcher;

import laya.net.Loader;

import net.consts.AppConst;

public class TaskDialogView extends BaseWindow {
    var ui:*
    public var data:TaskDialogVo;
    public var doTileListOpenSignal:SignalDispatcher
    public var closeFuncEnable:Boolean;
    private var mc:EffectPlayer;

    public function TaskDialogView() {
        super(["任务素材", {url: AppConst.atlasPath + "module/task.json", type: Loader.ATLAS}]);
        doTileListOpenSignal = new SignalDispatcher();
    }


    override public function dispose():void {

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

    }


    //小于45级 不能直接关闭界面
    private function onBgClick():void {
        if (!closeFuncEnable) {
            return;
        }
        dispose();
    }

    public function refresh():void {
        return;
    }
}
}