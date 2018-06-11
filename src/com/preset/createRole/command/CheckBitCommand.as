/**
 * Created by huangcb on 2017/8/17.
 */
package com.preset.createRole.command {
import net.consts.StaticConfig;
import net.data.recvMsg.CheckIDMsg;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class CheckBitCommand extends SimpleCommand implements ICommand {
    override public function execute(notification:INotification):void {
        var msg:CheckIDMsg = notification.getBody() as CheckIDMsg;
        StaticConfig.checkBit = msg.field;
    }
}
}
