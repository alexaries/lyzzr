package globals {

import config.ConfigManager;

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

    public function  get config():ConfigManager {
        return ConfigManager.instance;

    }

    public function getOpenfuncByPosition(pos:int):Array {
        var tmp:Array = [];
        return tmp;
    }

    public function init() {

    }
}
}

