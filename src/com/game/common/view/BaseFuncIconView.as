/**
 * Created by guanll on 2017/11/9.
 */
package com.game.common.view {
import com.game.vo.ActivityVO;
import com.game.vo.MenuWinType;
import com.signal.SignalDispatcher;

import laya.ui.Box;

import ui.main.icons.BaseFuncIconViewUI;

public class BaseFuncIconView extends Box {
    public var ui:BaseFuncIconViewUI;
    public var _vo:ActivityVO;
    public var isLocked:Boolean = true;  //是否锁住了

    public var refreshSignal:SignalDispatcher;

    public function BaseFuncIconView() {
        refreshSignal = new SignalDispatcher();
        super();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BaseFuncIconViewUI();
        addChild(ui);
    }

    override public function destroy(b:Boolean = true):void {
        super.destroy(b);
        refreshSignal.dispose();
        refreshSignal = null;
        this.clearTimer(this, refreshDesc);
    }

    public function init(vo:ActivityVO, level:int):void {
        _vo = vo;
        ui.txtName.text = _vo.name;
        ui.icon.skin = _vo.imgUrl;
        update(level);

        if (_vo.openfunc.guide_name) {
            this.name = _vo.openfunc.guide_name;
        } else {
            this.name = "";
        }

        if ((_vo.openfunc.position + "") == "4") {
            //右
            ui.nameBg.skin = "main/img_btn_charge.png";
            ui.nameBg.pos(21, 83);
            ui.nameBg.size(147, 42);
            ui.txtName.color = "#8bb6ff";
            ui.txtName.fontSize = 24;
        } else if ((_vo.openfunc.position + "") == "2") {
            //下
            ui.nameBg.skin = "main/txt_bg.png";
            ui.nameBg.pos(34, 87);
            ui.nameBg.size(118, 35);
            ui.txtName.color = "#feffec";
            ui.txtName.fontSize = 25;
        }

        if (_vo.openfunc.win == MenuWinType.REWARD_DRAW) {
            ui.bDesc.visible = true;
            this.timerLoop(1000, this, refreshDesc);
        } else {
            clear();
        }
    }

    public function reset():void {
        setBgSize(122, 122);
        setBgPos(34, 0);
        setIconSize(106, 112);
        setIconPos(43, 0);
        ui.bg.skin = "";
//        ui.bg.skin = "main/bg_function_icon.png";
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

    public function refreshDesc():void {
        refreshSignal.dispatch([this]);
    }

    public function updateDesc(n:String):void {
        ui.txtDesc2.text = n;
    }

    public function clear():void {
        ui.bDesc.visible = false;
        this.clearTimer(this, refreshDesc);
    }

    public function updateIcon(url:String):void {
        ui.icon.skin = url;
    }

    public function updateBg(url:String):void {
        ui.bg.skin = url;
    }

    public function setBgSize(width:int, height:int):void {
        ui.bg.size(width, height);
    }

    public function setIconSize(width:int, height:int):void {
        ui.icon.size(width, height);
    }

    public function setBgPos(x:Number, y:Number):void {
        ui.bg.pos(x, y);
    }

    public function setIconPos(x:Number, y:Number):void {
        ui.icon.pos(x, y);
    }
}
}
