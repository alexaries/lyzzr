/* ---------------------------------------------------------------------------------------------------------------------------- /

 DisasterDataMsg -- NEROKING

 / ---------------------------------------------------------------------------------------------------------------------------- */

package net.data.recvMsg.disaster {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.disaster.DisasterEventStruct;
import net.data.structs.disaster.QuestInfo;
import net.utils.BytesUtil;

/**
 * S-C 0x19协议
 * */
public class DisasterDataMsg extends BaseMsg {

    // --- Vars ---------------------------------------------------------------------------------------------------------- //

    // --- Public Function ----------------------------------------------------------------------------------------------- //
    public var type:int;
    public var status:int;
    //天劫按钮控制
    public var keep:uint;
    public var id:uint;
    public var events:Array
    public var eventId:uint;
    public var cmd:uint = 0;
    public var rank:int;
    public var score:int;
    public var players:Array;
    public var time:uint;
    public var gray:uint;

    public function DisasterDataMsg() {
        super();
        cmd = 0;
        players = new Array(10);
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);

//				trace("天劫MSG BACK::"+type)
            switch (type) {
                case 0:
                    status = BytesUtil.readByte1(bytes);
                    id = BytesUtil.readByte1(bytes);
                    if (status) {
                        toData(bytes);
                    }
                    break;
                case 1:
                    toData1(bytes);
                    break;
                case 2:
                    toData2(bytes);
                    break;
                case 3:
                    toData3(bytes);
                    break;
                case 5:
                    status = BytesUtil.readByte1(bytes);
                    id = BytesUtil.readByte1(bytes);
                    keep = BytesUtil.readByte1(bytes);
                    gray = BytesUtil.readByte1(bytes);
//						trace(id+"天劫开启结束通知：："+status+"按钮状态"+keep+"  灰色："+gray);
                    break;
                case 6://更新进行中事件
                    toData6(bytes);
                    break;
                case 7://进度事件信息 不用了 
                    /*status=BytesUtil.readByte1(bytes);
                     id=BytesUtil.readByte1(bytes);
                     if (status){
                     toData7(bytes);
                     }*/
                    break;
                case 8://排行榜更新

                    toData8(bytes);
                    break;
            }
        } catch (err:Error) {
            trace(err);
        }
        return true;
    }


    /**
     *全部天劫信息
     * @param bytes
     *
     */
    private function toData(bytes:ByteArray):void {
        events = new Array(4);
        for (var i:int = 0; i < 4; i++) {
            var event:DisasterEventStruct = new DisasterEventStruct();
            events[i] = event;
        }
        events[0].state = BytesUtil.readByte1(bytes);
        events[1].state = BytesUtil.readByte1(bytes);
        events[2].state = BytesUtil.readByte1(bytes);
        events[3].state = BytesUtil.readByte1(bytes);
//			trace(events[0].state+"-"+events[1].state+"-"+events[2].state+"-"+events[3].state)


        setEvent1(events[0], bytes);
        if (events[0].state == 2) {//事件1渡过 继续解析
            setEvent2(events[1], bytes);
        }
        if (events[1].state == 2) {
            setEvent3(events[2], bytes);
        }
        if (events[2].state == 2) {
            setEvent4(events[3], bytes);
        }
    }


    //渡过事件1数据更新
    private function toData1(bytes:ByteArray):void {
        status = 1
        eventId = 1
        cmd = BytesUtil.readByte1(bytes);
        if (cmd == 0) {
            var event:DisasterEventStruct = new DisasterEventStruct();
            event.state = 2;
            event.n = BytesUtil.readByte1(bytes);
            var awardType:uint = BytesUtil.readByte1(bytes);
            event.questList = new Array(3);
            for (var j:int = 0; j < 3; j++) {
                var quest:QuestInfo = new QuestInfo;
                quest.type = awardType;
                quest.id = BytesUtil.readByte2(bytes);
                quest.n = BytesUtil.readByte1(bytes);
                quest.award = bytes.readUnsignedInt();
                event.questList[j] = quest;
            }
            events = [event];
        }
    }

    //渡过事件2数据
    private function toData2(bytes:ByteArray):void {
        status = 1
        eventId = 2
        cmd = BytesUtil.readByte1(bytes);
        if (cmd == 0) {
            var event:DisasterEventStruct = new DisasterEventStruct();
            event.state = 2;
            event.questList = new Array(4);
            for (var j:int = 0; j < 4; j++) {
                var quest:QuestInfo = new QuestInfo;
                quest.n = BytesUtil.readByte2(bytes);
                event.questList[j] = quest;
            }
            //封印比
            event.percent = BytesUtil.readByte1(bytes);
            //奖励经验
            event.rank = bytes.readUnsignedInt();
            event.score = bytes.readUnsignedInt();
            events = [event];
        }


    }

    private function toData3(bytes:ByteArray):void {
        status = 1
        eventId = 3
        cmd = BytesUtil.readByte1(bytes);
        if (cmd == 0) {
            var event:DisasterEventStruct = new DisasterEventStruct();
            event.state = 2;
            event.copyFinish = BytesUtil.readByte1(bytes);
            event.copyId = BytesUtil.readByte1(bytes);
            event.percent = BytesUtil.readByte1(bytes);
            event.time = bytes.readUnsignedInt();
            event.rank = bytes.readUnsignedInt();
            event.score = bytes.readUnsignedInt();
            events = [event];
        }
    }


    private function toData6(bytes:ByteArray):void {
        status = 1;
        eventId = BytesUtil.readByte1(bytes);

        cmd = BytesUtil.readByte1(bytes);
        if (cmd == 0) {
            var event:DisasterEventStruct = new DisasterEventStruct();

            switch (eventId) {
                case 1:
                    //事件1刷新
                    event.state = 1;
                    event.questList = new Array(4);
                    for (var i:int = 0; i < 4; i++) {
                        var quest:QuestInfo = new QuestInfo;
                        quest.n = BytesUtil.readByte2(bytes);
                        event.questList[i] = quest;
                    }

                    event.rank = bytes.readShort();
                    event.score = bytes.readUnsignedInt();
                    event.percent = BytesUtil.readByte1(bytes);
                    event.time = bytes.readUnsignedInt();
                    event.top = BytesUtil.readUserName(bytes);
                    event.topScore = bytes.readUnsignedInt();
                    events = [event];
                    break;
                case 2:
                    event.state = 1;
                    event.questList = new Array(4);
                    for (var j:int = 0; j < 4; j++) {
                        var quest2:QuestInfo = new QuestInfo;
                        quest2.n = BytesUtil.readByte2(bytes);
                        event.questList[j] = quest2;
                    }

                    event.rank = bytes.readShort();
                    event.score = bytes.readUnsignedInt();
                    event.percent = BytesUtil.readByte1(bytes);
                    event.time = bytes.readUnsignedInt();
                    event.top = BytesUtil.readUserName(bytes);
                    event.topScore = bytes.readUnsignedInt();
                    events = [event];

                    break;
                case 3:
//						trace("事件3更新")
                    event.state = 1;
                    event.copyId = BytesUtil.readByte2(bytes);
                    event.rank = bytes.readShort();
                    event.score = bytes.readUnsignedInt();
                    event.percent = BytesUtil.readByte1(bytes);
                    event.time = bytes.readUnsignedInt();
                    event.top = BytesUtil.readUserName(bytes);
                    event.topScore = bytes.readUnsignedInt();
                    events = [event];
                    break;
                case 4:
//						trace("事件4更新")
                    event.state = 1;
                    event.time = bytes.readUnsignedInt();
                    events = [event];
                    break;
            }


        } else {
            trace("错误编号：" + cmd)
        }
    }


    //不用了
    private function toData7(bytes:ByteArray):void {

        eventId = BytesUtil.readByte1(bytes);
        var event:DisasterEventStruct = new DisasterEventStruct();
        event.state = 2;
        event.percent = BytesUtil.readByte1(bytes);
        event.rank = bytes.readShort();
        event.score = bytes.readUnsignedInt();
        event.time = bytes.readUnsignedInt();
        time = event.time;
        events = [event];

    }

    //排行榜
    private function toData8(bytes:ByteArray):void {
        rank = BytesUtil.readByte2(bytes);
        score = bytes.readUnsignedInt();
        for (var i:int = 0; i < 10; i++) {
            var player:Object = new Object;
            player.name = BytesUtil.readUserName(bytes);
            player.score = bytes.readUnsignedInt();
            players[i] = player;
//				trace("排行：："+i+"::"+players[i].name)
        }

    }


    private function setEvent1(event:DisasterEventStruct, bytes:ByteArray):void {
        if (event.state == 0) {
            //事件关闭
            event.time = bytes.readUnsignedInt();
        } else if (event.state == 1) {
            //事件开启
            trace("设置天劫事件1数据")
            event.questList = new Array(4);
            for (var i:int = 0; i < 4; i++) {
                var quest:QuestInfo = new QuestInfo;
                quest.n = BytesUtil.readByte2(bytes);
                event.questList[i] = quest;
            }
            event.rank = bytes.readShort();
            event.score = bytes.readUnsignedInt();
            event.percent = BytesUtil.readByte1(bytes);
            event.time = bytes.readUnsignedInt();
            event.top = BytesUtil.readUserName(bytes);
            event.topScore = bytes.readUnsignedInt();
        } else if (event.state == 2) {
            //事件渡过
            event.n = BytesUtil.readByte1(bytes);
//				trace("今日完成次数================"+event.n)
            var awardType:uint = BytesUtil.readByte1(bytes);
            event.questList = new Array(3);
            for (var j:int = 0; j < 3; j++) {
                var quest2:QuestInfo = new QuestInfo;
                quest2.type = awardType;
                quest2.id = BytesUtil.readByte2(bytes);
                quest2.n = BytesUtil.readByte1(bytes);
                quest2.award = bytes.readUnsignedInt();
                event.questList[j] = quest2;
                //	trace("刷新任务============"+quest2)
            }
        }
    }


    private function setEvent2(event:DisasterEventStruct, bytes:ByteArray):void {
        if (event.state == 0) {
            //事件关闭
            event.time = bytes.readUnsignedInt();
        } else if (event.state == 1) {
            //事件开启
            //			trace("设置天劫事件2数据")
            event.questList = new Array(4);
            for (var i:int = 0; i < 4; i++) {
                var quest:QuestInfo = new QuestInfo;
                quest.n = BytesUtil.readByte2(bytes);
                event.questList[i] = quest;
            }
            event.rank = bytes.readShort();
            event.score = bytes.readUnsignedInt();
            event.percent = BytesUtil.readByte1(bytes);
            event.time = bytes.readUnsignedInt();
            event.top = BytesUtil.readUserName(bytes);
            event.topScore = bytes.readUnsignedInt();
        } else if (event.state == 2) {
            //事件渡过
            //			trace("设置天劫渡过事件2数据")

            event.questList = new Array(4);
            for (var j:int = 0; j < 4; j++) {
                var quest2:QuestInfo = new QuestInfo;
                quest2.n = BytesUtil.readByte2(bytes);
                event.questList[j] = quest2;
            }
            //封印比
            event.percent = BytesUtil.readByte1(bytes);
            //奖励经验
            event.rank = bytes.readUnsignedInt();
            event.score = bytes.readUnsignedInt();
        }
    }


    private function setEvent3(event:DisasterEventStruct, bytes:ByteArray):void {
        if (event.state == 0) {
            //事件关闭
            event.time = bytes.readUnsignedInt();
        } else if (event.state == 1) {
            //事件开启
            trace("设置天劫事件3数据")
            event.copyId = BytesUtil.readByte2(bytes);
            event.rank = bytes.readShort();
            event.score = bytes.readUnsignedInt();
            event.percent = BytesUtil.readByte1(bytes);
            event.time = bytes.readUnsignedInt();
            event.top = BytesUtil.readUserName(bytes);
            event.topScore = bytes.readUnsignedInt();
        } else if (event.state == 2) {
            //事件渡过
            trace("设置天劫3渡过事件数据")
            event.copyFinish = BytesUtil.readByte1(bytes);
            event.copyId = BytesUtil.readByte1(bytes);
            event.percent = BytesUtil.readByte1(bytes);
            event.time = bytes.readUnsignedInt();
            event.rank = bytes.readUnsignedInt();
            event.score = bytes.readUnsignedInt();

        }
    }

    private function setEvent4(event:DisasterEventStruct, bytes:ByteArray):void {
        trace("事件4状态：" + event.state)
        if (event.state == 0) {
            //事件关闭
            event.time = bytes.readUnsignedInt();
        } else if (event.state == 1) {
            //事件开启
            event.time = bytes.readUnsignedInt();
        } else if (event.state == 2) {
            //事件渡过

        }
    }

}
}