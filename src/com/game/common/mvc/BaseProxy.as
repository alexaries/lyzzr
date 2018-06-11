package com.game.common.mvc {
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.patterns.observer.Notification;

import org.puremvc.as3.patterns.proxy.Proxy;

public class BaseProxy extends Proxy {
    protected  var socketConnection:SocketConnectionProxy;
    public function BaseProxy( proxyName:String=null, data:Object=null ) {
        super (proxyName,data);
        socketConnection=facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy
    }
    protected function dispatch(notiEvent:Notification):void {
        facade.notifyObservers(notiEvent);
    }

}
}