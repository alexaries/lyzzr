package net.data.recvMsg.user {
import globals.ConfigLocator;

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.lingShi.LingShiStruct;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.user.ChangeDataStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x21 武将信息改变
 */
public class ChangeEQMsg extends BaseMsg {
    private var _fighterId:uint = 0;
    private var _changeList:Array;

    public function ChangeEQMsg() {
        super();
    }

    public function get changeList():Array {
        return _changeList;
    }

    public function set changeList(value:Array):void {
        _changeList = value;
    }

    public function get fighterId():uint {
        return _fighterId;
    }

    public function set fighterId(value:uint):void {
        _fighterId = value;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            fighterId = bytes.readUnsignedInt();
            var count:uint = BytesUtil.readByte1(bytes);
            var changeData:ChangeDataStruct;
            _changeList = [];
            var m:int;
            var dataArr:Array = [];
            var len:int;

            for (var i:uint = 0; i < count; i++) {
                changeData = new ChangeDataStruct();
                changeData.field = BytesUtil.readByte1(bytes);
                var eqInfoStruct:EqInfoStruct = new EqInfoStruct();

                switch (changeData.field) {
                    case 0x01:
                    case 0x02:
                    case 0x04:
                    case 0x05:
                    case 0x06:
                    case 0x07:
                    case 0x08:
                    case 0x09:

                    case 0x10:
                    case 0x11:
                    case 0x12:
                    case 0x13:
                    case 0x14:
                    case 0x15:
                    case 0x16:
                    case 0x17:
                    case 0x18:
                    case 0x19:
                    case 0x1a:
                    case 0x1b:
                    case 0x1c:
                    case 0x1d:
                    case 0x30:
                    case 0x32:
                    case 0x40:
                    case 0x41:
                    case 0x42:
                    case 0x43:
                    case 0x44:
                    case 0x45:
                        changeData.data = bytes.readUnsignedInt();
                        break;
                    case 0x03:
                        changeData.exp = BytesUtil.readBytes8(bytes);
                        break;
                    case 0x0d:
                        changeData.otherData = [[BytesUtil.readByte1(bytes), BytesUtil.readByte2(bytes)], [BytesUtil.readByte1(bytes), BytesUtil.readByte2(bytes)], [BytesUtil.readByte1(bytes), BytesUtil.readByte2(bytes)]];
                        break;
                    case 0x0a:
                    case 0x0b:
                    case 0x0c:
                    case 0x20:
                    case 0x21:
                    case 0x22:
                    case 0x23:
                    case 0x24:
                    case 0x25:
                    case 0x26:
                    case 0x27:
                    case 0x28:
                    case 0x1f:
                    case 0x60:
                    case 0x61:
                    case 0x62:
                    case 0x70://先天法宝
                    case 0x66: //仙兵
                    case 0x67: //仙衣
                    case 0x68: //仙器
                    case 0x71: //魂器
                    case 0x72:
                    case 0x73:
                    case 0x74:
//							var hunqi:HunqiVo=new HunqiVo();
//							hunqi.critDef = BytesUtil.readByte4(bytes);
//							hunqi.pierceDef = BytesUtil.readByte4(bytes);
//							hunqi.repelDef = BytesUtil.readByte4(bytes);
//							hunqi.ap = BytesUtil.readByte4(bytes);
//							changeData.hunqiVO=hunqi;
//							break
                        eqInfoStruct.flowId = BytesUtil.readBigInt(bytes)
                        if (eqInfoStruct.flowId == 0) {
                            changeData.eqInfoStruct = eqInfoStruct;
                            changeList.push(changeData);
                            continue;
                        }
                        eqInfoStruct.binding = BytesUtil.readByte1(bytes);
                        eqInfoStruct.eqId = BytesUtil.readByte2(bytes);
                        eqInfoStruct.enhanceLevel = BytesUtil.readByte1(bytes);
                        eqInfoStruct.boreNums = BytesUtil.readByte1(bytes);
                        for (var j:uint = 0; j < eqInfoStruct.boreNums; j++) {
                            eqInfoStruct.jewelIds.push(BytesUtil.readByte2(bytes));
                        }
                        //附加属性
                        eqInfoStruct.exNums = BytesUtil.readByte1(bytes);
                        for (var k:uint = 0; k < eqInfoStruct.exNums; k++) {
                            var type:uint = BytesUtil.readByte1(bytes);
                            var exValue:Number = BytesUtil.readByte2(bytes);
                            eqInfoStruct.exProps.push([type, exValue]);
                        }
                        //法宝
                        if (eqInfoStruct.eqId < 1750 && eqInfoStruct.eqId >= 1500 || eqInfoStruct.eqId < 2000 && eqInfoStruct.eqId >= 1850 || eqInfoStruct.eqId >= 18801 && eqInfoStruct.eqId <= 18820) {
                            eqInfoStruct.maxLevel = BytesUtil.readByte1(bytes);  //法宝品阶
                            eqInfoStruct.currentExp = bytes.readUnsignedInt();
                        }
                        //注灵
                        var vo_type = ConfigLocator.getInstance().getGoodsTypeById(eqInfoStruct.eqId);
                        if (eqInfoStruct.eqId < 4000 && eqInfoStruct.eqId >= 2544 || eqInfoStruct.eqId <= 1799 && eqInfoStruct.eqId >= 1750 || eqInfoStruct.eqId <= 4999 && eqInfoStruct.eqId >= 4997
                                || eqInfoStruct.eqId >= 18145 && eqInfoStruct.eqId <= 18540
                                || eqInfoStruct.eqId >= 25001 && eqInfoStruct.eqId <= 25064
                                || eqInfoStruct.eqId >= 25301 && eqInfoStruct.eqId <= 25364
                                || eqInfoStruct.eqId >= 26000 && eqInfoStruct.eqId <= 26127) {
                            eqInfoStruct.soulLevel.push(BytesUtil.readByte2(bytes));
                            eqInfoStruct.soulLevel.push(BytesUtil.readByte2(bytes));
                            eqInfoStruct.soulLevel.push(BytesUtil.readByte2(bytes));
                            eqInfoStruct.soulLevel.push(BytesUtil.readByte2(bytes));
                            eqInfoStruct.soulFormula.push(BytesUtil.readByte1(bytes));//注灵材料
                            eqInfoStruct.soulFormula.push(BytesUtil.readByte1(bytes));
                            eqInfoStruct.soulFormula.push(BytesUtil.readByte1(bytes));
                        }
                        if (vo_type >= 13 && vo_type <= 15) {
                            eqInfoStruct.isTongLing = bytes.readByte();
                            eqInfoStruct.lbColor = bytes.readByte();
                            var num:uint = bytes.readByte();
                            for (var n:uint = 0; n < num; n++) {
                                var tp:uint = bytes.readByte();
                                var value:uint = bytes.readUnsignedShort();
                                eqInfoStruct.lingbaoAttr.push([tp, value]);
                            }
                            eqInfoStruct.skill1 = bytes.readUnsignedShort();
                            eqInfoStruct.factor1 = bytes.readUnsignedShort();
                            eqInfoStruct.skill2 = bytes.readUnsignedShort();
                            eqInfoStruct.factor2 = bytes.readUnsignedShort();
                        }
                        if (vo_type == 10) {
                            eqInfoStruct.diaowenNum = bytes.readByte();
                            for (j = 0; j < eqInfoStruct.diaowenNum; j++) {
                                eqInfoStruct.diaowenIds.push(BytesUtil.readByte2(bytes));
                            }
                        }
                        changeData.eqInfoStruct = eqInfoStruct;
                        if (changeData.field == 0x70) {
                            changeData.data = bytes.readUnsignedInt()
                        }
                        if (changeData.field >= 0x71 && changeData.field <= 0x74)//魂器
                        {
                            eqInfoStruct.critDef = BytesUtil.readByte4(bytes);
                            eqInfoStruct.pierceDef = BytesUtil.readByte4(bytes);
                            eqInfoStruct.repelDef = BytesUtil.readByte4(bytes);
                            eqInfoStruct.ap = BytesUtil.readByte4(bytes);
                        }
                        break;
                    case 0x29:
                        changeData.otherData = [BytesUtil.readByte1(bytes), BytesUtil.readByte1(bytes)];
                        break;
                    case 0x31:
                    case 0x2a:
                    case 0x2b:
                    case 0x2e:
                        changeData.otherData = [BytesUtil.readByte1(bytes), bytes.readUnsignedInt()];
                        break;
                    case 0x2c:
                    case 0x2d:
                        changeData.otherData = [BytesUtil.readByte1(bytes), BytesUtil.readByte2(bytes)];
                        break;
                    case 0x33://变身时装
                        changeData.otherData = [bytes.readUnsignedInt(), bytes.readUnsignedInt()];
                        break;
                    case 0x34://凝结金丹
                        changeData.otherData = [BytesUtil.readByte1(bytes), BytesUtil.readByte1(bytes)];
                        break;
                    case 0x63:
                    case 0x64:
                    case 0x65:
                        var lingshiData:LingShiStruct = LingShiStruct.parse(bytes);
                        changeData.lingShiStruct = lingshiData;

                        break;
                    case 0x75://飞升
                        changeData.isFeisheng = BytesUtil.readByte1(bytes) == 1 ? true : false;
                        break;
                    case 0x76: //御龙仙甲
                        for (i = 0; i < 6; i++) {
                            changeData.attributeInFsLvVec[i] = BytesUtil.readByte1(bytes);
                        }
                        break;
                    case 0x77:
                        changeData.data = bytes.readUnsignedInt();
                        break;
                    case 0x78:
                        changeData.data = bytes.readUnsignedInt();
                        break;
                    default:
                        changeData.data = bytes.readUnsignedInt();
                        break;
                }
                changeList.push(changeData);
            }
        } catch (e:*) {
        }
        return true;
    }
}
}