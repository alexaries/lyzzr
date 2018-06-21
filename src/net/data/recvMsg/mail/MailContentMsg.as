package net.data.recvMsg.mail {
import globals.ConfigLocator;

import utils.ByteArray;

import net.consts.StaticConfig;
import net.data.BaseMsg;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.zhenyuan.ZhenyuanStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xA1 邮件内容
 */
public class MailContentMsg extends BaseMsg {
    /**邮件id*/
    public var mailId:uint = 0;
    /**内容*/
    public var content:String = "";
    /**参数,在战报邮件中表示战报id*/
    public var param:uint = 0;

    public var hasItem:uint = 0;

    public var coin:uint = 0;

    public var silver:uint = 0;

    public var coupon:uint = 0;

    public var gold:uint = 0;

    public var nums:uint = 0;


    public var itemArr:Array = new Array();

    public function MailContentMsg() {

    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {

        }
        catch (e:*) {

        }
        return true;
    }
}
}