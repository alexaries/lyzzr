/**
 * Created by dingcj on 2018/6/22.
 */
package net.proxy {
import com.game.common.mvc.BaseProxy;

import laya.events.Event;

import laya.net.HttpRequest;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.observer.Notification;

public class HttpConnectionProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "HttpConnectionProxy";

    public function HttpConnectionProxy() {
        super(NAME);
    }

    public function send(url:String, data:* = null, method:String = "post", resposeType:String = "arraybuffer", headers:Array = null):Boolean {
        var hr:HttpRequest = new HttpRequest();

        hr.once(Event.PROGRESS, this, progressFunc);
        hr.once(Event.ERROR, this, errorFunc);
        hr.once(Event.COMPLETE, this, completeFunc);

        hr.send(url, data, method, resposeType, headers);
    }

    private function progressFunc(e:* = null):void {

    }

    private function errorFunc(e:* = null):void {
        trace("[消息访问出问题]：" + e);
    }

    private function completeFunc(e:* = null):void {
        var evt = e as Object;

        var name:String = "";
        var json:JSON = null;

        parse(name, json);
    }

    private function parse(name:String, msgData:JSON):void {
        dispatch(new Notification(name, msgData));
    }
}
}