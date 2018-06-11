/**
 * Created by huangcb on 2017/8/25.
 */
package com.game.utils {
import config.userInfo.expnew.IExpnewCfg;

import utils.*;

import com.game.module.heroic.vo.HeroVO;
import com.game.module.map.util.MapUtil;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.map.vo.CityBaseInfoVO;
import com.game.module.map.vo.MapModel;
import com.game.module.map.vo.NpcBaseInfoVO;
import com.game.module.pet.vo.PetVO;
import com.game.module.task.struct.TaskBuildStruct;
import com.game.module.task.struct.TaskCityStruct;
import com.game.module.task.struct.TaskNpcStruct;
import com.game.vo.MonsterVO;
import com.game.vo.TaskCfg;

import config.ConfigManager;
import config.pet.petConfig.IPetConfig_pet;
import config.userInfo.exp.IExpCfg;

import globals.ConfigLocator;

import lang.LangArrayTxt;
import lang.LangTxt;

import laya.maths.Point;
import laya.utils.Dictionary;

import net.consts.StaticConfig;
import net.utils.BytesUtil;

public class ShellUtils {

    /*            43，44 45 46 47 48 49
     50  51 52 53 54 55 56
     60  61 62 63 64 65 66 67 68 69
     70  71 76 77 78 79
     80  81 82 83 84 85 86 87 88 89
     90  91 92 93 94 95
     616 617 618 619 620 621
     633 634 635 636 637 638*/
    //宠物id
    public static var petSkillIdArr:Array = [37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71,
        76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95,
        616, 617, 618, 619, 620, 621, 630, 631, 632, 633, 634, 635, 636, 637, 638, 639, 640, 641];

    public static var SYS_COLORS_TXT:Array = LangArrayTxt.SHELL_VIEW_3;
    public static var SYS_COLOR:Array = ["FFFFFF", "2CC345", "2593EF", "9154E5", "FFCC33", "996600", "FF0000"];
    public static var SYS_TEXT_COLOR:Array = ["FFFFFF", "2CC345", "2593EF", "9154E5", "FFCC33", "996600", "FF0000"];
    public static var SYS_TEXT_FORMATS:Array;
    public static var SYS_HOTEL_TIP:String = LangTxt.HOTEL_TIP;
    public static var SYS_UNIT_TYPE:Array = ["", LangTxt.GOLD, LangTxt.GOLD, LangTxt.GOLD, LangTxt.GIFTSCORE, LangTxt.SILVER, "荣誉", "声望", "", "", "", "龙魂", "龙魂", "龙魂", "龙魂", "龙魂", "积分", "龙魂", "龙魂"];
    public static var SYS_SHOP_BUY_MAX:uint = 999;
    public static var TEMP_COLOR:String = "<font color='#{0}'>{1}</font>";
    public static var TEMP_TITLE:String = "<{0}>";
    public static var SYS_POTENTINAL1:Array = [0.7, 0.9, 1.2, 1.5, 2];
    public static var SYS_POTENTINAL2:Array = [5.9, 6.9, 7.9, 8.9, 9.9];
    public static var bmpPool:Array = [];


    public static function toNStr(str:String, n:uint = 4, s:String = "0"):String {
        var arr:Array = str.toString().split("");
        while (arr.length < n) {
            arr.unshift(s);
        }
        return arr.join("");
    }

    public static function toHeadURL(npc:TaskNpcStruct):String {
        var url:String = "";
        switch (npc.type) {
            case 2:
            case 4:
                url = "avatars/npc/";
                break;
            case 6:
            case 100:
                url = "avatars/npc/";
                break;
            default:
                url = "avatars/npc/";
                break;
        }
        url = StaticConfig.httpServer + url + toNStr((npc.headId) + "") + ".jpg";
        return url;
    }

    public static function toHalfURL(npc:TaskNpcStruct):String {
        if(npc.halfId == 0){
            return "";
        }
        var url:String = StaticConfig.httpServer + "avatars/half/" + npc.halfId + ".png";
        return url;
    }

    public static function toLvByExp(exp:Number):uint {
        var lv:uint;
        var exps:Vector.<IExpnewCfg> = ConfigManager.instance.userInfo_expnew.expnewCfg;
        var item:IExpnewCfg;
        for (var i:uint = 0; i < exps.length; i++) {
            item = exps[i];
            if (exp < item.exp) {
                lv = i;
                break;
            }
        }
        return lv;
    }

    public static function toRetreatExp(money:int, time:int, expHero:Number):Number {
        var expDic:Dictionary;
        var exp:Number = 0;
        var expInTime:Number = 0;
        expDic = ConfigLocator.getInstance().retreatExpDic;
        for (var i:uint = 0; i < time; i++) {
            expInTime = [8, 3][money] * expDic.get(ShellUtils.toLvByExp(expHero)) * 60;
            expHero += expInTime;
            exp += expInTime;
        }
        return exp;
    }

    public static function toHeroHeadURL(id:uint):String {
        var url:String = "avatars/general/";
        url = StaticConfig.httpServer + url + toNStr(String(id)) + ".jpg";
        return url;
    }

    public static function toHeroHeadURL_1(id:uint):String {
        var url:String = "avatars/npc/";
        url = StaticConfig.httpServer + url + toNStr(String(id)) + ".jpg";
        return url;
    }

    public static function taskById(id:uint):TaskCfg {
        var taskVo:TaskCfg;
        var a:TaskCfg;

        a = ConfigLocator.getInstance().taskDic.get(id) as TaskCfg;
        if (a) {
            taskVo = a;
        }
        return taskVo;
    }

    public static function npcById(id:uint):TaskNpcStruct {
        var npc:TaskNpcStruct;
        var a:NpcBaseInfoVO;
        var b:MonsterVO;
        a = ConfigLocator.getInstance().talkNpcs.get(id) as NpcBaseInfoVO;
        if (a) {
            npc = new TaskNpcStruct;
            npc.id = a.id;
            npc.name = a.name;
            npc.title = a.title;
            npc.level = a.level;
            npc.type = a.npcType;
            npc.info = a.info;
            npc.headId = a.imgID;
            npc.halfId = a.half;
            npc.buildId = a.footHoldId;
        } else {
            b = ConfigLocator.getInstance().monsters.get(id) as MonsterVO;
            if (b) {
                npc = new TaskNpcStruct;
                npc.id = b.id;
                npc.name = b.name;
                npc.title = b.title;
                npc.level = b.level;
                npc.type = b.type;
                npc.info = b.info;
                npc.headId = b.imgID;
                npc.model = Number(b.roleID);
                npc.buildId = b.footHoldId;
            }
        }
        return npc;
    }

    public static function buildById(__mapmodel:MapModel, id:uint):TaskBuildStruct {
        var build:TaskBuildStruct;
        var a:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(__mapmodel, id);
        build = new TaskBuildStruct();
        if (a) {
            build.id = a.id;
            build.name = a.name;
        }
        return build;
    }

    public static function cityById(__mapmodel:MapModel, id:uint):TaskCityStruct {
        var city:TaskCityStruct;
        var a:CityBaseInfoVO;
        var str:String = id.toString(16);
        str = ShellUtils.toNStr(str, 4);
        str = "0x" + str.substr(0, 2);
        a = MapUtil.getCityBaseInfoVObyId(__mapmodel, parseInt(str));
        city = new TaskCityStruct();
        if (a) {
            city.id = a.id;
            city.name = a.name;
        }
        return city;
    }

    public static function npcInBuildById(__mapmodel:MapModel, npcId:uint):TaskNpcStruct {
        var item:NpcBaseInfoVO = MapUtil.getNPCInfoByNpcID(__mapmodel, npcId);
        if (item) {
            var node:TaskNpcStruct = new TaskNpcStruct();
            node.id = item.id;
            node.name = item.name;
            node.title = item.title;
            node.level = item.level;
            node.type = item.type;
            node.info = item.info;
            node.headId = item.imgID;
            node.halfId = item.half;
            node.buildId = item.footHoldId;
            return node;
        }
        return ShellUtils.npcById(npcId);
    }

    public static function npcsInBuild(__mapmodel:MapModel, buildId:uint):Array {
        var list:Array = MapUtil.getMapNpcsByLocId(__mapmodel, buildId);
        var npcs:Array;
        var item:NpcBaseInfoVO;
        var node:TaskNpcStruct;
        var i:uint;
        npcs = [];
        for (i = 0; i < list.length; i++) {
            item = list[i] as NpcBaseInfoVO;
            node = new TaskNpcStruct();
            node.id = item.id;
            node.name = item.name;
            node.title = item.title;
            node.level = item.level;
            node.type = item.type;
            node.info = item.info;
            node.headId = item.imgID;
            node.halfId = item.half;
            node.buildId = item.footHoldId;
            npcs.push(node);
        }
        return npcs;
    }

    public static function npcListInBuild(__mapmodel:MapModel, buildId:uint):Array {
        var list:Array = MapUtil.getMapNpcsByLocId(__mapmodel, buildId);
        var npcs:Array;
        var item:NpcBaseInfoVO;
        var i:uint;
        npcs = [];
        for (i = 0; i < list.length; i++) {
            item = list[i] as NpcBaseInfoVO;
            npcs.push(item.id);
        }
        return npcs;
    }

    public static function getBuildPosInCurCity(mapNodeList:Array, buildId:int):Point {
        var pt:Point;
        var list:Array = mapNodeList;
        var item:Array = [];
        if (list) {
            for (var i:int = 0; i < list.length; i++) {
                item = list[i];
                if (buildId == item[0]) {
                    pt = new Point();
                    pt.x = item[1];
                    pt.y = item[2];
                    break;
                }
            }
        }
        return pt;
    }

    public static function toIndexByZZ(n:Number):uint {
        var p:uint = 0;
        var arr:Array = SYS_POTENTINAL2;
        for (var i:uint = 0; i < arr.length; i++) {
            if (n < arr[i]) {
                p = i;
                break;
            }
        }
        return p;
    }

    /*
     public static function toIndexByQL(n : Number) : uint {
     var p : uint = 4;
     var arr : Array = HeroVO.POTENTINAL;
     for (var i : uint = 0;i < arr.length;i++) {
     if (n < arr[i]) {
     p = i + 1;
     break;
     }
     }
     return p;
     }
     */

    public static function get heroicType():Array {
        return LangTxt.HEROIC_TYPE.split(",");
    }


    public static function toDB(vo:*, len:uint):Array {
        var arr:Array = [];
        for (var i:uint = 0; i < len; i++) {
            arr[i] = vo;
        }
        return arr;
    }

    public static function converUserName(str:String):String {
        var userName:String;
        var ba:ByteArray = BytesUtil.creatByteArray();
        ba.writeUTF(str);
        ba.position = 0;
        userName = BytesUtil.readUserName(ba);
        return userName;
    }

    public static function toDayTime(time:uint):uint {
        var n:uint;
        var date:Date = new Date();
        date.setTime(time * 1000);
        date.setHours(0);
        date..setMinutes(0);
        date.setSeconds(0);
        n = time / 1000;
        return n;
    }

    /*
     public static function checkPack(n : uint) : Boolean {
     var flag : Boolean = false;
     if (UserData.instance.userVO.leaveCapacity<n) {
     flag = true;
     }
     return flag;
     } */
    public static function getPetById(n:int):PetVO {
        var pet:PetVO;

        var item:IPetConfig_pet = ArrayUtil.find(ConfigManager.instance.pet_petConfig.pet, function (v:IPetConfig_pet) {
            return v.id == n
        });

        if (item) {
            pet = new PetVO();
            pet.id = (item.id);
            pet.color = (item.color);
            pet.modelID = (item.modelID);
            pet.carrer = (item.carrer);
        }

        return pet;
    }


    public static function toIndexByQL(n:Number):uint {
        var p:uint = 4;
        var arr:Array = HeroVO.POTENTINAL;
        for (var i:uint = 0; i < arr.length; i++) {
            if (n < arr[i]) {
                p = i + 1;
                break;
            }
        }
        return p;
    }
}
}