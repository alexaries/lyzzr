package net.data.recvMsg.trade {
import globals.ConfigLocator;

import utils.ByteArray;

import net.consts.StaticConfig;
import net.data.BaseMsg;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.pack.ItemStruct;
import net.data.structs.trade.TradeSaleListStruct;
import net.data.structs.zhenyuan.ZhenyuanStruct;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class TradeSaleListMsg extends BaseMsg {
    public var tradeArr:Array;

    public function TradeSaleListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        tradeArr = [];
        var saleInfo:TradeSaleListStruct = new TradeSaleListStruct();
        var start:uint = BytesUtil.readByte2(bytes);
        var num:uint = BytesUtil.readByte2(bytes);
        var totalNum:uint = BytesUtil.readByte2(bytes);
        tradeArr.push(start);
        tradeArr.push(num);
        tradeArr.push(totalNum);
        var arr:Array = new Array();
        for (var i:int = 0; i < num; i++) {
            saleInfo = new TradeSaleListStruct();
            saleInfo.id = BytesUtil.readBigInt(bytes);
            saleInfo.hasNotify = BytesUtil.readByte1(bytes);
            if (saleInfo.hasNotify == 1) {
                arr.push(saleInfo);
                continue;
            }
            saleInfo.name = BytesUtil.readUserName(bytes);
            saleInfo.price = bytes.readUnsignedInt();
            saleInfo.priceType = BytesUtil.readByte1(bytes);
            if ([4, 5].indexOf(StaticConfig.platflag) > -1)
                saleInfo.onSaletime = bytes.readUnsignedInt();
            var itemStruct:ItemStruct;
            itemStruct = new ItemStruct();
            itemStruct.itemId = BytesUtil.readBigInt(bytes);
            itemStruct.binding = BytesUtil.readByte1(bytes);
            itemStruct.itemNums = BytesUtil.readByte2(bytes);
            itemStruct.type = ItemStruct.COMM;
            if (itemStruct.itemId >= StaticConfig.EQ_START_FLOW_ID) {
                itemStruct.type = 1;
                itemStruct.eqInfo = new EqInfoStruct();
                itemStruct.eqInfo.eqId = BytesUtil.readByte2(bytes);
                itemStruct.eqInfo.enhanceLevel = BytesUtil.readByte1(bytes);
                itemStruct.eqInfo.boreNums = BytesUtil.readByte1(bytes);
                for (var j:uint = 0; j < itemStruct.eqInfo.boreNums; j++) {
                    itemStruct.eqInfo.jewelIds.push(BytesUtil.readByte2(bytes));
                }

                itemStruct.eqInfo.exNums = BytesUtil.readByte1(bytes);
                for (var k:uint = 0; k < itemStruct.eqInfo.exNums; k++) {
                    var type:uint = BytesUtil.readByte1(bytes);
                    var exValue:Number = BytesUtil.readByte2(bytes);
                    itemStruct.eqInfo.exProps.push([type, exValue]);
                }
                if (itemStruct.eqInfo.eqId < 1750 && itemStruct.eqInfo.eqId >= 1500 || itemStruct.eqInfo.eqId < 2000 && itemStruct.eqInfo.eqId >= 1850 || itemStruct.eqInfo.eqId >= 18801 && itemStruct.eqInfo.eqId <= 18820) {
                    itemStruct.eqInfo.maxLevel = BytesUtil.readByte1(bytes);
                    itemStruct.eqInfo.currentExp = bytes.readUnsignedInt();
                }
                if (itemStruct.eqInfo.eqId < 4000 && itemStruct.eqInfo.eqId >= 2544 || itemStruct.eqInfo.eqId <= 1799 && itemStruct.eqInfo.eqId >= 1750
                        || itemStruct.eqInfo.eqId <= 4999 && itemStruct.eqInfo.eqId >= 4997
                        || itemStruct.eqInfo.eqId >= 18145 && itemStruct.eqInfo.eqId <= 18540
                        || itemStruct.eqInfo.eqId >= 25001 && itemStruct.eqInfo.eqId <= 25064
                        || itemStruct.eqInfo.eqId >= 25301 && itemStruct.eqInfo.eqId <= 25364
                        || itemStruct.eqInfo.eqId >= 26000 && itemStruct.eqInfo.eqId <= 26127) {
                    itemStruct.eqInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                    itemStruct.eqInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                    itemStruct.eqInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                    itemStruct.eqInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                    itemStruct.eqInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                    itemStruct.eqInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                    itemStruct.eqInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                }
                var vo_type = ConfigLocator.getInstance().getGoodsTypeById(itemStruct.eqInfo.eqId);
                if (vo_type >= 13 && vo_type <= 15) {
                    itemStruct.eqInfo.isTongLing = bytes.readByte();
                    itemStruct.eqInfo.lbColor = bytes.readByte();
                    var Attrnum:uint = bytes.readByte();
                    for (var n:uint = 0; n < Attrnum; n++) {
                        var tp:uint = bytes.readByte();
                        var value:uint = bytes.readUnsignedShort();
                        itemStruct.eqInfo.lingbaoAttr.push([tp, value]);
                    }
                    itemStruct.eqInfo.skill1 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.factor1 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.skill2 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.factor2 = bytes.readUnsignedShort();
                }
                if (vo_type == 10) {
                    itemStruct.eqInfo.diaowenNum = bytes.readByte();
                    for (j = 0; j < itemStruct.eqInfo.diaowenNum; j++) {
                        itemStruct.eqInfo.diaowenIds.push(BytesUtil.readByte2(bytes));
                    }
                }
            }
            else {
                if (ConfigLocator.getInstance().isZhenyuan(itemStruct.itemId)) {
                    itemStruct.type = ItemStruct.RANK;
                    itemStruct.zhenyuanVO = ZhenyuanStruct.parseZhenyuanVO(bytes, itemStruct);
                    itemStruct.itemId = itemStruct.zhenyuanVO.flowID;//用于区分背包
                }
            }
            //客户端处理物品数据的时候。需要将物品分栏。先在这里分好
            /*if(itemStruct.itemId>=StaticConfig.EQ_START_FLOW_ID)
             itemStruct.type = ItemStruct.EQ;
             else if(itemStruct.itemId<=StaticConfig.JEWEL_LIMIT_ID)
             itemStruct.type = ItemStruct.JEWELS;
             else if(itemStruct.itemId<StaticConfig.FAVORITE_LIMIT_ID)
             itemStruct.type = ItemStruct.COMM;
             else if(itemStruct.itemId<StaticConfig.BUSSINESS_LIMIT_ID)
             itemStruct.type = ItemStruct.COMM;
             else if(itemStruct.itemId<StaticConfig.TASK_LIMIT_ID)
             itemStruct.type = ItemStruct.TASK;
             else
             itemStruct.type = ItemStruct.OTHERS;*///由何鑫注释，由交易模块自己判断，PackUtil.getTypeById(itemStruct.itemId);

            /*if(itemStruct.type>=0&&itemStruct.type<20)
             itemStruct.type = ItemStruct.EQ;
             else if(itemStruct.type>=20&&itemStruct.type<=29)
             itemStruct.type = ItemStruct.COMM;
             else if(itemStruct.type>=30&&itemStruct.type<=39)
             itemStruct.type = ItemStruct.RANK;
             else if(itemStruct.type>=40&&itemStruct.type<=49)
             itemStruct.type = ItemStruct.HEART;
             else if(itemStruct.type>=50&&itemStruct.type<=59)

             itemStruct.type = ItemStruct.COMM;
             else if(itemStruct.type>=60&&itemStruct.type<=79)
             itemStruct.type = ItemStruct.JEWELS;
             else if(itemStruct.type>=80&&itemStruct.type<=89)
             itemStruct.type = ItemStruct.TASK;*/

            saleInfo.item = itemStruct;
            arr.push(saleInfo);
        }
        tradeArr.push(arr);

        return true;
    }
}
}
