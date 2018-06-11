package net.data.sendCmd.anniversary {
import net.data.BaseCmd;
import net.events.MsgConst;

public class AnniversaryCmd extends BaseCmd {
    public static const GIFTS:uint = 0x01;
    public static const ROUTE:uint = 0x02;
    public static const VOICE:uint = 0x05;
    public static const BLUEGIFT:uint = 0x09;

    public var subMsgType:uint;
    public var params:Array;

    public function AnniversaryCmd(subMsgType:uint, params:Array) {
        super();

        msgType = MsgConst.ANNIVERSARY;
        this.subMsgType = subMsgType;
        this.params = params;
    }

    override protected function createBody():void {
        bodyBytes.writeByte(subMsgType);
        switch (subMsgType) {
            case GIFTS:
                if (params[0] == 1) {
                    bodyBytes.writeByte(params[0]);
                    bodyBytes.writeByte(params[1]);
                }
                else if (params[0] == 2) {
                    bodyBytes.writeByte(params[0]);
                }
                break;
            case ROUTE:
            case VOICE:
            case BLUEGIFT:
                bodyBytes.writeByte(params[0]);
                break;
            default:
                //	可能有错误发生
                break;
        }
    }
}
}