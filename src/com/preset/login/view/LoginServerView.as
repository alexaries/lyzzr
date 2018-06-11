/**
 * Created by dingcj on 2017/11/1.
 */
package com.preset.login.view {
import com.preset.login.mediator.LoginServerMediator;
import com.preset.login.view.item.LoginServerItem;
import com.preset.login.vo.Server;
import com.preset.view.PresetBaseView;
import com.signal.SignalDispatcher;

import laya.display.Sprite;
import laya.events.Event;
import laya.net.Loader;
import laya.utils.Handler;

import net.consts.AppConst;

import org.puremvc.as3.patterns.mediator.Mediator;

import ui.login.LoginServerUI;

public class LoginServerView extends PresetBaseView {

    private var ui:LoginServerUI;
    public var closeClick:SignalDispatcher;
    private var onListBackClick:Handler;
    public var selectClick:SignalDispatcher;

    private var notice:LoginNoticeView;

    public function LoginServerView() {
        closeClick = new SignalDispatcher();
        onListBackClick = new Handler(this, onItemBack, null, false);
        selectClick = new SignalDispatcher();
        super(null);
    }

    override public function getMediator():Mediator {
        return new LoginServerMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        ui = new LoginServerUI();
        Laya.stage.addChild(ui);

        init();
        layout();
    }

    public function layout():void {
//        width = AppConst.fullScreenWidth;
//        height = AppConst.height - AppConst.topBannerHeight;
//        x = (AppConst.width - AppConst.fullScreenWidth) / 2;
//        y = 0;//AppConst.topBannerHeight;

        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    private function init():void {
        ui.selectTab.selectHandler = Handler.create(this, onSelectHandler, null, false);
        ui.selectTab.selectedIndex = 0;
        ui.bg.on(Event.CLICK, this, onClickBtn);
        //ui.noticeBtn.on(Event.CLICK, this, onClickBtn);
        ui.noticeBtn.visible = false;
        ui.list.itemRender = LoginServerItem;
        ui.list.renderHandler = Handler.create(this, onRenderHandler, null, false);
        initPanel();
    }

    private function initPanel():void {
        ui.panel.vScrollBarSkin = "";
        ui.panel.vScrollBar.isVertical = true;
        ui.panel.vScrollBar.elasticBackTime = 600;
        ui.panel.vScrollBar.elasticDistance = 200;
    }

    private function onClickBtn(e:Event):void {
        if (e.target == ui.bg) {
            closeClick.dispatch(null);
        }
        else if (e.target == ui.noticeBtn) {
            if (!notice)notice = new LoginNoticeView();
            addChildView(notice);
        }
    }

    private function onSelectHandler(index:int):void {
        var data:Array = [];
        ui.list.array = [];
        data = index == 0 ? Server.serverList : Server.serverHistroyLoginList;
        if (data.length == 0)return;

        ui.list.array = data;

    }

    private function onRenderHandler(cell:LoginServerItem, index:int):void {
        cell.setData({item: ui.list.array[index]}, onListBackClick, ui.selectTab.selectedIndex);
    }

    private function onItemBack():void {
        selectClick.dispatch(null);
    }

    public function addChildView(view:Sprite):void {
        if (view && !ui.container.contains(view)) {
            ui.container.addChild(view);
        }
    }

    private function clear():void {
        clearNotice();
    }

    public function clearNotice():void {
        if (notice) {
            notice.dispose();
            notice = null;
        }
    }

    override public function dispose():void {
        if (isDispose)return;
        ui.list.renderHandler.clear();
        clear();
        ui.selectTab.selectHandler.clear();
        ui.selectTab.selectHandler = null;
        closeClick.dispose();
        if (onListBackClick)onListBackClick.clear();
        onListBackClick = null;
        selectClick.dispose();
        Laya.stage.removeChild(ui);
        if (ui)ui.destroy();
        super.dispose();
    }
}
}