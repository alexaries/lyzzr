package com.game.common.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.events.WindowEvent;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.CalculatorView;
import com.game.common.view.GameMain;
import com.game.events.NotiEvent;
import com.game.module.menu.events.MenuEvent;
import com.game.vo.FuncOpenVO;
import com.game.vo.MenuWinType;

import laya.display.Sprite;

import net.consts.AppConst;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class GameMainMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "GameMainMediator";

    public function get view():GameMain {
        return getViewComponent() as GameMain;
    };

    public function GameMainMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(onInstanceComplete);
//        view.build.gotoActivitySignal.getSignal(this).listen(gotoActivityHandler)
        view.goSignal.getSignal(this).listen(gotoActivityHandler);
    }

    private function gotoActivityHandler(acVo:FuncOpenVO):void {
        if (acVo.winType == "heros_info") {
            openWindow(MenuWinType.COMPANY_VIEW, null);
        }
        else if (acVo.winType == "heroicRetreatView") {
            openWindow(MenuWinType.JIBAN_VIEW, null);
        }
        else {
            openWindow(MenuWinType.TAVERN_VIEW, null);
        }

//        if (!acVo)return;
//        var vo:MenuWindowVO = new MenuWindowVO(acVo.winType, MenuWindowVO.OPEN, new Object());
//        openWindow(acVo.winType, vo.data);
    }

    private function onInstanceComplete():void {
    }


    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            NotiEvent.CHAT_GET_INFO,
            NotiEvent.POPUP_DLG,
            NotiEvent.POPUP_DEMO,
            NotiEvent.POPUP_WIN,
            WindowEvent.MENU_CLOSE_ALL_WIN,
            NotiEvent.SHOW_ACTIVITY_ICON,
            NotiEvent.REMOVE_ACTIVITY_ICON,
            MenuEvent.MENU_CLIK,
            NotiEvent.USER_INFO_UPDATE,
            NotiEvent.HERO_INFO_UPDATE,
            NotiEvent.HERO_DATA_UPDATE,
            NotiEvent.VIP_LEVEL,
            NotiEvent.SHOW_CALCULATOR,
            NotiEvent.TASK_REFRESH_INIT,
            NotiEvent.USER_LEVEL_UPDATE,
            NotiEvent.CHAT_GET_ERROR,
            NotiEvent.INFO_REDPOINT,
            NotiEvent.NEWVIP_INFO,
            NotiEvent.MENU_STATE_CHANGE,
            NotiEvent.OPEN_HOME,
            NotiEvent.CLOSE_HOME,
            NotiEvent.OPEN_MONEY,
            NotiEvent.CLOSE_MONEY,
            NotiEvent.OPEN_COPY,
            NotiEvent.CLOSE_COPY
        ];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case  NotiEvent.POPUP_DEMO:
                var data:Object = null;
                if (body.length > 1) {
                    data = body[1];
                }
                if (body[1] == 1) {
                    openWindow(body[0], data);
                } else {
                    closeWindow(body[0], data);
                }
                break;
            case  MenuEvent.MENU_CLIK:
                var mw:MenuWindowVO = body as MenuWindowVO;
                if (mw.state == MenuWindowVO.OPEN) {
                    openWindow(mw.menuWinTypeName, mw.data);
                } else {
                    closeWindow(mw.menuWinTypeName, mw.data);
                }
                break;
            case  NotiEvent.POPUP_WIN:
                var data:Object = null;
                if (body.length > 1) {
                    data = body[1];
                }
                openWindow(body[0], data);
                break;
            case  NotiEvent.POPUP_DLG:
            {
                var data = null;
                if (body.length == 3) {
                    data = body[2];
                }
                if (body[1] == 1) {
                    openWindow(body[0], data);
                } else {
                    closeWindow(body[0], data);
                }
                break;
            }
            case MenuWindowVO.OPEN:
                openWin(body as MenuWindowVO);
                break;
            case MenuWindowVO.CLOSE:
                closeWin(body as MenuWindowVO);
                break;
            case WindowEvent.MENU_CLOSE_ALL_WIN:
                view.closeViewLists();
                break;
            case NotiEvent.SHOW_CALCULATOR:
                showCalculatorDlg();
                break;
            case  NotiEvent.USER_LEVEL_UPDATE:
                levelUpdate();
                break;
            case NotiEvent.OPEN_HOME:

                break;
            case NotiEvent.CLOSE_HOME:

                break;
            case NotiEvent.OPEN_MONEY:
                view.openMoney();
                break;
            case NotiEvent.CLOSE_MONEY:
                view.closeMoney();
                break;
            case NotiEvent.OPEN_COPY:
                view.openCopy();
                break;
            case NotiEvent.CLOSE_COPY:
                view.closeCopy();
                break;
        }
    }

    private function levelUpdate():void {
        //MovieClipUtil.showUI(main, AppConst.width / 2, AppConst.height / 2, "shengji");
    }

    private function closeWindow(name:String, body:Object):void {
        view.closeWindow(name, body);
    }

    public function openWindow(menuWinTypeName:String, data:Object) {
        view.openWindow(menuWinTypeName, data);
    }

    private function closeWin(body:MenuWindowVO):void {
        view.closeWin(body);
    }

    private function openWin(body:MenuWindowVO):void {
        view.openWin(body);
    }

    public function showCalculatorDlg():void {
        var calculator:CalculatorView = new CalculatorView();
        calculator.popup(false);
    }
}
}