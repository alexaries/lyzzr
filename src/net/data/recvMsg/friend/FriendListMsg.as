package net.data.recvMsg.friend {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.friend.FriendStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xD8 返回好友列表
 */
public class FriendListMsg extends BaseMsg {
    /**
     * 列表类型
     */
    public var listType:uint = 0;

    /**
     * 是否已崇拜
     */
    public var supported:uint = 0;
    /**
     * 是否拒绝QQ邀请
     */
    public var isLimitQQReuqest:Boolean;

    /**
     *  好友列表起始位置
     */
    public var startIdx:uint = 0;
    /**
     * 数量n
     */
    public var count:uint = 0;
    /**
     * 好友总数
     */
    public var totalCount:uint = 0;
    /**
     * 好友列表
     */
    private var _friendList:Array;

    public function FriendListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _friendList = [];
            listType = BytesUtil.readByte1(bytes);
            var i:uint;
            if (listType == 5) {
                //推荐好友
                count = BytesUtil.readByte1(bytes);
                for (i = 0; i < count; i++) {
                    var obj:Object = {};
                    obj.name = BytesUtil.readUserName(bytes);
                    obj.lv = BytesUtil.readByte1(bytes);
                    obj.cls = BytesUtil.readByte1(bytes);
                    _friendList.push(obj);
                }
                return true;
            }
            supported = BytesUtil.readByte1(bytes);
            isLimitQQReuqest = bytes.readBoolean();
            startIdx = BytesUtil.readByte1(bytes);
            count = BytesUtil.readByte1(bytes);
            totalCount = BytesUtil.readByte1(bytes);

            var friendStruct:FriendStruct;
            for (i = 0; i < count; i++) {
                friendStruct = new FriendStruct();
                friendStruct.relationType = listType;
                var idBytes:ByteArray = BytesUtil.creatByteArray();
                bytes.readBytes(idBytes, 0, 8);
                friendStruct.userId = BytesUtil.readUint64(idBytes);
                // BytesUtil.readBytes8(bytes)
                friendStruct.userName = BytesUtil.readUserName(bytes);

                //temp：临时处理，后台忘在帮派加了。
                //if(listType != 4)
                friendStruct.vipLevel = BytesUtil.readByte1(bytes);

                friendStruct.platform = BytesUtil.readByte1(bytes);
                friendStruct.sex = BytesUtil.readByte1(bytes);
                friendStruct.country = BytesUtil.readByte1(bytes);
                friendStruct.level = BytesUtil.readByte1(bytes);
                friendStruct.cls = BytesUtil.readByte1(bytes);
                friendStruct.clan = BytesUtil.readUserName(bytes);
                friendStruct.mood = BytesUtil.readByte1(bytes);
                friendStruct.log = bytes.readUTF();
                friendStruct.ranking = bytes.readUnsignedInt();
                friendStruct.online = bytes.readByte();

                friendStruct.prayTreevo.wishID = BytesUtil.readByte1(bytes);
                friendStruct.prayTreevo.wishCount = BytesUtil.readByte1(bytes);
                friendStruct.prayTreevo.myHasHelpWish = Boolean(BytesUtil.readByte1(bytes));
                friendStruct.prayTreevo.wishTomeTimes = bytes.readUnsignedInt();
                friendStruct.receiveCount = BytesUtil.readByte1(bytes);
                friendStruct.openid = bytes.readUTF();
                friendStruct.isLimitQQRequest = bytes.readBoolean();
//                    friendStruct.fairyLandPower=bytes.readUnsignedByte();
                friendStruct.friendlyValue = bytes.readUnsignedInt();
                friendStruct.isBrother = Boolean(bytes.readUnsignedByte());
                friendStruct.flowerCount = bytes.readUnsignedByte();
                friendStruct.isHideTitle = BytesUtil.readByte1(bytes);
                _friendList.push(friendStruct);
            }
        } catch (e:*) {
        }
        return true;
    }

    public function getFriendVO():Array {
        return _friendList;
    }
}
}