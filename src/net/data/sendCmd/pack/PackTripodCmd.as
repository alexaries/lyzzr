package net.data.sendCmd.pack {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0x31 物品放入九疑鼎
 */
public class PackTripodCmd extends BaseCmd {
    /**
     * temInfor结构<br>
     * uint32 物品编号, 如果是装备类物品， 则为流水号<br>
     * uint8 绑定属性
     * uint16 物品个数
     */
    private var _itemInfo:Array = [];
    public var index:uint;

    public function PackTripodCmd() {
        this.msgType = MsgConst.PACK_TRIPOD;
    }

    public function get itemInfo():Array {
        return _itemInfo;
    }

    public function set itemInfo(value:Array):void {
        _itemInfo = value;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(index);
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