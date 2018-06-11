package net.data.sendCmd.sort {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xE9 请求个人排行数据
 */
public class PersonalSortCmd extends BaseCmd {
    /**
     * 请求编号,为0时强行请求
     */
    public var id:uint = 0;

    public function PersonalSortCmd() {
        this.msgType = MsgConst.SORT_PERSON;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeUnsignedInt(id);
        }
        catch (e:*) {

        }
    }
}
}