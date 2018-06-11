package net.data.sendCmd.skill {
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S)  技能  （）
 */
public class SkillBloodCmd extends BaseCmd {
    private var _charId:uint = 0;
    private var _equipFlag:uint = 0;
    private var _equipId:Number = 0;

    public function SkillBloodCmd() {
        this.msgType = MsgConst.CHANGE_EQ;
    }

    public function get equipId():Number {
        return _equipId;
    }
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
            BytesUtil.writeBigInt(equipId, bodyBytes);
        }
        catch (e:*) {

        }
    }
}
}

