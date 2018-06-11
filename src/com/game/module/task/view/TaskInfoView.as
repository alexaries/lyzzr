/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.view {
import com.game.common.view.BaseFrame;
import com.game.common.vo.BaseMenuVO;
import com.game.module.task.mediator.TaskInfoMediator;

import com.game.common.mvc.BaseMediator;
import com.talkingdata.TDItem;
import com.talkingdata.TDManager;

public class TaskInfoView extends BaseFrame {


    public function TaskInfoView() {

        super()
    }

    public function set vo(value:Object):void {

    }

    override public function dispose():void {

        super.dispose();

    }

    override public function getMediator():BaseMediator {
        return new TaskInfoMediator(this);
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
        setBgType(1);
        //  getContent().addChild()
        setToolBarItems([new BaseMenuVO("任务") ]);
        setViewStackItems([new TaskView()]);
        setToolBarSelect(toolBarSelectedIndex);
    }


    override public function toolBarSelectHandler(index:int):void {
        if (index == 1) {
            //每日点开日常任务次数统计
            TDManager.addEvent(TDItem.meiridiankairichangrenwucishu, {count: 1}, "日常任务");

            //每日点开日常任务的人数统计
            TDManager.addEvent(TDItem.meiridiankairichangrenwurenshu, null, "日常任务");
        }

        super.toolBarSelectHandler(index);
//        setMsg("");
    }
}
}