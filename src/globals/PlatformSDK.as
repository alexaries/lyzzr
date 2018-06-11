/**
 * Created by guanll on 2017/10/28.
 */
package globals {
import com.async.Deferred;
import com.game.common.view.Alert;
import com.game.module.gift.proxy.QzonePayRequest;
import com.talkingdata.TDManager;

import globals.vo.PlatformProductInfo;

import laya.utils.Browser;

import laya.utils.Handler;

import net.consts.StaticConfig;

import utils.PlatformUtil;

public class PlatformSDK {
    public static const TEST:String = "0";//测试 需要资源版本管理
    public static const TEST_LOCAL:String = "250";//本地测试 不需要资源版本管理
    public static const WUFAN:String = "1";//悟饭平台号
    public static const XY:String = "2";//XY平台号
    public static const ORANGE:String = "3";//天橙平台号
    public static const QZONE:String = "4";//qq空间-安卓
    public static const AWY:String = "5";//爱微游
    public static const QZONE_IOS:String = "6";//qq空间-IOS
    public static const HUAWEI:String = "7";//华为

    private static var __instance:PlatformSDK;
    private var window:* = Laya.Browser.window;

    private var _loginCb:Handler;
    private var _shareCb:Handler;
    private var _saveShortcutCb:Handler;
    public var sdk:Deferred;

    public function checkIsTest():Boolean{
        return StaticConfig.platform == TEST || StaticConfig.platform == TEST_LOCAL;
    }

    public function canShowShare():Boolean{
        return StaticConfig.platform == PlatformSDK.AWY || StaticConfig.platform == PlatformSDK.QZONE || StaticConfig.platform == PlatformSDK.QZONE_IOS;
    }
    
    public function PlatformSDK() {
        if(typeof window.removeLoadingBar == "function"){
            window.removeLoadingBar();
        }
        //最多等2分钟;
        sdk=new Deferred();
        Laya.timer.loop(100,this,checkSdk);
    }

    private function checkSdk():void {
        if(checkLoad()){
            Laya.timer.clear(this,checkSdk);
            if (this.window.ssh5platform && checkIsTest()==false){
                window.sdkInit();
            }
            sdk.resolve();
        }
    }

    private function checkLoad():Boolean {
        __JS__("return (typeof window.sdkHas !== 'undefined') &&window.sdkHas();");
    }

    public static function getInstance():PlatformSDK {
        if (__instance == null) {
            __instance = new PlatformSDK();
        }
        return __instance;
    }

    public function tryOpenLogin(loginSuccess:Handler) {
        if(_loginCb){
            _loginCb.clear();
            _loginCb = null;
        }
        _loginCb = loginSuccess;
        if (window.ssh5platform && checkIsTest()==false) {
            window.sdkLogin(loginCallback, this);
        } else {
            StaticConfig.platform = "0";
            if (_loginCb) {
                _loginCb.run();
            }
        }
    }
    public function openLogin(loginSuccess:Handler) {
        sdk.completes(Handler.create(this,tryOpenLogin,[loginSuccess]))
    }

    private function loginCallback(tokenObj:*):void {
        if(tokenObj){
            if(window.ssh5platform == 4 || window.ssh5platform == 6){
//                appid:"1106262458"
//                openid:"BABFF1AC56F4A432EFA1EE931263F166"
//                openkey:"1307A935B75AE60E950D3EE69C2F37F2"
                StaticConfig.userId = parseInt(tokenObj.uid);
                StaticConfig.openid = tokenObj.openid;
                StaticConfig.openkey = tokenObj.openkey;
                if(window.userInfo && window.userInfo.pf){
                    StaticConfig.pf = window.userInfo.pf;
                }else{
                    StaticConfig.pf = "wanba_ts";
                }

                if(window.userInfo && window.userInfo.qua){
                    StaticConfig.clientip = window.userInfo.qua.meybeQua;
                }else{
                    StaticConfig.clientip = "";
                }

                if(window.userInfo && window.userInfo.platform){
                    if (window.userInfo.platform==2) {
                        StaticConfig.platform = PlatformSDK.QZONE_IOS;
                    }else if(window.userInfo.platform==1){
                        StaticConfig.platform = PlatformSDK.QZONE;
                    }
                }else{
                    if (Laya.Browser.onIOS) {
                        StaticConfig.platform = PlatformSDK.QZONE_IOS;
                    }else{
                        StaticConfig.platform = PlatformSDK.QZONE;
                    }
                }
            }else{
                trace("this is callback function");
                trace(tokenObj);//token:"z0dGlWHE7IIqEFL4",uid:"44305808"
                StaticConfig.userId = parseInt(tokenObj.uid);
                if (tokenObj.logintime) {
                    StaticConfig.langId = tokenObj.logintime;
                } else {
                    StaticConfig.langId = 0;
                }
                StaticConfig.openkey = tokenObj.token;
                StaticConfig.platform = window.ssh5platform + "";
            }

        }else{
            StaticConfig.userId = 0;
            StaticConfig.langId = 0;
            StaticConfig.openkey = "";
            StaticConfig.platform = window.ssh5platform + "";
        }

        if (Laya.Browser.onPC) {
            StaticConfig.via = "3";//pc
        } else if (Laya.Browser.onIOS) {
            StaticConfig.via = "1";//ios
        } else if (Laya.Browser.onAndriod) {
            StaticConfig.via = "2";//android
        } else {
            StaticConfig.via = "0";//未知
        }
        if (_loginCb) {
            _loginCb.run();
        }
    }

    public function createRole(arg) {
        window.sdkCreateRole(arg);
    }

//    public function setShareBall():void{
//        var btn:Button = new Button();
//        btn.label = "分享";
//        btn.skin = "comp/button.png";
//        btn.scale(3,3);
//        Laya.stage.addChild(btn);
//        btn.clickHandler = Handler.create(this,shareHandler,null,false);
//    }

//    private function shareHandler():void{
//        startShare(Handler.create(this,shareSuccCb,null,false));
//    }

//    private function shareSuccCb():void {
//        Alert.show("分享成功！回调参数为："+arguments.toString());
//    }

    public function startShare(shareSucc:Handler):void{
        if(_shareCb){
            _shareCb.clear();
            _shareCb = null;
        }
        _shareCb = shareSucc;
        if (window.ssh5platform && checkIsTest()==false) {
            if(window.sdkShare){
                window.sdkShare(shareCallback, this);
            }else{
                Alert.roll("暂不支持分享功能！");
            }
        }
    }

    private function shareCallback():void{
        trace(arguments);

        if (_shareCb) {
            _shareCb.runWith(arguments);
        }
    }

    /**
     * 显示关注的二维码
     */
    public function showQRCode():void{
        if(window.sdk && window.sdk.showFocus){
            window.sdk.showFocus();
        }else{
            Alert.roll("暂无微信公众号关注功能！");
        }
    }


    public function startSaveShortcut(saveSucc:Handler):void{
        if(_saveShortcutCb){
            _saveShortcutCb.clear();
            _saveShortcutCb = null;
        }
        _saveShortcutCb = saveSucc;
        if (window.ssh5platform && checkIsTest()==false) {
            if(window.sdkShortcut){
                window.sdkShortcut(saveShortcutCallback, this);
            }else{
                Alert.roll("暂不支持保存到桌面功能！");
            }
        }
    }

    private function saveShortcutCallback():void{
        trace(arguments);

        if (_saveShortcutCb) {
            _saveShortcutCb.runWith(arguments);
        }
    }

    public function checkFocus():Boolean{
        if(StaticConfig.platform == AWY && window.userInfo){
//            字段名	字段类型	字段说明	字段举例
//            uid	Number	用户ID	287000001
//            nickname	String	昵称	爱微游玩家
//            headimgurl	String	头像地址	http://.…
//                    sex	Number	性别（0未知1男2女）	1
//            focus	Number	关注公众号（0否1是）	1
//            usertype	Number	用户类型（1为微信用户 -1为非微信用户）	1
//            error	Number	错误码	403
            trace("checkFocus==",window.userInfo);
            return window.userInfo.focus == 1;
        }

        return false;
    }

    private var curProduct:PlatformProductInfo;
    public function openPay(productInfo:PlatformProductInfo):void {
        this.curProduct = productInfo;
        var platformRole:Object = PlatformUtil.createProductInfo(curProduct);
        if (platformRole) {
            window.sdkPay(platformRole, payCallback, this);
            trace("商品信息==",this.curProduct);
            trace("发送给平台的信息==",platformRole);
            //发起充值统计
            TDManager.onChargeRequest(
                    curProduct.app_order_id.toString(),
                    curProduct.product_id.toString(),
                    curProduct.money_amount.toString(),
                    "CNY",
                    (curProduct.money_amount * 10).toString(),
                    curProduct.qudao.toString()
            );
        }
    }

    private function payCallback():void {
        trace("this is payCallback");
        if (curProduct == null)return;
        var result = arguments[0];
        if(result && result.status){
            if(StaticConfig.platform == PlatformSDK.QZONE || StaticConfig.platform == PlatformSDK.QZONE_IOS){
                //QQ空间 充值成功还需要去数据平台 通知扣除星币并发货
                QzonePayRequest.getInstance().requestPayByJsonP(curProduct);
            }else{
                Alert.roll("充值成功！");
            }
        }else{
            if(result && result.msg){
                Alert.roll("充值失败！"+result.msg);
            }else{
                Alert.roll("充值失败！")
            }
        }

        //充值成功统计
        TDManager.onChargeSuccess(
                curProduct.app_order_id.toString(),
                curProduct.product_id.toString(),
                curProduct.money_amount.toString(),
                "CNY",
                (curProduct.money_amount * 10).toString(),
                curProduct.qudao.toString()
        );
    }

    public function checkToken() {
        window.sdkCheckToken(checkTokenCallback, this);
    }

    private function checkTokenCallback(obj:*):void {
        trace("这是token的回调函数");
        trace(obj);
    }

    /**
     * 远程日志
     */
    public function useRemoteLog():void {
        var serial = getSerial();
        var txt = Browser.getElementById('serial') || Browser.createElement('font');
        txt.id = 'serial';
        txt.style.position = "absolute";
        txt.style.zIndex = "999999";
        txt.style.right = "10px";
        txt.style.top = "10px";
        txt.style.color = "#fff";
        txt.style.fontSize = "12px";
        txt.style.textShadow = " 1px 1px 1px #333";
        txt.textContent = 'serial:' + serial + '\nver:' + StaticConfig.curVersion;
        txt.onselectstart = function(){return false};
        Browser.document.body.appendChild(txt);
        txt.onmousedown = (function (e) {
            so('checkLogTime', new Date().getTime() + '');
            alert(window.location.href+'==如果遇到登入问题,可以截取即将打开界面的截图,并将serial编号和截图反馈到官方群寻求帮助.\n您的设备serial为:' + serial);
            checkLogTime(serial);
            window.open("https://nstool.netease.com/?" + serial, "newwindow");
        });
        checkLogTime(serial);
    }

    private function getSerial() {
        var strKey = 'serialvalue';
        var serial;
        serial = so(strKey);
        if (!serial || +serial < 100000) {
            serial = String(new Date().getTime()).slice(2);
            so(strKey, serial);
        }
        return serial;
    }

    private function so(key, value = null):* {
        var storage = window.localStorage;
        if (storage) {
            if (value === undefined) {
                return storage.getItem(key);
            }
            else {
                storage.setItem(key, value);
            }
        }
    }

    private function checkLogTime(serial) {
        var t = +so('checkLogTime');
        if (new Date().getTime() - t <= 3600000 && !window.HAS_REMOTE_LOG) {
            window.HAS_REMOTE_LOG = true;
            load(getDebugUrl() + serial, function () {
                console.groupEnd = function () { };
            }, true);
        }
    }

    /**
     * 调试地址
     */
    private function getDebugUrl() {
        return "http://192.168.75.111:31986/target/target-script-min.js#";
    }

    /**
     * 加载脚步文件
     */
    private function load(url, callback, async = true, reloadCount = 0) {
        var oHead = Browser.document.getElementsByTagName('HEAD').item(0);
        var script = Browser.document.createElement("script");
        script.type = "text/javascript";
        script.src = url;
        if (script.defer) {
            script.defer = true;
        }
        else if (script.async) {
            script.async = true;
        }
        oHead.appendChild(script);
        script.onload = script["onreadystatechange"] = function (e) {
            if (!script.readyState || script.readyState == 'loaded' || script.readyState == 'complete') {
                if (callback)
                    callback();
            }
        };
    }

    public function removeSerial():void{
        var s = Browser.getElementById("serial");
        if(s){
            Browser.document.body.removeChild(s);
        }
    }
}
}
