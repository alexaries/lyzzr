package net.data.sendCmd.pack {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0x33 使用物品
 */
public class UseItemCmd extends BaseCmd {
    /**
     * 物品个数
     * itemNums[0]物品编号, 如果是装备类物品， 需要填写流水号,
     * itemNums[1]是否绑定,
     * itemNums[2]物品个数
     */
    public var itemNums:Array = [];

    public function UseItemCmd() {
        this.msgType = MsgConst.PACK_USE;
    }

    override protected function createBody():void {
        try {
            BytesUtil.writeBigInt(itemNums[0], this.bodyBytes)
            this.bodyBytes.writeByte(itemNums[1]);
            this.bodyBytes.writeShort(itemNums[2]);
            this.bodyBytes.writeUnsignedInt(itemNums[3]);
            this.bodyBytes.writeByte(itemNums[4]);
            //合成的时候把resultID发过去
            if (itemNums[4] == 1)
                BytesUtil.writeBigInt(itemNums[5], this.bodyBytes)
            else
                BytesUtil.writeBigInt(0, this.bodyBytes)
        }
        catch (e:*) {

        }
    }
}
}