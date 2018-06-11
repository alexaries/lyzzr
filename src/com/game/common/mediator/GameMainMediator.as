package com.game.common.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.events.ScreenEvent;
import com.game.common.events.WindowEvent;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.CalculatorView;
import com.game.common.view.GameMain;
import com.game.events.NotiEvent;
import com.game.module.menu.events.MenuEvent;
import com.game.module.redPoint.proxy.RedPointProxy;
import com.game.module.task.proxy.TaskHookProxy;
import com.game.module.task.struct.TaskHookData;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;

import laya.display.Sprite;

import net.consts.AppConst;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

import ui.main.GameMainUI;

public class GameMainMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "GameMainMediator";


    private var userProxy:UserProxy;


    private var hookProxy:TaskHookProxy;
    private var hookData:TaskHookData;

    private var redProxy:RedPointProxy;

    private var chatTempArr:Array;


    public function get view():GameMain {
        return getViewComponent() as GameMain;
    };


    public function GameMainMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);

    }

    override public function onRegister():void {
        super.onRegister();
    }

    private function onInstanceComplete():void {
    }


    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            NotiEvent.TASK_TIP_SHOW,
            NotiEvent.TASK_TIP_HIDE,
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
            NotiEvent.PRACTICE_PLACE_INFO_MSG,
            NotiEvent.SHOW_CALCULATOR,
            NotiEvent.TASK_REFRESH_INIT,
            NotiEvent.USER_LEVEL_UPDATE,
            NotiEvent.CHAT_GET_ERROR,
            NotiEvent.EQ_ONEKEY,
            NotiEvent.PRACTICE_HOOK_UPDATE,
            NotiEvent.INFO_REDPOINT,
            NotiEvent.NEWVIP_INFO,
            NotiEvent.MENU_STATE_CHANGE,
            NotiEvent.OPEN_HOME,
            NotiEvent.CLOSE_HOME
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

            case NotiEvent.PRACTICE_PLACE_INFO_MSG:
                break;
            case NotiEvent.SHOW_CALCULATOR:
                showCalculatorDlg();
                break;
            case  NotiEvent.USER_LEVEL_UPDATE:
                //view.updateUserLevel(userProxy.userVO.level, userProxy.getMainHero());

                levelUpdate();
                delayGuideOnekey();
                break;
            case NotiEvent.TASK_TIP_SHOW:
                //  view.showTaskTip(body as String)
                break;

            case NotiEvent.EQ_ONEKEY:
                delayGuideOnekey(body as Array);
                break;
            case NotiEvent.PRACTICE_HOOK_UPDATE:
                return;
                var arr:Array = body as Array;
                if (arr == null || arr.length == 0)return;
                var taskId:int = arr[0];
                openWindow(MenuWinType.OPEN_CHAPTER, taskId);
                //dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.OPEN_CHAPTER, MenuWindowVO.OPEN)));//打开新章节界面

//                updateTaskHook();
//                updatePractice(1);
                break;

            case NotiEvent.OPEN_HOME:
                view.openHome();
                break;
            case NotiEvent.CLOSE_HOME:
                view.closeHome();
                break;
        }
    }

    private function levelUpdate():void {
        //MovieClipUtil.showUI(main, AppConst.width / 2, AppConst.height / 2, "shengji");
    }


    private function get main():GameMainUI {
        return view.main;
    }

    private function closeWindow(name:String, body:Object):void {
        view.closeWindow(name, body);
    }

    public function openWindow(menuWinTypeName:String, data:Object) {
        if (menuWinTypeName == MenuWinType.TASK_HOOK_VIEW) {
//            if (!taskHookProxy.isCan) {
//                facade.notifyObservers(new NotiEvent(NotiEvent.TASK_REQUEST_HOOK, [0, 1]));
//                return;
//            }
//            if (!taskHookProxy.isCanHook) {
//                !facade.notifyObservers(new Notification(NotiEvent.ROLL_ALERT, "当前据点不可以挂机!"));
//                return;
//            }
        } else if (menuWinTypeName == MenuWinType.ENDLESS_TOWER) {
            facade.notifyObservers(new ScreenEvent(ScreenEvent.ENDLESS_TOWER, true));
            return;
        }

        view.openWindow(menuWinTypeName, data);
    }

    private function closeWin(body:MenuWindowVO):void {
        view.closeWin(body);
    }

    private function openWin(body:MenuWindowVO):void {
        view.openWin(body);
    }

    function get taskHookProxy():TaskHookProxy {
        return facade.retrieveProxy(TaskHookProxy.NAME) as TaskHookProxy;
    }

    public function rootAddNode(node:Sprite):void {
        if (node && !view.root.contains(node)) {
            node.pos((AppConst.width - node.width) / 2, (AppConst.height - node.height) / 2);
            view.root.addChild(node);
        }
    }

    /* 虚拟数字键盘 */
    public function showCalculatorDlg():void {
        var calculator:CalculatorView = new CalculatorView();
        calculator.popup(false);
    }

    private function delayGuideOnekey(Arr:Array = []):void {
//        var itemid:int = Arr[0];
//        if (Arr.length > 0 && itemid != 0) {
//            var itemNum:int = Arr[1];
//            var hero:HeroVO = Arr[2];
//            oPack = PackUtil.createPackVO(itemid);
//            oPack.pileNums = itemNum;
//            if (oPack.level <= userProxy.userData.userVO.level) {
//                facade.notifyObservers(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.ONEKEY_EQ, MenuWindowVO.OPEN, [oPack, 0, hero])));
//            }
//            return;
//        }
//        var needOpenId:int = 0;
//        var oPack:PackVO;
//        var iArr:Array = [37, 17, 18, 19, 20, 21];
//        //新手礼包 逻辑
//        for (var o:int = 0; o < iArr.length; o++) {
//            var num:int = PackUtil.getGoodsNumByID(packProxy.packDic, iArr[o]);
//            if (num > 0) {
//                needOpenId = iArr[o];
//                oPack = PackUtil.createPackVO(needOpenId);
//                oPack.pileNums = 1;
//                if (oPack.level <= userProxy.userData.userVO.level) {
//                    facade.notifyObservers(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.ONEKEY_EQ, MenuWindowVO.OPEN, [oPack, 0])));
//                    break;
//                }
//            }
//        }
    }
}
}