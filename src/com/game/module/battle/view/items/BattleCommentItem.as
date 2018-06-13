/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.view.items {
import laya.ui.Box;

import ui.battle.BattleCommentItemUI;

public class BattleCommentItem extends Box {

    private var ui:BattleCommentItemUI;

    public function BattleCommentItem() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BattleCommentItemUI();
        this.addChild(ui);
    }

    public function updateInfo():void {

    }
}
}
