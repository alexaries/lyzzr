/**
 * Created by guanll on 2018/2/1.
 */
package com.game.common.view {
import com.game.vo.ActivityVO;

import laya.ui.Box;

import ui.main.icons.MainIconViewUI;

public class MainIconView extends Box{
    public var ui:MainIconViewUI;
    public var _vo:ActivityVO;
    public var isLocked:Boolean = true;  //是否锁住了

    public function MainIconView() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new MainIconViewUI();
        addChild(ui);
    }

    override public function destroy(b:Boolean = true):void {
        super.destroy(b);
    }

    public function init(vo:ActivityVO, level:int):void {
        _vo = vo;
        ui.icon.skin = _vo.imgUrl;
        update(level);

        if (_vo.openfunc.guide_name) {
            this.name = _vo.openfunc.guide_name;
        } else {
            this.name = "";
        }
    }

    public function update(level:int):void {
        if (!_vo.openfunc || level >= _vo.openfunc.level) {
            //开放
            ui.lockBox.visible = false;
            ui.icon.gray = false;
            isLocked = false;
        } else {
            ui.icon.gray = true;
            ui.lockBox.visible = true;
            ui.txtDesc.text = _vo.openfunc.level + "级开启";
            isLocked = true;
        }
    }
}
}
