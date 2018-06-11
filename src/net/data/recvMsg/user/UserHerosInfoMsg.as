package net.data.recvMsg.user {

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.user.IndexStruct;
import net.data.structs.user.UserHeroStruct;
import net.utils.BytesUtil;

/**
 * 协议0x23
 * @author RyanCao
 *
 */
public class UserHerosInfoMsg extends BaseMsg {
    public function UserHerosInfoMsg() {
        super();
    }

    /**
     * 返回数组   元素为:
     * @see UserHeroStruct
     * */
    private var _heros:Array;

    /**
     * 返回数组   元素为:
     * @see UserHeroStruct
     * */
    public var stars_num:Number;

    public function getHeros():Array {
        return _heros;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        trace("处理D2 ===D2")
        try {
            _heros = [];
            var len:int = BytesUtil.readByte1(bytes);
            for (var i:int = 0; i < len; i++) {
                var userhero:UserHeroStruct = readFightHeroData(bytes);
                _heros.push(userhero);
            }
        } catch (e:*) {
        }
        return true;
    }

    private function readFightHeroData(bytes:ByteArray):UserHeroStruct {
        var userhero:UserHeroStruct = new UserHeroStruct();

        userhero.id = BytesUtil.readByte2(bytes);
        userhero.potential_1 = bytes.readFloat();
        userhero.potential_2 = bytes.readFloat();
        userhero.level = BytesUtil.readByte1(bytes);
        userhero.exp = BytesUtil.readBytes8(bytes);
        userhero.practice_exp = bytes.readUnsignedInt();
        userhero.practice_exp_max = bytes.readUnsignedInt();
        userhero.soul = BytesUtil.readByte2(bytes);
        userhero.soul_max = BytesUtil.readByte2(bytes);

        userhero.skill_main = bytes.readUnsignedInt();
//先天法宝ID 在D0协议发			
//			userhero.skill_perks = BytesUtil.readByte2(bytes);
        userhero.hp = bytes.readUnsignedInt();

        userhero.talent0_type = BytesUtil.readByte1(bytes);
        userhero.talent0_value = BytesUtil.readByte2(bytes);
        userhero.talent1_type = BytesUtil.readByte1(bytes);
        userhero.talent1_value = BytesUtil.readByte2(bytes);
        userhero.talent2_type = BytesUtil.readByte1(bytes);
        userhero.talent2_value = BytesUtil.readByte2(bytes);
        // 仙丹_力量
        userhero.pills_strength = BytesUtil.readByte2(bytes);
        // 仙丹_敏捷
        userhero.pills_quick = BytesUtil.readByte2(bytes);
        // 仙丹_智力
        userhero.pills_intelligence = BytesUtil.readByte2(bytes);
        // 仙丹_意志
        userhero.pills_willpower = BytesUtil.readByte2(bytes);
        // 仙丹_耐力
        userhero.pills_endurance = BytesUtil.readByte2(bytes);
        // 仙丹_元神力
        userhero.pills_soul = BytesUtil.readByte2(bytes);

        userhero.pills_att = BytesUtil.readByte2(bytes);
        userhero.pills_def = BytesUtil.readByte2(bytes);
        userhero.pills_critical = BytesUtil.readByte2(bytes);
        userhero.pills_pierce = BytesUtil.readByte2(bytes);
        userhero.pills_evade = BytesUtil.readByte2(bytes);
        userhero.pills_counter = BytesUtil.readByte2(bytes);
        userhero.pills_tough = BytesUtil.readByte2(bytes);
        userhero.pills_act = BytesUtil.readByte2(bytes);

        userhero.c_open = BytesUtil.readByte1(bytes);

        var equips:Array = [];
        var i:int;
        equips[11] = BytesUtil.readBigInt(bytes);
        for (i = 0; i < 11; i++) {
            equips[i] = BytesUtil.readBigInt(bytes);
        }
        equips[12] = BytesUtil.readBigInt(bytes);
        equips[13] = BytesUtil.readBigInt(bytes);
        equips[14] = BytesUtil.readBigInt(bytes);
        //仙兵 仙衣 仙器
        equips[15] = BytesUtil.readBigInt(bytes);
        equips[16] = BytesUtil.readBigInt(bytes);
        equips[17] = BytesUtil.readBigInt(bytes);
        //魂器
        equips[18] = BytesUtil.readBigInt(bytes);
        equips[19] = BytesUtil.readBigInt(bytes);
        equips[20] = BytesUtil.readBigInt(bytes);
        equips[21] = BytesUtil.readBigInt(bytes);
        userhero.equips = equips;

        var bloodbits:Array = [];
        for (i = 0; i < 15; i++) {
            bloodbits.push(BytesUtil.readByte1(bytes));
        }
        userhero.bloodbits = bloodbits;

        var skills:Array;
        var count:int;
        var struct:IndexStruct;

        skills = new Array();
        count = BytesUtil.readByte1(bytes);
        for (i = 0; i < count; i++) {
            struct = new IndexStruct();
            struct.index = BytesUtil.readByte1(bytes);
            struct.data = bytes.readUnsignedInt();
            skills.push(struct);
        }
        userhero.skills_in_1 = skills;

        skills = new Array();
        count = BytesUtil.readByte1(bytes);
        for (i = 0; i < count; i++) {
            struct = new IndexStruct();
            struct.index = i;
            struct.data = bytes.readUnsignedInt();
            skills.push(struct.data);
        }
        userhero.skills_in_2 = skills;

        skills = new Array();
        count = BytesUtil.readByte1(bytes);
        for (i = 0; i < count; i++) {
            struct = new IndexStruct();
            struct.index = i;
            struct.data = bytes.readUnsignedInt();
            skills.push(struct);
        }
        userhero.skill_learn = skills;

        skills = new Array();
        count = BytesUtil.readByte1(bytes);
        for (i = 0; i < count; i++) {
            struct = new IndexStruct();
            struct.index = i;
            struct.data = bytes.readUnsignedInt();
            ;
            skills.push(struct);
        }
        userhero.skill_main_learn = skills;

        skills = new Array();
        count = BytesUtil.readByte1(bytes);
        for (i = 0; i < count; i++) {
            struct = new IndexStruct();
            struct.index = i;
            struct.data = BytesUtil.readByte2(bytes);
            skills.push(struct);
        }
        userhero.citta_in = skills;

        skills = new Array();
        count = BytesUtil.readByte1(bytes);
        for (i = 0; i < count; i++) {
            struct = new IndexStruct();
            struct.index = i;
            struct.data = BytesUtil.readByte2(bytes);
            skills.push(struct);
        }
        userhero.citta_learn = skills;

        var buffCount:uint = BytesUtil.readByte1(bytes);
        for (var j:int = 0; j < buffCount; j++) {
            // var buffdata:Object = new Object();
            // buffdata.buffId = BytesUtil.readByte1(bytes);
            // buffdata.timeLeft = bytes.readUnsignedInt();
            // userhero.buffDatas.push(buffdata);
            userhero.buffDatas.push({buffId: BytesUtil.readByte1(bytes), timeLeft: bytes.readUnsignedInt()});
        }
        userhero.hideFashion = Boolean(BytesUtil.readByte1(bytes));
        userhero.roleId = bytes.readUnsignedInt();
        stars_num = bytes.readUnsignedInt();
        userhero.stars_lv = bytes.readByte();
        userhero.stars_val = bytes.readUnsignedInt();
        userhero.stars_gem1 = bytes.readUnsignedShort();
        userhero.stars_gem2 = bytes.readUnsignedShort();
        userhero.stars_gem3 = bytes.readUnsignedShort();
        userhero.stars_gem4 = bytes.readUnsignedShort();
        userhero.stars_gem5 = bytes.readUnsignedShort();
        userhero.stars_gem6 = bytes.readUnsignedShort();
        userhero.stars_gem7 = bytes.readUnsignedShort();
        userhero.stars_gem8 = bytes.readUnsignedShort();
        userhero.stars_rank_cur = bytes.readUnsignedShort();
        userhero.stars_rank_max = bytes.readUnsignedShort();

        var shenTongbits:Array = [];
        for (i = 0; i < 13; i++) {
            shenTongbits.push(BytesUtil.readByte1(bytes));
        }
        userhero.shenTongbits = shenTongbits;
        //宝具	
        for (i = 0; i < 3; i++) {
            userhero.baojuRefine[i] = bytes.readUnsignedByte();
        }
        for (i = 0; i < 3; i++) {
            userhero.baojuRefineBless[i] = bytes.readUnsignedByte();
        }
        //仙器
        for (i = 0; i < 3; i++) {
            userhero.xianRefine[i] = bytes.readUnsignedByte();
        }
        for (i = 0; i < 3; i++) {
            userhero.xianRefineBless[i] = bytes.readUnsignedByte();
        }

        userhero.skillRefineExp = bytes.readUnsignedInt();
        userhero.isCareerUpgrade = bytes.readByte() == 1 ? true : false;

        userhero.potential_2_value = bytes.readUnsignedInt();
        userhero.potential_1_value = bytes.readUnsignedInt();

        for (i = 0; i < 6; i++) {
            userhero.attributeInFsLvVec[i] = BytesUtil.readByte1(bytes);
        }
        /**/
        return userhero;
    }
}
}
