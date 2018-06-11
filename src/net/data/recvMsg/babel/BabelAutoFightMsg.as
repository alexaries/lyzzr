package net.data.recvMsg.babel {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.copy.CopyRewardStruct;
import net.utils.BytesUtil;

/**
 * (S->C)消息类型 0x5B<br>
 * 自动爬塔信息
 *
 */
public class BabelAutoFightMsg extends BaseMsg {
    /*
     类型	名称	说明
     byte	dungeonID	副本ID
     byte	difficulty	难度 0/1
     byte	level	层数
     byte	status	状态
     0-开始
     1-取消
     2-战败
     3-战斗胜利进入下一层
     4-战斗胜利并通关
     5-物品格不够退出

     当status为1,2,5时追加以下字段
     uint	exp	获得经验

     当status为3时追加以下字段
     byte	itemCount	获得物品种类数
     n * itemStruct	itemStruct[ n ]	物品列表

     当status为4时追加以下字段
     uint	exp	获得经验
     byte	itemCount	获得物品种类数
     n * itemStruct	itemStruct[ n ]	物品列表
     */

    public var copyID:int;

    public var difficulty:int;

    public var level:int;

    public var status:int;

    public var exp:Number;

    public var arrTemp:Array;

    private var itemCount:int;

    public function BabelAutoFightMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        copyID = BytesUtil.readByte1(bytes);
        level = BytesUtil.readByte1(bytes);
        difficulty = BytesUtil.readByte1(bytes);
        status = BytesUtil.readByte1(bytes);
        switch (status) {
            case 0:
                return true;
            case 1:
            case 2:
            case 5:
                exp = bytes.readUnsignedInt();
                return true;
            case 3:
                exp = bytes.readUnsignedInt();
                break;
            case 4:
                exp = bytes.readUnsignedInt();
                break;
        }
        arrTemp = [];
        itemCount = BytesUtil.readByte1(bytes);
        var copyReward:CopyRewardStruct;
        for (var i:int = 0; i < itemCount; i++) {
            copyReward = new CopyRewardStruct();
            copyReward.itemId = BytesUtil.readByte2(bytes);
            copyReward.itemNum = BytesUtil.readByte1(bytes);
            arrTemp.push(copyReward);
        }

        return true;
    }
}
}