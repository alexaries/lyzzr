/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.company.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.company.events.CompanyEvent;
import com.game.module.company.proxy.CompanyProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class CompanyStartUpCommand extends BaseCommand implements ICommand {
    override public function execute(notification:INotification):void {
        trace("CompanyStartUpCommand");
        facade.registerProxy(new CompanyProxy());
        facade.registerCommand(CompanyEvent.UPDATE_COMPANY_INFO, CompanyCommand);
    }
}
}
