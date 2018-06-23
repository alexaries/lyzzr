package com.game.common.view {
import com.game.common.events.MenuWindowVO;
import com.game.common.mediator.GameMainMediator;
import com.game.common.mvc.BaseMediator;
import com.game.consts.BaseLayer;
import com.game.module.battle.view.BattleView;
import com.game.module.battle.view.ExpertView;
import com.game.module.company.view.CompanyView;
import com.game.module.copy.view.CopyInfoView;
import com.game.module.copy.view.CopyMopView;
import com.game.module.copy.view.CopyView;
import com.game.module.jiban.view.JibanView;
import com.game.module.plot.view.PlotView;
import com.game.module.roll.view.RollScreenView;
import com.game.module.tavern.view.HeroDisplayView;
import com.game.module.tavern.view.TavernHireView;
import com.game.module.tavern.view.TavernTuView;
import com.game.module.tavern.view.TavernView;
import com.game.utils.FuncUtil;
import com.game.vo.FuncOpenVO;
import com.game.vo.MenuWinType;
import com.signal.SignalDispatcher;

import globals.ConfigLocator;

import globals.PlatformSDK;

import laya.events.Event;

import laya.utils.Dictionary;
import laya.utils.Handler;

import net.consts.AppConst;

import ui.main.GameMainUI;

public class GameMain extends BaseView {

    public var ui:GameMainUI;

    public var viewLists:Dictionary = new Dictionary();

    public var build:HomeMap;
    private var copy:CopyView;
    private var money:MoneyView;

    private var _userLevel:int;

    public var goSignal:SignalDispatcher;

    public function GameMain() {
        super();
        goSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new GameMainMediator(this);
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();
    }

    private function __onComplete():void {
        PlatformSDK.getInstance().removeSerial();
        //主界面菜单
        ui = new GameMainUI();
        addChild(ui);
        layout();
        init();
    }

    public function openWindow(menuWinTypeName:String, data:Object) {
        var index:int = MenuWindowVO.getTabIndex(data);
        if (viewLists.indexOf(menuWinTypeName) != -1) {
            var __win:BaseWindow = viewLists.get(menuWinTypeName) as BaseWindow;
            if (data != null) {
                __win.setData(data);
            }
            __win.show();

            if (!ui.win.contains(__win)) {
                ui.win.addChild(__win);
            }
            __win.toolBarSelectedIndex = index;
            if (__win is BaseFrame) {
            }
        } else {
            var win:BaseWindow = null;
            trace("menuWinTypeName:", menuWinTypeName);
            switch (menuWinTypeName) {
                case MenuWinType.JIBAN_VIEW:
                    win = new JibanView();
                    break;
                case MenuWinType.PLOT_VIEW:
                    win = new PlotView();
                    break;
                case MenuWinType.TAVERN_VIEW:
                    win = new TavernView();
                    break;
                case MenuWinType.TAVERN_TU_VIEW:
                    win = new TavernTuView();
                    break;
                case MenuWinType.TAVERN_HIRE_VIEW:
                    win = new TavernHireView();
                    break;
                case MenuWinType.HERO_DISPLAY_VIEW:
                    win = new HeroDisplayView();
                    break;
                case MenuWinType.COPY_INFO_VIEW:
                    win = new CopyInfoView();
                    break;
                case MenuWinType.COPY_MOP_VIEW:
                    win = new CopyMopView();
                    break;
                case MenuWinType.BATTLE_VIEW:
                    win = new BattleView();
                    break;
                case MenuWinType.EXPERT_VIEW:
                    win = new ExpertView();
                    break;
                case MenuWinType.COMPANY_VIEW:
                    win = new CompanyView();
                    break;
                default :
                    trace("窗口打开失败", menuWinTypeName);
                    return;
                    break;
            }

            win.menuWinTypeName = menuWinTypeName;
            win.toolBarSelectedIndex = index;
            win.userlevel = userLevel;
            if (data != null) {
                win.setData(data);
            }
            if (win is BaseFrame) {
                win.startLoad();
            }

            //data
            var tmp:Array = [];
            for (var i:int = 0; i < ui.win.numChildren; i++) {
                var object:BaseWindow = ui.win.getChildAt(i) as BaseWindow;
                if (object.menuWinTypeName != win.menuWinTypeName && object.layer == win.layer) {
                    tmp.push(object);
                }
            }
            for (var j:int = 0; j < tmp.length; j++) {
                var object1:BaseWindow = tmp[j] as BaseWindow;
                closeWindow(object1.menuWinTypeName);
            }
            if (!ui.win.contains(win)) {
                ui.win.addChild(win);
                if (viewLists.get(menuWinTypeName) == null) {
                    win.onDisposeSignal.getSignal(this).listen(__closeWindow);
                    viewLists.set(menuWinTypeName, win);
                }
                win.relive();
                win.show();
            }
        }
    }

    public function get userLevel():int {
        return _userLevel;
    }

    public function openWin(body:MenuWindowVO):void {
        openWindow(body.menuWinTypeName, body.data);
    }

    public function closeWin(body:MenuWindowVO):void {
        closeWindow(body.menuWinTypeName, body.data)
    }

    public function __closeWindow(menuWinTypeName:String, data:Object = null) {
        if (viewLists.indexOf(menuWinTypeName) != -1) {
            viewLists.remove(menuWinTypeName);
        }
    }

    public function closeWindow(menuWinTypeName:String, data:Object = null) {
        if (menuWinTypeName == MenuWinType.USER_INFO) {
            menuWinTypeName = MenuWinType.HEROES_INFO;
        }
        if (viewLists.indexOf(menuWinTypeName) != -1) {
            var __win:BaseWindow = viewLists.get(menuWinTypeName) as BaseWindow;
            __win.tryDispose();
        }
    }

    public function closeViewLists():void {
        var tmp:Array = viewLists.values.concat();

        for (var j:int = 0; j < tmp.length; j++) {
            var object1:BaseWindow = tmp[j] as BaseWindow;
            if (object1.layer != BaseLayer.GUIDE && object1.layer != BaseLayer.CHAPTER)
                closeWindow(object1.menuWinTypeName);
        }
    }

    private function init():void {
        if (!build)build = new HomeMap();
        if (build && !ui.map.contains(build))ui.map.addChild(build);
        build.initInfo(goSignal);

        if (!money)money = new MoneyView();
        if (money && !ui.money.contains(money))ui.money.addChild(money);

        var rollScreen:RollScreenView = new RollScreenView();
        Laya.stage.addChild(rollScreen);

        ui.rightBtnList.itemRender = BaseFuncIconView;
        ui.rightBtnList.renderHandler = Handler.create(this, renderRightIconHandler, null, false);
        ui.rightBtnList.array = [];

        ui.leftBtnList.itemRender = BaseFuncIconView;
        ui.leftBtnList.renderHandler = Handler.create(this, renderLeftIconHandler, null, false);
        ui.leftBtnList.array = [];

        updateLeftButtonList();
        updateRightButtonList();

        ui.btnOut.on(Event.CLICK, this, onOutClick);
    }

    private function onOutClick():void {
        openCopy();
    }

    private function renderLeftIconHandler(cell:BaseFuncIconView, index:int):void {
        var ac:FuncOpenVO = ui.leftBtnList.array[index];
        cell.init(ac, userLevel, goSignal);
    }

    private function renderRightIconHandler(cell:BaseFuncIconView, index:int):void {
        var ac:FuncOpenVO = ui.rightBtnList.array[index];
        cell.init(ac, userLevel, goSignal);
    }

    public function updateRightButtonList():void {
        var btnsAc:Array = ConfigLocator.getInstance().getOpenfuncByPosition(FuncUtil.RIGHT_UP_INDEX);
        ui.rightBtnList.width = 196;
        ui.rightBtnList.height = btnsAc.length * 180;
        ui.rightBtnList.x = AppConst.width - ui.rightBtnList.width;
        ui.rightBtnList.array = btnsAc;
    }

    public function updateLeftButtonList():void {
        var btnsAc:Array = ConfigLocator.getInstance().getOpenfuncByPosition(FuncUtil.LEFT_DOWN_INDEX);
        ui.leftBtnList.width = 196;
        ui.leftBtnList.height = btnsAc.length * 180;
        ui.leftBtnList.x = 0;
        ui.leftBtnList.array = btnsAc;
    }

    public function openCopy():void {
        if (!copy)copy = new CopyView();
        if (copy && !ui.copy.contains(copy))ui.copy.addChild(copy);
        closeMoney();
        ui.btnOut.visible = false;
    }

    public function closeCopy():void {
        if (copy && ui.copy.contains(copy)) {
            ui.copy.removeChild(copy);
            copy.dispose();
            copy = null;
        }
        openMoney();
        ui.btnOut.visible = true;
    }

    public function openMoney():void {
        money.show();
    }

    public function closeMoney():void {
        if (money)money.hide();
    }

    private function layout():void {
        ui.width = AppConst.width;

        ui.money.width = 832;
        ui.money.x = AppConst.width - ui.money.width - 20;
        ui.btnOut.x = AppConst.width - ui.btnOut.width;
    }
}
}


