package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.clan.ClanMemberStruct;
import net.utils.BytesUtil;

/**
 * 协议类型 0x97
 * @author RyanCao
 *
 */
public class ClanReqSelfListMsg extends BaseMsg {
    public function ClanReqSelfListMsg() {
        super();
    }

    private var _flag:int;
    private var _itemData:Array;


    public function getItemData():Array {
        return _itemData;
    }

    public function getFlag():int {
        return _flag;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _flag = BytesUtil.readByte1(bytes);
            _itemData = new Array();

            var len:int = BytesUtil.readByte1(bytes);
            var i:int;
            var clanvo:ClanMemberStruct;
            var idBytes:ByteArray;
            if (_flag) {
                //读取申请宗族成员列表

                for (i = 0; i < len; i++) {
                    clanvo = new ClanMemberStruct();
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    clanvo.id = BytesUtil.readUint64(idBytes);
//						clanvo.id = _byteReader.readBytes8(bytes);
                    clanvo.name = BytesUtil.readUserName(bytes);
                    clanvo.level = BytesUtil.readByte1(bytes);
                    clanvo.time = bytes.readUnsignedInt();
                    clanvo.platform = BytesUtil.readByte1(bytes);
                    clanvo.pos = 100;

                    _itemData.push(clanvo);
                }
            } else {
                //读取宗族成员列表
                for (i = 0; i < len; i++) {
                    clanvo = new ClanMemberStruct();
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    clanvo.id = BytesUtil.readUint64(idBytes);
//						clanvo.id = _byteReader.readBytes8(bytes);
                    clanvo.name = BytesUtil.readUserName(bytes);
                    clanvo.pos = BytesUtil.readByte1(bytes);
                    clanvo.level = BytesUtil.readByte1(bytes);
                    clanvo.flag = BytesUtil.readByte1(bytes);
                    clanvo.active = bytes.readUnsignedInt();
                    clanvo.time = bytes.readUnsignedInt();
                    clanvo.platform = BytesUtil.readByte1(bytes);
                    clanvo.weekActivePoint = bytes.readUnsignedInt();
                    clanvo.monthActivePoint = bytes.readUnsignedInt();
//						clanvo.bindQQ=Boolean(BytesUtil.readByte1(bytes));
                    clanvo.power = bytes.readUnsignedByte();
                    _itemData.push(clanvo);
                }
            }

        } catch (e:*) {

        }
        return true;
    }
}
}