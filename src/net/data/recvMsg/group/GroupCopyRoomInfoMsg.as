package net.data.recvMsg.group {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.group.HeroicInfoStruct;
import net.data.structs.group.PlayerInfoStruct;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GroupCopyRoomInfoMsg extends BaseMsg {
    public var roomId:uint;
    public var leaderId:BigInteger;
    public var st:uint;
    public var playerList:Array;

    public function GroupCopyRoomInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        // try {
        var i:uint;
        var j:uint;
        var count:uint;
        var total:uint;
        var player:PlayerInfoStruct;
        var hero:HeroicInfoStruct;
        var idBytes:ByteArray;
        roomId = bytes.readUnsignedInt();
        idBytes = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        leaderId = BytesUtil.readUint64(idBytes);
        st = BytesUtil.readByte1(bytes);
        count = BytesUtil.readByte1(bytes);
        playerList = [];
        for (i = 0; i < count; i++) {
            player = new PlayerInfoStruct();
            idBytes = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes, 0, 8);
            player.id = BytesUtil.readUint64(idBytes);
            player.name = BytesUtil.readUserName(bytes);
            player.status = BytesUtil.readByte1(bytes);
            player.lv = BytesUtil.readByte1(bytes);
            player.color = BytesUtil.readByte1(bytes);
            player.headId = bytes.readUnsignedShort();
            player.rankId = bytes.readUnsignedShort();
            total = BytesUtil.readByte1(bytes);
            player.heroList = [];
            for (j = 0; j < total; j++) {
                hero = new HeroicInfoStruct();
                hero.id = bytes.readUnsignedInt();
                hero.lv = BytesUtil.readByte1(bytes);
                hero.color = BytesUtil.readByte1(bytes);
                player.heroList.push(hero);
            }
            playerList.push(player);
        }
        // } catch(e : *) {
        // }
        return true;
    }
}
}
