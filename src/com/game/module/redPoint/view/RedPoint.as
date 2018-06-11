package com.game.module.redPoint.view  {
import laya.ui.Box;

import ui.dialog.RedPointUI;

public class RedPoint extends Box{
    public var ui:RedPointUI;

    public function RedPoint() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new RedPointUI();
        addChild(ui);
    }

    public function init():void {



    }


}
}

