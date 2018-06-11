/**
 * Created by dingcj on 2018/5/24.
 */
package com.game.module.copy.view.items {
import laya.ui.Box;

import ui.copy.PropertyItemUI;

public class PropertyItem extends Box {

    private var ui:PropertyItemUI;

    public function PropertyItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new PropertyItemUI();
        this.addChild(ui);
    }

    public function updateInfo():void {

    }
}
}
