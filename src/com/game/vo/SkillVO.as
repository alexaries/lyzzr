package com.game.vo {

import globals.ConfigLocator;

import lang.LangArrayTxt;
import lang.LangTxt;

import laya.utils.Dictionary;

import utils.HtmlUtil;

import utils.StringUtil;

import net.consts.StaticConfig;


public class SkillVO {
    public var name:String;

    public function SkillVO() {
        super();
    }

    /**
     * 攻击范围
     */
    public var apRange:String;
    /**
     * 技能效果类型<br>
     * 0：物<br>
     * 1：法<br>
     * 2：疗<br>
     * 3：增
     */
    public var apType:int;
    /**
     * 攻击目标
     */
    public var apTarget:int;
    /**
     * 技能无双类型<br>
     * 0：被动<br>
     * 1：主动<br>
     * 2：无双
     * 3入场
     * 4 仙术
     */
    public var type:int;

    /**
     * 技能附加BuffID
     *
     */
    public var buffId:int;

    public var isMove:uint;
    public var isAct:uint;
    public var act:uint = 0;
    public var degree:int;
    public var rateInfo:String;
    public var mainInfo:String;
    public var moreInfo:String;
    public var imgID:String;

    public var datas:Dictionary = new Dictionary();
    /**模型id，用于触发技能的变身*/
    public var modelID:uint;

    /**
     * : 0-单体,1-全体,2-横排,3-竖列,4-十字,5-品字 (4,5可选支持)
     */
    public static var RANGE_TYPES:Array = LangArrayTxt.RANGE_TYPES;

    public static var AP_TYPES:Array = LangArrayTxt.AP_TYPES;
    /**
     *  0-无状态 1-中毒，2-混乱，4-晕眩(无法攻击)，8-无法使用技能 封, 有等级之分，和值代表多个状态，16-反击
     */
    public static var STATUS_TYPES:Array = LangArrayTxt.STATUS_TYPES;


    /** 技能 配置 id*/
    public var id:int;

    /**服务端传的五位 技能id*/
    public var skillId:int;


    /**技能等级*/
    public function get skillLv():int {
        return skillId % 100;
    }

    public function get typeString():String {
        return LangArrayTxt.SKIL_VIEW_4[type];
    }

    /**职业*/
    public function get careerString():String {
        return LangArrayTxt.SKIL_VIEW_1[rateInfo];
    }

    public function get imgSource():String {
        //return StaticConfig.httpServer +"avatars/pskill/"+ id +".jpg";
        var jurl:int = id;
        if (id == 47 || id == 66 || id == 91 || id == 639 || id == 708 || id == 715)  //泰山冲
            jurl = 47;
        else if (id == 52 || id == 69 || id == 76 || id == 630 || id == 666 || id == 673) //龙之力
            jurl = 52;
        else if (id == 37 || id == 60 || id == 81 || id == 633 || id == 680 || id == 687) //撕天之爪
            jurl = 37;
        else if (id == 42 || id == 63 || id == 86 || id == 636 || id == 694 || id == 701) //生死之翼
            jurl = 42;
        if (type == 1) {
            return StaticConfig.httpServer + "avatars/pskill/" + jurl + ".jpg";
        }
        else {
            return StaticConfig.httpServer + "goods/p" + apRange + ".jpg";
        }
    }

    /**
     *
     <skill id="1" name="天雷诀" type1="1" type2="1" apTarget="1" apType="0"
     rateInfo="主动" mainInfo="攻击者被反击猛将血量*x的伤害"
     moreInfo="猛将血量越高，反击伤害越高" degree="2">
     <item level="1" apradio="1" duration="2" cool="2" rate="" main="45" more="" />
     </skill>
     */

    /**获得对应 属性值   @return [rateStr,mainStr,moreStr]*/
    public function getTip(level:int = 0, stage:uint = 0):Array {

        var arr:Array = datas.get(level);
        if (!arr)
            return ['', '', ''];

        var rateArr:Array = String(arr[0]).split(',');
        var mainArr:Array = String(arr[1]).split(',');
        var moreArr:Array = String(arr[2]).split(',');

        //升阶加成
        //moreArr[1] = uint(moreArr[1]) + SkillStageModel.getPropertyFromStage(stage);

        var rateStr:String;
        var mainStr:String;
        var moreStr:String;

        rateStr = StringUtil.substitute(rateInfo, rateArr);
        mainStr = StringUtil.substitute(mainInfo, mainArr);
        moreStr = StringUtil.substitute(moreInfo, moreArr);
        var s_arr:Array = mainStr.split("|");
        mainStr = s_arr.join("\n");


        if (id == 122) {
            mainStr = "对敌方单体造成法术伤害，" + (tempG[level][0] as int).toString() + "%的概率造成二次伤害，";
            if (tempG[level][1] > 0)
                mainStr += (tempG[level][1] as int).toString() + "%的概率造成三次伤害，";
            if (tempG[level][2] > 0)
                mainStr += (tempG[level][2] as int).toString() + "%的概率造成四次伤害";
        }
        return [rateStr, mainStr, moreStr];
    }

    private var tempG:Array = [[0, 0, 0],
        [30, 0, 0],
        [40, 0, 0],
        [50, 0, 0],
        [60, 0, 0],
        [60, 10, 0],
        [60, 20, 0],
        [40, 30, 10],
        [30, 40, 20],
        [20, 50, 30],
        [10, 40, 50],
        [0, 30, 70],
        [0, 10, 90]
    ];


    public function getApType():String {
        return AP_TYPES[apType];
    }

    public function getRangeType():String {
        return RANGE_TYPES[apRange];
    }

    public function getEffectType():String {
        var returnStr:String = "";
        switch (buffId) {
            case 0:
                returnStr = STATUS_TYPES[0];
                break;
            case 1:
                returnStr = STATUS_TYPES[1];
                break;
            case 2:
                returnStr = STATUS_TYPES[2];
                break;
            case 4:
                returnStr = STATUS_TYPES[3];
                break;
            case 8:
                returnStr = STATUS_TYPES[4];
                break;
            case 16:
                returnStr = STATUS_TYPES[5];
                break;
            default:
                returnStr = STATUS_TYPES[0];
                break;
        }
        return returnStr;
    }

    public function clone():SkillVO {
        var vo:SkillVO = new SkillVO();
        vo.id = id;
        vo.name = name;
        vo.apType = apType;
        vo.type = type;
        vo.apTarget = apTarget
        vo.apRange = apRange;
        vo.rateInfo = rateInfo;
        vo.mainInfo = mainInfo;
        vo.moreInfo = moreInfo;
        vo.degree = degree;
        vo.buffId = buffId;
        vo.isMove = isMove;
        vo.isAct = isAct;
        vo.modelID = modelID;
        vo.skillId = skillId;
        vo.tempG = tempG;

        vo.datas = datas;

        return vo;
    }
}
}
