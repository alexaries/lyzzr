package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.data.structs.task.NpcInteractStruct;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * (S->C) 0x81 玩家点击交互动作响应
 */
public class NpcInteractMsg extends BaseMsg {
    public var npcId:uint = 0;
    public var npcMsg:String = "";
    public var npcInteractStruct:NpcInteractStruct;

    public function NpcInteractMsg() {

    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        npcId = bytes.readUnsignedInt();
        npcMsg = bytes.readUTF();
        npcInteractStruct = new NpcInteractStruct();
        npcInteractStruct.interactType = BytesUtil.readByte1(bytes) + "";//bytes.readByte();
        npcInteractStruct.interactToken = BytesUtil.readByte1(bytes);
        npcInteractStruct.interactMsg = bytes.readUTF();
        npcInteractStruct.interactId = bytes.readUnsignedInt();
        npcInteractStruct.interactStep = BytesUtil.readByte1(bytes);

        return true;
    }
}
}