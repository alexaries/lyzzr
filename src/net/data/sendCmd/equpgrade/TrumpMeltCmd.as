package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.data.structs.equpgrade.TrumpPieceStruct;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author user
 */
public class TrumpMeltCmd extends BaseCmd {
    public function TrumpMeltCmd() {
        super();
        msgType = MsgConst.TRUMP_MELT;
    }

    public var fighterId:uint;

    public var trumpId:Number;

    public var itemIdArr:Array;

    /**
     * 0-未绑定 1-绑定
     * @param value
     *
     */


    override protected function createBody():void {
        try {
            bodyBytes.writeShort(fighterId);
            BytesUtil.writeBigInt(trumpId, bodyBytes);
            bodyBytes.writeShort(itemIdArr.length);
            var vo:TrumpPieceStruct;
            for (var i:uint = 0; i < itemIdArr.length; i++) {
                if (itemIdArr[i] is TrumpPieceStruct) {
                    vo = itemIdArr[i] as TrumpPieceStruct;
                    BytesUtil.writeBigInt(vo.id, bodyBytes);
                    bodyBytes.writeByte(vo.binding);
                    bodyBytes.writeShort(vo.num);
                }
                else {
                    BytesUtil.writeBigInt(itemIdArr[i], bodyBytes);
                }
            }
        } catch (e:*) {

        }
    }
}
}
