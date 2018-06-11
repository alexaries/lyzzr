/**
 * Created by huangcb on 2017/8/18.
 */
package com.game.common.command {

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class CloseAllGameWinCommand extends BaseCommand implements ICommand {
    public function CloseAllGameWinCommand() {
    }

    override public function execute(notification:INotification):void {

    }
}
}
