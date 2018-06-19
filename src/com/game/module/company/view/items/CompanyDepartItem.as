/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.company.view.items {
import laya.ui.Box;

import ui.company.CompanyDepartItemUI;

public class CompanyDepartItem extends Box {

    private var ui:CompanyDepartItemUI;

    public function CompanyDepartItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new CompanyDepartItemUI();
        this.addChild(ui);
    }

    public function initInfo():void {

    }
}
}
