package com.game.common.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.ActivityIconListView;
import com.game.common.view.Alert;
import com.game.common.view.BaseIconView;
import com.game.events.NotiEvent;
import com.game.module.menu.events.MenuEvent;
import com.game.module.redPoint.proxy.RedPointProxy;
import com.game.module.share.event.ShareEvent;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.FuncUtil;
import com.game.vo.ActivityVO;
import com.game.vo.MenuWinType;

import config.mission.openfunc.IOpenfuncCfg;

import globals.ConfigLocator;

import laya.ui.List;
import laya.utils.Dictionary;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class ActivityIconListMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "ActivityIconListMediator";
    private var userProxy:UserProxy;
    private var redProxy:RedPointProxy;
    private var datas:Array;

    private function get view():ActivityIconListView {
        return getViewComponent() as ActivityIconListView;
    }

    public function ActivityIconListMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        redProxy = facade.retrieveProxy(RedPointProxy.NAME) as RedPointProxy;
        view.gotoActivitySignal.getSignal(this).listen(gotoActivityHandler);
        view.pageChangeSignal.getSignal(this).listen(pageChangeHandler);
        refresh();
        //分享关注的信息
        dispatch(new ShareEvent(ShareEvent.GET_INFO));
    }

    private function refresh():void {
        datas = [];
        view.userLevel = userProxy.userVO.level;
        var icons:Array = ConfigLocator.getInstance().getOpenfuncByPosition(1);
        var cfg:IOpenfuncCfg;
        var iconVo:ActivityVO;
        for each(iconVo in icons) {
            cfg = iconVo.openfunc;
            if (cfg.level <= userProxy.userVO.level && (!cfg.funcid || (cfg.funcid && FuncUtil.check(cfg.funcid)))) {
                datas.push(iconVo);
            }
        }
        view.resetView(datas);
        checkRedPoint();
    }

    private function checkRedPoint():void {

    }

    private function gotoActivityHandler(acVo:ActivityVO):void {
//        if (!acVo) {
//            return;
//        }
//        var vo:MenuWindowVO = new MenuWindowVO(acVo.type, MenuWindowVO.OPEN, new Object());
//        MenuWindowVO.setTabIndex(vo.data, acVo.openfunc.tab);
//        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));

        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.TAVERN_VIEW, MenuWindowVO.OPEN, new Object())))
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.USER_LEVEL_UPDATE,
            NotiEvent.HERO_INFO_UPDATE,
            NotiEvent.HERO_DATA_UPDATE,
            NotiEvent.MENU_STATE_CHANGE,
            NotiEvent.INFO_REDPOINT
            /*NotiEvent.MENU_ICON_BUBBLE_SHOW*/];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.USER_LEVEL_UPDATE:
            case NotiEvent.HERO_INFO_UPDATE:
            case NotiEvent.HERO_DATA_UPDATE:
            case NotiEvent.MENU_STATE_CHANGE:
                refresh();
                break;
            case NotiEvent.INFO_REDPOINT:
                redPointOnUpBtn(body as Array);
                break;
        }
    }

    /**处理上方按钮 红点   参数【按钮名字，是否红点，编号id（选填）】*/
    public function redPointOnUpBtn(arr:Array):void {
        var icon_name:String = arr[0];
        var flag:uint = arr[1];

        var icons:List = view.getIconList();
        var vo:ActivityVO;
        var cell:BaseIconView;
        for (var i:int = 0; i < icons.length; i++) {
            cell = icons.getCell(i) as BaseIconView;
            vo = icons.array[i];
            if (cell && vo.openfunc.guide_name == icon_name) {
                dispatch(new NotiEvent(NotiEvent.SHOW_REDPOINT, [cell.ui.redCon, flag, 0]));
                break;
            }
        }
    }

    private function pageChangeHandler():void {
        var icons:List = view.getIconList();
        var vo:ActivityVO;
        var cell:BaseIconView;
        var gname:String;
        var dic:Dictionary = ConfigLocator.getInstance().redPointDic;
        var iconID:int;
        var flag:uint;

        for (var i:int = 0; i < icons.length; i++) {
            cell = icons.getCell(i) as BaseIconView;
            vo = icons.array[i];
            gname = vo.openfunc.guide_name;
            iconID = getKeyByValue(gname, dic);
            iconID = Math.floor(iconID / 10 * 10);
            flag = redProxy.redpointDic.get(iconID);
            dispatch(new NotiEvent(NotiEvent.SHOW_REDPOINT, [cell.ui.redCon, flag, 0]));
        }
    }

    public static function getKeyByValue(value:String, dic:Dictionary):int {
        var keys:Array = dic.keys;
        var len:int = keys.length;
        for (var i:int = 0; i < len; i++) {
            if (dic.get(keys[i]).btnName == value)
                return keys[i];
        }
        return null;
    }
}
}