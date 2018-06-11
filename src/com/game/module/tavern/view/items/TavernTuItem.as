/**
 * Created by dingcj on 2018/5/22.
 */
package com.game.module.tavern.view.items {
import laya.ui.Box;

import ui.tavern.TavernTuItemUI;

public class TavernTuItem extends Box {
    private var ui:TavernTuItemUI;

    public function TavernTuItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new TavernTuItemUI();
        this.addChild(ui);

        addChild(ui.getChildByName("selectBox"));
    }

    public function updateInfo():void
    {

    }
}
}
