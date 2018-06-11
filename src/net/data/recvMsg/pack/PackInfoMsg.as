package net.data.recvMsg.pack {
import globals.ConfigLocator;

import utils.ByteArray;

import net.consts.StaticConfig;
import net.data.BaseMsg;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.pack.ItemStruct;
import net.data.structs.zhenyuan.ZhenyuanStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x30 包裹列表
 */
public class PackInfoMsg extends BaseMsg {
    /**物品修改数据结构。如果itemStruct.itemNums为零则表示删除指定物品*/
    public var itemList:Array;
    public function PackInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        var changeCount:uint = BytesUtil.readByte2(bytes);
        itemList = [];
        var itemStruct:ItemStruct;
        for (var i:uint = 0; i < changeCount; i++) {
            itemStruct = new ItemStruct();
            itemStruct.itemId = BytesUtil.readBigInt(bytes);
            itemStruct.binding = BytesUtil.readByte1(bytes);
            itemStruct.itemNums = BytesUtil.readByte2(bytes);
            itemStruct.type = ItemStruct.COMM;
            if (itemStruct.itemId >= StaticConfig.EQ_START_FLOW_ID) {
                itemStruct.type = 1;
                if (itemStruct.itemNums == 0) {
                    itemList.push(itemStruct);
                    continue;
                }
                itemStruct.eqInfo = new EqInfoStruct();
                itemStruct.eqInfo.eqId = BytesUtil.readByte2(bytes);
                trace("装备+++" + itemStruct.eqInfo.eqId)
                itemStruct.eqInfo.enhanceLevel = BytesUtil.readByte1(bytes);
                itemStruct.eqInfo.boreNums = BytesUtil.readByte1(bytes);
                for (var j:int = 0; j < itemStruct.eqInfo.boreNums; j++) {//镶嵌宝石
                    itemStruct.eqInfo.jewelIds.push(BytesUtil.readByte2(bytes));
                }
                itemStruct.eqInfo.exNums = BytesUtil.readByte1(bytes);
                for (var k:int = 0; k < itemStruct.eqInfo.exNums; k++) {//附加属性
                    var type:int = BytesUtil.readByte1(bytes);
                    var exValue:Number = BytesUtil.readByte2(bytes);
                    itemStruct.eqInfo.exProps.push([type, exValue]);
                }
                //法宝熔炼
                if (itemStruct.eqInfo.eqId < 1750 && itemStruct.eqInfo.eqId >= 1500 || itemStruct.eqInfo.eqId < 2000 && itemStruct.eqInfo.eqId >= 1850 || itemStruct.eqInfo.eqId >= 18801 && itemStruct.eqInfo.eqId <= 18820) {
                    itemStruct.eqInfo.maxLevel = BytesUtil.readByte1(bytes);
                    itemStruct.eqInfo.currentExp = bytes.readUnsignedInt();
                }
                if (itemStruct.eqInfo.eqId < 4000 && itemStruct.eqInfo.eqId >= 2544 || itemStruct.eqInfo.eqId <= 1799 && itemStruct.eqInfo.eqId >= 1750
                        || itemStruct.eqInfo.eqId <= 4999 && itemStruct.eqInfo.eqId >= 4997
                        || itemStruct.eqInfo.eqId >= 18145 && itemStruct.eqInfo.eqId <= 18540
                        || itemStruct.eqInfo.eqId >= 25001 && itemStruct.eqInfo.eqId <= 25064
                        || itemStruct.eqInfo.eqId >= 25301 && itemStruct.eqInfo.eqId <= 25364
                        || itemStruct.eqInfo.eqId >= 26000 && itemStruct.eqInfo.eqId <= 26127)  //id段已写死（请手动更改哦）
                {//注灵
                    itemStruct.eqInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                    itemStruct.eqInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                    itemStruct.eqInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                    itemStruct.eqInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                    itemStruct.eqInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                    itemStruct.eqInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                    itemStruct.eqInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                }
                if (itemStruct.eqInfo.eqId >= 19000 && itemStruct.eqInfo.eqId <= 19019)  //如果是魂器
                {
                    itemStruct.eqInfo.critDef = BytesUtil.readByte4(bytes);
                    itemStruct.eqInfo.pierceDef = BytesUtil.readByte4(bytes);
                    itemStruct.eqInfo.repelDef = BytesUtil.readByte4(bytes);
                    itemStruct.eqInfo.ap = BytesUtil.readByte4(bytes);
                }

                var vo_type = ConfigLocator.getInstance().getGoodsTypeById(itemStruct.eqInfo.eqId);
                if ((vo_type >= 13 && vo_type <= 15)) {//宝具
                    itemStruct.eqInfo.isTongLing = bytes.readByte();
                    itemStruct.eqInfo.lbColor = bytes.readByte();
                    var num:uint = bytes.readByte();
                    for (var n:uint = 0; n < num; n++) {
                        var tp:uint = bytes.readByte();
                        var value:uint = bytes.readUnsignedShort();
                        itemStruct.eqInfo.lingbaoAttr.push([tp, value]);
                    }
                    itemStruct.eqInfo.skill1 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.factor1 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.skill2 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.factor2 = bytes.readUnsignedShort();
                }
                if (vo_type == 10) {//法宝雕纹
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
            itemList.push(itemStruct);
        }
        return true;
    }
}

}