package com.game.common.view {
import com.game.common.events.MenuWindowVO;
import com.game.common.mediator.GameMainMediator;
import com.game.common.mvc.BaseMediator;
import com.game.consts.BaseLayer;
import com.game.module.battle.view.ExpertView;
import com.game.module.battle.view.BattleView;
import com.game.module.copy.view.CopyInfoView;
import com.game.module.copy.view.CopyView;
import com.game.module.plot.view.PlotView;
import com.game.module.tavern.view.HeroDisplayView;
import com.game.module.tavern.view.TavernHireView;
import com.game.module.tavern.view.TavernTuView;
import com.game.module.tavern.view.TavernView;
import com.game.vo.MenuWinType;
import com.signal.SignalDispatcher;

import globals.PlatformSDK;

import laya.display.Sprite;
import laya.events.Event;
import laya.utils.Dictionary;

import net.consts.AppConst;

import ui.main.GameMainUI;

public class GameMain extends BaseView {

    public var main:GameMainUI;
    public var root:Sprite;

    public var viewLists:Dictionary = new Dictionary();
    public var goHomeSignal:SignalDispatcher;
    private var homeView:MyHomeView;

    public function GameMain() {
        super();
        goHomeSignal = new SignalDispatcher();
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
        main = new GameMainUI();
        addChild(main);
        main.width = AppConst.width;

        main.battle.visible = false;
        main.battle.name = "noguide";

        root = new Sprite();
        Laya.stage.addChild(root);

        main.btnHome.on(Event.CLICK, this, openWorldMap);
        openHome();
    }

    public function openHome():void {
        if (!homeView) {
            homeView = new MyHomeView();
        }

        homeView.userlevel = userLevel;
        if (!main.homeWin.contains(homeView)) {
            main.homeWin.addChild(homeView);
            homeView.show();
            homeView.refresh();
        }
        goHomeSignal.dispatch([]);
        closeCityWar();
    }

    public function closeHome():void {
        if (homeView && main.homeWin.contains(homeView)) {
            main.homeWin.removeChild(homeView);
            homeView.hide();
        }

        openCityWar();
    }

    public function openCityWar():void {
    }

    public function closeCityWar():void {
    }

    public function openWorldMap():void {
        openWindow(MenuWinType.WORLD_MAP, null);
    }

    public function openWindow(menuWinTypeName:String, data:Object) {

        var index:int = MenuWindowVO.getTabIndex(data);
//        var openfuncCfg:IOpenfuncCfg = ConfigLocator.getInstance().getOpenfunc(menuWinTypeName, index);
//        if (openfuncCfg != null && userLevel < openfuncCfg.level) {
//            Alert.roll(" 等级达到" + openfuncCfg.level + "可以开启" + openfuncCfg.name);
//            return;
//        }
        if (menuWinTypeName == MenuWinType.USER_INFO) {
            menuWinTypeName = MenuWinType.HEROES_INFO;
        }
        if (viewLists.indexOf(menuWinTypeName) != -1) {
            var __win:BaseWindow = viewLists.get(menuWinTypeName) as BaseWindow;
            if (data != null) {
                __win.setData(data);
            }
            __win.show();

            if (!main.win.contains(__win)) {
                main.win.addChild(__win);
            }
            __win.toolBarSelectedIndex = index;
            if (__win is BaseFrame) {
                //    (__win as BaseFrame).setToolBarSelect(index);
            }
        } else {
            var win:BaseWindow = null;
            trace("menuWinTypeName:", menuWinTypeName);
            switch (menuWinTypeName) {
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
                case MenuWinType.COPY_VIEW:
                    win = new CopyView();
                    break;
                case MenuWinType.COPY_INFO_VIEW:
                    win = new CopyInfoView();
                    break;
                case MenuWinType.BATTLE_VIEW:
                    win = new BattleView();
                    break;
                case MenuWinType.EXPERT_VIEW:
                    win = new ExpertView();
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
            for (var i:int = 0; i < main.win.numChildren; i++) {
                var object:BaseWindow = main.win.getChildAt(i) as BaseWindow;
                if (object.menuWinTypeName != win.menuWinTypeName && object.layer == win.layer) {
                    tmp.push(object);
                }
            }
            for (var j:int = 0; j < tmp.length; j++) {
                var object1:BaseWindow = tmp[j] as BaseWindow;
                closeWindow(object1.menuWinTypeName);
            }
            if (!main.win.contains(win)) {
                main.win.addChild(win);
                if (viewLists.get(menuWinTypeName) == null) {
                    win.onDisposeSignal.getSignal(this).listen(__closeWindow);
                    viewLists.set(menuWinTypeName, win);
                }
                win.relive();
                win.show();
            }
        }
    }

    private var _userLevel:int;

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
}
}


