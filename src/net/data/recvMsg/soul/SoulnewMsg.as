package net.data.recvMsg.soul {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.soul.Soul2InfoStruct;
import net.data.structs.soul.Soul2SwallowStruct;
import net.utils.BytesUtil;

public class SoulnewMsg extends BaseMsg {
    public var type:uint;
    public var fighterId:int;		//散仙ID
    public var classType:int;		//元神类型
    public var skillType:int;		//特殊技能类型
    public var practiceLevel:int;	//元神等级
    public var stateExp:int;		//元神强度
    public var skillCount:int;		//技能数量
    public var skillData:Vector.<Soul2InfoStruct>;		//技能列表
    public var result1:int;			//结果：0-成功1-失败
    public var result2:int;			//结果：0-成功1-修为不足
    public var level:int;			//元神等级
    public var infoNum:int;			//返回信息个数
    public var resultInfo:Array;	//物品信息
    public var result4:int;			//结果：0-成功1-失败
    public var ningshenLv:int;          //凝神等级
    public var ningshenExp:int;         //凝神经验
    public function SoulnewMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            switch (type) {
                case 0x00:
                    fighterId = BytesUtil.readByte2(bytes);
                    classType = BytesUtil.readByte1(bytes);
                    skillType = BytesUtil.readByte1(bytes);
                    if (classType != 0) {
                        practiceLevel = BytesUtil.readByte1(bytes);
                        stateExp = bytes.readUnsignedInt();
                        skillCount = BytesUtil.readByte1(bytes);
                        skillData = new Vector.<Soul2InfoStruct>();
                        var item0:Soul2InfoStruct;
                        for (var i:int = 0; i < skillCount; i++) {
                            item0 = readSoulnewInfoStruct(bytes);
                            skillData.push(item0);
                        }
                        ningshenLv = BytesUtil.readByte1(bytes);
                        ningshenExp = BytesUtil.readByte2(bytes);
                    }
                    break;
                case 0x01:
                    fighterId = BytesUtil.readByte2(bytes);
                    result1 = BytesUtil.readByte1(bytes);
                    break;
                case 0x02:
                    fighterId = BytesUtil.readByte2(bytes);
                    result2 = BytesUtil.readByte1(bytes);
                    if (result2 == 1) {
                        level = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 0x03:
                    fighterId = BytesUtil.readByte2(bytes);
                    infoNum = BytesUtil.readByte2(bytes);
                    resultInfo = [];
                    var item3:Soul2SwallowStruct;
                    for (var j:int = 0; j < infoNum; j++) {
                        item3 = readsoulnewSwallowStruct(bytes);
                        resultInfo.push(item3);
                    }
                    break;
                case 0x04:
                    fighterId = BytesUtil.readByte2(bytes);
                    result4 = BytesUtil.readByte1(bytes);
                    break;
                case 0x05:
                    fighterId = BytesUtil.readByte2(bytes);
                    skillCount = BytesUtil.readByte1(bytes);
                    skillData = new Vector.<Soul2InfoStruct>();
                    var item5:Soul2InfoStruct;
                    for (var m:int = 0; m < skillCount; m++) {
                        item5 = readSoulnewInfoStruct(bytes);
                        skillData.push(item5);
                    }
                    break;
                case 0x06:
                    fighterId = BytesUtil.readByte2(bytes);
                    ningshenLv = BytesUtil.readByte1(bytes);
                    ningshenExp = BytesUtil.readByte2(bytes);
                    break;
            }
        }
        catch (e:*) {

        }
        return true;
    }

    private function readSoulnewInfoStruct(bytes:ByteArray):Soul2InfoStruct {
        var item:Soul2InfoStruct = new Soul2InfoStruct();
        item.skillId = BytesUtil.readByte1(bytes);
        item.skillLevel = BytesUtil.readByte1(bytes);
        return item;
    }

    private function readsoulnewSwallowStruct(bytes:ByteArray):Soul2SwallowStruct {
        var item:Soul2SwallowStruct = new Soul2SwallowStruct();
        item.itemId = BytesUtil.readByte2(bytes);
        item.resultType = BytesUtil.readByte1(bytes);
        item.expNum = BytesUtil.readByte2(bytes);
        return item;
    }
}
}