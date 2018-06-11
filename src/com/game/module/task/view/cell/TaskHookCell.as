/**
 * Created by dingcj on 2017/9/27.
 */
package com.game.module.task.view.cell {
import com.game.module.pack.util.PackUtil;
import com.game.module.pack.vo.PackVO;
import com.game.utils.LabelUtil;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Box;

import ui.task.TaskHookItemUI;

public class TaskHookCell extends Box {
    private var ui:TaskHookItemUI;
    private var index:int;

    override protected function createChildren():void {
        super.createChildren();

        ui = new TaskHookItemUI();
        this.addChild(ui);
    }

    public function initData(data:Object, index:int, signal:SignalDispatcher, p:Object):void {
        var id:int = data.itemid;
        var num:int = data.itemNum;
        this.index = index;

        ui.checkImage.visible = index == 0;

        this.pos(p.x, p.y);

        var packVo:PackVO = createPackVO(id);
        if (!packVo)return;
        ui.iconBg.skin = "";
        ui.iconBg.skin = LabelUtil.iconBg(packVo.color - 1);
        ui.icon.skin = "";
        ui.icon.skin = packVo.imgURL;
        LabelUtil.color(packVo.color - 1, packVo.name, ui.nameLabel);
        ui.numLabel.text = num + "";

        ui.on(Event.CLICK, this, onClick, [signal]);
        if (index == 0) signal.dispatch([index]);
    }

    public function updateData(num:int):void {
        ui.numLabel.text = num + "";
    }

    private function onClick(signal:SignalDispatcher):void {
        if (signal)signal.dispatch([index]);
    }

    public function updateSelect(i:int):void {
        ui.checkImage.visible = i == index;
    }

    private function createPackVO(itemID:int):PackVO {
        var packvo:PackVO = PackUtil.createPackVO(itemID);
        if (!packvo)
            return null;
        packvo.binding = 0;
        return packvo;
    }
}
}
