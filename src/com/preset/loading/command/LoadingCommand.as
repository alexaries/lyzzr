/**
 * Created by guanll on 2017/9/19.
 */
package com.preset.loading.command {

import com.preset.loading.events.LoadingEvent;
import com.preset.loading.proxy.LoadingProxy;
import com.preset.loading.vo.LoadResDefine;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class LoadingCommand extends BaseCommand implements ICommand {
    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var proxy:LoadingProxy = facade.retrieveProxy(LoadingProxy.NAME) as LoadingProxy;

        switch(name) {
            case LoadingEvent.LOADING_START:
                proxy.loadRes(body as LoadResDefine);
                break;
            case LoadingEvent.LOADING_REMOVE:

                proxy.removeRes((body as LoadResDefine).resArray);
                break;
        }
    }
}
}
