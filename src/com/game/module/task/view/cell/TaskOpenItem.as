/**
 * Created by dingcj on 2018/4/9.
 */
package com.game.module.task.view.cell {
import com.game.common.operation.Oper;
import com.game.common.operation.TweenOper;
import com.tween.easing.Linear;

import config.mission.openfunc.IOpenfuncCfg;

import laya.maths.Point;

import laya.ui.Box;

import ui.task.TaskOpenItemUI;

public class TaskOpenItem extends Box {

    private var ui:TaskOpenItemUI;
    private var oper:Oper;
    private var stayTime:int = 1000;//图标停留时间
    private var destroyTime:int = 2500;//销毁时间
    private var point:Point;

    override protected function createChildren():void {
        super.createChildren();
        ui = new TaskOpenItemUI();
        addChild(ui);
    }

    public function setData(func:IOpenfuncCfg, point:Point):void {
        this.point = point;
        ui.x = (Laya.stage.width - ui.width) / 2;
        ui.y = 960;

        ui.icon.skin = "";
        ui.icon.skin = "ui/func_icon/" + func.icon + ".png";

        timerOnce(stayTime, this, fly);
        timerOnce(destroyTime, this, dispose)
    }

    private function fly():void {
        if (oper) {
            oper.halt();
            oper = null;
        }
        oper = new Oper();
        oper.add(new TweenOper(this, 2500, {
            x: point.x,
            y: point.y,
            alpha: 0.2
        }, Linear.easeIn));
        oper.list.forEach(function (item:Oper) {
            item.do_execute();
        });
    }

    public function dispose():void {
        if (oper) {
            oper.halt();
            oper = null;
        }
        this.destroy();
    }
}
}
