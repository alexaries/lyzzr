package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.group.PlayerInfoStruct;
import net.data.structs.group.RoomInfoStruct;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GroupCopyLobbyRoomListMsg extends BaseMsg {
    public var max:uint;
    public var index:uint;
    public var type:uint;
    public var count:uint;
    public var roomList:Array;

    public function GroupCopyLobbyRoomListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
//			try
//			{
        var i:uint;
        var j:uint;
        var roomInfo:RoomInfoStruct;
        var playerInfo:PlayerInfoStruct;
        var idBytes:ByteArray;
        max = bytes.readUnsignedInt();
        index = bytes.readUnsignedInt();
        type = BytesUtil.readByte1(bytes);
        count = BytesUtil.readByte1(bytes);
        roomList = [];
        for (i = 0; i < count; i++) {
            roomInfo = new RoomInfoStruct();
            roomInfo.roomId = bytes.readUnsignedInt();
            idBytes = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes, 0, 8);
            roomInfo.leaderId = BytesUtil.readUint64(idBytes);
            roomInfo.st = BytesUtil.readByte1(bytes);
            roomInfo.ed = BytesUtil.readByte1(bytes);
            roomInfo.hasPWD = BytesUtil.readByte1(bytes);
            roomInfo.count = BytesUtil.readByte1(bytes);
            roomInfo.playerList = [];
            for (j = 0; j < roomInfo.count; j++) {
                playerInfo = new PlayerInfoStruct();
                idBytes = BytesUtil.creatByteArray();
                bytes.readBytes(idBytes, 0, 8);
                playerInfo.id = BytesUtil.readUint64(idBytes);
                playerInfo.name = BytesUtil.readUserName(bytes);
                playerInfo.lv = BytesUtil.readByte1(bytes);
                playerInfo.color = BytesUtil.readByte1(bytes);
                playerInfo.headId = bytes.readUnsignedShort();
                roomInfo.playerList.push(playerInfo);
            }
            roomList.push(roomInfo);
        }
//			}
//			catch(e:*)
//			{
//				
//			}
        return true;
    }
}
}
