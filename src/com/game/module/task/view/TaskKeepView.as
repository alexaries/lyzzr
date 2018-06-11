/**
 * Created by dingcj on 2017/9/26.
 */
package com.game.module.task.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseFrame;
import com.game.module.practice.view.PracticeView;
import com.game.module.task.mediator.TaskKeepMediator;
import com.signal.SignalDispatcher;

import laya.net.Loader;

import net.consts.AppConst;

import ui.task.TaskKeepUI;

public class TaskKeepView extends BaseFrame {

    private var ui:TaskKeepUI;

    private var hook:TaskHookView;
    private var practice:PracticeView;
    public var closeClick:SignalDispatcher;

    private var resArr:Array = ["离线经验素材",
        {url: AppConst.atlasPath + "module/leaveexp.json", type: Loader.ATLAS},
        {url: "module/leaveexp/hengtiao.png", type: Loader.IMAGE},
        {url: "module/leaveexp/hengxian.png", type: Loader.IMAGE}
    ];

    public function TaskKeepView() {
        closeClick = new SignalDispatcher();
        super(resArr);
    }

    override public function getMediator():BaseMediator {
        return new TaskKeepMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        ui = new TaskKeepUI();
        addChild(ui);

        init();
        adapt();
    }

    private function adapt():void {
        setContent(ui);
        setToolBarItems([]);
        setTitle("离线收益");
        if (!hook) {
            hook = new TaskHookView();
            ui.tcontainer.addChild(hook);
        }
        if (!practice) {
            practice = new PracticeView();
            ui.pcontainer.addChild(practice);
        }
        setViewStackItems([hook, practice]);
    }

    override public function toolBarSelectHandler(index:int):void {
        super.toolBarSelectHandler(index);
    }

    override public function tryClose():void {
        closeClick.dispatch(null);
    }

    private function init():void {

    }

    override public function dispose():void {
        closeClick.dispose();
        super.dispose();
    }
}
}