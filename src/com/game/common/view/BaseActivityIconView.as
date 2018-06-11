/**
 * Created by dingcj on 2018/1/11.
 */
package com.game.common.view {
import com.game.module.pack.view.ItemIcon;

import config.ConfigManager;
import config.mission.seven_day.ISeven_day_bigprize_prize;

import laya.maths.Rectangle;
import laya.ui.Box;

import ui.main.icons.BaseActivityIconViewUI;

public class BaseActivityIconView extends Box {
    private var ui:BaseActivityIconViewUI;

    private var posArr:Array = [
        {x: 29, y: 235},
        {x: 29, y: 226}
    ];

    private var cell:ItemIcon;

    public function BaseActivityIconView() {

    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BaseActivityIconViewUI();
        addChild(ui);
    }

    public function setData(day:int):void {
        var url:String = day == 1 ? "main/icons/seven_day_0.png" : "main/icons/seven_day_1.png";
        ui.bgImage.skin = "";
        ui.bgImage.skin = url;

        if (cell) {
            cell.destroy();
            cell = null;
        }

        ui.container.visible = day != 1;

        if (day != 1) {
            var itemCfg:ISeven_day_bigprize_prize = ConfigManager.instance.mission_seven_day.bigprize.prize[day - 1];
            cell = new ItemIcon();
            ui.container.addChild(cell);
            cell.setData({itemid: itemCfg.reward.split(',')[0], itemNum: 1});
            cell.showTip = false;
            cell.nameLab.visible = false;
            cell.pos(89, 39);
            cell.setSize(132, 132);
        }

        var pos = day == 1 ? posArr[0] : posArr[1];
        ui.bar.pos(pos.x, pos.y);
    }

    public function setInfo(finishCount:int, totalCount:int):void {
        ui.barLabel.text = finishCount + "/" + totalCount;
        ui.barImage.scrollRect = new Rectangle(0, 0, ui.barImage.width * (finishCount / totalCount), ui.barImage.height);
    }
}
}
