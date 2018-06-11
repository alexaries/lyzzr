package net.data.structs.fight {
import utils.ByteArray;

import net.utils.BytesUtil;

/**
 * 战斗消息解析类
 */
public class FightMsgParser {
    public static var instance:FightMsgParser;

    public function FightMsgParser() {
    }

    public static function getInstace():FightMsgParser {
        if (instance == null) instance = new FightMsgParser();
        return instance;
    }

    public function parseFightMsg(bytes:ByteArray):MsgStruct {
//			try {
        var i:Number;
        var skill:uint;
        var k:uint;
        var n:uint;
        var sobj:Object;
        if (msgStruct) msgStruct = null;
//				trace(bytes, "????:", bytes.bytesAvailable);
        var msgStruct:MsgStruct = new MsgStruct();
        msgStruct.nextFightId = bytes.readUnsignedInt();
        msgStruct.backgroundID = BytesUtil.readByte1(bytes);
        msgStruct.atRankId = BytesUtil.readByte2(bytes);
        msgStruct.defRankId = BytesUtil.readByte2(bytes);
        msgStruct.atLevel = BytesUtil.readByte1(bytes);
        msgStruct.defLevel = BytesUtil.readByte1(bytes);
        msgStruct.atPayerHead = BytesUtil.readByte2(bytes);
        msgStruct.defPlayerHead = BytesUtil.readByte2(bytes);
        msgStruct.atBenchHead = BytesUtil.readByte2(bytes);
        msgStruct.defBenchHead = BytesUtil.readByte2(bytes);
        /*
         msgStruct.atPlayerNums = BytesUtil.readByte1(bytes);
         msgStruct.defPlayerNums = BytesUtil.readByte1(bytes);
         */
        /*
         var playerData:PlayerStruct;
         for(var i:uint = 0;i<msgStruct.atPlayerNums;i++)
         {
         playerData = new PlayerStruct();
         playerData.playerId = BytesUtil.readByte1(bytes);
         playerData.playerName = BytesUtil.readString(bytes)
         trace("@ FightActionMsg: 2222222222 ",playerData.playerId,playerData.playerName)
         msgStruct.atPlayerData.push(playerData)
         }
         for(i = 0;i<msgStruct.defPlayerNums;i++)
         {
         playerData = new PlayerStruct();
         playerData.playerId = BytesUtil.readByte1(bytes);
         playerData.playerName = BytesUtil.readString(bytes)
         trace("@ FightActionMsg: 33333333333 ",playerData.playerId,playerData.playerName)
         msgStruct.defPlayerData.push(playerData)
         }
         */
        msgStruct.atPlayerName = BytesUtil.readUserName(bytes);
        msgStruct.defPlayerName = BytesUtil.readUserName(bytes);
        n = BytesUtil.readByte1(bytes);
        msgStruct.atTeam = [];
        var teamMemberStruct:TeamMemberStruct;
        for (i = 0; i < n; i++) {
            teamMemberStruct = new TeamMemberStruct();
            teamMemberStruct.name = BytesUtil.readUserName(bytes);
            teamMemberStruct.lv = BytesUtil.readByte1(bytes);
            teamMemberStruct.headId = BytesUtil.readByte2(bytes);
            msgStruct.atTeam.push(teamMemberStruct);
        }
        n = BytesUtil.readByte1(bytes);
        msgStruct.defTeam = [];
        for (i = 0; i < n; i++) {
            teamMemberStruct = new TeamMemberStruct();
//					var sss:String = bytes.readUTF();
//					trace("dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd",Hex.fromArray(Hex.toArray(Hex.fromString(sss))));
            teamMemberStruct.name = BytesUtil.readUserName(bytes);
            teamMemberStruct.lv = BytesUtil.readByte1(bytes);
            teamMemberStruct.headId = BytesUtil.readByte2(bytes);
            msgStruct.defTeam.push(teamMemberStruct);
        }
        msgStruct.atHeroNum = BytesUtil.readByte1(bytes);
        msgStruct.atBuff = msgStruct.atHeroNum >> 5;
        msgStruct.atHeroNum &= 0x1f;

        msgStruct.defHeroNum = BytesUtil.readByte1(bytes);
        msgStruct.defBuff = msgStruct.defHeroNum >> 5;
        msgStruct.defHeroNum &= 0x1f;

        var characterData:CharacterStruct;
        for (i = 0; i < 25; i++) {
            characterData = new CharacterStruct();
            msgStruct.atNpcData[i] = characterData;
        }
        for (i = 0; i < msgStruct.atHeroNum; i++) {
            characterData = new CharacterStruct();

            var value:uint = BytesUtil.readByte1(bytes);
            characterData.pos = value & 0x7f;
            var notInField:Boolean = Boolean(value >> 7);

            characterData.name = BytesUtil.readUserName(bytes);
            characterData.sex = BytesUtil.readByte1(bytes);
            characterData.career = characterData.sex >> 4;
            characterData.sex &= 0x0F;
            if (characterData.career == 5 && characterData.sex == 0) { //已飞升的仙宠
                characterData.name = "仙." + characterData.name;
            }
            characterData.level = BytesUtil.readByte1(bytes);
            characterData.protait = BytesUtil.readByte2(bytes);
            characterData.buff = BytesUtil.readByte1(bytes);
            characterData.color = BytesUtil.readByte1(bytes);
            if (characterData.protait == 1049) {//副本组队特殊处理
                characterData.name = "黑无常";
                characterData.color = 0;
            }
            characterData.hp = bytes.readUnsignedInt();
            characterData.addedHpTotal = bytes.readUnsignedInt();
            characterData.aura = BytesUtil.readByte2(bytes);
            characterData.auraMax = BytesUtil.readByte2(bytes);
            characterData.addedAp = bytes.readUnsignedInt();
            characterData.magicAtk = bytes.readUnsignedInt();
            characterData.addedDef = bytes.readUnsignedInt();
            characterData.magicDef = bytes.readUnsignedInt();
            characterData.action = BytesUtil.readByte2(bytes);
            characterData.hitrate = bytes.readShort();
            characterData.evade = bytes.readShort();
            characterData.critical = bytes.readShort();
            characterData.pierce = bytes.readShort();
            characterData.counter = bytes.readShort();
            characterData.tough = bytes.readShort();
            characterData.criticaldmg = bytes.readShort();
            characterData.crtdmg = bytes.readShort();
            n = bytes.readUnsignedInt();
            characterData.s1 = n;
            characterData.s2 = [];
            n = BytesUtil.readByte1(bytes);
            for (k = 0; k < n; k++) {
                sobj = {};
                sobj["pos"] = BytesUtil.readByte1(bytes);
                sobj["id"] = bytes.readUnsignedInt();
                characterData.s2[k] = sobj;
            }
            characterData.s3 = [];
            n = BytesUtil.readByte1(bytes);
            for (k = 0; k < n; k++) {
                characterData.s3[k] = bytes.readUnsignedInt();
            }
            n = bytes.readUnsignedByte();
            for (k = 0; k < n; k++) {
                characterData.insignias[k] = bytes.readUnsignedInt();
                if (characterData.career == 5) {
                    msgStruct.actPetInsignias[k] = characterData.insignias[k];
                }
            }
            trace("atNpcData:" + characterData.name);
            if (!notInField) {
                msgStruct.atNpcData[characterData.pos - 1] = characterData;
            }
            else
                msgStruct.actBenchFighterData = characterData;

            if (characterData.career == 5) {
                msgStruct.isShowKuishao = false;
            }
        }
        // msgStruct.defHeroNum = msgStruct.defHeroNum>>3;
        for (i = 0; i < 25; i++) {
            characterData = new CharacterStruct();
            msgStruct.defNpcData[i] = characterData;
        }
        for (i = 0; i < msgStruct.defHeroNum; i++) {
            characterData = new CharacterStruct();

            value = BytesUtil.readByte1(bytes);
            characterData.pos = value & 0x7f;
            notInField = Boolean(value >> 7);

            characterData.name = BytesUtil.readUserName(bytes);
            characterData.sex = BytesUtil.readByte1(bytes);
            characterData.career = characterData.sex >> 4;
            characterData.sex &= 0x0F;
            characterData.level = BytesUtil.readByte1(bytes);
            characterData.protait = BytesUtil.readByte2(bytes);

            characterData.buff = BytesUtil.readByte1(bytes);
            characterData.color = BytesUtil.readByte1(bytes);
            if (characterData.protait == 1049) {//副本组队特殊处理
                characterData.name = "黑无常";
                characterData.color = 0;
            }
            characterData.hp = bytes.readUnsignedInt();
            characterData.addedHpTotal = bytes.readUnsignedInt();
            characterData.aura = BytesUtil.readByte2(bytes);
            characterData.auraMax = BytesUtil.readByte2(bytes);
            characterData.addedAp = bytes.readUnsignedInt();
            characterData.magicAtk = bytes.readUnsignedInt();
            characterData.addedDef = bytes.readUnsignedInt();
            characterData.magicDef = bytes.readUnsignedInt();
            characterData.action = BytesUtil.readByte2(bytes);
            characterData.hitrate = bytes.readShort();
            characterData.evade = bytes.readShort();
            characterData.critical = bytes.readShort();
            characterData.pierce = bytes.readShort();
            characterData.counter = bytes.readShort();
            characterData.tough = bytes.readShort();
            characterData.criticaldmg = bytes.readShort();
            characterData.crtdmg = bytes.readShort();
            n = bytes.readUnsignedInt();
            characterData.s1 = n;
            characterData.s2 = [];
            n = BytesUtil.readByte1(bytes);
            for (k = 0; k < n; k++) {
                sobj = {};
                sobj["pos"] = BytesUtil.readByte1(bytes);
                sobj["id"] = bytes.readUnsignedInt();
                characterData.s2[k] = sobj;
            }
            characterData.s3 = [];
            n = BytesUtil.readByte1(bytes);
            for (k = 0; k < n; k++) {
                characterData.s3[k] = bytes.readUnsignedInt();
            }
            n = bytes.readUnsignedByte();
            for (k = 0; k < n; k++) {
                characterData.insignias[k] = bytes.readUnsignedInt();
                ;
                if (characterData.career == 5) {
                    msgStruct.defPetInsignias[k] = characterData.insignias[k];
                }
            }
            trace("defNpcData:" + characterData.name);
            if (!notInField) {
                msgStruct.defNpcData[characterData.pos - 1] = characterData;
            }
            else
                msgStruct.defBenchFighterData = characterData;
            if (characterData.career == 5) {
                msgStruct.isShowKuishao = false;
            }
        }
        //添加攻击方宠物符文
        n = bytes.readUnsignedByte();
        for (k = 0; k < n; k++) {
            msgStruct.actPetInsignias[k] = bytes.readUnsignedInt();
        }
        //添加防御方宠物符文
        n = bytes.readUnsignedByte();
        for (k = 0; k < n; k++) {
            msgStruct.defPetInsignias[k] = bytes.readUnsignedInt();
        }
        msgStruct.actPetIsFeisheng = Boolean(BytesUtil.readByte1(bytes));
        msgStruct.defPetIsFeisheng = Boolean(BytesUtil.readByte1(bytes));

        for (k = 0; k < 7; k++) {
            var itemid:int = BytesUtil.readByte2(bytes)//;
            msgStruct.actKuishaoVec[k] = itemid;
        }
        for (k = 0; k < 7; k++) {
            itemid = BytesUtil.readByte2(bytes);//21503
            msgStruct.defKuishaoVec[k] = itemid;
        }
        msgStruct.actNums = bytes.readUnsignedInt();
//				trace("**********", msgStruct.actNums);
        for (i = 0; i < msgStruct.actNums; i++) {
            trace("================动作数=====================:", i);
            var actionData:ActionStruct = new ActionStruct();
            actionData.actSide = BytesUtil.readByte1(bytes);
            actionData.actType = BytesUtil.readByte1(bytes);
            actionData.additionProperty = bytes.readUnsignedInt();
            actionData.actResult = BytesUtil.readByte1(bytes);
            actionData.atGrid = BytesUtil.readByte1(bytes);
            actionData.actPlayerNums = BytesUtil.readByte1(bytes);
            if ((actionData.actType & 0x80) == 0x80)
                actionData.critAt = 1;
            if ((actionData.actType & 0x40) == 0x40)
                actionData.prcAt = 1;
            if ((actionData.actType & 0x20) == 0x20)
                actionData.multiAt = 1;
//					trace("@ FightActionMsg: 99999999999 ", actionData.actSide, actionData.actType, actionData.additionProperty, actionData.actResult, actionData.atGrid, actionData.actPlayerNums);
//					trace("atK:------------", actionData.actPlayerNums);
            for (var j:uint = 0; j < actionData.actPlayerNums; j++) {
                var attackerData:AttackerStruct = new AttackerStruct();
                attackerData.actPlayerId = BytesUtil.readByte1(bytes);
                attackerData.atType = BytesUtil.readByte1(bytes);
                actionData.actPlayerList.push(attackerData);
//						trace("@ FightActionMsg: 000000000000 ", attackerData.actPlayerId, attackerData.atType);
                var atCharacter:CharacterStruct;
                if (actionData.actSide == 0) {
                    if ( (attackerData.actPlayerId / 25) <0.001)
                        atCharacter = msgStruct.getAtCharacter(attackerData.actPlayerId % 25);
                    else
                        atCharacter = msgStruct.getDefCharacter(attackerData.actPlayerId % 25);
                } else {
                    if ( (attackerData.actPlayerId / 25) <0.001)
                        atCharacter = msgStruct.getDefCharacter(attackerData.actPlayerId % 25);
                    else
                        atCharacter = msgStruct.getAtCharacter(attackerData.actPlayerId % 25);
                }
                if (atCharacter)
                    attackerData.playerName = atCharacter.name;
            }
            actionData.defPlayerNums = BytesUtil.readByte1(bytes);
//					trace("def:------------", actionData.defPlayerNums);
            for (j = 0; j < actionData.defPlayerNums; j++) {
                var effectData:EffectStruct = new EffectStruct();
                effectData.playerId = BytesUtil.readByte1(bytes);
                effectData.effectType = BytesUtil.readByte1(bytes);
                effectData.effectType1 = BytesUtil.readByte1(bytes);

//						effectData.effectValue = BytesUtil.readByte2(bytes);
                effectData.effectValue = bytes.readUnsignedInt();
                effectData.effectedValue = bytes.readUnsignedInt();
                effectData.damageType = BytesUtil.readByte1(bytes);

//						trace(effectData.effectType);
                if (effectData.effectType == 143 || effectData.effectType == 144) {
//							trace(123);
                }

                if ((effectData.effectType1 & 0x80) == 0x80) {
                    effectData.repel = 1;
                    if ((effectData.effectType1 & 0x40) == 0x40)
                        effectData.repelCrit = 1;
                    if ((effectData.effectType1 & 0x20) == 0x20)
                        effectData.repelPrc = 1;
                    if ((effectData.effectType1 & 0x10) == 0x10)
                        effectData.repelDodge = 1;
                }
                if (effectData.effectType == 8) {
//							effectData.rhp = BytesUtil.readByte2(bytes);
                    effectData.rhp = bytes.readUnsignedInt();
                    effectData.hpLeft = bytes.readUnsignedInt();
                }
                if (effectData.effectType == 159 || effectData.effectType == 160 || effectData.effectType == 163 || effectData.effectType == 164) {
                    effectData.mhp = bytes.readUnsignedInt();
                    effectData.hpLeft = bytes.readUnsignedInt();
                }
                if (effectData.effectType == 169) {
                    effectData.f_name = bytes.readUTF();
                }

                if (effectData.repel) {
//							effectData.repelDamage = BytesUtil.readByte2(bytes);
                    effectData.repelDamage = bytes.readUnsignedInt();
                    effectData.remainHp = bytes.readUnsignedInt();
                }
                // if (effectData.effectType1 == 8) {
                // effectData.rhp = BytesUtil.readByte2(bytes);
                // effectData.hpLeft = bytes.readUnsignedInt();
                // }
                // effectData.effectType1 &= 0x0F;
                // if (effectData.effectType == 5) {
                // effectData.repelDamage = BytesUtil.readByte2(bytes);
                // effectData.remainHp = bytes.readUnsignedInt();
                // }
                actionData.defPlayerList.push(effectData);
//						trace("@ FightActionMsg: +++++++++++++ ", effectData.playerId, effectData.effectType, effectData.effectValue, effectData.effectedValue);
                var defCharacter:CharacterStruct;
                if (actionData.actSide == 0) {
                    if ( Math.floor(effectData.playerId / 25) ==0)
                        defCharacter = msgStruct.getDefCharacter(effectData.playerId % 25);
                    else
                        defCharacter = msgStruct.getAtCharacter(effectData.playerId % 25);
                } else {
                    if ( Math.floor(effectData.playerId / 25) ==0)
                        defCharacter = msgStruct.getAtCharacter(effectData.playerId % 25);
                    else
                        defCharacter = msgStruct.getDefCharacter(effectData.playerId % 25);
                }
                if (defCharacter)
                    effectData.playerName = defCharacter.name;
            }
            actionData.stateChangeNums = BytesUtil.readByte1(bytes);
//					trace("status:------------", actionData.stateChangeNums);
            for (j = 0; j < actionData.stateChangeNums; j++) {
                var statusData:StatusStruct = new StatusStruct();
                statusData.charID = BytesUtil.readByte1(bytes);
                if (statusData.charID < 50) {
                    statusData.skillID = bytes.readUnsignedInt();
                    statusData.type = BytesUtil.readByte1(bytes);
                    //						    statusData.value = BytesUtil.readByte2(bytes);
                    statusData.value = bytes.readInt();
                    if ([210, 211, 212, 213].indexOf(statusData.type) != -1) {
//                                trace(statusData.charID);
                    }
                    actionData.stateChangeList.push(statusData);
                } else if (statusData.charID == 51) {
                    statusData.skillID = bytes.readUnsignedInt();
                    statusData.type = BytesUtil.readByte1(bytes);
                    actionData.round = bytes.readInt();
//                            trace("round.....===================================");
//                            trace(actionData.round ,"..........");
                }
//						trace("type:" + statusData.type)
                if (["11", "10", "13", "9", "7", "6"].indexOf(statusData.type) != -1) {
//							trace(123);
                }
            }
            msgStruct.actData.push(actionData);
            trace("动作结束");
        }
        msgStruct.result = BytesUtil.readByte1(bytes);
//			} catch(e : *) {
//				trace(e,"========>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//			}
        return msgStruct;
    }
}
}