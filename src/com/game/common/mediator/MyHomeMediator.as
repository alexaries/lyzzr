package com.game.common.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.events.PopManagerEvent;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.MyHomeView;
import com.game.events.NotiEvent;
import com.game.module.menu.events.MenuEvent;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.ActivityVO;
import com.game.vo.MenuWinType;

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

    private function get view():MyHomeView {
        return getViewComponent() as MyHomeView;
    }

    public function MyHomeMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.outSignal.getSignal(this).listen(outFight);
        view.build.gotoActivitySignal.getSignal(this).listen(gotoActivityHandler);
    }

    private function get main():MyHomeUI {
        return view.ui;
    }

    private function instanceCompleteHander():void {

    }

    private function gotoActivityHandler(acVo:ActivityVO):void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.TAVERN_VIEW, MenuWindowVO.OPEN)));
//        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COMPANY_VIEW, MenuWindowVO.OPEN)));
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

    public function outFight():void {
        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.COPY_VIEW, MenuWindowVO.OPEN, new Object())));
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
                break;
            case NotiEvent.REMOVE_ACTIVITY_ICON:
                break;
            case  NotiEvent.USER_INFO_UPDATE:
                break;
            case NotiEvent.HERO_INFO_UPDATE:
                break;
            case  NotiEvent.HERO_DATA_UPDATE:
                break;
            case  NotiEvent.NEWVIP_INFO:
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