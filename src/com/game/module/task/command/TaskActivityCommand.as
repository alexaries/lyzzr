/**
 * Created by huangcb on 2017/9/11.
 */
package com.game.module.task.command {

import com.game.common.mvc.BaseCommand;
import com.game.events.NotiEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.task.events.TaskEvent;
import com.game.module.task.vo.item.DailyLimitActItemVo;
import com.game.module.task.vo.item.DailyUnlimitedActItemVo;
import com.game.module.user.proxy.UserProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class TaskActivityCommand extends BaseCommand implements ICommand {

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
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
                break;
            case  NotiEvent.BOOKSTORE_RESPONSE_LIST:
                break;
        }
    }

    private function doViewLstLimitActOpen(dVo:DailyLimitActItemVo):void {

    }

    private function doViewLstUnlimitedActOpen(dVo:DailyUnlimitedActItemVo):void {

    }

    private function FightSword():void {

    }
}
}
