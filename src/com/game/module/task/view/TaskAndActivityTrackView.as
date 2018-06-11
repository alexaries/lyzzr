/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.view {
import com.component.EffectPlayer;
import com.game.module.task.view.TaskSLGTrackView;
import com.signal.SignalDispatcher;

import laya.ui.Button;
import laya.ui.Component;

import tools.DisplayTools;

import ui.task.TaskAndActivityTrackUI;

public class TaskAndActivityTrackView extends Component {

    var task:TaskSLGTrackView ;
    var activity:TaskActivityTrackView
    var ui:TaskAndActivityTrackUI;
    public var moreSignal:SignalDispatcher;
//    public var onSelectSignal:SignalDispatcher;
    var selectIndex:int;

    public function TaskAndActivityTrackView() {
        moreSignal = new SignalDispatcher();
//        onSelectSignal = new SignalDispatcher();
        super();
    }

//    public function  get taskBtn():Button {
//        return ui.more;
//    }

    override protected function createChildren():void {
        ui = new TaskAndActivityTrackUI();
        addChild(ui);
        task = new TaskSLGTrackView();
        ui.container.addChild(task);
        activity = new TaskActivityTrackView();
//        ui.tabar.clickHandler = Handler.create(this, onSelectClickHandler, null, false);
//        ui.tabar.selected = false;;
        selectIndex = 0;
        onSelect(selectIndex);
        super.createChildren();

//        var taskMc:RenderMovieClip = new RenderMovieClip();
//        taskMc.mouseEnabled = false;
//        taskMc.loadAtlas("clip/", "effect", true);
//        taskMc.x = 330;
//        taskMc.y = 80;
//        taskMc.gotoAndPlay("renwu_liuguang", true);
//        taskMc.scale(2.4,2.4);
//        taskMc.timeScale = 0.5;
//        ui.addChildAt(taskMc,ui.getChildIndex(ui.more)-1);
        var effMc:EffectPlayer = DisplayTools.getInstance().addFangLiuguangEff(this);
//        effMc.x = -20;
//        effMc.y = -17;
//        effMc.scaleX = 0.86;
//        effMc.scaleY = 0.7;
        effMc.interval = 185;
        this.addChild(effMc);
        effMc.play();
    }

//    private function onSelectClickHandler():void {
//        if(ui.tabar.selected){
//            selectIndex = 1;
//        }else{
//            selectIndex = 0;
//        }
//        onSelectSignal.dispatch(selectIndex);
//
//    }

    public function onSelect(index:int):void {
        trace("当前选择的表情页索引: index= ", index);

        while (ui.container.numChildren > 0) {
            ui.container.removeChildAt(0);
        }
        if (index == 0) {
            ui.container.addChild(task);
        }
//        if (index == 1) {
//           ui.container.addChild(activity)
//        }
    }
}
}