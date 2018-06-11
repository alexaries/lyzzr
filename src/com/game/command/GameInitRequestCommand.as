/**
 * Created by huangcb on 2017/10/12.
 */
package com.game.command {

import com.game.consts.URLConfig;
import com.game.events.NotiEvent;
import com.game.module.battle.proxy.FfProxy;
import com.game.module.daily.proxy.DailyService;
import com.game.module.friendlyDegree.events.FriendlyEvent;
import com.game.module.guide.vo.ShopReturnVo;
import com.game.module.user.proxy.UserProxy;

import config.ConfigManager;
import config.activity.goodShop.IGoodShop_data_item;
import config.mission.config.IConfig_fight_item;
import config.mission.config.IConfig_func_item;
import config.mission.payreturnnew.IPayreturnnew_data_grid;
import config.mission.payreturnnew.IPayreturnnew_data_grid_item;
import config.mission.shopreturn.IShopreturn_data_item;

import globals.ConfigLocator;

import laya.utils.Dictionary;

import net.consts.StaticConfig;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;
import org.puremvc.as3.patterns.observer.Notification;

public class GameInitRequestCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        refresh();
        autoFightHandle();
//        var userid:String=StaticConfig.userId16;
//        trace("userid",userid)

        var item = ConfigManager.instance.mission_daily.root.time;
        userProxy.userData.dailyTimeActs = [(item.w0), (item.w1), (item.w2), (item.w3), (item.w4), (item.w5), (item.w6), (item.w7)];
    }

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function  get   ffProxy():FfProxy {
        return facade.retrieveProxy(FfProxy.NAME) as FfProxy;
    }

    function  get   dailyService():DailyService {
        return facade.retrieveProxy(DailyService.NAME) as DailyService;
    }

    private function autoFightHandle():void {
        var dic1:Dictionary = new Dictionary();
        var dic2:Dictionary = new Dictionary();
        var item:IConfig_fight_item = ConfigManager.instance.mission_config.fight.item
        var arr1:Array = (item.ids).split(",");
        var arr2:Array = (item.tar).split(",");
        userProxy.userData.autoFightIds = String(item.ids).split(",");
        for (var i:int = 0; i < arr1.length; i++) {
            dic1.set(parseInt(arr1[i]), arr2[i]);
        }
        for each (var obj:IConfig_func_item in ConfigManager.instance.mission_config.func.item) {
            dic2.set(obj.id, obj)
        }
        ffProxy.modelGrid.sTipList = ConfigManager.instance.mission_config.fight.sTip.split("|");
        ffProxy.modelGrid.fTipList = ConfigManager.instance.mission_config.fight.fTip.split("|");
        ConfigLocator.getInstance().autoFightDic = dic1;
        ConfigLocator.getInstance().npcFunctionDic = dic2;
    }

    private function payreturnnewHandle():void {
        var list:Array = [];
        var arr:Array;
        for each (var grid:IPayreturnnew_data_grid in  ConfigManager.instance.mission_payreturnnew.data.grid) {
            arr = [];
            for each(var item:IPayreturnnew_data_grid_item in grid.item) {
                arr.push(item);
            }
            list.push(arr);
        }
        dailyService.vo.PayList = list;
        dailyService.vo.PayMaxList = ConfigManager.instance.mission_payreturnnew.data.max.split(",");
        // DailyVo.PayReturnList = arr;
        return;
    }

    private function shopreturnHandle(xml:Object, index:uint):void {
        var arr:Array = [];
        for each (var item:IShopreturn_data_item in xml.item) {
            arr.push(item);
        }
        ShopReturnVo.RETURN_LISTS[index] = arr;
        if (index == 0)
            ShopReturnVo.ReturnMaxList = (xml.max).split(",");
        return;
    }

    private function goodShopHandle():void {
        var arr:Array = [];
        for each (var item:IGoodShop_data_item in ConfigManager.instance.activity_goodShop.data.item) {
            arr.push(item);
        }
        ShopReturnVo.GOOD_RETURN_LISTS = arr;
        ShopReturnVo.GOOD_RETURN_MAX = ConfigManager.instance.activity_goodShop.data.max;
    }

    private function refresh():void {

        payreturnnewHandle();
        shopreturnHandle(ConfigManager.instance.mission_shopreturn.data, 0);
        shopreturnHandle(ConfigManager.instance.mission_shopreturn1.data, 1);
        shopreturnHandle(ConfigManager.instance.mission_shopreturn2.data, 2);
        shopreturnHandle(ConfigManager.instance.mission_shopreturn3.data, 3);
        shopreturnHandle(ConfigManager.instance.mission_shopreturn4.data, 4);
        shopreturnHandle(ConfigManager.instance.mission_shopreturn5.data, 5);
        shopreturnHandle(ConfigManager.instance.mission_shopreturn6.data, 6);
        goodShopHandle();
        this.dispatch(new NotiEvent(NotiEvent.HEROIC_REQUEST_RETREAT, [0]));
        this.dispatch(new NotiEvent(NotiEvent.GROUP_COPY_REQUEST_INFO, [0]));

        dispatch(new NotiEvent(NotiEvent.REQ_SYS_SERVER_TIME, 1));
        dispatch(new NotiEvent(NotiEvent.REQ_SYS_SERVER_TIME, 2));
        dispatch(new NotiEvent(NotiEvent.REQ_SYS_SERVER_TIME, 3));

        StaticConfig.isNew = StaticConfig.isNew_web = true;
        if (StaticConfig.isNew) {
            if (StaticConfig.platflag == 1) {
                //QQ大厅奖励
                if (URLConfig.popQGameAwardValue != 0)
                    dispatch(new NotiEvent(NotiEvent.GUIDE_BUBBLE_TIP, [5]));
            }
        }
//			qtLoginVo.signnum = qtLoginVo.checkSignNum(0);
        dispatch(new NotiEvent(NotiEvent.FUND_SEND_INFO, [0x00, 0]));
        dispatch(new NotiEvent(NotiEvent.FUND_SEND_INFO, [0x02, 0]));
        dispatch(new NotiEvent(NotiEvent.MARRIAGE_SEND_INFO, []));
        dispatch(new NotiEvent(NotiEvent.CHAOS_SEND_INFO, [0x00]));
        dispatch(new NotiEvent(NotiEvent.TIANYUAN_SEND_INFO, [0x00]));
        /*
         if(userProxy.timeAble(userProxy.userData.getActivityTimeByID(100116))){
         activity.sendSeverStatus();
         }*/
        //todo

        dispatch(new FriendlyEvent(FriendlyEvent.GET_FRIENDLY_VALUE));
        return;
    }

}
}
