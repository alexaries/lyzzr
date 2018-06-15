package com.game.common.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.events.PopManagerEvent;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseFuncIconView;
import com.game.common.view.BuildButtonView;
import com.game.common.view.MainIconView;
import com.game.common.view.MyHomeView;
import com.game.events.NotiEvent;
import com.game.module.menu.events.MenuEvent;
import com.game.module.redPoint.proxy.RedPointProxy;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.FuncUtil;
import com.game.vo.ActivityVO;
import com.game.vo.MenuWinType;

import laya.ui.Image;
import laya.ui.List;

import net.consts.StaticConfig;
import net.data.recvMsg.chat.ChatMsg;
import net.data.recvMsg.chat.ChatSystemMsg;
import net.data.structs.chat.ChatStruct;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

import ui.main.MyHomeUI;

import utils.HtmlUtil;

public class MyHomeMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "MyHomeMediator";

    private var userProxy:UserProxy;
    private var redProxy:RedPointProxy;

    private function get view():MyHomeView {
        return getViewComponent() as MyHomeView;
    }

    public function MyHomeMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.instanceSignal.getSignal(this).listen(instanceCompleteHander);
    }

    private function get main():MyHomeUI {
        return view.main;
    }

    private function instanceCompleteHander():void {
        view.outSignal.getSignal(this).listen(outFight);
        view.build.gotoActivitySignal.getSignal(this).listen(gotoActivityHandler);
    }

    private function gotoActivityHandler(acVo:ActivityVO):void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.TAVERN_VIEW, MenuWindowVO.OPEN, new Object())));
    }

    private function closeWin(menuWinTypeName:String, data:Object = null):void {
        var vo:MenuWindowVO = new MenuWindowVO(menuWinTypeName, MenuWindowVO.CLOSE, data);
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));
    }

    private function openWin(menuWinTypeName:String, data:Object):void {
        var vo:MenuWindowVO = new MenuWindowVO(menuWinTypeName, MenuWindowVO.OPEN, data);
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));
    }

    function openChat():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.CHAT_VIEW, MenuWindowVO.OPEN, [1])));
    }

    private function openTest():void {
        //todo
        return;
        StaticConfig.welcome = true;
    }


    public function outFight(obj:Array = []):void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COPY_VIEW, MenuWindowVO.OPEN, new Object())));
    }

    /**
     * 每秒刷新一次
     * @param icon
     */
    private function refreshRightIconHandler(icon:BaseFuncIconView):void {
    }

    private function refreshRightIconOnceHandler(icon:BaseFuncIconView):void {
    }

    /** 接收网络信息 **/
    public function msgReceive(msg):void {
    }

    function fuc(obj):void {
        var vo:ChatStruct = (obj as Array)[1];
        if (vo) {
            if (vo.type == ChatStruct.WHISPER && vo.name != userProxy.userVO.name) {
                //打开聊天
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.PCHAT_VIEW, MenuWindowVO.OPEN, [vo.name])));
            }
        }
    }

    private function musicSetHandler():void {
        dispatch(new NotiEvent(NotiEvent.MUSIC_SET));
    }

    private function onOpenWindow(menuWinTypeName:String):void {
    }

    /**右侧按钮 参数【按钮名字，是否红点，编号id（选填）】*/
    public function redPointOnRightBtn(arr:Array):void {
        var icon_name:String = arr[0];
        var flag:uint = arr[1];

        //右方按钮
        var icons:List = view.getRightBtnList();
        var cell:BaseFuncIconView;
        var vo:ActivityVO;
        var i:int;
        for (i = 0; i < icons.length; i++) {
            cell = icons.getCell(i) as BaseFuncIconView;
            vo = icons.array[i];
//            if (cell && vo.openfunc.guide_name == icon_name && cell.isLocked == false) {
//                dispatch(new NotiEvent(NotiEvent.SHOW_REDPOINT, [cell.ui.redCon, flag, 0]));
//                return;
//            }
        }

        //下方按钮
        var cell2:MainIconView;
        var icons_down:List = view.getBottomBtnList();
        for (i = 0; i < icons_down.length; i++) {
            cell2 = icons_down.getCell(i) as MainIconView;

            vo = icons_down.array[i];
//            if (cell2 && vo.openfunc.guide_name == icon_name && cell2.isLocked == false) {
//                dispatch(new NotiEvent(NotiEvent.SHOW_REDPOINT, [cell2.ui.redCon, flag, 0]));
//                return;
//            }
        }

        //任务和日常 按钮
        var icons_special:Array = [main.richangBtn];
        var cell3:Image;
        for (i = 0; i < icons_special.length; i++) {
            cell3 = icons_special[i];
            if (cell3 && cell3.name == icon_name) {
                if (icon_name == "zhujiemian_richang") {
                    if (FuncUtil.isOpen(76)) {
                        redProxy.redpointDic.set(1000, flag);
                        dispatch(new NotiEvent(NotiEvent.SHOW_REDPOINT, [cell3, flag]));
                    }
                    else {
                        redProxy.redpointDic.set(1000, false);
                        dispatch(new NotiEvent(NotiEvent.SHOW_REDPOINT, [cell3, false]));
                    }
                }
                break;
            }
        }

        //建筑按钮
        var cell4:BuildButtonView;
        var builds:Vector.<BuildButtonView> = view.build.builds;
        for (i = 0; i < builds.length; i++) {
            cell4 = builds[i] as BuildButtonView;

            vo = builds[i]._vo;
//            if (cell4 && vo.openfunc.guide_name == icon_name && cell4.isLocked == false) {
//                dispatch(new NotiEvent(NotiEvent.SHOW_REDPOINT, [cell4.ui.redCon, flag, 0]));
//                return;
//            }
        }
    }

    private function closeWindow(name:String, body:Object):void {
        view.closeWindow(name, body);
    }

    public function openWindow(menuWinTypeName:String, data:Object) {
        view.openWindow(menuWinTypeName, data);
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [NotiEvent.MENU_STATE_CHANGE,
            NotiEvent.SHOW_ACTIVITY_ICON,
            NotiEvent.REMOVE_ACTIVITY_ICON,
            NotiEvent.USER_INFO_UPDATE,
            NotiEvent.HERO_INFO_UPDATE,
            NotiEvent.HERO_DATA_UPDATE,
            NotiEvent.NEWVIP_INFO,
            NotiEvent.TASK_TIP_HIDE,
//            MapServiceEvent.MAP_ARRIVED_BUILD,
            NotiEvent.CHAT_GET_INFO,
            NotiEvent.CHAT_GET_ERROR,
            NotiEvent.INFO_REDPOINT,
            NotiEvent.USER_LEVEL_UPDATE,
            PopManagerEvent.UPGRADE_REWARD,
            NotiEvent.REFRESH_POWER
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.MENU_STATE_CHANGE:
                view.updateRightButtonList();
                break;
            case NotiEvent.SHOW_ACTIVITY_ICON:
                view.showIcon(body as ActivityVO);
                break;
            case NotiEvent.REMOVE_ACTIVITY_ICON:
                view.removeIcon(body as ActivityVO);
                break;
            case  NotiEvent.USER_INFO_UPDATE:
                break;
            case NotiEvent.HERO_INFO_UPDATE:
                break;
            case  NotiEvent.HERO_DATA_UPDATE:
                break;
            case  NotiEvent.NEWVIP_INFO:
                break;
            case NotiEvent.TASK_TIP_HIDE:
                view.hideTaskTip();
                break;
//            case  MapServiceEvent.MAP_ARRIVED_BUILD:
//                view.updateMapInfo(body[0]);
//                break
            case NotiEvent.CHAT_GET_INFO:
                msgReceive(body as ChatMsg);
                break;
            case NotiEvent.CHAT_GET_ERROR:
                var sysMsg:ChatSystemMsg = body as ChatSystemMsg;
                if (sysMsg.type == ChatSystemMsg.SYS_MSG_ROLL) {
                    oneKeyHandler(sysMsg.content);
                    //dispatch(new NotiEvent(NotiEvent.ITEM_TWEENTO_PACK, sysMsg.content));
                    view.openWindow(MenuWinType.GOODSITEM_TWEEN, [sysMsg.content])
                }
                if (sysMsg.type == ChatSystemMsg.SYS_MSG_WORLD) {
                    var str:String = HtmlUtil.shiftColorTxtStr(sysMsg.content, sysMsg.color);
                    msgReceive(str);
                }
                break;
            case NotiEvent.INFO_REDPOINT:
                redPointOnRightBtn(body as Array);
                break;
            case  NotiEvent.USER_LEVEL_UPDATE:
                //view.updateUserLevel(userProxy.userVO.level, userProxy.getMainHero());
                break;
            case PopManagerEvent.UPGRADE_REWARD:
                view.showUpdateReward(body);
                break;
            case NotiEvent.REFRESH_POWER:
                break;
        }
    }

    /* 一键xx 弹框 */
    private function oneKeyHandler(content:String):void {
    }

}
}