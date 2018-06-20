/**
 * Created by dingcj on 2018/6/14.
 */
package com.game.module.battle.utils {
import config.ConfigManager;
import config.stage.IstageCfg;

import utils.ArrayUtil;

public class BattleUtil {
    public static function getStageById(id:Number):IstageCfg {
        return ArrayUtil.find(ConfigManager.instance.stage.stageCfg, function (item:IstageCfg) {
            return item.ID == id;
        });
    }
}
}
