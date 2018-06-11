package com.game.common.view {
import com.game.common.events.MenuWindowVO;
import com.game.common.mediator.MyHomeMediator;
import com.game.common.mvc.BaseMediator;
import com.game.common.operation.FunctionOper;
import com.game.common.operation.Queue;
import com.game.common.operation.TimeoutOper;
import com.game.module.task.view.TaskAndActivityTrackView;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.FuncUtil;
import com.game.vo.ActivityVO;
import com.game.vo.MenuWinType;
import com.signal.SignalDispatcher;
import com.talkingdata.TDManager;

import config.mission.openfunc.IOpenfuncCfg;

import globals.ConfigLocator;

import laya.display.Sprite;
import laya.events.Event;
import laya.maths.Point;
import laya.maths.Rectangle;
import laya.ui.Box;
import laya.ui.List;
import laya.utils.Handler;
import laya.utils.Pool;

import net.consts.AppConst;
import net.consts.StaticConfig;

import ui.main.MyHomeUI;

public class MyHomeView extends BaseWindow {
    public var main:MyHomeUI;

    public var build:HomeMap;

    public var outSignal:SignalDispatcher;

    private var acIcons:ActivityIconListView;
    public var onOpenWindow:SignalDispatcher;
    public var refreshRightIconSignal:SignalDispatcher;
    public var refreshRightIconOnceSignal:SignalDispatcher;
    private var _userLevel:int;
    var que:Queue;
    var taskTrack:TaskAndActivityTrackView;
    public var instanceSignal:SignalDispatcher;

    private var aIcon:BaseActivityIconView;
    private var expRect:Rectangle = new Rectangle(0, 0, 0, 0);
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

        main.btnOut.on(Event.CLICK, this, outHandler);

        packPoint = new Point(780, 1798);
        stonePoint = (main.xianshiTxt.parent as Box).localToGlobal(new Point(main.xianshiTxt.x, main.xianshiTxt.y));
        sliverPoint = (main.sliverTxt.parent as Box).localToGlobal(new Point(main.sliverTxt.x, main.sliverTxt.y));
        layoutTop();
        layoutBottom();
        setRightButtonList();
        setDownButtonList();

//        taskTrack = new TaskAndActivityTrackView();
//        taskTrack.taskBtn.on(Event.CLICK, this, onClick, [MenuWinType.TASK_INFO]);
//        main.taskTrack.addChild(taskTrack);
//        main.taskTrack.width = taskTrack.width;
//        centerH(main.taskTrack);//任务追踪条居中显示
        centerH(main.taskTips);
        hideTaskTip();

        //活动Icon相关
//        acIcons = new ActivityIconListView();
//        main.activityIconCollect.addChild(acIcons);
//        main.relationIcon.on(Event.CLICK, this, onClick, [MenuWinType.RELATION]);
//        main.roleBtn.on(Event.CLICK, this, onClick, [MenuWinType.HEROES_INFO]);
        main.richangBtn.on(Event.CLICK, this, onClick, [MenuWinType.ACTIVE]);
//        main.vipTxt.on(Event.CLICK, this, onClick, [MenuWinType.NEWVIP_VIEW]);
//        main.mapBtn.on(Event.CLICK, this, onClick, [MenuWinType.WORLD_MAP]);
        main.item0.on(Event.CLICK, this, onClick, [MenuWinType.RECHARGE_WIN]);
        main.btnMusic.toggle = true;
        main.btnMusic.clickHandler = Handler.create(this, musicHandler, null, false);
        main.btnRecharge.on(Event.CLICK, this, onClick, [MenuWinType.RECHARGE_WIN]);
        main.btnRank.on(Event.CLICK, this, onClick, [MenuWinType.RANK_SORT]);

        layoutButtons();
    }

    private function outHandler():void {
        outSignal.dispatch([[1, 0]]);
    }

    public function refresh():void {

    }

    public function activityIcon(day:int, finishCount:int, totalCount:int):void {
        if (day <= 0 || day > 7)return;
        if (aIcon == null) {
            aIcon = new BaseActivityIconView();
            main.activityContainer.addChild(aIcon);
        }

        aIcon.setData(day);
        aIcon.setInfo(finishCount, totalCount);

        aIcon.off(Event.CLICK, this, onAIconClick, null);
        aIcon.on(Event.CLICK, this, onAIconClick, null);
    }

    public function openWindow(menuWinTypeName:String, data:Object) {
        openWindowSignal.dispatch([menuWinTypeName, data]);
    }

    public function closeWindow(menuWinTypeName:String, data:Object = null) {
        closeWindowSignal.dispatch([menuWinTypeName, data])
    }

//    public function showOnekeyEquip(goodsvo:PackVO, powerValue:Number, hero_sk:HeroVO = null):void {
//        openWindow(MenuWinType.ONEKEY_EQ, [goodsvo, powerValue, hero_sk]);
//    }

    private function onAIconClick():void {
        openWindow(MenuWinType.SEVEN_DAY, null);
    }

    private function onClick(menuWinTypeName:String) {
        if (menuWinTypeName == MenuWinType.CLAN_OPERATE
                || menuWinTypeName == MenuWinType.DAILY_BOSS
                || menuWinTypeName == MenuWinType.ARENA
                || menuWinTypeName == MenuWinType.TASK_HOOK_VIEW
        ) {
            onOpenWindow.dispatch([menuWinTypeName]);
            return;
        }
        openWindow(menuWinTypeName, null);
    }

    public function updateActivityIcon(finishCount:int, totalCount:int):void {
        if (aIcon)aIcon.setInfo(finishCount, totalCount);
    }

    private function musicHandler():void {
        StaticConfig.musicOnOff = !main.btnMusic.selected;
        musicSignal.dispatch(null);
    }

    /* 底部自适应 */
    private function layoutBottom():void {
        main.downPart.x = AppConst.padX;
        main.chat.x = AppConst.padX;
    }

    /* 需要横向居中的显示对象 使用此方法 */
    private function centerH(s:Sprite):void {
        s.x = (AppConst.width - s.width) / 2;
    }

    /* 顶部自适应 */
    private function layoutTop():void {
        main.upPart.x = AppConst.padX;
        main.activityIconCollect.x = AppConst.padX;
        stonePoint = (main.xianshiTxt.parent as Box).localToGlobal(new Point(main.xianshiTxt.x, main.xianshiTxt.y));
        sliverPoint = (main.sliverTxt.parent as Box).localToGlobal(new Point(main.sliverTxt.x, main.sliverTxt.y));
    }

    /* 左边 右边 下边 按钮的自适应 1上 2下 3左 4右*/
    public function layoutButtons():void {
        updateRightButtonList();

        var icons:Array = ConfigLocator.getInstance().getOpenfuncByPosition(2);
        var cfg:IOpenfuncCfg;
        var iconVo:ActivityVO;
        var btnsAc:Array = [];
        for each(iconVo in icons) {
            cfg = iconVo.openfunc;
            btnsAc.push(iconVo);
        }
        main.iconList.array = btnsAc;
    }

    private function setDownButtonList():void {
        main.iconList.itemRender = MainIconView;
        main.iconList.renderHandler = Handler.create(this, renderDownIconHandler, null, false);
        main.iconList.array = [];
    }

    private function renderDownIconHandler(cell:MainIconView, index:int):void {
        var ac:ActivityVO = main.iconList.array[index];
        cell.init(ac, userLevel);
        cell.on(Event.CLICK, this, gotoActivityHandler, [ac]);
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

        if (acVo.openfunc.win == MenuWinType.DAILY_BOSS) {
            onOpenWindow.dispatch([acVo.openfunc.win]);
            return;
        }

        var vo:MenuWindowVO = new MenuWindowVO(acVo.type, MenuWindowVO.OPEN, new Object());
        MenuWindowVO.setTabIndex(vo.data, acVo.openfunc.tab);
        openWindow(acVo.type, vo.data);
    }

    public function updateRightButtonList():void {
        var icons:Array = ConfigLocator.getInstance().getOpenfuncByPosition(4);
        var cfg:IOpenfuncCfg;
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

    public var buttons:Array = [];

    private function addBtns(side:int, sideName:String) {
        var icons:Array = ConfigLocator.getInstance().getOpenfuncByPosition(side);

        var iconVo:ActivityVO;
        for (var i:int = 0; i < icons.length; i++) {
            iconVo = icons[i];

            addFuncIcon(main[sideName + "Btn" + i], iconVo);
        }
    }

    private function addFuncIcon(con:Box, ac:ActivityVO):void {
        while (con.numChildren > 0) {
            Pool.recover("BaseFuncIconView", con.removeChildAt(0));
        }
        var icon:BaseFuncIconView = Pool.getItemByClass("BaseFuncIconView", BaseFuncIconView);
        icon.init(ac, userLevel);
        icon.pos(-34, 0);
        con.addChild(icon);
        con.on(Event.CLICK, this, onClick, [ac.openfunc.win]);
        buttons.push(icon);
        var cfg:IOpenfuncCfg = icon._vo.openfunc;
        if (cfg && (!cfg.funcid || (cfg.funcid && FuncUtil.check(cfg.funcid)))) {
            //需要显示
            con.visible = true;
        } else {
            con.visible = false;
        }
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
        return main.iconList;
    }

    public function setUserInfo(proxy:UserProxy, vip:String = "激活月卡"):void {
    }

//    public function updateMainHero(vo:HeroVO):void {
//        updateUserLevel(vo.level, vo);
//        main.headIcon.skin = AppConst.texturePath + "avatars/user/" + vo.id + ".png";
//        main.nameLabel.text = vo.name;
//        main.levelTxt.text = vo.level + "级";
//
//        expRect.width = main.expProgress.width * vo.exp / vo.next_exp;
//        expRect.height = main.expProgress.height;
//        main.expProgress.scrollRect = expRect;
//    }

    public function showUpdateReward(body:Object):void {
        updateRightButtonList();
    }

    public function showTaskTip(describe:String):void {
        if (que) {
            que.halt();
        }
        main.taskTips.visible = true;
        main.taskTip.text = describe;
        var list:Array = [
            new TimeoutOper(20000),
            new FunctionOper(this, hideTaskTip, null, hideTaskTip)
        ]
        que = new Queue(list);
        que.execute();

    }

    public function hideTaskTip():void {

        main.taskTips.visible = false;
    }

//    public function updateUserLevel(value:int, mainHero:HeroVO):void {
//        var $level = _userLevel;
//        mainHeroVO = mainHero;
//        userLevel = value;
//        if ($level != value) {
//            layoutButtons();
//        }
//        build.refresh(value);
//    }

    public function set userLevel(value:int):void {

//        if (_userLevel != value) {
//            if (_userLevel != 0 && value != 1) {
//                openWindow(MenuWinType.LEVEL_UP_VIEW, [value, mainHeroVO]);
//            }
//        }

        //统计等级
        TDManager.setLevel(value);

        _userLevel = value;
    }

    public function get userLevel():int {
        return _userLevel;
    }
}
}