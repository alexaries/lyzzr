/**
 * Created by dingcj on 2017/9/8.
 */
package com.game.module.task.command {

import com.game.common.mvc.BaseCommand;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class TaskGuideLinkCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case "":

                break;
        }
    }
}
}
