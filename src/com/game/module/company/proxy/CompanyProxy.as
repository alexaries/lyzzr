/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.company.proxy {
import com.game.common.mvc.BaseProxy;

import org.puremvc.as3.interfaces.IProxy;

public class CompanyProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "CompanyProxy";

    public function CompanyProxy() {
        super(NAME);
    }

}
}