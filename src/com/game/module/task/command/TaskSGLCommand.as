/**
 * Created by huangcb on 2018/3/16.
 */
package com.game.module.task.command {

import com.game.common.mvc.BaseCommand;
import com.game.events.NotiEvent;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.TaskCfg;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class TaskSGLCommand extends BaseCommand implements ICommand {
    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var task:TaskTrackItemVo = body as TaskTrackItemVo;
        switch (name) {
            case NotiEvent.TASK_SLG:

                doTask(task);

                break;
        }
    }

    private function openFuncByid(funcid:int):void {

//        var func:IOpenfuncCfg = ArrayUtil.find(ConfigManager.instance.mission_openfunc.openfuncCfg, function (of:IOpenfuncCfg) {
//            return of.id == funcid;
//        });
//        var vo:MenuWindowVO = new MenuWindowVO(func.win, MenuWindowVO.OPEN, new Object());
//        MenuWindowVO.setTabIndex(vo.data, func.tab);
//        dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));

    }

    private function doTask(evt_text:TaskTrackItemVo):void {
        var taskVo:TaskCfg = evt_text.task.cfg;
    }
}
}