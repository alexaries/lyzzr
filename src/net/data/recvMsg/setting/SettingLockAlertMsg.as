package net.data.recvMsg.setting {
import utils.ByteArray;

import net.data.BaseMsg;

/**
 * (S->C) 0xCA 弹密宝框
 */
public class SettingLockAlertMsg extends BaseMsg {
    public function SettingLockAlertMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        return true;
    }
}
}