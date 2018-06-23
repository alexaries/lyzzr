/**
 * Created by dingcj on 2018/6/23.
 */
package com.game.module.copy.view.items {
import laya.ui.Box;

import ui.copy.CopyMopItemUI;

public class CopyMopItem extends Box {

    private var ui:CopyMopItemUI;

    public function CopyMopItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new CopyMopItemUI();
        this.addChild(ui);
    }

    public function initInfo(index:int):void {
        ui.indexLabel.text = "第" + (index + 1) + "次————————公司经验：";
    }
}
}
