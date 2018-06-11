/**
 * Created by huangcb on 2017/9/6.
 */
package com.game.module.map.command {

import com.game.events.NotiEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.task.proxy.TaskService;
import com.game.module.user.proxy.UserProxy;

import net.consts.StaticConfig;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class DoHeroListUpdateCommand extends BaseCommand implements ICommand {
    function  get  mapService():MapService{
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }
    function  get   userProxy():UserProxy{
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }
    function  get  taskService():TaskService{
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }
    override public function execute(notification:INotification):void {
        dispatch(new NotiEvent(NotiEvent.MENU_VISIBLE,[1,!StaticConfig.welcome]));
        if (StaticConfig.welcome) {
            dispatch(new NotiEvent(NotiEvent.GIFT_DIFF));
            //				if(StaticConfig.spread==1&&StaticConfig.isNew){
            //				  dispatch(new NotiEvent(NotiEvent.SWF_END, [MenuWinType.SPREAD_NEWS]));
            //				  return;
            //				}
            //				if(StaticConfig.reflux==1&&StaticConfig.isNew){
            //				  dispatch(new NotiEvent(NotiEvent.SWF_END, [MenuWinType.REFLUX_NEWS]));
            //				  return;
            //				}
            //				if(dailyVo.newUserLuckIndex==0){
            //				  dispatch(new NotiEvent(NotiEvent.SWF_LOAD, [MenuWinType.NEWUSERLUCK]));
            //				  return;
            //				}
            //				RedSparkManager.ROOT.addChild(new WelcomeView());
        } else {
//				dispatch(new NotiEvent(NotiEvent.USER_STARS_INIT,[]));
            this.dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CURR_LIST));
            this.dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_ACCEPT_LIST));
            this.dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [0, 0]));
            this.dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_CYC_FRESH, [1, 0]));
            this.dispatch(new NotiEvent(NotiEvent.DAILY_REQUEST_DATA, []));
            this.dispatch(new NotiEvent(NotiEvent.MAIL_ID_LIST, 0));
            this.dispatch(new NotiEvent(NotiEvent.ACTIVE_INFO_CMD));
        }
    }

}
}
