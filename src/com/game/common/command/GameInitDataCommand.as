/**
 * Created by dingcj on 2017/9/22.
 */
package com.game.common.command {

import com.game.common.mvc.BaseCommand;
import com.game.events.NotiEvent;
import com.game.module.tavern.events.TavernEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class GameInitDataCommand extends BaseCommand implements ICommand {
    override public function execute(notification:INotification):void {
        dispatch(new NotiEvent(NotiEvent.SWORDFIGHT_INFO));//主动请求蜀山论剑
    }


}
}
