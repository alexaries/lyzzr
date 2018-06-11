/**
 * Created by guanll on 2018/1/17.
 */
package com.game.module.share.proxy {
import com.game.common.mvc.BaseProxy;
import com.game.events.NotiEvent;
import com.game.module.share.event.ShareEvent;
import com.game.module.share.vo.ShareVO;

import globals.PlatformSDK;

import net.data.recvMsg.active.ActivityAllMsg;

import net.data.sendCmd.DynamicCmd;
import net.events.MsgConst;
import net.proxy.SocketConnectionProxy;

import net.utils.BytesUtil;

import org.puremvc.as3.interfaces.IProxy;

import utils.ByteArray;

public class ShareProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "ShareProxy";
    var connection:SocketConnectionProxy;

    public var info:ShareVO;
    public function ShareProxy() {
        super(NAME);
        connection = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;
        info = new ShareVO();
        Laya.timer.callLater(this,checkFocus);
    }

    public function checkFocus():void{
        if(PlatformSDK.getInstance().checkFocus()){
            dispatch(new ShareEvent(ShareEvent.CONCERN_SUCCESS));//上线检查关注成功与否
        }
    }

    /**
     * 类型	    名称	    说明
     * UInt8	type	0:分享成功,1:领取分享奖励,2:关注成功,3:领取关注奖励,4:获取信息
     */
    public function sendInfoCmd(type:int):void
    {
        var byte:ByteArray = BytesUtil.creatByteArray();
//        byte.writeByte(0x8B);
        byte.writeByte(0x92);
        byte.writeByte(type);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.ACTIVITY_SEVEN, byte);
        connection.send(cmd);
    }

    /**
     * 分享关注有礼 协议0x8B --> 0x92 -->
     * 类型	     名称	       说明
     * UInt32	sharetime	  今日 0:未分享,时间戳:已分享,UInt32(-1):已经领奖
     * UInt32	concerntime	  0:未关注,时间戳:已关注,UInt32(-1):已经领奖
     */
    public function getInfoFromServer(msg:ActivityAllMsg):void {
        if(msg.type != 0x92){
            return;
        }
        info.sharetime = msg.sharetime;
        info.concerntime = msg.concerntime;
        dispatch(new ShareEvent(ShareEvent.GET_MSG_FROM_SERVER,info));

        if(msg.sharetime > 0){
            //可以领取奖励
            dispatch(new NotiEvent(NotiEvent.INFO_REDPOINT,["zhujiemian_fenxiang",true]));
        }else{
            dispatch(new NotiEvent(NotiEvent.INFO_REDPOINT,["zhujiemian_fenxiang",false]));
        }

        if(msg.concerntime > 0){
            //可以领取奖励
            dispatch(new NotiEvent(NotiEvent.INFO_REDPOINT,["zhujiemian_guanzhu",true]));
        }else{
            if(msg.concerntime == -1){
                //关注图标消失
                dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE));
            }else{
                dispatch(new NotiEvent(NotiEvent.INFO_REDPOINT,["zhujiemian_guanzhu",false]));
            }
        }
    }
}
}