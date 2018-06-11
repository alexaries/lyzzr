/**
 * Created by huangcb on 2017/8/21.
 */
package net.data.recvMsg.rune {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

public class RuneSystemRetMsg  extends  BaseMsg{
    private var flag:uint;
    public var bless:int;
    public function RuneSystemRetMsg() {
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
          flag = BytesUtil.readByte1(bytes);
        switch (flag) {
            case 0://失败

                break;
            case 1://成功
                break;
            case 2://查询
                break;
        }
        bless = BytesUtil.readByte1(bytes);
        return super.byteArrayToMsg(bytes);
    }
}
}
