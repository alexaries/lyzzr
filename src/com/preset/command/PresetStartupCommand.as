/**
 * Created by huangcb on 2017/11/18.
 */
package com.preset.command {

import com.preset.loading.command.LoadingCommand;
import com.preset.loading.events.LoadingEvent;
import com.preset.loading.proxy.LoadingProxy;
import com.preset.createRole.command.CheckBitCommand;
import com.preset.createRole.command.NewCharacterCommand;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.command.SimpleCommand;

public class PresetStartupCommand extends SimpleCommand implements ICommand {

    override public function execute(notification:INotification):void {


        facade.registerProxy(new LoadingProxy());
        facade.registerCommand(LoadingEvent.LOADING_START, LoadingCommand);
        facade.registerCommand(LoadingEvent.LOADING_REMOVE, LoadingCommand);
        facade.registerCommand(MsgEvent.CHECK_ID_RETURN, CheckBitCommand);
        facade.registerCommand(MsgEvent.NEW_CHARACTER, NewCharacterCommand);

    }
}
}
