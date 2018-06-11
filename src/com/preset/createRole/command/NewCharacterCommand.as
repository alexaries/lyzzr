/**
 * Created by huangcb on 2017/8/17.
 */
package com.preset.createRole.command {
import com.preset.events.DataEvent;

import net.data.recvMsg.login.NewCharacterMsg;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class NewCharacterCommand extends SimpleCommand implements ICommand {
    override public function execute(notification:INotification):void {
        trace("NewCharacterCommand");
        var body:NewCharacterMsg = notification.getBody() as NewCharacterMsg
        var flag:int = body.flag;
        switch (flag) {
            case 0:
                //成功
                this.sendNotification(DataEvent.CREATE_SUCCESS);
                break;
            case 1:
                //角色名重复			消息说明    重新输入角色
                this.sendNotification(DataEvent.CREATE_DUP);
                break;
            case 2:
                //角色名字非法
                this.sendNotification(DataEvent.CREATE_ILLEGAL);
                break;
        }
    }
}
}
