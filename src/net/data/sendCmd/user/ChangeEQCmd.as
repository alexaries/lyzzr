package net.data.sendCmd.user {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0x21 改变装备
 */
public class ChangeEQCmd extends BaseCmd {
    private var _charId:uint = 0;
    private var _equipFlag:uint = 0;
    private var _equipId:Number = 0;

    public function ChangeEQCmd() {
        this.msgType = MsgConst.CHANGE_EQ;
    }

    public function get equipId():Number {
        return _equipId;
    }

    /**
     *装备标志位<br>
     0x00 - 请求装备列表<br>
     0x01 - 武器<br>
     0x02 - 头<br>
     0x03- 胸<br>
     0x04 - 肩<br>
     0x05 - 腰<br>
     0x06- 腿<br>
     0x07 -链<br>
     0x08 -戒 七个防具位
     * @param value
     *
     */
    public function set equipId(value:Number):void {
        _equipId = value;
    }

    public function get charId():uint {
        return _charId;
    }

    public function set charId(value:uint):void {
        _charId = value;
    }

    public function get equipFlag():uint {
        return _equipFlag;
    }

    public function set equipFlag(value:uint):void {
        _equipFlag = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeUnsignedInt(charId);
            bodyBytes.writeByte(equipFlag);
            //bodyBytes.writeUnsignedInt(equipId);
            BytesUtil.writeBigInt(equipId, bodyBytes);
        }
        catch (e:*) {

        }
    }
}
}