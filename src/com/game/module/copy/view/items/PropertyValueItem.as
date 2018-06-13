/**
 * Created by dingcj on 2018/6/12.
 */
package com.game.module.copy.view.items {
import laya.ui.Box;

import ui.copy.PropertyValueItemUI;

public class PropertyValueItem extends Box {

    private var ui:PropertyValueItemUI;

    public function PropertyValueItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new PropertyValueItemUI();
        this.addChild(ui);
    }

    public function updateInfo():void {

    }
}
}
