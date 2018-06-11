package {
import com.component.ListCustom;
import com.component.SoundJsNext;
import com.game.common.vo.AcConfigRequest;
import com.game.module.sysAlert.vo.SysAlertRequest;
import com.preset.login.vo.Server;
import com.preset.login.vo.ServerRequest;
import com.talkingdata.TDManager;

import globals.PlatformSDK;

import laya.display.Sprite;
import laya.display.Stage;
import laya.maths.Rectangle;
import laya.net.ResourceVersion;
import laya.net.URL;
import laya.resource.ResourceManager;
import laya.ui.TipManager;
import laya.ui.View;
import laya.utils.Handler;
import laya.webgl.WebGL;

import net.consts.AppConst;
import net.consts.StaticConfig;

import tools.DisplayTools;

public class LayaSample {
    private var window:* = Laya.Browser.window;

    public function LayaSample() {
        //初始化引擎
        AdaptScreen();
        var facade:ApplicationFacade = new ApplicationFacade();
        facade.startup();
        return;

        StaticConfig.platform = window.ssh5platform + "";
        StaticConfig.curVersion = window.version_num + "";
        if (window.location.protocol == "https:") {
            StaticConfig.PROTOCOL = "https://";
        } else {
            StaticConfig.PROTOCOL = "http://";
        }
        initResourceManager();
        PlatformSDK.getInstance().useRemoteLog();
    }

    private function AdaptScreen():void {
        trace("浏览器宽：" + Laya.Browser.clientWidth + "浏览器高：" + Laya.Browser.clientHeight);
        var fullScreenWidth = Laya.Browser.clientWidth;
        var fullScreenHeight = Laya.Browser.clientHeight;

        AppConst.width = AppConst.height / fullScreenHeight * fullScreenWidth;
        AppConst.width = Math.max(AppConst.fullScreenWidth, Math.min(AppConst.width, AppConst.width_max));
        Laya.init(AppConst.width, AppConst.height, WebGL);
        if (window.ssh5platform == 4 || window.ssh5platform == 6) {
            if (window.location.href.indexOf("debugkey") > 0) {
                URL.rootPath = "https://ssh5-static.kingnet.com/qzone/";
                URL.basePath = "https://ssh5-static.kingnet.com/qzone/";
            } else {
                URL.rootPath = "https://ssh5.kingnet.com/qzone/";
                URL.basePath = "https://ssh5.kingnet.com/qzone/";
            }
        }

        ResourceManager.systemResourceManager.autoRelease = true;//true开启内存管理，，false关闭内存管理
        ResourceManager.systemResourceManager.autoReleaseMaxSize = 1024 * 1024 * 350;//1M=1024KB,1KB=1024B//

        DisplayTools.getInstance().tipManager = new TipManager();
        TipManager.offsetX = 200;
        TipManager.offsetY = -200;
        DisplayTools.getInstance().tipManager["_showToStage"] = _showToStage;

        Laya.stage.alignH = Stage.ALIGN_CENTER;
        Laya.stage.alignV = Stage.ALIGN_MIDDLE;

        Laya.stage.scaleMode = AppConst.scaleMode;

        if (!Laya.Browser.onPC) {
            Laya.stage.screenMode = Stage.SCREEN_VERTICAL;
        }
        Laya.stage.bgColor = AppConst.bgColor;
        AppConst.padX = (AppConst.width - AppConst.fullScreenWidth) / 2;
        View.regComponent("List", ListCustom);
        SoundJsNext.getInstance().init();
    }

    private function _showToStage(dis:Sprite, offX:int = 0, offY:int = 0):void {
        var rec:Rectangle = dis.getBounds();
        dis.x = Laya.stage.mouseX + offX;
        dis.y = Laya.stage.mouseY + offY;
        if (dis.x + rec.width > Laya.stage.width) {
            dis.x -= rec.width + offX;
        }
        if (dis.x < 0) {
            dis.x = 0;
        }
        if (dis.y + rec.height > Laya.stage.height) {
            dis.y -= rec.height + offY;
        }
        if (dis.y < 0) {
            dis.y = 0;
        }
    }

    private function initResourceManager():void {
        if ((typeof window.ssh5platform !== 'undefined') && window.ssh5platform == 250) {
//            测试环境
            PlatformSDK.getInstance().openLogin(Handler.create(this, platformLoginSucc));
            return;
        }
        var configUrl:String = "manifest.json?" + Math.random();
        ResourceVersion.enable(configUrl, Handler.create(this, this.completeHandler));
    }

    private function completeHandler(e:Object = null):void {
        URL.customFormat = addVersionPrefix;
        //平台登录
        PlatformSDK.getInstance().openLogin(Handler.create(this, platformLoginSucc));
    }

    /**
     * 为加载路径添加版本前缀。
     * @param    originURL    源路径。
     * @return 格式化后的新路径。
     */
    public static function addVersionPrefix(__originURL:String):String {
        var originURL = "resource/" + __originURL;
        if (ResourceVersion.manifest && ResourceVersion.manifest[originURL])
            return ResourceVersion.manifest[originURL] + "/" + originURL;
        return originURL;
    }

    private function platformLoginSucc():void {
        TDManager.check();
        Server.channelId = StaticConfig.platform;
        ServerRequest.getInstance().requestServerByJsonP();
        var facade:ApplicationFacade = new ApplicationFacade();
        facade.startup();
    }

    public static function getServerList(data:*):void {
        ServerRequest.getInstance().onJsonPComplete(data);
    }

    public static function sysAlertContent(data:*):void {
        SysAlertRequest.getInstance().onJsonPComplete(data);
    }

    public static function qzonePay(data:*):void {
//        QzonePayRequest.getInstance().onJsonPComplete(data);
    }

    public static function getAcConfig(data:*):void {
        AcConfigRequest.getInstance().onJsonPComplete(data);
    }

    public static function qzoneGift(data:*):void {
//        QzonePayRequest.getInstance().onGiftJsonPComplete(data);
    }
}
}
	
	 