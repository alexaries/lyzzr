/**
 * Created by huangcb on 2017/8/16.
 */
package net.data.recvMsg.user {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

public class SysAlertMsg extends BaseMsg {
    public var type:int;

    public var curServ:int;

    //服务器是否弹公告
    public var popSysup:int;
    //服务器发来的客户端版本比对号
    public var version:String;

    public function SysAlertMsg() {
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        type = BytesUtil.readByte1(bytes);
        curServ = BytesUtil.readByte1(bytes);
        popSysup = BytesUtil.readByte1(bytes);
        version = BytesUtil.readUserName(bytes);
        return true;
    }
}
}
