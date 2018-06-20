/**
 * Created by dingcj on 2018/6/14.
 */
package com.game.module.battle.proxy {
import com.game.module.battle.utils.BattleUtil;

import config.stage.IstageCfg;

public class BattleModel {

    private var _copyId:int = 0;
    private var _copyCfg:IstageCfg;

    public function BattleModel() {
    }

    public function set copyId(value:int):void {
        this._copyId = value;
        this._copyCfg = BattleUtil.getStageById(_copyId);
    }

    public function get copyId():int {
        return _copyId;
    }

    public function get copyCfg():IstageCfg {
        return _copyCfg;
    }
}
}
