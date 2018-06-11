package net.data.recvMsg.friend {

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0x17
 */
public class FriendMoodMsg extends BaseMsg {
    public var type:uint;
    public var moodIndex:uint;
    public var moodDesc:String;
    public var userName:String;
    public var result:uint;

    public var wishID:uint;
    public var weekPrayTimes:uint;
    public var wishCount:uint;
    public var leftTime:uint;
    public var wishStatus:uint;
    public var xiuweiNum:uint;
    public var continueLoginCout:int;
    // public var actionType : uint = 0;
    // public var userName : String = "";
    // public var friendStruct : FriendStruct;
    public var userNameList:Vector.<String>;


    public var loginDaysCount:int;
    public var hasSendGiftCount:int;
    public var getGiftCount:int;
    public var feedCount:int;
    public var canSendGiftCount:int;
    public var giftBoxNum:int;
    public var giftList:Array;
    public var soulCount:int;

    public function FriendMoodMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            switch (type) {
                case 0x00:
                    moodIndex = BytesUtil.readByte1(bytes);
                    break;
                case 0x01:
                    moodIndex = BytesUtil.readByte1(bytes);
                    break;
                case 0x02:
                    moodDesc = bytes.readUTF();
                    break;
                case 0x03:
                    moodDesc = bytes.readUTF();
                    break;
                case 0x04:
                    result = bytes.readByte();
                    break;
                case 0x05:
                    userName = bytes.readUTF();
                    break;
                case 0x06:
                    xiuweiNum = bytes.readUnsignedInt();
                    wishID = BytesUtil.readByte1(bytes);
                    continueLoginCout = BytesUtil.readByte1(bytes);
                    weekPrayTimes = BytesUtil.readByte1(bytes);
                    wishStatus = BytesUtil.readByte1(bytes)
                    wishCount = BytesUtil.readByte1(bytes);
                    if (wishCount >= 10) {
                        leftTime = bytes.readUnsignedInt();
                    }
                    var num:int = BytesUtil.readByte1(bytes);
                    userNameList = new Vector.<String>();
                    for (var i:int = 0; i < num; i++) {
                        userNameList.push(BytesUtil.readUserName(bytes));
                    }
                    break;
                case 0x07:
                    loginDaysCount = BytesUtil.readByte1(bytes);
                    hasSendGiftCount = BytesUtil.readByte1(bytes);
                    getGiftCount = BytesUtil.readByte1(bytes);
                    feedCount = BytesUtil.readByte1(bytes);
                    soulCount = BytesUtil.readByte1(bytes);
                    canSendGiftCount = BytesUtil.readByte1(bytes);
                    giftBoxNum = BytesUtil.readByte1(bytes);
                    giftList = [];
                    var obj:Object;
                    for (var j:int = 0; j < giftBoxNum; j++) {
                        obj = {};
                        var idBytes:ByteArray = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        obj.id = BytesUtil.readUint64(idBytes);
                        obj.rewardIndex = BytesUtil.readByte1(bytes);
                        obj.time = bytes.readUnsignedInt();
                        giftList.push(obj);
                    }
                    break;
            }
        } catch (e:*) {
        }
        return true;
    }
}
}