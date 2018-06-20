/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.company.command {

import com.game.common.mvc.BaseCommand;
import com.game.module.company.proxy.CompanyProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class CompanyCommand extends BaseCommand implements ICommand {
    override public function execute(notification:INotification):void {
        var proxy:CompanyProxy = facade.retrieveProxy(CompanyProxy.NAME) as CompanyProxy;
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case "":

                break;
        }
    }
}
}
