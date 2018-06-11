package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * 装备打孔消息<br>
 * 0x41
 * @author RyanCao
 *
 */
public class EqToPunchCmd extends BaseCmd {
    public function EqToPunchCmd() {
        super();
        msgType = MsgConst.EQ_PUNCH;
    }

    private var _itemID:Number;
    private var _fighterId:uint;

    public function set itemID(value:Number):void {
        _itemID = value;
    }

    public function set fighterId(value:uint):void {
        _fighterId = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(_fighterId);
            BytesUtil.writeBigInt(_itemID, bodyBytes);
        } catch (e:*) {

        }
    }
}
}