package globals {
import com.preset.loading.events.LoadingEvent;
import com.preset.loading.view.LoadingView;
import com.preset.loading.vo.LoadResDefine;

import config.ConfigManager;

import laya.net.Loader;
import laya.utils.Handler;

import net.consts.AppConst;
import net.consts.StaticConfig;

import org.puremvc.as3.patterns.facade.Facade;

/* 需要预加载的素材 */
public class PreLoadRes {
    static var __instance:PreLoadRes;
    public var loadingView:LoadingView;
    public var isLoaded:Boolean = false;
    public var isConfigLoaded:Boolean = false;
    var configResDefine:LoadResDefine;
    private var resArray:Array = [

        {url: AppConst.atlasPath + "comp.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "main/icons.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "main.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "module/face.json", type: Loader.ATLAS},
        {url: "main/alertgoodBg.png", type: Loader.IMAGE}
    ];
    private var configResArray:Array = [
        {url: AppConst.configPath + "config1.json", type: Loader.TEXT},
        {url: AppConst.configPath + "config2.json", type: Loader.TEXT},
        {url: AppConst.configPath + "config3.json", type: Loader.TEXT}
    ];
    public var commonResArray:Array = [
        {url: AppConst.atlasPath + "common/button.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "common/icon.json", type: Loader.ATLAS},
        {url: AppConst.atlasPath + "common/surface.json", type: Loader.ATLAS}];

    private var _endHandler:Handler;

    public function PreLoadRes() {
    }

    public function set endHandler(h:Handler):void {
        _endHandler = h;
    }

    public static function getInstance():PreLoadRes {
        if (__instance == null) {
            __instance = new PreLoadRes();
//            __instance.initLoadingView();
        }
        return __instance;
    }

    public function initLoadingView():void {
        loadingView = new LoadingView();
        loadingView.startLoad();
        Laya.stage.addChild(loadingView);
    }

    public function load():void {
        if (isLoaded) {
            return;
        }
        /*
         if(! ConfigManager.instance.hasLocalVersion()){
         var configResDefine:LoadResDefine = new LoadResDefine(configResArray, "配置正在加载中……", Handler.create(this, configResLoaded), 1);
         Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_START, configResDefine));
         }else{
         isConfigLoaded=true;
         ConfigManager.instance.loadVer();
         ConfigLocator.getInstance().init();
         loadEnd();
         }
         */
        configResDefine = new LoadResDefine(configResArray, "游戏正在加载中……", Handler.create(this, configResLoaded), 1);
        Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_START, configResDefine));

        var resDefine:LoadResDefine = new LoadResDefine(resArray.concat(commonResArray), "主资源正在加载中……", Handler.create(this, resLoaded), 1);
        Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_START, resDefine));

        if (StaticConfig.welcome) {
            //加新手战斗
        }
    }

    private function configResLoaded():void {
        isConfigLoaded = true;
        var result1 = Laya.loader.getRes(AppConst.configPath + "config1.json");
        var result2 = Laya.loader.getRes(AppConst.configPath + "config2.json");
        var result3 = Laya.loader.getRes(AppConst.configPath + "config3.json");
        var result = JSON.parse(result1 + result2 + result3);
        Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_REMOVE, configResDefine));
        ConfigManager.instance.init(result);
        ConfigLocator.getInstance().init();
        loadEnd();
    }

    /*
     private function configResLoaded():void {
     isConfigLoaded=true;
     var result:ArrayBuffer = Laya.loader.getRes(AppConst.configPath + "config.bytes");
     ConfigManager.instance.init(result);
     ConfigManager.instance.saveVer();

     ConfigLocator.getInstance().init();
     loadEnd();
     }
     */
    public function loadEnd():void {
        if (isConfigLoaded && isLoaded) {
            if (_endHandler) {
                _endHandler.run();
            }
        }

    }

    private function resLoaded():void {
        isLoaded = true;
        loadEnd();

    }
}
}
