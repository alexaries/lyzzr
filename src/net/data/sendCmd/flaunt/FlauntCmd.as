package net.data.sendCmd.flaunt {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.data.structs.flaunt.FlauntStruct;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0xF3 请求炫耀信息
 */
public class FlauntCmd extends BaseCmd {
    /**0x01:装备,0x02:将领*/
    public var type:uint = 0;
    /**将领改为流水号，需要知道用户id*/
    public var flaunterId:BigInteger = BigInteger.nbv(0);
    /**若是装备：则为装备流水号,若为将领:则为将领id*/
    public var id:Number = 0;
    /**当是灵宠装备炫耀的时候，userid后32改成灵宠id*/
    public var petID:uint = 0;

    public function FlauntCmd() {
        this.msgType = MsgConst.FLAUNT;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
//				BytesUtil.writeBytes8(this.bodyBytes,flaunterId);
            if (type != FlauntStruct.FLAUNT_PET_EQUIP && type != FlauntStruct.FLAUNT_PET_EQUIP_LOOK)
                BytesUtil.writeUint64(this.bodyBytes, flaunterId);
            else {
                bodyBytes.writeUnsignedInt(petID);
                bodyBytes.writeUnsignedInt(0);
            }
            BytesUtil.writeBigInt(id, bodyBytes);
        }
        catch (e:*) {

        }
    }
}
}