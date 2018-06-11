package net.data.sendCmd.equpgrade {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * 宝石镶嵌消息协议<br>
 * 0x43
 * @author RyanCao
 *
 */
public class EqEmbedCmd extends BaseCmd {
    public function EqEmbedCmd() {
        super();
        msgType = MsgConst.EQ_EMBED;
    }

    private var _fighterId:uint;

    private var _gemId:uint;

    private var _itemId:Number;

    private var _bind:int = 0;

    /**
     * 0-未绑定 1-绑定
     * @param value
     *
     */
    public function set bind(value:int):void {
        _bind = value;
    }

    public function set fighterId(value:uint):void {
        _fighterId = value;
    }

    public function set itemId(value:Number):void {
        _itemId = value;
    }

    public function set gemId(value:uint):void {
        _gemId = value;
    }


    override protected function createBody():void {
        try {
            bodyBytes.writeShort(_fighterId);
            BytesUtil.writeBigInt(_itemId, bodyBytes);
            bodyBytes.writeShort(_gemId);
            bodyBytes.writeByte(_bind);
        } catch (e:*) {

        }
    }
}
}