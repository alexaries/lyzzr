/**
 * Created by dingcj on 2017/9/7.
 */
package com.game.module.task.command {

import com.game.common.mvc.BaseCommand;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class TaskMsgCommand extends BaseCommand implements ICommand {
    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        trace(notification);
        switch (name) {

        }
    }
}
}
