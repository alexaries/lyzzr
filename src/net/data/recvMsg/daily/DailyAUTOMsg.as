package net.data.recvMsg.daily {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.copy.CopyRewardStruct;
import net.utils.BytesUtil;

/**
 *自动组队战斗
 * 0x99
 * (S->C) 0x06 响应自动战斗
 * @author wangqing
 *
 */
public class DailyAUTOMsg extends BaseMsg {
    /**类型
     0 - 开始
     1 - 取消
     2 - 战胜怪物
     3 - 战斗胜利进入下一个副本
     4 - 战斗胜利并通关
     5 - 背包不足退出
     6 - 立即完成副本返回消息
     7 - 仙石或礼券不足退出
     8 - 服务器重启**/
    public var type:int;
    public var curIndex:int;   //当前副本索引
    public var npcID:int;
    public var copyIndex:int;  // 副本索引  0-21
    public var itemCount:int; // 获得物品种类数 
    public var itemStruct:Array = new Array(); //物品列表
    public var expCount:Number;   // 经验 

    public var nextIndex:int; //下一个副本索引 
    public var nextNpcId:int;   //下一个怪物id

    public function get copyId():int {
        return Math.ceil((curIndex + 1) / 2);
    }

    public function get nextCopyId():int {
        return Math.ceil((nextIndex + 1) / 2);
    }

    public function DailyAUTOMsg() {
        super();
    }

    public function get itemData():Array {
        return itemStruct;
    }

    /**额外奖励的物品*/
    private var goods:Array = [[519, 6], [520, 6], [521, 6], [522, 6], [523, 6], [524, 6], [525, 6], [519, 12], [520, 12], [521, 12], [522, 12]];

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            curIndex = BytesUtil.readByte1(bytes);
            copyIndex = BytesUtil.readByte4(bytes);
            npcID = BytesUtil.readByte4(bytes);
            nextIndex = BytesUtil.readByte1(bytes);
            nextNpcId = BytesUtil.readByte4(bytes);
            switch (type) {
                case 0:
                case 1:
                case 2:
                    break;
                case 3:
                case 4:
                    itemCount = BytesUtil.readByte1(bytes);
                    var obj:CopyRewardStruct;
                    for (var i:int = 0; i < itemCount; i++) {
                        obj = new CopyRewardStruct();
                        obj.itemId = BytesUtil.readByte4(bytes);
                        obj.itemNum = BytesUtil.readByte1(bytes);
                        itemStruct.push(obj);
                    }
                    if (curIndex & 1) {
                        var index:int = Math.floor(curIndex / 2);
                        obj = new CopyRewardStruct();
                        obj.itemId = goods[index][0];
                        obj.itemNum = goods[index][1];
                        itemStruct.push(obj);
                    }

                    expCount = BytesUtil.readBytes8(bytes);
                    break;
                case 5:
                case 6:
                case 7:
                case 8:
                    break;
                default:
            }
        } catch (e:*) {
        }
        return true;
    }
}
}