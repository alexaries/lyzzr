/**
 * Created by dingcj on 2018/6/13.
 */
package com.game.module.battle.proxy {
import com.game.common.mvc.BaseProxy;

import org.puremvc.as3.interfaces.IProxy;

public class BattleProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "BattleProxy";
    public var model:BattleModel;
    public var fighters:Array;//战斗中 选中的羁绊角色
    public var isInBattle:Boolean;//当前是否在战斗中

    public function BattleProxy() {
        super(NAME);
        model = new BattleModel();
        fighters = [];
        isInBattle = false;
    }
}
}