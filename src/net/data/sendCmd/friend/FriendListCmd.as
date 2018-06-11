package net.data.sendCmd.friend {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xA8 获取好友列表
 */
public class FriendListCmd extends BaseCmd {
    /**
     * 列表类型
     */
    public var listType:uint = 0;
    /**
     *  起始序号
     */
    private var _startIdx:uint = 0;
    /**
     * 好友数量
     */
    private var _friendNums:uint = 0;

    public function FriendListCmd() {
        this.msgType = MsgConst.FRIEND_LIST;
    }

    public function get friendNums():uint {
        return _friendNums;
    }

    public function set friendNums(value:uint):void {
        _friendNums = value;
    }

    public function get startIdx():uint {
        return _startIdx;
    }

    public function set startIdx(value:uint):void {
        _startIdx = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(listType);
            this.bodyBytes.writeByte(startIdx);
            this.bodyBytes.writeByte(friendNums);
        }
        catch (e:*) {

        }
    }
}
}