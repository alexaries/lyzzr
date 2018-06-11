package net.data.recvMsg.reward {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 类型	名称	说明
 * UInt32	totaltime	当前累积在线时间
 * UInt32	curreward	当前领到第几档奖励
 */

public class RewardDrawMsg extends BaseMsg {
    private var _totoltime:uint = 0;
    private var _curreward:uint = 0;

    public function RewardDrawMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        _totoltime = BytesUtil.readByte4(bytes);
        _curreward = BytesUtil.readByte4(bytes);
        return true;
    }

    public function get totoltime():uint {
        return _totoltime;
    }

    public function get curreward():uint {
        return _curreward;
    }
}
}