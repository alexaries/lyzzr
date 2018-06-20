/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.company.view.items {
import com.game.module.copy.view.items.PropertyItem;

import laya.ui.Box;
import laya.utils.Handler;

import ui.company.CompanyExpertItemUI;

public class CompanyExpertItem extends Box {
    private var ui:CompanyExpertItemUI;

    public function CompanyExpertItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new CompanyExpertItemUI();
        this.addChild(ui);

        init();
    }

    private function init():void {
        ui.list.itemRender = PropertyItem;
        ui.list.renderHandler = Handler.create(this, onRenderPropertyItem, null, false);
    }

    private function onRenderPropertyItem(cell:PropertyItem, index:int):void {

    }

    public function initInfo():void {

    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        if (ui.list.renderHandler)ui.list.renderHandler.clear();
    }
}
}
