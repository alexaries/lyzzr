/**
 * Created by dingcj on 2017/11/2.
 */
package com.preset.login.view.item {
import com.game.utils.TimeUtil;
import com.preset.login.vo.Server;
import com.preset.login.vo.ServerHistroyLoginVo;
import com.preset.login.vo.ServerVo;

import laya.events.Event;
import laya.ui.Box;
import laya.utils.Handler;

import ui.login.LoginServerItemUI;

public class LoginServerItem extends Box {

    private var ui:LoginServerItemUI;
    private var vo:ServerVo;
    private var historyVo:ServerHistroyLoginVo;
    private var serverId:String;
    private var careerArr:Array = ["天师", "慈航", "剑仙"];
    private var statusArr:Array = ["未开启", "流畅", "维护中", "繁忙", "火爆"];

    private var zuijin:String = "lvzuijin.png";
    private var huobao:String = "honghuobao.png";
    private var zhengchang:String = "huangzhengchang.png";
    private var isHistory:Boolean = false;

    public function LoginServerItem() {

    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new LoginServerItemUI();
        this.addChild(ui);
    }

    public function setData(value:Object, handle:Handler = null, type:int = 0):void {
        if (!value) {
            vo = null;
            return;
        }
        isHistory = type == 1;

        ui.server.visible = !isHistory;
        ui.history.visible = isHistory;

        if (!isHistory) {
            vo = value.item;
            if (vo == null)return;
            this.serverId = vo.serverId;
            ui.areaLabel.text = vo.serverNumber + "区";
            ui.nameLabel.text = vo.serverName;
            ui.stateLabel.text = statusArr[parseInt(vo.serverStatus) - 1];

            ui.stateIcon.skin = "";
            var preStr:String = "module/login/";
            var str:String = zhengchang;

            if (Server.lastLoginServerVo != null && vo.serverId == Server.lastLoginServerVo.serverId) {
                str = zuijin;
            }
            else {
                var status:int = parseInt(vo.serverStatus);
                if (status == 2) {
                    str = zhengchang;
                }
                else if (status == 4 || status == 5) {
                    str = huobao;
                }
            }
            ui.stateIcon.skin = preStr + str;

            ui.newIcon.visible = vo.isNew;
            ui.recommandIcon.visible = vo.isRecommend;
        }
        else {
            historyVo = value.item;
            if (historyVo == null)return;
            this.serverId = historyVo.serverId;
            ui.hnameLabel.text = historyVo.roleName;
            ui.hlevelLabel.text = "Lv." + historyVo.roleLevel;
            ui.hcareerLabel.text = historyVo.roleJob <= 2 ? careerArr[historyVo.roleJob] : careerArr[0];
            ui.htimeLabel.text = "登录时间:" + TimeUtil.toDateYMDHMS(historyVo.time*1000);
        }

        ui.enterBtn.on(Event.CLICK, this, onClickBtn, [handle]);
    }

    private function onClickBtn(handle:Handler):void {
        if (handle) {
            Server.currServerVo = Server.GetServerVo(serverId);
            handle.run();
        }
    }
}
}
