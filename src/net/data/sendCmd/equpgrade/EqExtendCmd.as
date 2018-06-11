package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class EqExtendCmd extends BaseCmd {
    public function EqExtendCmd() {
        super();
        msgType = MsgConst.PROPERTY_SWAP;
    }

    public var fighter1:uint;
    public var fighter2:uint;
    public var id1:Number;
    public var id2:Number;
    public var bitValue:uint = 0;
    public var discount:uint = 0;

    override protected function createBody():void {
        //try{
        bodyBytes.writeShort(fighter1);
        bodyBytes.writeShort(fighter2);
        BytesUtil.writeBigInt(id1, bodyBytes);
        BytesUtil.writeBigInt(id2, bodyBytes);
        bodyBytes.writeByte(bitValue);
        bodyBytes.writeByte(1);
        bodyBytes.writeByte(discount);
        //}catch(e:*){

        //}
    }
}
}