package com.preset.login.view {
import com.game.utils.LabelUtil;
import com.preset.createRole.vo.RandomName;
import com.preset.login.mediator.LoginMediator;
import com.preset.login.view.item.LoginRecomandItem;
import com.preset.login.vo.Server;
import com.preset.view.PresetBaseView;
import com.signal.SignalDispatcher;
import com.talkingdata.TDItem;
import com.talkingdata.TDManager;

import globals.PlatformSDK;

import laya.display.Sprite;
import laya.events.Event;
import laya.net.Loader;
import laya.utils.Browser;
import laya.utils.Handler;

import net.consts.AppConst;
import net.consts.StaticConfig;

import org.puremvc.as3.patterns.mediator.Mediator;

import ui.login.LoginUI;

public class LoginView extends PresetBaseView {
    private var ui:LoginUI;
    private var resArray:Array =
            [
                "登录素材",
                {url: AppConst.atlasPath + "module/login.json", type: Loader.ATLAS},
                {url: "module/login/heiyunwen.png", type: Loader.IMAGE},
                {url: "module/login/loginbg.png", type: Loader.IMAGE},
                {url: "module/login/LOGO.png", type: Loader.IMAGE}
            ];

    private var statusArr:Array = ["未开启", "流畅", "维护中", "繁忙", "火爆"];

    public var loginClick:SignalDispatcher;
    public var changeClick:SignalDispatcher;

    private var speed:int = 1;
    private var edge:int = 0;
    private var server:LoginServerView;
    private var onListBackClick:Handler;

    private var ip:String = "";
    private var port:Number = 0;

    private var num:int = 4;
    private var playerSignal:SignalDispatcher = new SignalDispatcher();
    private var playerArr:Array = [];

    public function LoginView() {
        loginClick = new SignalDispatcher();
        changeClick = new SignalDispatcher();
        onListBackClick = new Handler(this, onItemBack, null, false);
        Server.channelId = StaticConfig.platform;

        super(resArray);
    }

    override public function getMediator():Mediator {
        return new LoginMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        onResComplete();
    }

    private function onResComplete():void {
        ui = new LoginUI();
        Laya.stage.addChild(this);
        addChild(ui);
        ui.loginBtn.on(Event.CLICK, this, login);
        ui.x = (Laya.stage.width - ui.width) / 2;

        if (PlatformSDK.getInstance().checkIsTest()) {
            ui.inputId.editable = true;
            ui.pc.visible = true;
            ui.patform.visible = false;
        } else {
            ui.areaLabel.text = "";
            ui.stateLabel.text = "";
            ui.nameLabel.text = "正在获取可用服务器...";
            ui.inputId.text = StaticConfig.userId + "";
            ui.inputId.editable = false;
            ui.pc.visible = false;
            ui.patform.visible = true;
            platformHandle();
        }
        ui.list.itemRender = LoginRecomandItem;
        ui.list.renderHandler = Handler.create(this, onRenderHandler, null, false);
        initPanel();
        ui.notice.visible = false;
        createPlayerList();

        timerLoop(50, this, tween, null);
    }

    private var dir:int = -1;

    private function tween():void {
        if (dir == -1) {
            ui.touch.alpha -= 0.05;
            if (ui.touch.alpha <= 0)dir = 1;
        }
        else if (dir == 1) {
            ui.touch.alpha += 0.05;
            if (ui.touch.alpha >= 1.0)dir = -1;
        }
    }

    public function notice(str:String):void {
        ui.notice.visible = true;
        ui.noticeLabel.text = str;

        timer.once(1000, this, delay, null, true);
    }

    private function delay():void {
        ui.loginBtn.disabled = false;
        ui.notice.visible = false;
    }

    private function initPanel():void {
        ui.panel.vScrollBarSkin = "";
        ui.panel.vScrollBar.isVertical = true;
        ui.panel.vScrollBar.elasticBackTime = 600;
        ui.panel.vScrollBar.elasticDistance = 200;
    }

    private function createPlayerList():void {
        ui.playerList.array = [];
        ui.playerList.vScrollBarSkin = "";
        ui.playerList.mouseEnabled = false;

        ui.playerList.itemRender = LoginPlayerItem;
        ui.playerList.renderHandler = Handler.create(this, onRenderPlayerItem, null, false);
        playerSignal.getSignal(this).listen(popList);

        playerArr = [];
        for (var i = 0; i < num; i++) {
            playerArr.push(createPlayer());
        }
        ui.playerList.array = playerArr;
    }

    private function popList():void {
        playerArr.shift();
        playerArr.push(createPlayer());
        ui.playerList.array = playerArr;
    }

    private function createPlayer():Object {
        var name:String = RandomName.randAll();
        var occu:int = RandomName.randOccu();
        var colorIndex:int = Math.round(Math.random() * 2);
        var color:String = colorIndex == 0 ? LabelUtil.purpleColor : (colorIndex == 1 ? LabelUtil.greenColor : LabelUtil.blueColor);
        return {"occuIndex": occu, "playerName": name, "playerColor": color};
    }

    private function onRenderPlayerItem(cell:LoginPlayerItem, index:int):void {
        cell.setData(ui.playerList.array[index], playerSignal, index);
    }

    public function onServerComplete(data:*):void {
        trace("JSONP执行到这里");
        Server.Pasre(data);
//        if (Server.serverList.length > 0 && Server.currServerVo == null) {
////            ui.nameLabel.text = "无可用服务器";
//            Server.currServerVo = Server.serverRecommendList.length > 0 ? Server.serverRecommendList[Server.serverRecommendList.length - 1] : Server.serverList[0];
//            trace("@onServerComplete==", Server.currServerVo);
//            if (Server.currServerVo) {
//                login();
//            }
//        }
//        else {
        recommandServer();
        updateSelectServer();
//        }
    }


    private function recommandServer():void {
        ui.list.array = [];
        if (Server.serverRecommendList == null || Server.serverRecommendList.length == 0)return;


        if (Server.serverRecommendList.length == 0)return;
        ui.list.array = Server.serverRecommendList;

    }

    private function onRenderHandler(cell:LoginRecomandItem, index:int):void {
        cell.setData(ui.list.array[index], index, onListBackClick);
    }

    private function onItemBack():void {
        updateSelectServer();
    }

    public function updateSelectServer():void {
        if (Server.currServerVo == null) {
//            if (Server.serverRecommendList != null && Server.serverRecommendList.length > 0) {
//                Server.currServerVo = Server.serverRecommendList[Server.serverRecommendList.length - 1];
//                ConfigLoadRes.getInstance().load();
//            }
            TDManager.addEvent(TDItem.shoucidianjidenglu);
            Server.currServerVo = Server.serverRecommendList.length > 0 ? Server.serverRecommendList[Server.serverRecommendList.length - 1] : Server.serverList[0];
            if (Server.currServerVo) {
                login();
            }
        }

        if (Server.currServerVo == null) {
            ui.areaLabel.text = "";
            ui.nameLabel.text = "暂无可用的服务器";
            ui.stateIcon.skin = "";
            ui.stateLabel.text = "";
            return;
        }

        ui.areaLabel.text = Server.currServerVo.serverNumber + "区";
        ui.nameLabel.text = Server.currServerVo.serverName;
        ui.stateIcon.skin = "";

        var status:int = parseInt(Server.currServerVo.serverStatus);
        var index:int = status == 0 ? 0 : (status > 5 ? 0 : status - 1);
        ui.stateLabel.text = statusArr[index];
        trace("@updateSelectServer", Server.currServerVo);
    }

    private function platformHandle():void {
        ui.changeBtn.clickHandler = Handler.create(this, onchangeBtnClickBtn, null, false);
    }

    private function login():void {
        //暂时直接进入游戏
        loginClick.dispatch(null);
        return;

        if (PlatformSDK.getInstance().checkIsTest()) {
            var str:String = ui.combox.selectedLabel;
            var arr:Array = str.split(':');

            ip = arr[0];
            port = Number(arr[1]);
            StaticConfig.userId = parseInt(ui.inputId.text);
        }
        else {
            if (Server.currServerVo != null) {
                ip = Server.currServerVo.serverHost;
                port = Server.currServerVo.serverPort;

                if (Server.currServerVo.serverStatus == "1") {
                    notice("服务器暂未开启... ...");
                    return;
                }
                if (Server.currServerVo.serverStatus == "3") {
                    var host:String = Browser.window.location.host;
                    if (host != "test.djss.yxorange.com") {
                        notice("服务器正在维护中... ...");
                        return;
                    }
                }
            }
        }
//        ip = "192.168.75.108";
//        port = 5601;
        trace("@login==ip==port==", ip, port);
        if (ip != "" && port != 0) {
            loginClick.dispatch([ip, port]);
            notice("正在努力进入游戏,请稍候... ...");
            ui.loginBtn.disabled = true;
        }
    }

    private function onchangeBtnClickBtn():void {
        if (!server)server = new LoginServerView();
        addChildView(server);

    }

    public function addChildView(view:Sprite):void {
        if (view && !ui.container.contains(view)) {
            ui.container.addChild(view);
        }
    }

    private function clear():void {
        clearServer();
    }

    public function clearServer():void {
        if (server) {
            server.dispose();
            server = null;
        }
    }

    override public function dispose():void {
        if (isDispose)return;
        ui.list.renderHandler.clear()

        playerSignal.dispose();
        ui.playerList.renderHandler.clear();
        playerArr = [];

        clear();
        clearTimer(this, delay);
        clearTimer(this, tween);
        ui.loginBtn.off(Event.CLICK, this, login);
        if (ui.changeBtn.clickHandler != null) {
            ui.changeBtn.clickHandler.clear();
            ui.changeBtn.clickHandler = null;
        }

        loginClick.dispose();
        changeClick.dispose();
        if (onListBackClick) onListBackClick.clear();
        onListBackClick = null;
        Laya.stage.removeChild(this);
        if (ui)ui.destroy();
        super.dispose();
    }
}
}