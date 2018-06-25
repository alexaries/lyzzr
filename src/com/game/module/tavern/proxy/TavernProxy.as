/**
 * Created by dingcj on 2018/5/17.
 */
package com.game.module.tavern.proxy {
import com.game.common.mvc.BaseProxy;

import org.puremvc.as3.interfaces.IProxy;

public class TavernProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "TavernProxy";

    public function TavernProxy() {
        super(NAME);
    }
}
}