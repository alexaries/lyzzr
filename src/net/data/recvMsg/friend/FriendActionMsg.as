package net.data.recvMsg.friend {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.friend.FriendStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xD9 返回好友操作
 */
public class FriendActionMsg extends BaseMsg {
    public var actionType:uint = 0;
    public var userName:String = "";
    public var friendStruct:FriendStruct;
    public var supported:uint = 0;
    public var refers:Array;

    public function FriendActionMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            actionType = BytesUtil.readByte1(bytes);
            if (actionType == 0x09) {
                supported = BytesUtil.readByte1(bytes);
//				}else if (actionType == 0x0C){//推薦好友
//					refers = [];
//					var len:uint = BytesUtil.readByte1(bytes);
//					for (var i:int = 0; i < len; i++) 
//					{
//						refers.push([BytesUtil.readUserName(bytes),BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes)]);
//					}
            } else if ([FriendStruct.DELETE_FRIEND, FriendStruct.REMOVE_FROM_BLACK, FriendStruct.REMOVE_E_FRIEND, FriendStruct.REMOVE_G_FRIEND].indexOf(actionType) > -1)
                userName = BytesUtil.readUserName(bytes);
            else {
                friendStruct = new FriendStruct();
                friendStruct.relationType = (actionType - 1) / 2;
                var idBytes:ByteArray = BytesUtil.creatByteArray();
                bytes.readBytes(idBytes, 0, 8);
                friendStruct.userId = BytesUtil.readUint64(idBytes);
                // BytesUtil.readBytes8(bytes)
                friendStruct.userName = BytesUtil.readUserName(bytes);
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
                friendStruct.friendlyValue = bytes.readUnsignedInt();
                friendStruct.isBrother = bytes.readBoolean();
                friendStruct.flowerCount = bytes.readUnsignedByte();
            }
        } catch (e:*) {
        }
        return true;
    }
}
}
