/**
 * Created by dingcj on 2018/6/25.
 */
package net.proxy {
import com.game.common.mvc.BaseProxy;

import net.data.recvMsg.active.ActiveInfoMsg;

import net.events.MsgEvent;

import net.utils.MsgCenter;

import org.puremvc.as3.interfaces.IProxy;

public class ReHttpProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "ReHttpProxy";

    public var reHttpList:Array = [];

    public function ReHttpProxy() {
        super(NAME);

        add(MsgEvent.ACTIVE_INFO, ActiveInfoMsg);
    }

    private function add(name:String, cls:Class):void {
        reHttpList[name] = cls;
    }

    public function parse(name:String, data:JSON):void {
        if (reHttpList[name] == null) {
            trace("[协议]:不存在[" + name + "]，或者没有注册");
            return;
        }
        sendNotification(name, MsgCenter.toMsg(reHttpList[name], data));
    }

    override public function sendNotification(notificationName:String, body:Object = null, type:String = null):void {
        super.sendNotification(notificationName, body, type);
    }
}
}