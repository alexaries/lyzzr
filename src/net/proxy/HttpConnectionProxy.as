/**
 * Created by dingcj on 2018/6/22.
 */
package net.proxy {
import com.game.common.mvc.BaseProxy;

import laya.events.Event;

import laya.net.HttpRequest;

import net.utils.MsgCenter;

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

    //这个解析还是单独放在 另外的地方处理吧
    private function parse(name:String, msgData:JSON):void {
        //结构---------------------------------后面看情况吧
        dispatch(new Notification(name, MsgCenter.toMsg(null, msgData)));
        //此处传出去BaseMsg
    }
}
}