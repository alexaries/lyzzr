package net.data.recvMsg.daily {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * S-C 0x5f协议
 * */
public class DailyDataMsg extends BaseMsg {
    public var active:uint;
    public var activeInfo:uint;
    public var activeValue:uint;

    public function DailyDataMsg() {
        super();
    }

    public var type:int;
    public var hook:int;
    public var cycTask4:int;
    public var cycTask4Max:int;
    public var cycTask5:int;
    public var cycTask5Max:int;
    public var cycTask6:int;
    public var bookstoreTime:Number;
    public var hotelTime:Number;
    public var copyCurCount:int;
    public var copyFreeCount:int;
    public var copyPayCount:int;
    public var diamondCount:uint;
    public var vipCount:uint;
    public var pkCurCount:int;
    public var pkFreeCount:int;
    public var pkPayCount:int;

    public var pkCurCount2:int;
    public var pkFreeCount2:int;
    public var pkPayCount2:int;
    public var xuanjiCurCount:uint;
    public var xuanjiFreeCount:uint;
    public var xuanjiPayCount:uint;
    public var rankCurCount:int;
    public var rankFreeCount:int;
    public var rankPayCount:int;
    public var copyData:Array;
    public var pkData:Array;
    public var rankData:Array;
    public var xuanjiData:Array;
    public var bossType:uint;
    public var bossId:uint;
    public var buildId:uint;
    public var bossHp:Number;
    public var bossCurHp:Number;
    public var bossDamage:Number;
    public var bossLeftSoul:uint;
    public var bossInfo:uint;
    public var bossName:String;
    public var actType:uint;
    public var actState:uint;
    public var state:int;

    public var rechargeList:Array = [];
    public var reacharge:uint = 0;
    public var reachargePos:uint = 0;

    public var shopActive:uint = 0;
    public var shopPoint:uint;
    public var level:uint;
    public var count:uint;

    public var xianjie_copyCurCount:int;
    public var xianjie_copyFreeCount:int;
    public var xianjie_copyPayCount:int;
    public var xianjie_diamondCount:uint;
    public var xianjie_vipCount:uint;
    public var xianjieCopyData:Array;

    public var exp:int;//章节挂机经验基础值
    public var pexp:int;//章节修炼挂机经验基础值
    public var taskId:int;//完成的任务id

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
//			try {
        type = BytesUtil.readByte1(bytes);
        switch (type) {
            case 1:
                toData(bytes);
                break;
            case 3:
                toData3(bytes);
                break;
            case 5:
                active = BytesUtil.readByte1(bytes);
                activeInfo = bytes.readUnsignedInt();
                break;
            case 6:
                toData6(bytes);
                break;
            case 7:
            case 8:
            case 9:
            case 10:
            case 11:
                toData78910(bytes);
                // activeInfo = BytesUtil.readByte1(bytes);
                break;
            case 12:
                activeValue = bytes.readUnsignedInt();
                break;
            case 13:
                toData13(bytes);
                break;
            case 14:
                toData14(bytes);
                break;
            case 15:
                shopActive = bytes.readUnsignedInt();
                break;
            case 16:
                toData16(bytes);
                break;
            case 17:
                shopActive = bytes.readUnsignedInt();
                break;
            case 18:
                shopActive = bytes.readUnsignedInt();
                shopPoint = bytes.readUnsignedInt();
                break;
            case 19:
                shopActive = bytes.readUnsignedInt();
                level = BytesUtil.readByte1(bytes);
                count = BytesUtil.readByte1(bytes);
                break;
            case 20:

                break;
            case 21:
                exp = bytes.readUnsignedInt();
                pexp = bytes.readUnsignedInt();
                taskId = bytes.readUnsignedInt();
                break;
        }
//			} catch(err : Error) {
//			}
        return true;
    }

    private function toData(bytes:ByteArray):void {
        hook = BytesUtil.readByte1(bytes);
        cycTask4 = BytesUtil.readByte1(bytes);
        cycTask4Max = BytesUtil.readByte1(bytes);
        cycTask5 = BytesUtil.readByte1(bytes);
        cycTask5Max = BytesUtil.readByte1(bytes);
//        cycTask6 = BytesUtil.readByte1(bytes);
        bookstoreTime = BytesUtil.readByte2(bytes);
        hotelTime = BytesUtil.readByte2(bytes);
        var i:int;
        var length:int;
        var obj:Object = {};
        copyData = [];
        length = BytesUtil.readByte1(bytes);
        copyCurCount = BytesUtil.readByte1(bytes);
        copyFreeCount = BytesUtil.readByte1(bytes);
        copyPayCount = BytesUtil.readByte1(bytes);
        diamondCount = BytesUtil.readByte1(bytes);
        vipCount = BytesUtil.readByte1(bytes);
        for (i = 0; i < length; i++) {
            obj = {};
            obj["id"] = BytesUtil.readByte1(bytes);
            copyData.push(obj);
        }

        pkData = [];
        length = BytesUtil.readByte1(bytes);
        pkCurCount = BytesUtil.readByte1(bytes);
        pkFreeCount = BytesUtil.readByte1(bytes);
        pkPayCount = BytesUtil.readByte1(bytes);

        pkCurCount2 = BytesUtil.readByte1(bytes);
        pkFreeCount2 = BytesUtil.readByte1(bytes);
        pkPayCount2 = BytesUtil.readByte1(bytes);
        for (i = 0; i < length; i++) {
            obj = {};
            obj["id"] = BytesUtil.readByte1(bytes);
            pkData.push(obj);
        }

        rankData = [];
        length = BytesUtil.readByte1(bytes);
        rankCurCount = BytesUtil.readByte1(bytes);
        rankFreeCount = BytesUtil.readByte1(bytes);
        rankPayCount = BytesUtil.readByte1(bytes);
        for (i = 0; i < length; i++) {
            obj = {};
            obj["id"] = BytesUtil.readByte1(bytes);
            rankData.push(obj);
        }

        xuanjiData = [];
        length = BytesUtil.readByte1(bytes);
        xuanjiCurCount = BytesUtil.readByte1(bytes);
        xuanjiFreeCount = BytesUtil.readByte1(bytes);
        xuanjiPayCount = BytesUtil.readByte1(bytes);
        for (i = 0; i < length; i++) {
            obj = {};
            obj["id"] = BytesUtil.readByte1(bytes);
            xuanjiData.push(obj);
        }

        xianjieCopyData = [];
        length = BytesUtil.readByte1(bytes);
        xianjie_copyCurCount = BytesUtil.readByte1(bytes);
        xianjie_copyFreeCount = BytesUtil.readByte1(bytes);
        xianjie_copyPayCount = BytesUtil.readByte1(bytes);
        xianjie_diamondCount = BytesUtil.readByte1(bytes);
        xianjie_vipCount = BytesUtil.readByte1(bytes);
        for (i = 0; i < length; i++) {
            obj = {};
            var id:uint = BytesUtil.readByte1(bytes);
            if (id < 100)continue;
            obj["id"] = id;
            xianjieCopyData.push(obj);
        }
        return;
    }

    private function toData3(bytes:ByteArray):void {
        actType = BytesUtil.readByte1(bytes);
        actState = BytesUtil.readByte1(bytes);
        return;
    }

    private function toData6(bytes:ByteArray):void {
        bossType = BytesUtil.readByte1(bytes);
        switch (bossType) {
            case 0:
                bossHp = bytes.readUnsignedInt();
                break;
            case 1:
                bossCurHp = bytes.readUnsignedInt();
                break;
            case 2:
                bossDamage = bytes.readUnsignedInt();
                break;
            case 3:
                bossLeftSoul = bytes.readUnsignedInt();
                break;
            case 4:
                bossId = bytes.readUnsignedInt();
                break;
            case 5:
                buildId = bytes.readUnsignedInt();
                break;
            case 6:
                bossInfo = bytes.readUnsignedInt();
                bossName = BytesUtil.readUserName(bytes);
                break;
            case 7:
                break;
        }
        return;
    }

    private function toData78910(bytes:ByteArray):void {
        state = BytesUtil.readByte1(bytes);
        return;
    }

    public function toData13(bytes:ByteArray):void {
        var arr:Array = new Array(13);
        var v:uint;
        var len:uint = BytesUtil.readByte1(bytes);
        for (var i:uint = 0; i < len; i++) {
            v = bytes.readUnsignedInt();
            arr[i] = v;
        }
        rechargeList = arr;
        return;
    }

    public function toData14(bytes:ByteArray):void {
        reachargePos = BytesUtil.readByte1(bytes);
        reacharge = bytes.readUnsignedInt();
        return;
    }


    private function toData16(bytes:ByteArray):void {
        bossType = BytesUtil.readByte1(bytes);
        switch (bossType) {
            case 0:
                bossHp = bytes.readUnsignedInt();
                break;
            case 1:
                bossCurHp = bytes.readUnsignedInt();
                break;
            case 2:
                bossDamage = bytes.readUnsignedInt();
                break;
            case 3:
                bossLeftSoul = bytes.readUnsignedInt();
                break;
            case 4:
                bossId = bytes.readUnsignedInt();
                break;
            case 5:
                buildId = bytes.readUnsignedInt();
                break;
            case 6:
                bossInfo = bytes.readUnsignedInt();
                break;

        }
        return;
    }

}
}