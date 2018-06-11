package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class BaoJuToStrongCmd extends BaseCmd {
    public function BaoJuToStrongCmd() {
        super();
        msgType = MsgConst.EQ_BAOJU;
    }

    public var type:uint;
    public var arr:Array;
    public var itemId:Number;
    public var protect:int;
    public var bind:int;
    public var itemBinded:uint;

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            if (type == 1) {
                BytesUtil.writeBigInt(itemId, bodyBytes);
                bodyBytes.writeByte(protect);
                bodyBytes.writeByte(bind);

            } else if (type == 2) {
                bodyBytes.writeShort(itemId);
                bodyBytes.writeByte(protect);

            } else if (type == 3) {
                var length:int;
                length = arr.length;
                bodyBytes.writeShort(length);
                for (var i:int = 0; i < length; i++) {
                    bodyBytes.writeShort(arr[i][0]); // 是否绑定
                    BytesUtil.writeBigInt(arr[i][1], bodyBytes);// 物品ID
                }

            }
        } catch (e:*) {

        }
    }


}
}