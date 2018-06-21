package net.data.recvMsg.user {
import globals.ConfigLocator;

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.lingShi.LingShiStruct;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.user.ChangeDataStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x21 武将信息改变
 */
public class ChangeEQMsg extends BaseMsg {
    private var _fighterId:uint = 0;
    private var _changeList:Array;

    public function ChangeEQMsg() {
        super();
    }

    public function get changeList():Array {
        return _changeList;
    }

    public function set changeList(value:Array):void {
        _changeList = value;
    }

    public function get fighterId():uint {
        return _fighterId;
    }

    public function set fighterId(value:uint):void {
        _fighterId = value;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
        } catch (e:*) {
        }
        return true;
    }
}
}