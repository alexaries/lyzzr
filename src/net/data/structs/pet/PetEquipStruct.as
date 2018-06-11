/**
 * Created by Haru on 2017/8/4.
 */
package net.data.structs.pet {
import utils.LunaUtil;

import utils.ByteArray;

import net.utils.BytesUtil;

public class PetEquipStruct {
    public var jewels:Vector.<PetJewelStruct>;
    public var itemid:uint;
    public var level:uint;
    public var skillID:uint;
    public var exp:uint;
    public var flowID:Number;
    public var isBind:Boolean;
    public const name:String;
    public const color:uint;
    public const flauntToolTip:String;
    public const imgURL:String;

    public function PetEquipStruct() {
    }

    public static function parsePetEquipVO(byte:ByteArray):PetEquipStruct {
        var vo:PetEquipStruct = new PetEquipStruct();
        vo.flowID = BytesUtil.readBigInt(byte);
        vo.isBind = byte.readBoolean();
        vo.itemid = byte.readUnsignedShort();
        vo.skillID = byte.readUnsignedInt();
        vo.level = byte.readUnsignedByte();
        vo.exp = byte.readUnsignedInt();

        var posBit:uint = byte.readUnsignedByte();
        for (var ei:int = 0; ei < 5; ei++) {
            if (LunaUtil.readBit(posBit, ei)) {
                var jewelID:uint = byte.readUnsignedShort();//这里确实用shot，后台要求
                var jewelVO:PetJewelStruct = new PetJewelStruct();
                jewelVO.itemid = jewelID;
                jewelVO.isBind = true;
                jewelVO.itemNum = 1;
                vo.jewels[ei] = jewelVO;
            }
        }
        return vo;
    }
}
}
