package com.game.common.mvc {
import net.proxy.HttpConnectionProxy;

import org.puremvc.as3.patterns.observer.Notification;
import org.puremvc.as3.patterns.proxy.Proxy;

public class BaseProxy extends Proxy {
    protected var connection:HttpConnectionProxy;

    public function BaseProxy(proxyName:String = null, data:Object = null) {
        super(proxyName, data);
        connection = facade.retrieveProxy(HttpConnectionProxy.NAME) as HttpConnectionProxy;
    }

    protected function dispatch(notiEvent:Notification):void {
        facade.notifyObservers(notiEvent);
    }

}
}