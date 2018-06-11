/**
 * Created by dingcj on 2018/1/18.
 */
package com.game.module.sysAlert.vo {
import com.async.Deferred;
import com.preset.login.vo.Server;

import globals.PlatformSDK;

import laya.events.Event;

import laya.net.HttpRequest;

import laya.utils.Browser;

public class SysAlertRequest {

    private static var instance:SysAlertRequest;
    public var onComplete:Deferred;
    private var hr:HttpRequest = new HttpRequest();

    public static function getInstance():SysAlertRequest {
        if (instance == null)instance = new SysAlertRequest();
        return instance;
    }

    public function SysAlertRequest() {
        onComplete = new Deferred();
    }

    private function requestServer():void {
        var date:Date = new Date();
        var sec:uint = date.getTime() / 1000;
        var feed:String = (sec - (sec % 300)) + "";
        var url:String = "";

        if (PlatformSDK.getInstance().checkIsTest()) {
            //光彩服务器 测试
            url = "http://ssh5.list.kingnet.com/new/shushan/app/getSysAnnoc.php?sid=789&r=" + feed
//            url = "http://ssh5.list.kingnet.com/new/shushan/app/getSysAnnoc.php?sid=789&r=1516158300";
        }
        else {
            //正式接口
            url = "http://ssh5.list.kingnet.com/new/shushan/app/getSysAnnoc.php?sid=" + Server.currServerVo.serverId + "&r=" + feed;
        }

        hr.once(Event.PROGRESS, this, onHttpRequestProgress);
        hr.once(Event.COMPLETE, this, onHttpRequestComplete);
        hr.once(Event.ERROR, this, onHttpRequestError);
        hr.send(url, null, "post", "text");
    }

    public function requestServerJsonP():void {
        var date:Date = new Date();
        var sec:uint = date.getTime() / 1000;
        var feed:String = (sec - (sec % 300)) + "";
        var url:String = "";

        if (PlatformSDK.getInstance().checkIsTest()) {
            //光彩服务器 测试
            url = "http://ssh5.list.kingnet.com/new/shushan/app/getSysAnnoc.php?sid=789&r=" + feed;
        }
        else {
            //正式接口
            url = "http://ssh5.list.kingnet.com/new/shushan/app/getSysAnnoc.php?sid=" + Server.currServerVo.serverId + "&r=" + feed;
        }

        var script:* = Browser.createElement("script");
        script.id = "alertContent";
        script.src = url;
        Browser.document.body.appendChild(script);

        trace("开始获取公告内容", url);
    }

    private function onHttpRequestProgress(e:* = null):void {
        trace(e);
    }

    private function onHttpRequestComplete(e:* = null):void {
        trace(e);
    }

    private function onHttpRequestError(e:* = null):void {
        trace(e);
    }

    public function onJsonPComplete(data:*):void {
        onComplete.resolve(data);

        var s = Browser.getElementById("alertContent");
        if (s) {
            Browser.document.body.removeChild(s);
        }
    }
}
}
