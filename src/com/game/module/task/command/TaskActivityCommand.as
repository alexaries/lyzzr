/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.command {

import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseCommand;
import com.game.events.NotiEvent;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.menu.events.MenuEvent;
import com.game.module.task.events.TaskEvent;
import com.game.module.task.vo.item.DailyLimitActItemVo;
import com.game.module.task.vo.item.DailyUnlimitedActItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;
import com.game.vo.MonsterVO;

import globals.ConfigLocator;

import laya.utils.Dictionary;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class TaskActivityCommand extends BaseCommand implements ICommand {

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }

    function  get  dailyService():DailyService {
        return facade.retrieveProxy(DailyService.NAME) as DailyService;
    }

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case TaskEvent.DO_LIMIT_ACT_OPEN:
                doViewLstLimitActOpen(body as DailyLimitActItemVo);
                break;
            case TaskEvent.DO_UNLIMIT_ACT_OPEN:
                doViewLstUnlimitedActOpen(body as DailyUnlimitedActItemVo);
                break;
            case   NotiEvent.HOTEL_RESPONSE_PUB_LIST:
                doHotelTime(body as HotelVo);
                break;
            case  NotiEvent.BOOKSTORE_RESPONSE_LIST:
                doBookstoreTime(body as BookstoreVo);
                break;
        }
    }

    private function doBookstoreTime(bookstoreVo:BookstoreVo):void {
        dailyService.vo.bookstoreTime = bookstoreVo.time;
        dailyService.timerDailyResponseData()
    }

    private function doHotelTime(hotelVo:HotelVo):void {
        dailyService.vo.hotelTime = hotelVo.time;
        dailyService.timerDailyResponseData()
        //通知更新
    }

    private function getHookData():MonsterVO {
        var monstervo:MonsterVO;
        if (userProxy.userVO.level >= 30) {
            var monsters:Dictionary = ConfigLocator.getInstance().monsters;
            var levelM:int = userProxy.userVO.level;
            for each (var item:MonsterVO in monsters) {
                if (item.type == 2 && item.footHoldId != 0) {
                    if (item.level == levelM) {
                        monstervo = item;
                        break;
                    } else if (item.level < levelM) {
                        if (!monstervo)
                            monstervo = item;
                        if (monstervo.level < item.level)
                            monstervo = item;
                    }
                }
            }
        }
        return monstervo;
    }

    private function doViewLstLimitActOpen(dVo:DailyLimitActItemVo):void {

        var module:Object;
        switch (dVo.buttonType) {
            case 0:
                break;
            case 1:
                switch (dVo.index) {
                    case 2:
                        var monster:MonsterVO = getHookData();
                        if (!monster) {
                            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, '没有合适的挂机点'));
                            return;
                        }
                        var hookid:int = monster.footHoldId;
                        dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [0, hookid]));
                        break;
                    default:
                        dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [0, dVo.build]));
                        break;
                }
                break;
            case 2:
                switch (dVo.index) {
                    case 0:
                        break;
                    case 1:
                        break;
                    case 2:
                        dispatch(new NotiEvent(NotiEvent.POPUP_WIN, [MenuWinType.HEROES_INFO]));
                        break;
                    case 3:
                        break;

                    default:
                        //if (dVo.build == 3) {
//                            var menuAction:MenuWindowVO = new MenuWindowVO(MenuWinType.USER_INFO, MenuWindowVO.OPEN, 1);
//                            dispatch(new MenuEvent(MenuEvent.MENU_CLIK, menuAction));
//                        } else {
//                            module = ConfigLocator.getInstance().moduleDic.get(dVo.build) as Object;
//                            dispatch(new NotiEvent(NotiEvent.POPUP_WIN, [module["win"]]));
//                        }
                        break;
                }
                break;
        }
        return;
    }


    private function doViewLstUnlimitedActOpen(dVo:DailyUnlimitedActItemVo):void {

        var module:Object;
        switch (dVo.buttonType) {
            case 0:
                break;
            case 1:
                switch (dVo.id) {
                    case 3:
                        if (dVo.state == 3) {
                            dispatch(new NotiEvent(NotiEvent.CLAN_VIEW));
                        } else {
                            dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [0, dVo.build]));
                        }
                        break;
                    case 6:
                        FightSword();
                        break;
                    case 8:
                        if (dVo.state == 3) {
                            dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [0, dVo.build]));
                            //dispatch(new NotiEvent(NotiEvent.POPUP_WIN,[MenuWinType.SWORDFIGHT]));
                        } else {
                            dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [0, dVo.build]));
                        }
                        break;
                    default:
                        dispatch(new MapOperatorEvent(MapOperatorEvent.DELIVER, [0, dVo.build]));
                        break;
                }
                break;
            case 2:
                module = ConfigLocator.getInstance().moduleDic.get(dVo.build) as Object;
                dispatch(new NotiEvent(NotiEvent.POPUP_WIN, [module["win"]]));
                break;
        }
        return;
    }

    private function FightBoss(dVo:DailyUnlimitedActItemVo):void {
    }

    private function FightSword():void {
        //dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.SWORDFIGHT_JOIN, MenuWindowVO.OPEN)));
        dispatch(new Notification(SwordfightEvent.CheckSwordFight));
    }
}
}
