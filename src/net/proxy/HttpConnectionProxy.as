/**
 * Created by dingcj on 2018/6/22.
 */
package net.proxy {
import com.game.common.mvc.BaseProxy;

import laya.events.Event;
import laya.net.HttpRequest;

import net.data.BaseCmd;

import net.events.ConnectionNotification;

import net.events.HttpNotification;
import net.events.MsgEvent;

import org.puremvc.as3.interfaces.IProxy;

public class HttpConnectionProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "HttpConnectionProxy";
    public var serverTimeDelay:Number;
    public var startKeepAlive:Number = 0;
    public var isReConnect:Boolean = false;
    public var kickOff:Boolean = false;//被踢掉

    public var url:String = "www.baidu.com";

    public function HttpConnectionProxy() {
        super(NAME);
    }

    public function send(cmd:BaseCmd, method:String = "post", resposeType:String = "json", headers:Array = null):Boolean {
        var hr:HttpRequest = new HttpRequest();
        hr.once(Event.PROGRESS, this, progressFunc);
        hr.once(Event.ERROR, this, errorFunc);
        hr.once(Event.COMPLETE, this, completeFunc);

        if (cmd.msgToJson()) {
            var json:Object = cmd.json;
            hr.send(url, json, method, resposeType, headers);
        }
        else {
            trace("[" + cmd.protocolID + "]协议有问题");
        }
        return true;
    }

    private function progressFunc(e:* = null):void {

    }

    private function errorFunc(e:* = null):void {
        trace("[消息访问出问题]：" + e);
        this.sendNotification(HttpNotification.CONNECTION, "--@--SocketConnectionProxy.ioErrorHandler() .... ", ConnectionNotification.IO_ERROR);
    }

    private function completeFunc(e:* = null):void {
        var evt = e as Object;
        var name:String = "";
        var json:JSON = null;
        var msgEvent:MsgEvent = new MsgEvent(HttpNotification.MSG, json, name);
        facade.notifyObservers(msgEvent);
    }

    /*思路
     ReMapProxy->StartUpCommand//注册 && 将需要处理的协议添加带reMapList
     HttpConnectionProxy->StartConnectCommand->StartUpCommand//注册
     (SocketNotification.MSG,MsgCommand)->StartUpCommand//注册

     MsgCommand收到消息->ReMapProxy.parse来解析协议
     ReMapProxy将解析好的协议Msg传出去

     MsgCenter
     BaseMsg
     */

    public function addListener(type:String, args:Array = null):Boolean {
        var hr:HttpRequest = new HttpRequest();
        hr.on(type, this, completeFunc, args);
        return true;
    }

    public function removeListener(type:String, onceOnly:Boolean = false):Boolean {

    }

    public function reconnect():void {

    }
}
}