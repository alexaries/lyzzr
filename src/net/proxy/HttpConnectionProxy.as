/**
 * Created by dingcj on 2018/6/22.
 */
package net.proxy {
import com.game.common.mvc.BaseProxy;

import org.puremvc.as3.interfaces.IProxy;

public class HttpConnectionProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "HttpConnectionProxy";

    public function HttpConnectionProxy() {
        super(NAME);
    }

    public function send():Boolean {

    }

}
}