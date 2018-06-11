package net.data.recvMsg.map {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class TransportUpdateMsg extends BaseMsg {
    public function TransportUpdateMsg() {
        super();
    }

    private var _type:int = 2;
    private var _npcID:uint = 0x1110;
    private var _locID:int = 0x3505;
    private var _flag:int;
    private var _actionType:int;

    public function get actionType():int {
        return _actionType;
    }

    public function get flag():int {
        return _flag;
    }

    public function get locID():int {
        return _locID;
    }

    public function get npcID():uint {
        return _npcID;
    }

    /**
     * 类型<br>
     * 1 - 移除npc<br>
     * 2 - 添加npc
     * @return
     *
     */
    public function get type():int {
        return _type;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            _npcID = bytes.readUnsignedInt();
            _locID = BytesUtil.readByte2(bytes);
            _flag = BytesUtil.readByte1(bytes);
            _actionType = BytesUtil.readByte1(bytes);
        } catch (e:*) {

        }
        return true;
    }
}
}