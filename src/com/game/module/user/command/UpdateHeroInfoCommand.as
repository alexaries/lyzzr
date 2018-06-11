package com.game.module.user.command {

import com.game.common.mvc.BaseCommand;

import net.data.structs.user.IndexStruct;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class UpdateHeroInfoCommand extends BaseCommand implements ICommand {

//    private var skProxy:SkillProxy;
//    private var isLevelUP:Boolean;
    override public function execute(notification:INotification):void {
//        skProxy = facade.retrieveProxy(SkillProxy.NAME) as SkillProxy;
//        var powerProxy:PowerProxy = facade.retrieveProxy(PowerProxy.NAME) as PowerProxy;
//        var name:String = notification.getName();
//        var body:Object = notification.getBody();
//        var msg:ChangeEQMsg = body as ChangeEQMsg;
//        trace("0xD0 在处理====")
//
//        var changeList:Array = msg.changeList;
//        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
//        var heroProxy:HeroProxy = facade.retrieveProxy(HeroProxy.NAME) as HeroProxy;
//        var hero:HeroVO = ArrayUtil.find(userProxy.userData.heros, function (v:HeroVO) {
//            return v.id == msg.fighterId;
//        });
//        if (hero) {
//            var dic:Dictionary;
//
//            if (heroProxy.eqOnHeroDic) {
//                dic = heroProxy.eqOnHeroDic.get(hero.id);
//            }
//            var needRefresh:Boolean = false;
////			hero.hunqiEquipDic = new Dictionary(true);
//            for (var i:int = 0; i < changeList.length; i++) {
//                var changeDataStruct:ChangeDataStruct = changeList[i];
//
//                var packItemVo:PackVO;
//
//                // trace("hero:"+hero.id+"||changeDataStruct.field" + changeDataStruct.field );
//                if (changeDataStruct.eqInfoStruct) {
//                    // trace("hero:"+hero.id+"|| changeDataStruct.eqInfoStruct.flowId" + changeDataStruct.eqInfoStruct.flowId);
//                }
//                if ((changeDataStruct.field >= 0x20 && changeDataStruct.field < 0x29) || (changeDataStruct.field >= 0x0a && changeDataStruct.field <= 0x0c || changeDataStruct.field == 0x1f || changeDataStruct.field == 0x70 || changeDataStruct.field >= 0x60 && changeDataStruct.field <= 0x62) || [0x66, 0x67, 0x68].indexOf(changeDataStruct.field) != -1 || (changeDataStruct.field >= 0x71 && changeDataStruct.field <= 0x74)) {
//                   // isLevelUP = false;
//                    // 装备 模块
//                    if (changeDataStruct.eqInfoStruct.flowId != 0) {
//                        // 身上有装备
//                        var tempStaticVO:GoodsVO = ConfigLocator.getInstance().goodsList.get(changeDataStruct.eqInfoStruct.eqId);
//                        if (!tempStaticVO)
//                            continue;
//                        var tempPropsVO:GoodsPropsVO = ConfigLocator.getInstance().goodsPropList.get(tempStaticVO.propId);
//
//                        packItemVo = new PackVO();
//                        packItemVo.name = tempStaticVO.name;
//                        packItemVo.type = tempStaticVO.type;
//
//                        packItemVo.level = tempStaticVO.level;
//                        packItemVo.color = tempStaticVO.color;
//                        packItemVo.stackLimit = tempStaticVO.stackLimit;
//                        packItemVo.price = tempStaticVO.price;
//                        packItemVo.binding = changeDataStruct.eqInfoStruct.binding;
//                        packItemVo.useable = tempStaticVO.useable;
//                        packItemVo.propId = tempStaticVO.propId;
//                        packItemVo.description = tempStaticVO.description;
//                        packItemVo.imgID = tempStaticVO.imgID;
//                        packItemVo.career = tempStaticVO.career;
//                        packItemVo.vlevel = tempStaticVO.vlevel;
//                        packItemVo.flowId = changeDataStruct.eqInfoStruct.flowId;
//                        packItemVo.id = changeDataStruct.eqInfoStruct.eqId;
//                        packItemVo.enhanceLevel = changeDataStruct.eqInfoStruct.enhanceLevel;
//                        packItemVo.boreNums = changeDataStruct.eqInfoStruct.boreNums;
//                        packItemVo.jewelsId = changeDataStruct.eqInfoStruct.jewelIds;
//                        packItemVo.exNums = changeDataStruct.eqInfoStruct.exNums;
//                        packItemVo.maxLevel = changeDataStruct.eqInfoStruct.maxLevel;
//                        packItemVo.currentExp = changeDataStruct.eqInfoStruct.currentExp;
//                        packItemVo.soulLevel = changeDataStruct.eqInfoStruct.soulLevel;
//                        packItemVo.soulFormula = changeDataStruct.eqInfoStruct.soulFormula;
//                        packItemVo.isTongLing = changeDataStruct.eqInfoStruct.isTongLing;
//                        packItemVo.lbColor = changeDataStruct.eqInfoStruct.lbColor;
//                        if (packItemVo.lbColor != 0)
//                            packItemVo.color = packItemVo.lbColor;
//                        packItemVo.lingbaoAttr = changeDataStruct.eqInfoStruct.lingbaoAttr;
//                        packItemVo.skill1 = changeDataStruct.eqInfoStruct.skill1;
//                        packItemVo.factor1 = changeDataStruct.eqInfoStruct.factor1;
//                        packItemVo.skill2 = changeDataStruct.eqInfoStruct.skill2;
//                        packItemVo.factor2 = changeDataStruct.eqInfoStruct.factor2;
//
//
//                        packItemVo.critDef = changeDataStruct.eqInfoStruct.critDef;
//                        packItemVo.pierceDef = changeDataStruct.eqInfoStruct.pierceDef;
//                        packItemVo.repelDef = changeDataStruct.eqInfoStruct.repelDef;
//                        packItemVo.ap = changeDataStruct.eqInfoStruct.ap;
//
//                        packItemVo.diaowenNum = changeDataStruct.eqInfoStruct.diaowenNum;
//                        packItemVo.diaowenIds = changeDataStruct.eqInfoStruct.diaowenIds;
//                        var dic1:Dictionary = ConfigLocator.getInstance().trumpExpDic;
//                        var temp:int = packItemVo.currentExp;
//                        for (var j:int = 1; j < 13; j++) {
//                            temp -= dic1.get(j)[packItemVo.color - 2];
//                            if (temp < 0) {
//                                temp += dic1.get(j)[packItemVo.color - 2];
//                                break;
//                            }
//                        }
//                        packItemVo.levelExp = temp;
//                        packItemVo.currentLevel = j - 1;
//                        packItemVo.refresh(hero);
//
//                        packItemVo.eqType = tempPropsVO.apValue != 0 ? 0 : 1;
//                        packItemVo.eqPropValue = tempPropsVO.apValue != 0 ? tempPropsVO.apValue : tempPropsVO.defValue;
//                        packItemVo.topProps = [tempPropsVO.power, tempPropsVO.inelligence, tempPropsVO.strength, tempPropsVO.agility];
//                        packItemVo.addedProps = changeDataStruct.eqInfoStruct.exProps;
//                        packItemVo.skillid = (tempPropsVO.skills) as int;
//                        // packItemVo.skillid = parseInt(tempPropsVO.skills);
//
//                        if (!dic)
//                            dic = new Dictionary();
//
//                        if (changeDataStruct.field >= 0x71 && changeDataStruct.field <= 0x74)
//                            hero.hunqiEquipDic.set(changeDataStruct.field, packItemVo);
//                        else
//                            dic.set(packItemVo.flowId, packItemVo);
//                        hero.equipDic.set(packItemVo.flowId, packItemVo)
//                    }
//                }
//                switch (changeDataStruct.field) {
//                    case 0x01:
//                        hero.life_value = changeDataStruct.data;
//                        break;
//                    case 0x02:
//                        if (hero.isUserSelf && changeDataStruct.data > hero.level) {
//                            hero.level = changeDataStruct.data;
//                            // dispatch(new NotiEvent(NotiEvent.MUSIC_EFFECT, SoundCommand.EFFECT_3));
//                            dispatch(new NotiEvent(NotiEvent.USER_LEVEL_UPDATE, {
//                                path: 'LevelUp',
//                                autoStop: true,
//                                level: changeDataStruct.data
//                            }));
//                            if (StaticConfig.isNew && hero.level < 31) {
//                            }
//                        }
//                        isLevelUP = true
//                        hero.level = changeDataStruct.data;
//                        // this.sendNotification(NotificationConst.ANNEAL_REFRESH);
//                        break;
//                    case 0x03:
//                        hero.setHeroTotalExp(changeDataStruct.exp);
//                        break;
//                    case 0x04:
//                        hero.potential_1 = changeDataStruct.data * 0.01;
//                        break;
//                    case 0x05:
//                        hero.potential_2 = changeDataStruct.data * 0.01;
//                        break;
//                    case 0x06:
//                        hero.p_exp = changeDataStruct.data;
//                        skProxy.redPointSkill(1000,2);
//                        break;
//                    case 0x07:
//                        hero.p_exp_max = changeDataStruct.data;
//                        break;
//                    case 0x08:
//                        hero._soul = changeDataStruct.data;
//                        break;
//                    case 0x09:
//                        hero.soul_max_base = changeDataStruct.data;
//                        break;
//                    case 0x0a://法宝1
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.trump1) {
//                            dic.remove(hero.trump1);
//                            hero.equipDic.remove(hero.trump1)
//                        }
//                        hero.trump1 = changeDataStruct.eqInfoStruct.flowId;
//
//                        TDManager.addEvent(TDItem.peidaifabao, {
//                            heroId: hero.id + "",
//                            fabaoId: hero.trump1 + ""
//                        }, "佩戴法宝");
//                        break;
//                    case 0x0b://法宝2
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.trump2) {
//                            dic.remove(hero.trump2);
//                            hero.equipDic.remove(hero.trump2)
//                        }
//                        hero.trump2 = changeDataStruct.eqInfoStruct.flowId;
//
//                        TDManager.addEvent(TDItem.peidaifabao, {
//                            heroId: hero.id + "",
//                            fabaoId: hero.trump2 + ""
//                        }, "佩戴法宝");
//                        break;
//                    case 0x0c://法宝3
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.trump3) {
//                            dic.remove(hero.trump3);
//                            hero.equipDic.remove(hero.trump3)
//                        }
//                        hero.trump3 = changeDataStruct.eqInfoStruct.flowId;
//
//                        TDManager.addEvent(TDItem.peidaifabao, {
//                            heroId: hero.id + "",
//                            fabaoId: hero.trump3 + ""
//                        }, "佩戴法宝");
//                        break;
//                    case 0x1f://光环法宝
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.trump_halo) {
//                            dic.remove(hero.trump_halo);
//                            hero.equipDic.remove(hero.trump_halo)
//                        }
//                        hero.trump_halo = changeDataStruct.eqInfoStruct.flowId;
//
//                        TDManager.addEvent(TDItem.peidaifabao, {
//                            heroId: hero.id + "",
//                            fabaoId: hero.trump_halo + ""
//                        }, "佩戴法宝");
//                        break;
//                    case 0x70://先天法宝
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.trump5) {
//                            dic.remove(hero.trump5);
//                            hero.equipDic.remove(hero.trump5)
//                        }
//                        hero.trump5 = changeDataStruct.eqInfoStruct.flowId;
//                        hero.perksSkill = changeDataStruct.data;
//
//                        TDManager.addEvent(TDItem.peidaifabao, {
//                            heroId: hero.id + "",
//                            fabaoId: hero.trump5 + ""
//                        }, "佩戴法宝");
//                        break;
//                    case 0x0d://天赋属性变更 (0x46)
//                        hero.talent0_type = changeDataStruct.otherData[0][0];
//                        hero.talent0_value = changeDataStruct.otherData[0][1];
//                        hero.talent1_type = changeDataStruct.otherData[1][0];
//                        hero.talent1_value = changeDataStruct.otherData[1][1];
//                        hero.talent2_type = changeDataStruct.otherData[2][0];
//                        hero.talent2_value = changeDataStruct.otherData[2][1];
//                        break;
//                    case 0x10:
//                        hero.pills_strength = changeDataStruct.data;
//                        break;
//                    case 0x11:
//                        hero.pills_quick = changeDataStruct.data;
//                        break;
//                    case 0x12:
//                        hero.pills_intelligence = changeDataStruct.data;
//                        break;
//                    case 0x13:
//                        hero.pills_willpower = changeDataStruct.data;
//                        break;
//                    case 0x14:
//                        hero.pills_endurance = changeDataStruct.data;
//                        break;
//                    case 0x15:
//                        hero.pills_soul = changeDataStruct.data;
//                        break;
//                    case 0x16:
//                        hero.pills_att = changeDataStruct.data;
//                        break;
//                    case 0x17:
//                        hero.pills_def = changeDataStruct.data;
//                        break;
//                    case 0x18:
//                        hero.pills_critical = changeDataStruct.data;
//                        break;
//                    case 0x19:
//                        hero.pills_pierce = changeDataStruct.data;
//                        break;
//                    case 0x1a:
//                        hero.pills_evade = changeDataStruct.data;
//                        break;
//                    case 0x1b:
//                        hero.pills_counter = changeDataStruct.data;
//                        break;
//                    case 0x1c:
//                        hero.pills_tough = changeDataStruct.data;
//                        break;
//                    case 0x1d:
//                        hero.pills_act = changeDataStruct.data;
//                        break;
//                    case 0x30:
//                        hero.generalSkill = changeDataStruct.data;
//                        break;
//                    case 0x20:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.fashion) {
//                            dic.remove(hero.fashion);
//                            hero.equipDic.remove(hero.fashion)
//                        }
//                        hero.fashion = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x21:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.weapon) {
//                            dic.remove(hero.weapon);
//                            hero.equipDic.remove(hero.weapon)
//                        }
//                        hero.weapon = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x22:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.helmet) {
//                            dic.remove(hero.helmet);
//                            hero.equipDic.remove(hero.helmet)
//                        }
//                        hero.helmet = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x23:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.guard) {
//                            dic.remove(hero.guard);
//                            hero.equipDic.remove(hero.guard)
//                        }
//                        hero.guard = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x24:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.shoulderPad) {
//                            dic.remove(hero.shoulderPad);
//                            hero.equipDic.remove(hero.shoulderPad)
//                        }
//                        hero.shoulderPad = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x25:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.belt) {
//                            dic.remove(hero.belt);
//                            hero.equipDic.remove(hero.belt)
//                        }
//                        hero.belt = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x26:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.boots) {
//                            dic.remove(hero.boots);
//                            hero.equipDic.remove(hero.boots)
//                        }
//                        hero.boots = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x27:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.necklace) {
//                            dic.remove(hero.necklace);
//                            hero.equipDic.remove(hero.necklace)
//                        }
//                        hero.necklace = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x28:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.ring) {
//                            dic.remove(hero.ring);
//                            hero.equipDic.remove(hero.ring)
//                        }
//                        hero.ring = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x29:
//                        // 查找
//                        hero.bloodbits[changeDataStruct.otherData[0]] = changeDataStruct.otherData[1];
//                        dispatch(new NotiEvent(NotiEvent.BlOODCHANGE));//wq
//
//                        //上阵散仙经脉等级统计
//                        var jingmaiLv:int = 0;
//                        hero.bloodbits.length>0&&hero.bloodbits.forEach(function (i:int) {
//                            jingmaiLv += i;
//                        });
//                        TDManager.addEvent(TDItem.shangzhensanxianjingmai, {
//                            heroId: hero.id + "",
//                            jmLevel: jingmaiLv + ""
//                        }, "经脉");
//
//                        break;
//                    case 0x66:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.xianbing) {
//                            dic.remove(hero.xianbing);
//                            hero.equipDic.remove(hero.xianbing)
//                        }
//                        hero.xianbing = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x67:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.xianyi) {
//                            dic.remove(hero.xianyi);
//                            hero.equipDic.remove(hero.xianyi)
//                        }
//                        hero.xianyi = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x68:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.xianqi) {
//                            dic.remove(hero.xianqi)
//                            hero.equipDic.remove(hero.xianqi);
//                            hero.xianSkill = 0;
//                        }
//                        hero.xianqi = changeDataStruct.eqInfoStruct.flowId;
//                        break;
//                    case 0x2a:
//                        hero.skills_select_active = changeSkillData(changeDataStruct.otherData, hero.skills_select_active);
//                        break;
//                    case 0x2b:
//                        hero.skills_learn = changeActionSkillData(changeDataStruct.otherData, hero.skills_learn);
//                        hero.skills_select_active = changeActionSkillData([3, changeDataStruct.otherData[1]], hero.skills_select_active);
//                        break;
//                    case 0x2c:
//                        hero.cittas_select = changeActionSkillData(changeDataStruct.otherData, hero.cittas_select);
//                        // 佩戴和升级返回
//
//                        //佩戴心法X散仙数量
//                        TDManager.addEvent(TDItem.peidaixinfa, {xinfas: hero.cittas_select}, "佩戴法宝");
//                        break;
//                    case 0x2d:
//                        hero.cittas_learn = changeActionSkillData(changeDataStruct.otherData, hero.cittas_learn);
//                        dispatch(new NotiEvent(NotiEvent.SKILL_LEATH_CHANGE, ""));  //学习和升级返回
//                        break;
//                    case 0x2e:
//                        hero.skills_select_passive = changePassiveSkillData(changeDataStruct.otherData, hero.skills_select_passive);
//                        break;
//                    case 0x30:
//                        hero.generalSkill = changeDataStruct.data;
//                        break;
//                    case 0x31:
//                        hero.generalSkills_learn = changeActionSkillData(changeDataStruct.otherData, hero.generalSkills_learn);
//                        var dataArr:Array = changeDataStruct.otherData;
//                        var flag:int = dataArr[0];
//                        var data:int = dataArr[1];
//                        // 如果 列表中卸下某个技能  顺便卸下无双
//                        if (flag == 2 && Math.floor(hero.generalSkill / 100) == Math.floor(data / 100)) {
//                            hero.generalSkill = 0;
//                        }
//                        break;
//                    case 0x32:
//                        hero.nums_cittaOpen = changeDataStruct.data;
//                        break;
//                    case 0x33:
//                        //hero.hideFashion = Boolean(changeDataStruct.data) ;
//                        hero.hideFashion = Boolean(changeDataStruct.otherData[0]);
//                        hero.roleId = changeDataStruct.otherData[1];
//                        break;
//                    case 0x60:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.baoju_ling) {
//                            dic.remove(hero.baoju_ling);
//                            hero.equipDic.remove(hero.baoju_ling)
//                        }
//                        hero.baoju_ling = changeDataStruct.eqInfoStruct.flowId;
//
//                        //
//                        if (hero.baoju_ling && hero.baojuRefine[0] > 0) {
//                            packItemVo.baojuChange = true;
//                            packItemVo.refresh(hero);
//                        }
//
//                        break;
//                    case 0x61:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.baoju_wu) {
//                            dic.remove(hero.baoju_wu);
//                            hero.equipDic.remove(hero.baoju_wu)
//                        }
//                        hero.baoju_wu = changeDataStruct.eqInfoStruct.flowId;
//
//                        if (hero.baoju_wu && hero.baojuRefine[1] > 0) {
//                            packItemVo.baojuChange = true;
//                            packItemVo.refresh(hero);
//                        }
//                        break;
//                    case 0x62:
//                        if (!changeDataStruct.eqInfoStruct.flowId || changeDataStruct.eqInfoStruct.flowId != hero.baoju_xin) {
//                            dic.remove(hero.baoju_xin);
//                            hero.equipDic.remove(hero.baoju_xin)
//                        }
//                        hero.baoju_xin = changeDataStruct.eqInfoStruct.flowId;
//
//                        if (hero.baoju_xin && hero.baojuRefine[2] > 0) {
//                            packItemVo.baojuChange = true;
//                            packItemVo.refresh(hero);
//                        }
//                        break;
//                    case 0x34:
//                        hero.shenTongbits[changeDataStruct.otherData[0]] = changeDataStruct.otherData[1];
//                        break;
//                    case 0x63:
//                    case 0x64:
//                    case 0x65:
//                        var lingShiVo:LingShiStruct = changeDataStruct.lingShiStruct;
//                        if (lingShiVo.flowId == 0) {
//                            if (changeDataStruct.field == 0x63) {
//                                hero.lingShi1 = 0;
//                            } else if (changeDataStruct.field == 0x64) {
//                                hero.lingShi2 = 0;
//                            } else if (changeDataStruct.field == 0x65) {
//                                hero.lingShi3 = 0;
//                            }
//                            hero.lingShiEquipDic.remove(changeDataStruct.field);
//                        } else {
//                            hero.lingShiEquipDic.set(changeDataStruct.field, lingShiVo);
//                        }
//                        break;
//                    case 0x71:    //魂器
//                    case 0x72:
//                    case 0x73:
//                    case 0x74:
//                        if (changeDataStruct.eqInfoStruct.flowId == 0) {
//                            if (changeDataStruct.field == 0x71)
//                                hero.hunqi1 = 0;
//                            else if (changeDataStruct.field == 0x72)
//                                hero.hunqi2 = 0;
//                            else if (changeDataStruct.field == 0x73)
//                                hero.hunqi3 = 0;
//                            else if (changeDataStruct.field == 0x74)
//                                hero.hunqi4 = 0;
//                            hero.hunqiEquipDic.remove(changeDataStruct.field);
//                        }
//                        break;
//                    case 0x75:
//                        hero.careerUpgrade = changeDataStruct.isFeisheng;
//                        break;
//                    case 0x76:
//                        hero.attributeInFsLvVec = changeDataStruct.attributeInFsLvVec;
//                        break;
//                    case 0x77:  //潜力
//                        hero.potential_1_value = changeDataStruct.data
//                        break;
//                    case 0x78: //资质
//                        hero.potential_2_value = changeDataStruct.data;
//                        break;
//                    default:
//                        var vo:StatesVO = UserUtil.getStateVO(changeDataStruct.field, changeDataStruct.data, true);
//                        if (vo && hero.isUserSelf)
//                            dispatch(new NotiEvent(NotiEvent.BUFFER_CHANGE, vo));
//                        else {
//                            if (vo) {
//                                statesChange(hero, vo);
//                                //dispatch(new HeroServiceEvent(HeroServiceEvent.HERO_LIST_UPDATE));
//                            }
//                        }
//                        break;
//                }
//                if (changeDataStruct.field < 0x80 && [0x01, 0x06, 0x07, 0x29,  0x2d, 0x33, 0x32, 0x31].indexOf(changeDataStruct.field) == -1) {
//                    needRefresh = true;
//                }
//            }
//            if (hero.xianqi != 0) {
//                var packvo:PackVO = dic.get(hero.xianqi) as PackVO;
//                if (packvo) {
//                    hero.xianSkill = packvo.skillid + packvo.enhanceLevel;
//                }
//            }
//            if (needRefresh) {
//                facade.notifyObservers(new NotiEvent(NotiEvent.HERO_ADD_PRO_REFRESH, hero))
//                if(isLevelUP){
//                    Laya.timer.once(1500,Laya.stage,function():void{
//                        facade.notifyObservers(new NotiEvent(NotiEvent.REFRESH_POWER, hero))
//                    })
//                }else{
//                    facade.notifyObservers(new NotiEvent(NotiEvent.REFRESH_POWER, hero))
//                }
//
//                // powerProxy.cachePowerVO(hero)
//            }
//            if (hero.isUserSelf) {
//                userProxy.userVO.level = hero.level;
//                dispatch(new NotiEvent(NotiEvent.USER_LEVEL_UPDATE))
//            }
//            // 设置 当前  武将的装备
//            if (heroProxy.eqOnHeroDic) {
//                heroProxy.eqOnHeroDic.set(hero.id, dic);
//            }
//            //PowerProxy.instance.cachePowerVO(hero);
//        }
//        if (msg.fighterId && userProxy.toUpdateHeros.indexOf(msg.fighterId) == -1)
//            userProxy.toUpdateHeros.push(msg.fighterId);
//
//
//        //todo
//        userProxy.delayUpdateHero();
//        // clearTimeout(toDelayUint);
//        //toDelayUint = setTimeout(delayUpdateHero, 200);
    }

//    private function statesChange(herovo:HeroVO, obj:StatesVO):void {
//        var isInArr:Boolean = false;
//        var isRightTime:Boolean = true;
//        var vo:StatesVO;
//        if (!herovo.buffArr)
//            herovo.buffArr = new Array();
//        for (var j:uint; j < herovo.buffArr.length; j++) {
//            vo = herovo.buffArr[j];
//            if (vo.id == obj.id) {
//                isInArr = true;
//                if (vo.remain != obj.remain) {
//                    vo.remain = obj.remain;
//                    if (obj.remain <= 0) {
//                        if (herovo.buffArr.length == 1) herovo.buffArr = [];
//                        else herovo.buffArr.splice(j, 1);
//                    } else
//                        isRightTime = false;
//                }
//                break;
//            }
//        }
//
//        if (isInArr == false && isRightTime == true) {
//            vo = new StatesVO();
//            vo.id = obj.id;
//            vo.remain = obj.remain;
//            herovo.buffArr.push(vo);
//        }
//    }

    private function changePassiveSkillData(dataArr:Array, arr:Array):Array {
        var flag:int = dataArr[0];
        var data:int = dataArr[1];
        var i:int;

        var len:int = arr.length;

        switch (flag) {
            case 1:
                if (data != 0)
                    arr.push(data);
                break;
            case 2:
                for (i = 0; i < len; i++) {
                    if ((arr[i]) == data) {
                        arr.splice(i, 1);
                        break;
                    }
                }
                break;
            case 3:
                for (i = 0; i < len; i++) {
                    if (Math.floor(arr[i] / 100) == Math.floor(data / 100)) {
                        arr.splice(i, 1, data);
                        break;
                    }
                }
                break;
        }
        return arr.concat();
    }


    private function changeActionSkillData(dataArr:Array, arr:Array):Array {
        var flag:int = dataArr[0];
        var data:int = dataArr[1];
        var item:IndexStruct;
        var i:int;

        var len:int = arr.length;

        switch (flag) {
            case 1:
                item = new IndexStruct();
                item.data = data;
                if (data != 0)
                    arr.push(item);
                break;
            case 2:
                for (i = 0; i < len; i++) {
                    item = arr[i] as IndexStruct;
                    if (item.data == data) {
                        arr.splice(i, 1);
                        break;
                    }
                }
                break;
            case 3:
                for (i = 0; i < len; i++) {
                    var iii:IndexStruct = new IndexStruct();
                    item = arr[i] as IndexStruct;
                    if (Math.floor(item.data / 100) == Math.floor(data / 100)) {
                        iii.index = item.index;
                        iii.data = data;
                        arr.splice(i, 1, iii);
                        break;
                    }
                }
                break;
        }
        return arr.concat();
    }

    private function changeSkillData(dataArr:Array, arr:Array):Array {
        var index:int = dataArr[0];
        var data:int = dataArr[1];
        if (!arr)
            arr = [];
        var len:int = arr.length;
        var hasData:Boolean = false;
        var item:IndexStruct;
        for (var i:int = 0; i < len; i++) {
            item = arr[i] as IndexStruct;
            if (item.index == index) {
                item.data = data;
                hasData = true;
                if (data == 0) {
                    arr.splice(i, 1);
                } else
                    item = item.clone();
                break;
            }
        }
        if (!hasData) {
            item = new IndexStruct();
            item.index = index;
            item.data = data;
            if (data != 0)
                arr.push(item);
        }
        return arr.concat();
    }
}
}
