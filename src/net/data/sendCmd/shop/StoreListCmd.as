package net.data.sendCmd.shop {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xB0 请求商城物品列表
 */
public class StoreListCmd extends BaseCmd {
    /**
     * 类型
     * 1-热卖
     * 2-宝石
     * 3-杂物
     * 4-礼券
     */
    private var _type:uint = 0;

    public function StoreListCmd() {
        this.msgType = MsgConst.STORE_LIST;
    }

    public function set type(value:uint):void {
        _type = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
        }
        catch (e:*) {

        }
    }
}
}