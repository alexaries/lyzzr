/**
 * Created by dingcj on 2017/12/4.
 */
package globals {
import laya.net.Loader;

import net.consts.AppConst;
import net.consts.StaticConfig;

public class ConfigLoadRes {
    static var __instance:ConfigLoadRes;
    public static function getInstance():ConfigLoadRes {
        if (__instance == null) {
            __instance = new ConfigLoadRes();
        }
        return __instance;
    }

    private var resArray:Array = [

        {url: AppConst.atlasPath + "comp.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "main/icons.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "main.json", type: Loader.ATLAS}
    ];
    private var configResArray:Array = [
        {url: AppConst.configPath + "config1.json", type: Loader.TEXT},
        {url: AppConst.configPath + "config2.json", type: Loader.TEXT},
        {url: AppConst.configPath + "config3.json", type: Loader.TEXT}
    ];
    private var commonResArray:Array = [
        {url: AppConst.atlasPath + "common/button.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "common/icon.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "common/surface.json", type: Loader.ATLAS}];


    public function load():void {
        Laya.loader.load(configResArray);
        Laya.loader.load(resArray);
        Laya.loader.load(commonResArray);

    }


}
}
