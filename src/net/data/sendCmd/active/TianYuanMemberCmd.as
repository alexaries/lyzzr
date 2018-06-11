/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-3-12
 * Time: 下午4:43
 * To change this template use File | Settings | File Templates.
 */
package net.data.sendCmd.active {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class TianYuanMemberCmd extends BaseCmd {
    public var type:uint;
    public var opt:uint;
    public var pid:BigInteger;

    public function TianYuanMemberCmd() {
        msgType = MsgConst.ACTIVITY_SEVEN;
    }

    override protected function createBody():void {
        bodyBytes.writeByte(0x31);
        bodyBytes.writeByte(type);
        bodyBytes.writeByte(opt);
        BytesUtil.writeUint64(bodyBytes, pid);
    }
}
}
