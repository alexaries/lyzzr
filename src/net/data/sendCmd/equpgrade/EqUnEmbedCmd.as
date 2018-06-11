package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * 装备的宝石拆卸<br>
 * 消息协议0x44
 * @author RyanCao
 *
 */
public class EqUnEmbedCmd extends BaseCmd {
    public function EqUnEmbedCmd() {
        super();
        msgType = MsgConst.EQ_UN_EMBED;
    }

    private var _fighterId:uint;

    private var _slot:int;

    private var _itemId:Number;

    /**
     *    byte    slot    拆卸位置 (1-6)
     * @param value
     *
     */
    public function set slot(value:int):void {
        _slot = value;
    }

    /**
     * 装备ID
     * @param value
     *
     */
    public function set itemId(value:Number):void {
        _itemId = value;
    }

    /**
     * 武将ID
     * 0表示在背包中
     *
     */
    public function set fighterId(value:int):void {
        _fighterId = value;
    }

    private var _extra:int;

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

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(_fighterId);
            BytesUtil.writeBigInt(_itemId, bodyBytes);
            bodyBytes.writeByte(_slot);
            bodyBytes.writeByte(_extra);
        } catch (e:*) {

        }
    }
}
}