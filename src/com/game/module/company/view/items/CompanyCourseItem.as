/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.company.view.items {
import laya.ui.Box;

import ui.company.CompanyCourseItemUI;

public class CompanyCourseItem extends Box {

    private var ui:CompanyCourseItemUI;

    public function CompanyCourseItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new CompanyCourseItemUI();
        this.addChild(ui);

//        ui.bg.visible = true;
//        ui.info.visible = false;
    }

    public function initInfo(point:Object):void {
        this.ui.pos(point.x, point.y);
    }

}
}
