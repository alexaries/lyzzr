/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.proxy {
import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.proxy.Proxy;

public class CopyProxy extends Proxy implements IProxy {
    public static const NAME:String = "CopyProxy";

    public function CopyProxy() {
        super(NAME);
    }

}
}