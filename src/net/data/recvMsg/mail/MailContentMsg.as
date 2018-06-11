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
            this.mailId = bytes.readUnsignedInt();
            this.content = bytes.readUTF();
            this.param = bytes.readUnsignedInt();
            this.hasItem = BytesUtil.readByte1(bytes);
            if (hasItem == 1) {
                this.coin = bytes.readUnsignedInt();
                this.silver = bytes.readUnsignedInt();
                this.coupon = bytes.readUnsignedInt();
                this.gold = bytes.readUnsignedInt();
                this.nums = BytesUtil.readByte2(bytes);
                var item:Array;
                var id:uint;
                var eqInfo:EqInfoStruct;
                for (var i:int = 0; i < nums; i++) {
                    item = new Array();
                    id = BytesUtil.readByte2(bytes);
                    item.push(id);
                    item.push(BytesUtil.readByte2(bytes));
                    if (!StaticConfig.isTW) {
                        var vo_type = ConfigLocator.getInstance().getGoodsTypeById(id);
                        if (vo_type >= 13 && vo_type <= 15) {//宝具
                            eqInfo = new EqInfoStruct();
                            eqInfo.isTongLing = bytes.readByte();
                            eqInfo.lbColor = bytes.readByte();
                            var num:uint = bytes.readByte();
                            for (var n:uint = 0; n < num; n++) {
                                var tp:uint = bytes.readByte();
                                var value:uint = bytes.readUnsignedShort();
                                eqInfo.lingbaoAttr.push([tp, value]);
                            }
                            eqInfo.skill1 = bytes.readUnsignedShort();
                            eqInfo.factor1 = bytes.readUnsignedShort();
                            eqInfo.skill2 = bytes.readUnsignedShort();
                            eqInfo.factor2 = bytes.readUnsignedShort();
                            item.push(eqInfo);
                        }
                    }
                    if (ConfigLocator.getInstance().isZhenyuan(id)) {
                        var zhenyuanVO:ZhenyuanStruct = ZhenyuanStruct.parseZhenyuanVO(bytes, null, id);
                        item[3] = zhenyuanVO;
                    }


                    itemArr.push(item);
                }
            }
        }
        catch (e:*) {

        }
        return true;
    }
}
}