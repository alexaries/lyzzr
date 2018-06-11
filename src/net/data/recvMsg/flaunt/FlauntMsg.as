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
            flauntData = new FlauntStruct();
            flauntData.type = BytesUtil.readByte1(bytes);
            flauntData.gender = BytesUtil.readByte1(bytes);
            flauntData.flaunterCountry = BytesUtil.readByte1(bytes);
            flauntData.flaunter = BytesUtil.readUserName(bytes);

            switch (flauntData.type) {
                case FlauntStruct.FLAUNT_EQ:
                    flauntData.equipInfo = new EqInfoStruct();
                    flauntData.equipInfo.flowId = BytesUtil.readBigInt(bytes);
                    flauntData.equipInfo.binding = BytesUtil.readByte1(bytes);
                    flauntData.equipInfo.eqId = BytesUtil.readByte2(bytes);
                    flauntData.equipInfo.enhanceLevel = BytesUtil.readByte1(bytes);
                    flauntData.equipInfo.boreNums = BytesUtil.readByte1(bytes);
                    for (var i:uint = 0; i < flauntData.equipInfo.boreNums; i++) {
                        flauntData.equipInfo.jewelIds.push(BytesUtil.readByte2(bytes));
                    }
                    flauntData.equipInfo.exNums = BytesUtil.readByte1(bytes);
                    for (var k:uint = 0; k < flauntData.equipInfo.exNums; k++) {
                        var type:uint = BytesUtil.readByte1(bytes);
                        var exValue:Number = BytesUtil.readByte2(bytes);
                        flauntData.equipInfo.exProps.push([type, exValue]);
                    }
                    if (flauntData.equipInfo.eqId < 1750 && flauntData.equipInfo.eqId >= 1500 || flauntData.equipInfo.eqId < 2000 && flauntData.equipInfo.eqId >= 1850) {
                        flauntData.equipInfo.maxLevel = BytesUtil.readByte1(bytes);
                        flauntData.equipInfo.currentExp = bytes.readUnsignedInt();
                    }
                    if (flauntData.equipInfo.eqId < 4000 && flauntData.equipInfo.eqId >= 2544 || flauntData.equipInfo.eqId <= 1799 && flauntData.equipInfo.eqId >= 1750
                            || flauntData.equipInfo.eqId <= 4999 && flauntData.equipInfo.eqId >= 4997
                            || flauntData.equipInfo.eqId >= 25001 && flauntData.equipInfo.eqId <= 25064
                            || flauntData.equipInfo.eqId >= 25301 && flauntData.equipInfo.eqId <= 25364
                            || flauntData.equipInfo.eqId >= 26000 && flauntData.equipInfo.eqId <= 26127) {
                        flauntData.equipInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                        flauntData.equipInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                        flauntData.equipInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                        flauntData.equipInfo.soulLevel.push(BytesUtil.readByte2(bytes));
                        flauntData.equipInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                        flauntData.equipInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                        flauntData.equipInfo.soulFormula.push(BytesUtil.readByte1(bytes));
                    }
                    var vo_type = ConfigLocator.getInstance().getGoodsTypeById(flauntData.equipInfo.eqId);
                    if (vo_type >= 13 && vo_type <= 15) {
                        flauntData.equipInfo.isTongLing = bytes.readByte();
                        flauntData.equipInfo.lbColor = bytes.readByte();
                        var num:uint = bytes.readByte();
                        for (var n:uint = 0; n < num; n++) {
                            var tp:uint = bytes.readByte();
                            var value:uint = bytes.readUnsignedShort();
                            flauntData.equipInfo.lingbaoAttr.push([tp, value]);
                        }
                        flauntData.equipInfo.skill1 = bytes.readUnsignedShort();
                        flauntData.equipInfo.factor1 = bytes.readUnsignedShort();
                        flauntData.equipInfo.skill2 = bytes.readUnsignedShort();
                        flauntData.equipInfo.factor2 = bytes.readUnsignedShort();
                    }
                    if (flauntData.equipInfo.eqId >= 19000 && flauntData.equipInfo.eqId <= 19019) {
                        flauntData.equipInfo.critDef = BytesUtil.readByte4(bytes);
                        flauntData.equipInfo.pierceDef = BytesUtil.readByte4(bytes);
                        flauntData.equipInfo.repelDef = BytesUtil.readByte4(bytes);
                        flauntData.equipInfo.ap = BytesUtil.readByte4(bytes);
                    }
                    if (vo_type == 10) {
                        flauntData.equipInfo.diaowenNum = bytes.readByte();
                        for (var j:uint = 0; j < flauntData.equipInfo.diaowenNum; j++) {
                            flauntData.equipInfo.diaowenIds.push(BytesUtil.readByte2(bytes));
                        }
                    }
                    break;
                case FlauntStruct.FLAUNT_HERO:
                    flauntData.fighterData = new FlauntHeroStruct();
                    flauntData.fighterData.id = BytesUtil.readByte2(bytes);
                    flauntData.fighterData.level = BytesUtil.readByte1(bytes);
                    flauntData.fighterData.potential = bytes.readFloat();
                    flauntData.fighterData.skill = bytes.readUnsignedInt();

                    flauntData.fighterData.power = bytes.readUnsignedInt();
                    flauntData.fighterData.agility = bytes.readUnsignedInt();
                    flauntData.fighterData.intelligence = bytes.readUnsignedInt();
                    flauntData.fighterData.will = bytes.readUnsignedInt();
                    flauntData.fighterData.strength = bytes.readUnsignedInt();

                    flauntData.fighterData.attack = bytes.readUnsignedInt();
                    flauntData.fighterData.magic_ap = bytes.readUnsignedInt();
                    flauntData.fighterData.defend = bytes.readUnsignedInt();
                    flauntData.fighterData.magic_def = bytes.readUnsignedInt();
                    //flauntData.fighterData.hp = BytesUtil.readByte2(bytes);
                    flauntData.fighterData.hp = bytes.readUnsignedInt();
                    flauntData.fighterData.hitrate = BytesUtil.readByte2(bytes) * 0.0001;
                    flauntData.fighterData.evade = BytesUtil.readByte2(bytes) * 0.0001;
                    flauntData.fighterData.magic_dodge = BytesUtil.readByte2(bytes) * 0.0001;
                    flauntData.fighterData.critical = BytesUtil.readByte2(bytes) * 0.0001;
                    flauntData.fighterData.pierce = BytesUtil.readByte2(bytes) * 0.0001;
                    flauntData.fighterData.counter = BytesUtil.readByte2(bytes) * 0.0001;
                    flauntData.fighterData.touch = BytesUtil.readByte2(bytes) * 0.0001;
                    flauntData.fighterData.act = bytes.readUnsignedInt();
                    break;
                case FlauntStruct.FLAUNT_PET:
                    flauntData.petVO = new PetStruct();
                    flauntData.petVO.id = bytes.readUnsignedInt();
                    flauntData.petVO.pinjieID = bytes.readUnsignedByte();
                    flauntData.petVO.genguID = bytes.readUnsignedByte();
                    flauntData.petVO.formationPos = BytesUtil.readByte1(bytes);
                    //装备
                    var posBit:uint = bytes.readUnsignedByte();
                    for (var ei:int = 0; ei < 4; ei++) {
                        if (LunaUtil.readBit(posBit, ei)) {
                            flauntData.petVO.equips[ei] = PetEquipStruct.parsePetEquipVO(bytes);
                        }
                    }
                    //三魂
                    var hunCount:uint = bytes.readUnsignedByte();
                    for (ei = 0; ei < hunCount; ei++) {
                        var hunID:uint = bytes.readUnsignedByte();
                        var hunLV:uint = bytes.readUnsignedByte();
                        flauntData.petVO.huns[hunID - 1].level = hunLV;
                    }

                    //七魄
                    var poCount:uint = bytes.readUnsignedByte();
                    for (ei = 0; ei < poCount; ei++) {
                        var poLv:uint = bytes.readUnsignedByte();
                        var poSkilIndex:uint = bytes.readUnsignedByte();
                        flauntData.petVO.polist[ei].level = poLv;
                        flauntData.petVO.polist[ei].currentUseSkillIndex = poSkilIndex;
                    }
                    //飞升
                    flauntData.petVO.taskProgress = BytesUtil.readByte1(bytes);
                    flauntData.petVO.trainLv = BytesUtil.readByte1(bytes);
                    flauntData.petVO.mainHeroHp = bytes.readUnsignedInt();
                    flauntData.petVO.mainHeroAp = bytes.readUnsignedInt();
                    flauntData.petVO.mainHerpDef = bytes.readUnsignedInt();
                    flauntData.petVO.mainHeroMagicAp = bytes.readUnsignedInt();
                    flauntData.petVO.mainHeroMagicDef = bytes.readUnsignedInt();
                    flauntData.id = flauntData.petVO.id;
                    break;
                case FlauntStruct.FLAUNT_PET_EQUIP:
                    var petEqVO:PetEquipStruct = PetEquipStruct.parsePetEquipVO(bytes);
                    flauntData.id = petEqVO.flowID;
                    flauntData.name = petEqVO.name;
                    flauntData.nameColor = petEqVO.color;
                    flauntData.img = petEqVO.imgURL;
                    flauntData.about = petEqVO.flauntToolTip;
                    break;

                case FlauntStruct.FLAUNT_ZHENYUAN_LOOK:
                    var struct:ItemStruct = new ItemStruct();
                    struct.itemId = bytes.readUnsignedInt();
                    struct.binding = bytes.readByte();
                    struct.itemNums = bytes.readUnsignedInt();
                    var zhenyuanVO:ZhenyuanStruct = ZhenyuanStruct.parseZhenyuanVO(bytes, struct);

                    flauntData.id = zhenyuanVO.flowID;
                    flauntData.name = zhenyuanVO.name;
                    flauntData.nameColor = zhenyuanVO.quality;
                    flauntData.img = zhenyuanVO.imgURL;
                    flauntData.about = zhenyuanVO.toolTip;
                    break;

                case FlauntStruct.MARRYHOME_PET:
                    flauntData.marryHome_petVO = new MarryHomePetStruct();
                    flauntData.marryHome_petVO.boyName = BytesUtil.readUserName(bytes);
                    flauntData.marryHome_petVO.boyCountry = BytesUtil.readByte1(bytes);
                    flauntData.marryHome_petVO.girlName = BytesUtil.readUserName(bytes);
                    flauntData.marryHome_petVO.girlCountry = BytesUtil.readByte1(bytes);
                    flauntData.marryHome_petVO.petName = bytes.readUTF();
                    flauntData.marryHome_petVO.tokenID = BytesUtil.readByte1(bytes);
                    flauntData.marryHome_petVO.petLevel = BytesUtil.readByte1(bytes);
                    flauntData.marryHome_petVO.growNum = bytes.readUnsignedShort();
                    flauntData.marryHome_petVO.relationCount = bytes.readUnsignedShort()
                    break;
                case FlauntStruct.FLAUNT_LING_SHI_LOOK:
                    flauntData.lingShiData = LingShiStruct.parse(bytes);
                    break;
                case FlauntStruct.FLAUNT_CHARM_LOOK:
                    var id:int = bytes.readUnsignedInt();
                    flauntData.charmVo = new CharmStruct();
                    flauntData.charmVo.id = id;
                    flauntData.charmVo.lv = bytes.readByte();
                    flauntData.charmVo.name_NEW = bytes.readUTF();
                    flauntData.img = "";
                    flauntData.charmVo.skillList = [];
                    var skNum:int = bytes.readByte();
                    var skId:int;
                    for (i = 0; i < skNum; i++) {
                        skId = bytes.readUnsignedInt();
                        flauntData.charmVo.skillList.push(skId);
                    }
                    break;
            }
        }
        catch (e:*) {

        }
        return true;
    }
}
}