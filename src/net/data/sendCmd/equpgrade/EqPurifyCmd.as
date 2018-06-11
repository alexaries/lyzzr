package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * 装备洗練协议<br>
 * 0x47
 * @author RyanCao
 *
 */
public class EqPurifyCmd extends BaseCmd {
    public function EqPurifyCmd() {
        super();
        msgType = MsgConst.EQ_PURIFY;
    }

    private var _fighterId:uint;
    private var _itemId:Number;
    private var _extra:int;
    private var _forgeType:int;

    public function set forgeType(value:int):void {
        _forgeType = value;
    }

    /**
     *byte    extra    使用符<br>
     0-不使用<br>
     1-保护符
     * @param value
     *
     */
    public function set extra(value:int):void {
        _extra = value;
    }

    public function set itemId(value:Number):void {
        _itemId = value;
    }

    public function set fighterId(value:int):void {
        _fighterId = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(_fighterId);
            BytesUtil.writeBigInt(_itemId, bodyBytes);
            bodyBytes.writeByte(_extra);
        } catch (e:*) {

        }
    }
}
}