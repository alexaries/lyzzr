package net.data.recvMsg.sort {

import globals.ConfigLocator;

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.pack.ItemStruct;
import net.data.structs.pet.PetEquipStruct;
import net.data.structs.pet.PetHunStruct;
import net.data.structs.pet.PetJewelStruct;
import net.data.structs.pet.PetPoStruct;
import net.data.structs.pet.PetStruct;
import net.data.structs.sort.SortItemStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xE8 排行榜数据
 */
public class SortListMsg extends BaseMsg {
    /**
     *类型,1-荣誉,2-等级,3-金钱,4-战功,5-宗族
     */
    public var type:uint = 0;
    /**
     * 我的排行榜编号，为0时表示没有更新
     */
    public var reqId:uint = 0;
    /**
     * 我的数值，为0时表示没有更新
     */
    public var value:uint = 0;
    /**
     * 排行榜数据
     */
    public var itemInfo:Array = [];

    public function SortListMsg() {
        super();
    }

    function getTypebyGoodsId(eqId:Number) {
        var vo = ConfigLocator.getInstance().getGoodsById(eqId);
        if (vo && (vo.type >= 13 && vo.type <= 15))
            return true;
        return false

    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        //try
        //{
        type = BytesUtil.readByte1(bytes);
        reqId = bytes.readUnsignedInt();

        if ([SortItemStruct.BAOJU, SortItemStruct.HOT, SortItemStruct.PET].indexOf(type) > -1) {
            value = bytes.readUnsignedInt();
        }
        var count:uint = BytesUtil.readByte1(bytes);
        var sortItem:SortItemStruct;
        var i:uint;
        if (type == SortItemStruct.LEVEL) {
            for (i = 0; i < count; i++) {
                sortItem = new SortItemStruct();
                sortItem.playerName = BytesUtil.readUserName(bytes);
                sortItem.platform = BytesUtil.readByte1(bytes);
                sortItem.level = BytesUtil.readByte1(bytes);
                sortItem.country = BytesUtil.readByte1(bytes);
                sortItem.value = BytesUtil.readBytes8(bytes);
                sortItem.clanName = BytesUtil.readUserName(bytes);
                itemInfo.push(sortItem);
            }
        } else if (type == SortItemStruct.BAOJU) {
            //todo 8-4
            for (i = 0; i < count; i++) {
                sortItem = new SortItemStruct();
                sortItem.index = i + 1;
                sortItem.playerName = BytesUtil.readUserName(bytes);
                sortItem.platform = BytesUtil.readByte1(bytes);
                sortItem.country = BytesUtil.readByte1(bytes);
                sortItem.value = bytes.readUnsignedInt();

                var itemStruct:ItemStruct;
                itemStruct = new ItemStruct();
                itemStruct.itemId = bytes.readUnsignedShort();
                itemStruct.binding = 0;
                itemStruct.itemNums = 1;
                itemStruct.type = ItemStruct.BAOJU;
                itemStruct.eqInfo = new EqInfoStruct();
                itemStruct.eqInfo.eqId = itemStruct.itemId;
                if (getTypebyGoodsId(itemStruct.itemId)) {

                    itemStruct.eqInfo.isTongLing = bytes.readByte();
                    itemStruct.eqInfo.lbColor = bytes.readByte();
                    var num:uint = 4;
                    for (var n:uint = 0; n < num; n++) {
                        var tp:uint = bytes.readByte();
                        var value:uint = bytes.readUnsignedShort();
                        if (tp > 0)
                            itemStruct.eqInfo.lingbaoAttr.push([tp, value]);
                    }
                    itemStruct.eqInfo.skill1 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.factor1 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.skill2 = bytes.readUnsignedShort();
                    itemStruct.eqInfo.factor2 = bytes.readUnsignedShort();
                }
                sortItem.item = itemStruct;
                itemInfo.push(sortItem);
            }
        } else if (type == SortItemStruct.PET) {
            for (i = 0; i < count; i++) {
                sortItem = new SortItemStruct();
                sortItem.index = i + 1;
                sortItem.playerName = BytesUtil.readUserName(bytes);
                sortItem.platform = BytesUtil.readByte1(bytes);
                sortItem.country = BytesUtil.readByte1(bytes);
                sortItem.value = bytes.readUnsignedInt();

                sortItem.pet = new PetStruct();

                sortItem.pet.id = BytesUtil.readByte2(bytes);
                sortItem.pet.isMySelf = false;
                var pinjieID:uint = BytesUtil.readByte2(bytes);
                var genguID:uint = BytesUtil.readByte2(bytes);
                sortItem.pet.formationPos = BytesUtil.readByte1(bytes);
                sortItem.pet.equips = parsePetEquips(bytes);
                parsePetHuns(bytes, sortItem.pet);
                parsePetPos(bytes, sortItem.pet);
                //飞升
                sortItem.pet.taskProgress = BytesUtil.readByte1(bytes);
                sortItem.pet.trainLv = BytesUtil.readByte1(bytes);
                sortItem.pet.mainHeroHp = bytes.readUnsignedInt();
                sortItem.pet.mainHeroAp = bytes.readUnsignedInt();
                sortItem.pet.mainHerpDef = bytes.readUnsignedInt();
                sortItem.pet.mainHeroMagicAp = bytes.readUnsignedInt();
                sortItem.pet.mainHeroMagicDef = bytes.readUnsignedInt();
                sortItem.pet.pinjieID = pinjieID;
                sortItem.pet.genguID = genguID;
                itemInfo.push(sortItem);
            }
        } else {
            for (i = 0; i < count; i++) {
                sortItem = new SortItemStruct();
                sortItem.playerName = BytesUtil.readUserName(bytes);
                sortItem.platform = BytesUtil.readByte1(bytes);
                sortItem.level = BytesUtil.readByte1(bytes);
                sortItem.country = BytesUtil.readByte1(bytes);
                sortItem.value = bytes.readUnsignedInt();
                sortItem.clanName = BytesUtil.readUserName(bytes);
                itemInfo.push(sortItem);
            }
        }
        //}
        //catch(e:*)
        //{

        //}
        return true;
    }

    private function parsePetHuns(bytes:ByteArray, vo:PetStruct):void {
        var len:uint = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < len; i++) {
            var sanhunID:uint = BytesUtil.readByte1(bytes);
            var sanhunLV:uint = BytesUtil.readByte1(bytes);
            var hunVO:PetHunStruct = vo.huns[sanhunID - 1];
            hunVO.level = sanhunLV;
        }
    }

    private function parsePetPos(bytes:ByteArray, vo:PetStruct):void {
        var len:uint = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < len; i++) {
            var poLv:uint = bytes.readUnsignedByte();
            var poSkilIndex:uint = bytes.readUnsignedByte();
            var po:PetPoStruct = vo.polist[i];
            po.level = poLv;
            po.currentUseSkillIndex = poSkilIndex;
            po.index = i;
        }
    }

    private function parsePetEquips(bytes:ByteArray):Vector.<PetEquipStruct> {
        var eqs:Vector.<PetEquipStruct> = new Vector.<PetEquipStruct>;
        for (var i:int = 0; i < 4; i++) {
            var p:PetEquipStruct = parsePetEquipVO(bytes);
            if (!p)
                continue;
            eqs.push(p);
        }
        return eqs;
    }

    private function parsePetEquipVO(byte:ByteArray):PetEquipStruct {
        var vo:PetEquipStruct = new PetEquipStruct();
        var itemID:uint = BytesUtil.readByte2(byte);
        var level:uint = BytesUtil.readByte1(byte);
        var skillID:uint = byte.readUnsignedInt()
        vo.jewels = new Vector.<PetJewelStruct>;
        for (var ei:int = 0; ei < 5; ei++) {
            var jewelID:uint = byte.readUnsignedShort();//这里确实用shot，后台要求
            var jewelVO:PetJewelStruct = new PetJewelStruct();
            if (jewelID == 0)
                continue;
            try {
                jewelVO.itemid = jewelID;
            } catch (e:Error) {

            }
            jewelVO.isBind = true;
            jewelVO.itemNum = 1;
            vo.jewels.push(jewelVO);
        }
        if (itemID == 0)
            return null;
        vo.itemid = itemID;
        vo.level = level;
        vo.skillID = skillID;
        return vo;
    }
}
}