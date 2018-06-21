/**
 * Created by wangq on 2017/12/26.
 */
package com.game.module.redPoint.proxy {
import com.game.common.mvc.BaseProxy;

import org.puremvc.as3.interfaces.IProxy;

public class RedPointProxy  extends BaseProxy implements IProxy {
    public static const NAME:String = "RedPointProxy";
    public function RedPointProxy() {
        super(NAME);

    }
}
}
