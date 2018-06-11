package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class EqToStrongCmd extends BaseCmd {
    public function EqToStrongCmd() {
        super();
        msgType = MsgConst.EQ_ENHANCE;
    }

    private var _fighterId:uint;
    private var _itemId:Number;
    private var _enchantType:uint;
    private var _extra:uint;
    public var count:uint;
    public var level:uint;

    public function set enchantType(value:uint):void {
        _enchantType = value;
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

    /**
     * uint    itemId    装备ID
     * @param value
     *
     */
    public function set itemId(value:Number):void {
        _itemId = value;
    }

    /**
     * uint    itemId    武将ID
     0表示在背包中
     * @param value
     *
     */
    public function set fighterId(value:uint):void {
        _fighterId = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(_fighterId);
            BytesUtil.writeBigInt(_itemId, bodyBytes);
            bodyBytes.writeByte(_enchantType);
            bodyBytes.writeShort(count);
            bodyBytes.writeByte(level);
        } catch (e:*) {

        }
    }
}
}