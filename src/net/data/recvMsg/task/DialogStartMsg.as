package net.data.recvMsg.task {
import net.data.BaseMsg;
import net.data.structs.task.NpcInteractStruct;
import net.utils.BytesUtil;

import utils.ByteArray;

/**
 * (S->C) 0x80 玩家点击NPC反馈
 */
public class DialogStartMsg extends BaseMsg {
    /**
     *
     */
    private var _npcId:uint = 0;
    /**
     * 玩家点击NPC的反馈行为（0，1）
     */
    private var _actionType:uint = 0;
    private var _npcTaskList:Array;

    public function DialogStartMsg() {
        super();
    }

    public function get actionType():uint {
        return _actionType;
    }

    public function set actionType(value:uint):void {
        _actionType = value;
    }

    public function get npcId():uint {
        return _npcId;
    }

    public function set npcId(value:uint):void {
        _npcId = value;
    }

    public function setNpcInteractVO(tasks:Array):void {
        _npcTaskList = tasks;
        return;
    }

    public function getNpcInteractVO():Array {
        return _npcTaskList;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        npcId = bytes.readUnsignedInt();
        actionType = BytesUtil.readByte2(bytes);
        if (actionType == 1) return true;
        _npcTaskList = [];
        var taskNums:uint = BytesUtil.readByte2(bytes);
        for (var i:uint = 0; i < taskNums; i++) {
            var npcInteractStruct:NpcInteractStruct = new NpcInteractStruct();
            npcInteractStruct.interactType = BytesUtil.readByte2(bytes) + "";
            npcInteractStruct.interactToken = BytesUtil.readByte1(bytes);
            npcInteractStruct.interactId = bytes.readUnsignedInt();
            npcInteractStruct.interactStep = BytesUtil.readByte1(bytes);
            npcInteractStruct.interactMsg = bytes.readUTF();
            _npcTaskList.push(npcInteractStruct);
        }

        return true;
    }
}
}