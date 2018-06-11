/**
 * Created by dingcj on 2017/11/17.
 */
package com.preset.login.view.item {
import com.preset.login.vo.Server;
import com.preset.login.vo.ServerVo;

import laya.events.Event;

import laya.ui.Box;
import laya.utils.Handler;

import ui.login.LoginRecommandItemUI;

public class LoginRecomandItem extends Box {

    private var ui:LoginRecommandItemUI;
    private var vo:ServerVo;

    public function LoginRecomandItem() {

    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new LoginRecommandItemUI();
        addChild(ui);
    }

    public function setData(vo:ServerVo, index:int, handle:Handler):void {
        if (!vo)return;
        this.vo = vo;
        ui.areaLabel.text = vo.serverNumber + "区";
        ui.nameLabel.text = vo.serverName;

        ui.on(Event.CLICK, this, onClickBtn, [handle]);
    }

    private function onClickBtn(handle:Handler):void {
        if (handle) {
            Server.currServerVo = this.vo;
            handle.run();
        }
    }
}
}
