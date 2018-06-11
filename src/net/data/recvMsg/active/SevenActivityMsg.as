package net.data.recvMsg.active {
import utils.LunaUtil;

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 七日活动返回
 * @author ryan
 */
public class SevenActivityMsg extends BaseMsg {
    public var type:uint;
    public var cts1:uint;
    public var cts2:uint;
    public var cts3:uint;
    public var will:uint;
    public var income:uint;
    public var dot:uint;
    public var packdot:uint;
    public var online:uint;
    public var cts:uint;
    public var day:uint;
    public var cts4:uint;

    public var flag:uint;
    public var flag2:uint;
    public var award:uint;
    public var signList:Vector.<Boolean>;
    public var dayGet:Boolean;
    public var weekGet:Boolean;
    public var monthGet:Boolean;
    public var fistLogin:Boolean;

    public var experience:Vector.<uint> = new Vector.<uint>(12);
    public var experienceScore:uint = 0;

    public function SevenActivityMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        if (type == 0) {
            income = bytes.readUnsignedInt();
            dot = BytesUtil.readByte1(bytes);
            online = BytesUtil.readByte1(bytes);
            cts1 = BytesUtil.readByte1(bytes);
            cts2 = BytesUtil.readByte1(bytes);
            cts = BytesUtil.readByte1(bytes);
            cts3 = BytesUtil.readByte1(bytes);
            will = BytesUtil.readByte1(bytes);
            day = BytesUtil.readByte1(bytes);
            cts4 = BytesUtil.readByte1(bytes);
        } else if (type == 4) {
            will = BytesUtil.readByte1(bytes);
        } else if (type == 5) {
            income = bytes.readUnsignedInt();
        } else if (type == 6) {
            dot = BytesUtil.readByte1(bytes);
        } else if ([9, 11, 12, 13, 14].indexOf(type) > -1) {
            day = BytesUtil.readByte1(bytes);
            dot = BytesUtil.readByte1(bytes);
            packdot = BytesUtil.readByte1(bytes);
        } else if (type == 15) {
            day = BytesUtil.readByte1(bytes);
            income = bytes.readUnsignedInt();
        } else if (type == 16) {
            day = BytesUtil.readByte1(bytes);
            will = BytesUtil.readByte1(bytes);
            dot = bytes.readUnsignedInt();
            cts1 = BytesUtil.readByte1(bytes);
            cts2 = BytesUtil.readByte1(bytes);
            cts3 = BytesUtil.readByte1(bytes);
        } else if (type == 17) {
            flag = BytesUtil.readByte1(bytes);
            award = BytesUtil.readByte1(bytes);
        } else if (type == 18) {
            day = BytesUtil.readByte1(bytes);
            dot = bytes.readUnsignedInt();
            cts1 = BytesUtil.readByte2(bytes);
            cts2 = BytesUtil.readByte1(bytes);
            cts3 = BytesUtil.readByte1(bytes);
        } else if (type == 19) {
            flag = BytesUtil.readByte1(bytes);
            flag2 = BytesUtil.readByte1(bytes);
        } else if (type == 20) {
        } else if (type == 27) {
            signList = new Vector.<Boolean>;
            var value:uint = bytes.readUnsignedInt();
            for (var i:int = 0; i < 32; i++) {
                signList[i] = LunaUtil.readBit(value, i);
            }
            day = BytesUtil.readByte1(bytes);
            var rewardValue:uint = BytesUtil.readByte1(bytes);
            dayGet = LunaUtil.readBit(rewardValue, 0);
            weekGet = LunaUtil.readBit(rewardValue, 1);
            monthGet = LunaUtil.readBit(rewardValue, 2)
            //fistLogin = BytesUtil.readByte1(bytes);
        }
        else if (type == 28) {
            for (i = 0; i < 10; i++) {
                experience[i] = bytes.readUnsignedByte();
            }
            experience[10] = bytes.readUnsignedInt();
            experience[11] = bytes.readUnsignedInt();
            experienceScore = bytes.readUnsignedInt();
        }

        return true;
    }
}
}
