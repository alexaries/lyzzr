package net.data.sendCmd.pack {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0x32 出售物品
 */
public class SellItemCmd extends BaseCmd {
    /**
     * temInfor结构<br>
     * uint32 物品编号, 如果是装备类物品， 则为流水号<br>
     * uint8 是否绑定
     * uint16 物品个数
     */
    private var _itemInfo:Array = [];

    public function SellItemCmd() {
        this.msgType = MsgConst.PACK_SELL;
    }

    public function get itemInfo():Array {
        return _itemInfo;
    }

    public function set itemInfo(value:Array):void {
        _itemInfo = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeShort(itemInfo.length);
            for (var i:uint = 0; i < itemInfo.length; i++) {
                BytesUtil.writeBigInt(itemInfo[i][0], bodyBytes);
                this.bodyBytes.writeByte(itemInfo[i][1]);
                this.bodyBytes.writeShort(itemInfo[i][2]);
            }
        }
        catch (e:*) {

        }
    }
}
}