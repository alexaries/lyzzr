/**
 * Created by dingcj on 2018/5/17.
 */
package com.game.module.tavern.proxy {
import com.game.common.mvc.BaseProxy;

import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.IProxy;

public class TavernProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TavernProxy";
    private var _connection:SocketConnectionProxy;

    public function TavernProxy() {
        super(NAME);
        _connection = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;
    }
}
}