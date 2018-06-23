/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.proxy {
import com.game.module.copy.events.CopyEvent;

import net.proxy.HttpConnectionProxy;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.observer.Notification;
import org.puremvc.as3.patterns.proxy.Proxy;

public class CopyProxy extends Proxy implements IProxy {
    public static const NAME:String = "CopyProxy";

    private var connection:HttpConnectionProxy;

    public var isInCopy:Boolean = false;

    public function CopyProxy() {
        super(NAME);
        connection = facade.retrieveProxy(HttpConnectionProxy.NAME) as HttpConnectionProxy;
        isInCopy = false;
    }

    public function requestInfo():void {
        var url:String = "";
        connection.send(url);
    }

    public function onRespionseInfo():void {
        facade.notifyObservers(new Notification(CopyEvent.COPY_RESPONSE_INFO));
    }

}
}