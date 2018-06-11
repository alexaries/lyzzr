/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.view.items {
import laya.ui.Box;

import ui.copy.comboxListItemUI;

public class ComboBoxItem extends Box {
    private var ui:comboxListItemUI;

    public function ComboBoxItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new comboxListItemUI();
        addChild(ui);

        addChild(ui.getChildByName("selectBox"));
        addChild(ui.getChildByName("label"));
    }
}
}
