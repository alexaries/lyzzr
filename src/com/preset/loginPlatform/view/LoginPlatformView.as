/**
 * Created by dingcj on 2017/11/18.
 */
package com.preset.loginPlatform.view {
import com.preset.loginPlatform.mediator.LoginPlatformMediator;
import com.preset.loginPlatform.vo.LoginConst;
import com.preset.loginPlatform.vo.LoginOneKeVo;
import com.preset.loginPlatform.vo.LoginSDK;
import com.preset.view.PresetBaseView;

import laya.events.Event;
import laya.net.HttpRequest;
import laya.net.Loader;
import laya.net.LocalStorage;
import laya.utils.Browser;

import net.consts.AppConst;

import org.puremvc.as3.patterns.mediator.Mediator;

import ui.loginplatform.LoginPlatformUI;

public class LoginPlatformView extends PresetBaseView {

    private var resArr:Array =
            [
                    "登录素材",
                {url: AppConst.atlasPath + "module/loginplatform.json", type: Loader.ATLAS},
                {url: "module/LOGO.png", type: Loader.IMAGE},
            ];
    private var ui:LoginPlatformUI;
    private var oneKeyHttp:HttpRequest;
    private var autoLoginHttp:HttpRequest;

    private var registerInHttp:HttpRequest;

    private var loginHttp:HttpRequest;

    private var user_exist:String = "用户已存在！";
    private var user_illege:String = "用户名只能6到20位的英文数字和下划线组成！";
    private var user_namenull:String = "参数username不能为空!";

    private var userName:String;
    private var password:String;

    public function LoginPlatformView() {
        super(resArr);
    }

    override public function getMediator():Mediator {
        return new LoginPlatformMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        ui = new LoginPlatformUI();
        Laya.stage.addChild(this);
        addChild(ui);
        init();

        var json:Object = getInfo();
        if (json == null) {
            onOneKeyPre();
            ui.backBtn.visible = true;
        }
        else {
            setState(2);

            userName = json["username"];
            password = json["password"];

            ui.inputName.text = userName;
            ui.inputPassword.text = password;

            ui.backBtn.visible = false;
        }
    }

    private function init():void {
        setState();
        ui.oneKeyBtn.on(Event.CLICK, this, autoLogin);
        ui.registerBtn.on(Event.CLICK, this, onRegister);
        ui.zhanghaoBtn.on(Event.CLICK, this, onZhangHaoBtn);
        ui.backBtn.on(Event.CLICK, this, onBackBtn);
        ui.backInBtn.on(Event.CLICK, this, onBackBtn);

        ui.registerInBtn.on(Event.CLICK, this, onRegisterInBtn);
        ui.loginBtn.on(Event.CLICK, this, onLoginBtn);

        ui.check.on(Event.CHANGE, this, onCheckChange)

        ui.weiboBtn.visible = false;
        ui.qqBtn.visible = false;
        ui.forgetLabel.visible = false;
    }

    private function onCheckChange():void {
        ui.inputPassword.type = ui.check.selected ? "text" : "password";
        ui.inputPassword.text = password;
    }

    //--------------------onekey
    private function onOneKeyPre():void {
        oneKeyHttp = new HttpRequest();
        var url:String = LoginConst.dmName + "/h5/guest-register?appId=" + LoginConst.appId;
        oneKeyHttp.once(Event.PROGRESS, this, onOneKeyRequestProgress);
        oneKeyHttp.once(Event.COMPLETE, this, onOneKeyRequestComplete);
        oneKeyHttp.once(Event.PROGRESS, this, onOneKeyRequestError);
        oneKeyHttp.send(url, null, "post", "json");
    }

    private function onOneKeyRequestProgress(e:* = null):void {
        trace(e);
    }

    private function onOneKeyRequestComplete(e:* = null):void {
        LoginSDK.parseOneKey(oneKeyHttp.data);

        if (LoginSDK.oneKeyVo != null) {
            ui.inputName.text = LoginSDK.oneKeyVo.username;
            ui.inputPassword.text = LoginSDK.oneKeyVo.password;

            userName = LoginSDK.oneKeyVo.username;
            password = LoginSDK.oneKeyVo.password;

            save(LoginSDK.oneKeyVo.username, LoginSDK.oneKeyVo.password);
        }
    }

    private function onOneKeyRequestError(e:* = null):void {
        trace(e);
    }

    //--------------------autologin

    private function autoLogin():void {
        if (LoginSDK.oneKeyVo == null)return;
        var vo:LoginOneKeVo = LoginSDK.oneKeyVo;
        autoLoginHttp = new HttpRequest();
        var md5 = Browser.window.md5;
        var md:String = md5(vo.sign + "&key=" + LoginConst.appKey);
        md = md.replace('-', '').toUpperCase();

        var url:String = LoginConst.dmName + "/h5/check-login?" +
                "appId=" + LoginConst.appId +
                "&username=" + userName +
                "&token=" + vo.token +
                "&sign=" + md +
                "t=" + vo.t;

        trace("发送的sign:" + vo.sign + "/发送的token:" + vo.token + "/md5:" + md);

        autoLoginHttp.once(Event.PROGRESS, this, onAutoLoginRequestProgress);
        autoLoginHttp.once(Event.COMPLETE, this, onAutoLoginRequestComplete);
        autoLoginHttp.once(Event.PROGRESS, this, onAutoLoginRequestError);
        autoLoginHttp.send(url, null, "post", "json");
    }

    private function onAutoLoginRequestProgress(e:* = null):void {
        trace(e);
    }

    private function onAutoLoginRequestComplete(e:* = null):void {
        //trace(e);

        trace(autoLoginHttp.data);
    }

    private function onAutoLoginRequestError(e:* = null):void {
        trace(e);
    }

    //----------------------------registerIn
    private function onRegisterInBtn():void {
        if (ui.inputName.text == "" || ui.inputName.text == "用户名")return;
        if (ui.inputPassword.text == "" || ui.inputPassword.text == "密码")return;

        registerInHttp = new HttpRequest();

        var url:String = LoginConst.dmName + "/h5/register?appId=" + LoginConst.appId + "&username=" + ui.inputName.text + "&password=" + ui.inputPassword.text;

        registerInHttp.once(Event.PROGRESS, this, onRegisterInRequestProgress);
        registerInHttp.once(Event.COMPLETE, this, onRegisterInRequestComplete);
        registerInHttp.once(Event.PROGRESS, this, onRegisterInRequestError);
        registerInHttp.send(url, null, "post", "json");
    }

    private function onRegisterInRequestProgress(e:* = null):void {

    }

    private function onRegisterInRequestComplete(e:* = null):void {

        if (registerInHttp.data["status_code"] == 500) {
            ui.inputName.text = registerInHttp.data["message"];
            ui.inputPassword.text = "";
            return;
        }

        LoginSDK.parseRegisterIn(registerInHttp.data);

        setState(2);
    }

    private function onRegisterInRequestError(e:* = null):void {

    }

    ////----------------------------login
    private function onLoginBtn():void {
        if (ui.inputName.text == user_exist || ui.inputName.text == user_illege || ui.inputName.text == user_namenull)return;

        userName = ui.inputName.text;
        password = ui.inputPassword.text;

        save(userName, password);

        loginHttp = new HttpRequest();

        var url:String = LoginConst.dmName + "/h5/login?appId=" + LoginConst.appId + "&username=" + userName + "&password=" + password;

        loginHttp.once(Event.PROGRESS, this, onLoginRequestProgress);
        loginHttp.once(Event.COMPLETE, this, onLoginRequestComplete);
        loginHttp.once(Event.PROGRESS, this, onLoginRequestError);
        loginHttp.send(url, null, "post", "json");
    }

    private function onLoginRequestProgress(e:* = null):void {
        trace(e);
    }

    private function onLoginRequestComplete(e:* = null):void {
        if (loginHttp.data["status_code"] == 500)return;
        LoginSDK.parseLogin(loginHttp.data);

        trace(LoginSDK.loginLoginVo);
    }

    private function onLoginRequestError(e:* = null):void {

    }

    //----------------------------view
    private function onRegister():void {
        setState(1);
    }

    private function onZhangHaoBtn():void {
        setState(2);
    }

    private function onBackBtn():void {
        setState(0);
    }

    private function setState(state:int = 0):void {
        ui.lrContainer.visible = state == 0;
        ui.registerContainer.visible = state == 1;
        ui.loginContainer.visible = state == 2;
        ui.titleLabel.text = state == 0 || state == 1 ? "游戏注册" : "游戏登录";
    }

    private function save(_userName:String, _password:String):void {
        var json:Object = {"username": _userName, "password": _password};
        LocalStorage.setJSON("user_Info", json);
    }

    private function getInfo():Object {
        return LocalStorage.getJSON("user_Info");
    }

    public override function dispose():void {
        Laya.stage.removeChild(this);
        if (ui)ui.destroy();
        super.dispose();
    }
}
}