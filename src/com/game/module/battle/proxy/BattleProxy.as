/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.proxy {
import com.game.common.mvc.BaseProxy;

import org.puremvc.as3.interfaces.IProxy;

public class BattleProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "BattleProxy";

    public function BattleProxy() {
        super(NAME);
    }
}
}