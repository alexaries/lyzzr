package com.game.common.view {
import com.game.common.events.MenuWindowVO;
import com.game.common.mediator.MyHomeMediator;
import com.game.common.mvc.BaseMediator;
import com.game.vo.ActivityVO;
import com.signal.SignalDispatcher;

import globals.ConfigLocator;

import laya.display.Sprite;
import laya.events.Event;
import laya.maths.Point;
import laya.ui.List;
import laya.utils.Handler;

import net.consts.AppConst;

import ui.main.MyHomeUI;

public class MyHomeView extends BaseWindow {
    public var main:MyHomeUI;
    public var build:HomeMap;
    public var money:MoneyView;

    public var outSignal:SignalDispatcher;

    private var acIcons:ActivityIconListView;
    public var onOpenWindow:SignalDispatcher;
    public var refreshRightIconSignal:SignalDispatcher;
    public var refreshRightIconOnceSignal:SignalDispatcher;
    private var _userLevel:int;
    public var instanceSignal:SignalDispatcher;

    public static var packPoint:Point;
    public static var stonePoint:Point;
    public static var sliverPoint:Point;
    public var musicSignal:SignalDispatcher;

    public var openWindowSignal:SignalDispatcher;
    public var closeWindowSignal:SignalDispatcher;

    public function MyHomeView() {
        outSignal = new SignalDispatcher();

        onOpenWindow = new SignalDispatcher();
        musicSignal = new SignalDispatcher();
        refreshRightIconSignal = new SignalDispatcher();
        refreshRightIconOnceSignal = new SignalDispatcher();

        openWindowSignal = new SignalDispatcher();
        closeWindowSignal = new SignalDispatcher();
        instanceSignal = new SignalDispatcher();
        super([]);
    }

    override public function dispose():void {
        outSignal.dispose();
        outSignal = null;
        super.dispose();
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

        instanceSignal.dispatch(null);
    }

    function __onComplete():void {
        main = new MyHomeUI();
        addChild(main);
        main.width = AppConst.width;

        build = new HomeMap();
        main.mapPart.addChild(build);

        money = new MoneyView();
        main.moneyBox.addChild(money);

        main.btnOut.on(Event.CLICK, this, outHandler);

        packPoint = new Point(780, 1798);
        layoutTop();
        layoutBottom();
        setRightButtonList();
        setDownButtonList();
        hideTaskTip();

//        main.btnRecharge.on(Event.CLICK, this, onClick, [MenuWinType.RECHARGE_WIN]);
        layoutButtons();
    }

    private function outHandler():void {
        outSignal.dispatch([[1, 0]]);
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

    /* 底部自适应 */
    private function layoutBottom():void {
        main.downPart.x = (Laya.stage.width - main.downPart.width) / 2;
    }

    /* 需要横向居中的显示对象 使用此方法 */
    private function centerH(s:Sprite):void {
        s.x = (AppConst.width - s.width) / 2;
    }

    /* 顶部自适应 */
    private function layoutTop():void {
        main.upPart.x = (Laya.stage.width - main.upPart.width) / 2;
    }

    /* 左边 右边 下边 按钮的自适应 1上 2下 3左 4右*/
    public function layoutButtons():void {
        updateRightButtonList();
    }

    private function setDownButtonList():void {
    }

    private function setRightButtonList():void {
        main.rightBtnGroup.itemRender = BaseFuncIconView;
        main.rightBtnGroup.renderHandler = Handler.create(this, renderRightIconHandler, null, false);
        main.rightBtnGroup.array = [];
    }

    private function renderRightIconHandler(cell:BaseFuncIconView, index:int):void {
        var ac:ActivityVO = main.rightBtnGroup.array[index];
        cell.init(ac, userLevel);
        cell.on(Event.CLICK, this, gotoActivityHandler, [ac]);
        cell.refreshSignal.getSignal(this).listen(refreshRightIconHandler);
        refreshRightIconOnceSignal.dispatch([cell]);
    }

    private function refreshRightIconHandler(icon:BaseFuncIconView):void {
        refreshRightIconSignal.dispatch([icon]);
    }

    private function gotoActivityHandler(acVo:ActivityVO):void {
        if (!acVo) {
            return;
        }

        var vo:MenuWindowVO = new MenuWindowVO(acVo.type, MenuWindowVO.OPEN, new Object());
        openWindow(acVo.type, vo.data);
    }

    public function updateRightButtonList():void {
        var icons:Array = ConfigLocator.getInstance().getOpenfuncByPosition(4);
//        var cfg:IOpenfuncCfg;
        var iconVo:ActivityVO;
        var btnsAc:Array = [];
        for each(iconVo in icons) {
//            cfg = iconVo.openfunc;
//            if (cfg && (!cfg.funcid || (cfg.funcid && FuncUtil.check(cfg.funcid)))) {
//                if (userLevel >= cfg.level) {
            btnsAc.push(iconVo);
//                }
//            }
        }

        main.rightBtnGroup.width = 190;
        main.rightBtnGroup.height = btnsAc.length * 180;
        main.rightBtnGroup.x = AppConst.width - main.rightBtnGroup.width;
        main.rightBtnGroup.y = AppConst.height - 435 - main.rightBtnGroup.height;
        main.rightBtnGroup.array = btnsAc;
    }

    public function showIcon(acVo:ActivityVO):void {
        if (!acVo) {
            return;
        }
        acIcons.addIcon(acVo);
    }

    public function removeIcon(acVo:ActivityVO):void {
        if (!acVo) {
            return;
        }
        acIcons.removeIcon(acVo);
    }

    public function getRightBtnList():List {
        return main.rightBtnGroup;
    }

    public function getBottomBtnList():List {
        return null;
    }

    public function showUpdateReward(body:Object):void {
        updateRightButtonList();
    }

    public function hideTaskTip():void {

    }

    public function get userLevel():int {
        return _userLevel;
    }
}
}