package globals {

import com.game.vo.FuncOpenVO;

import config.ConfigManager;
import config.functionopen.IfunctionOpenCfg;

import utils.ArrayUtil;

public class ConfigLocator {
    static var __instance:ConfigLocator;

    public static function getInstance():ConfigLocator {
        if (__instance == null) {
            __instance = new ConfigLocator();
        }
        return __instance;
    }

    public function ConfigLocator() {
    }

    public function init() {

    }

    public function  get config():ConfigManager {
        return ConfigManager.instance;

    }

    public function getOpenfuncByPosition(pos:int):Array {
        var arr:Array = ArrayUtil.filter(ConfigManager.instance.functionOpen.functionopenCfg, function (cfg:IfunctionOpenCfg) {
            return cfg.area == pos;
        });
        ArrayUtil.sortOn(arr, ["index"], ArrayUtil.SORT_NUMERIC);
        var tmp:Array = [];
        for (var i = 0; i < arr.length; i++) {
            var cfg:IfunctionOpenCfg = arr[i];
            var vo:FuncOpenVO = new FuncOpenVO();
            vo.name = cfg.name;
            vo.imgUrl = "main/icons/" + cfg.image + ".png";
            vo.winType = cfg.windows;
            vo.cfg = cfg;
            tmp.push(vo);
        }
        return tmp;
    }
}
}

