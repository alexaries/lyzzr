package com.game.common.view {
import com.game.common.events.MenuWindowVO;
import com.game.common.mediator.MyHomeMediator;
import com.game.common.mvc.BaseMediator;
import com.game.vo.ActivityVO;
import com.signal.SignalDispatcher;

import laya.display.Sprite;
import laya.events.Event;
import laya.ui.List;
import laya.utils.Handler;

import net.consts.AppConst;

import ui.main.MyHomeUI;

public class MyHomeView extends BaseWindow {
    public var ui:MyHomeUI;
    public var build:HomeMap;

    public var outSignal:SignalDispatcher;
    public var musicSignal:SignalDispatcher;
    public var openWindowSignal:SignalDispatcher;
    public var closeWindowSignal:SignalDispatcher;

    private var _userLevel:int;

    public function MyHomeView() {
        outSignal = new SignalDispatcher();
        musicSignal = new SignalDispatcher();
        closeWindowSignal = new SignalDispatcher();
        openWindowSignal = new SignalDispatcher();

        super([]);
    }

    override public function getMediator():BaseMediator {
        return new MyHomeMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();
    }

    function __onComplete():void {
        ui = new MyHomeUI();
        addChild(ui);
        ui.width = AppConst.width;

        build = new HomeMap();
        ui.mapPart.addChild(build);

        ui.upPart.x = (Laya.stage.width - ui.upPart.width) / 2;//适应顶部
        ui.downPart.x = (Laya.stage.width - ui.downPart.width) / 2;//适应底部

        ui.rightBtnList.itemRender = BaseFuncIconView;
        ui.rightBtnList.renderHandler = Handler.create(this, renderRightIconHandler, null, false);
        ui.rightBtnList.array = [];

        ui.leftBtnList.itemRender = BaseFuncIconView;
        ui.leftBtnList.renderHandler = Handler.create(this, renderLeftIconHandler, null, false);
        ui.leftBtnList.array = [];

        ui.btnOut.on(Event.CLICK, this, outHandler);
        //        main.btnRecharge.on(Event.CLICK, this, onClick, [MenuWinType.RECHARGE_WIN]);

        updateRightButtonList();
        updateLeftButtonList();
    }

    private function renderLeftIconHandler(cell:BaseFuncIconView, index:int):void {
        var ac:ActivityVO = ui.leftBtnList.array[index];
        cell.init(ac, userLevel);
        cell.on(Event.CLICK, this, onClickFuncIcon, [ac]);
    }

    private function renderRightIconHandler(cell:BaseFuncIconView, index:int):void {
        var ac:ActivityVO = ui.rightBtnList.array[index];
        cell.init(ac, userLevel);
        cell.on(Event.CLICK, this, onClickFuncIcon, [ac]);
    }

    private function outHandler():void {
        outSignal.dispatch(null);
    }

    public function refresh():void {

    }

    public function openWindow(menuWinTypeName:String, data:Object) {
        openWindowSignal.dispatch([menuWinTypeName, data]);
    }

    public function closeWindow(menuWinTypeName:String, data:Object = null) {
        closeWindowSignal.dispatch([menuWinTypeName, data])
    }

    private function onClick(menuWinTypeName:String) {
        openWindow(menuWinTypeName, null);
    }

    private function onClickFuncIcon(acVo:ActivityVO):void {
        if (!acVo)return;

        var vo:MenuWindowVO = new MenuWindowVO(acVo.type, MenuWindowVO.OPEN, new Object());
        openWindow(acVo.type, vo.data);
    }

    public function updateRightButtonList():void {
        var btnsAc:Array = [];

        for (var i = 0; i < 5; i++) {
            btnsAc.push("");
        }

        ui.rightBtnList.width = 196;
        ui.rightBtnList.height = btnsAc.length * 180;
        ui.rightBtnList.x = AppConst.width - ui.rightBtnList.width;
        ui.rightBtnList.array = btnsAc;
    }

    public function updateLeftButtonList():void {
        var btnsAc:Array = [];

        for (var i = 0; i < 3; i++) {
            btnsAc.push("");
        }

        ui.leftBtnList.width = 196;
        ui.leftBtnList.height = btnsAc.length * 180;
        ui.leftBtnList.x = 0;
        ui.leftBtnList.array = btnsAc;

        trace("----:" + AppConst.width + "/" + AppConst.fullScreenWidth + "/" + AppConst.width_max);
    }

    public function get userLevel():int {
        return _userLevel;
    }

    public function getRightBtnList():List {
        return ui.rightBtnList;
    }

    /* 需要横向居中的显示对象 使用此方法 */
    private function centerH(s:Sprite):void {
        s.x = (AppConst.width - s.width) / 2;
    }

    override public function dispose():void {
        if (outSignal)outSignal.dispose();
        if (musicSignal)musicSignal.dispose();
        if (closeWindowSignal)closeWindowSignal.dispose();
        if (openWindowSignal)openWindowSignal.dispose();

        if (ui.rightBtnList.renderHandler)ui.rightBtnList.renderHandler.clear();
        if (ui.leftBtnList.renderHandler)ui.leftBtnList.renderHandler.clear();

        if (build) {
            build.destroy();
            build = null;
        }
        super.dispose();
    }
}
}