/**
 * Created by huangcb on 2017/12/19.
 */
package com.preset.login.vo {
import com.async.Deferred;

import globals.PlatformSDK;

import laya.events.Event;
import laya.net.HttpRequest;
import laya.utils.Browser;
import laya.utils.Handler;

import net.consts.StaticConfig;

public class ServerRequest {
    private var hr:HttpRequest = new HttpRequest();
    private var isGetServerSuccess:Boolean = false;
    public var  onComplete:Deferred;
    private static var instance:ServerRequest;
    public static function getInstance():ServerRequest {
        if (instance == null) instance = new ServerRequest( );
        return instance;
    }
    public function ServerRequest(){
        isGetServerSuccess = false;
        onComplete=new Deferred();
    }



    private function requestServer():void {
        var sign:String = "ssh5oasdufLEWKJRJMkdfjdkfj_%*_9fjdkfj5656522rclient";
        var mdStr:String = "";
        var md5 = Browser.window.md5;
        mdStr = md5("channel_id=" + Server.channelId + "&player_uid=" + StaticConfig.userId + "&version=" + Server.version + sign);
        mdStr = mdStr.replace('-', "");

        var host:String = "ssh5.list.kingnet.com";
        if (StaticConfig.PROTOCOL == "https://") {
            host = "ssh5-list.kingnet.com";
        }

        var url:String = StaticConfig.PROTOCOL + host + "/new/shushan/indexapp1.php?c=game&m=getPlayerServerList" +
                "&channel_id=" + Server.channelId +
                "&player_uid=" + StaticConfig.userId +
                "&version=" + Server.version +
                "&sign=" + mdStr.toLowerCase();
        if (StaticConfig.platform == PlatformSDK.ORANGE) {
            url = StaticConfig.PROTOCOL + "111.231.105.35/new/shushan/indexapp1.php?c=game&m=getPlayerServerList" +
            "&channel_id=" + Server.channelId +
            "&player_uid=" + StaticConfig.userId +
            "&version=" + Server.version +
            "&sign=" + mdStr.toLowerCase();
        }

        hr.once(Event.PROGRESS, this, onHttpRequestProgress);
        hr.once(Event.COMPLETE, this, onHttpRequestComplete);
        hr.once(Event.PROGRESS, this, onHttpRequestError);
        hr.send(url.toLowerCase(), null, "post", "json");
    }

    private function onHttpRequestProgress(e:* = null):void {
        trace(e);
    }

    private function onHttpRequestComplete(e:* = null):void {

        if (hr.data == "Disallowed Key Characters.")return;
        else {
            Server.Pasre(hr.data);
            if (Server.serverList.length > 0 && Server.currServerVo == null) {

            }
            else {
                isGetServerSuccess = true;
            }
        }

    }

    public function requestServerByJsonP():void {
        var sign:String = "ssh5oasdufLEWKJRJMkdfjdkfj_%*_9fjdkfj5656522rclient";
        var mdStr:String = "";
        var md5 = Browser.window.md5;
        mdStr = md5("channel_id=" + Server.channelId + "&jsonp=true&player_uid=" + StaticConfig.userId + "&version=" + Server.version + sign);
//        mdStr = mdStr.replace('-', "");

        var host:String = "ssh5.list.kingnet.com";
        if (StaticConfig.PROTOCOL == "https://") {
            host = "ssh5-list.kingnet.com";
        }

        var url:String = StaticConfig.PROTOCOL + host + "/new/shushan/indexapp1.php?c=game&m=getPlayerServerList" +
                "&channel_id=" + Server.channelId +
                "&jsonp=true&player_uid=" + StaticConfig.userId +
                "&version=" + Server.version +
                "&sign=" + mdStr.toLowerCase();
        if (StaticConfig.platform == PlatformSDK.ORANGE) {
            url = StaticConfig.PROTOCOL + "111.231.105.35/new/shushan/indexapp1.php?c=game&m=getPlayerServerList" +
            "&channel_id=" + Server.channelId +
            "&jsonp=true&player_uid=" + StaticConfig.userId +
            "&version=" + Server.version +
            "&sign=" + mdStr.toLowerCase();
        }

        var script:* = Browser.createElement("script");
        script.id = "serverList";
        script.src = url;
        Browser.document.body.appendChild(script);
        trace("开始拉取服务器列表", url);
    }

    private function onHttpRequestError(e:* = null):void {
        trace(e);
        if (!isGetServerSuccess) {
//            requestServer();
            requestServerByJsonP();
            isGetServerSuccess = true;
        }
    }

    public   function onJsonPComplete(data:*):void {
        onComplete.resolve(data);
        isGetServerSuccess = true;
        var s = Browser.getElementById("serverList");
        if (s) {
            Browser.document.body.removeChild(s);
        }
    }
}
}
