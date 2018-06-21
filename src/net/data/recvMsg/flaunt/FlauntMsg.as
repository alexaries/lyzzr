package net.data.recvMsg.flaunt {
import utils.LunaUtil;

import globals.ConfigLocator;

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.charm.CharmStruct;
import net.data.structs.flaunt.FlauntHeroStruct;
import net.data.structs.flaunt.FlauntStruct;
import net.data.structs.lingShi.LingShiStruct;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.pack.ItemStruct;
import net.data.structs.pet.MarryHomePetStruct;
import net.data.structs.pet.PetEquipStruct;
import net.data.structs.pet.PetStruct;
import net.data.structs.zhenyuan.ZhenyuanStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xF3 返回炫耀信息
 */
public class FlauntMsg extends BaseMsg {
    public var flauntData:FlauntStruct;

    public function FlauntMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {

        }
        catch (e:*) {

        }
        return true;
    }
}
}