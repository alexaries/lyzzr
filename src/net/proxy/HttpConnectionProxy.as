/**
 * Created by dingcj on 2018/6/22.
 */
package net.proxy {
import com.game.common.mvc.BaseProxy;

import laya.events.Event;

import laya.net.HttpRequest;

import org.puremvc.as3.interfaces.IProxy;

public class HttpConnectionProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "HttpConnectionProxy";

    public function HttpConnectionProxy() {
        super(NAME);
    }

    public function send(url:String,
                         data:*,
                         completeFunc:Function,
                         progressFunc:Function = null,
                         errorFunc:Function = null,
                         method:String = "post",
                         resposeType:String = "arraybuffer",
                         headers:Array = null):Boolean {
        var hr:HttpRequest = new HttpRequest();

        hr.once(Event.PROGRESS, this, progressFunc);
        hr.once(Event.ERROR, this, errorFunc);
        hr.once(Event.COMPLETE, this, completeFunc);

        hr.send(url, data, method, resposeType, headers);
    }
}
}