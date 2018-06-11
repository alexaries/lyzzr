package com.game.vo {
import com.game.vo.CittaVO;

import globals.ConfigLocator;

import lang.LangArrayTxt;

import lang.LangTxt;
import laya.utils.Dictionary;
import net.consts.StaticConfig;

import utils.HtmlUtil;
import utils.StringUtil;

public class CittaVO {
    public var id:int ;
    public var name:String ;
    public var degree:int ;
    public var maxlevel:int ;
    public var rateInfo:String ;
    public var mainInfo:String ;
    public var moreInfo:String ;


    public var datas:Dictionary = new Dictionary();
    private var imgIdR:Array = ["p1200","p1202","p1204","p1263"];
    private var imgIdS:Array = ["p1220","p1222","p1224","p1258"];
    private var imgIdD:Array = ["p1240","p1242","p1244","p1265"];
    private var imgIdQ:Array = ["p1260","p1262","p1264","p6001"];

    /**服务端传的五位 技能id*/
    public var skillId:int;

    public function CittaVO() {
    }

    /**技能等级*/
    public function get skillLv():int
    {
        return  skillId%100;
    }

    /**职业*/
    public function get careerString():String
    {
        return LangArrayTxt.SKIL_VIEW_1[rateInfo];
    }

    /**获得对应 属性值   @return [rateStr,mainStr,moreStr，needSoul,needDp]*/
    public function getTip(level : int) : Array {
        var arr:Array = datas.get(level) ;
        if(!arr)
            return ['','','',0,0];

        var rateArr:Array = String(arr[0]).split(',');
        var mainArr:Array = String(arr[1]).split(',');
        var moreArr:Array = String(arr[2]).split(',');

        var rateStr:String;
        var mainStr:String;
        var moreStr:String;

        if(rateArr.length > 0 && (rateArr[0])!=0){
            rateStr = rateInfo.indexOf('&x&')?rateInfo.replace('&x&',rateArr[0]):rateInfo;
            if(rateArr.length > 1 && (rateArr[1])!=0)
                rateStr = rateStr.indexOf('&y&')?rateStr.replace('&y&',rateArr[1]):rateStr;
            if(rateArr.length > 2 && (rateArr[2])!=0)
                rateStr = rateStr.indexOf('&z&')?rateStr.replace('&z&',rateArr[2]):rateStr;
        }else
            rateStr = rateInfo;

        if(rateStr == "10")
            rateStr = "6";

        if(mainArr.length > 0 && (mainArr[0])!=0){
            mainStr = mainInfo.indexOf('&x&')?mainInfo.replace('&x&',mainArr[0]):mainInfo;
            if(mainArr.length > 1 && (mainArr[1])!=0)
                mainStr = mainStr.indexOf('&y&')?mainStr.replace('&y&',mainArr[1]):mainStr;
            if(mainArr.length > 2 && (mainArr[2])!=0)
                mainStr = mainStr.indexOf('&z&')?mainStr.replace('&z&',mainArr[2]):mainStr;
        }else
            mainStr = mainInfo;

        if(moreArr.length > 0 && (moreArr[0])!=0){
            moreStr = moreInfo.indexOf('&x&')?moreInfo.replace('&x&',moreArr[0]):moreInfo;
            if(moreArr.length > 1 && (moreArr[1])!=0)
                moreStr = moreStr.indexOf('&y&')?moreStr.replace('&y&',moreArr[1]):moreStr;
            if(moreArr.length > 2 && (moreArr[2])!=0)
                moreStr = moreStr.indexOf('&z&')?moreStr.replace('&z&',moreArr[2]):moreStr;
        }else
            moreStr = moreInfo;

        return [rateStr,mainStr,moreStr,arr[3],arr[4]];
    }

    public function get imgSource():String
    {
        var gDic:Dictionary = ConfigLocator.getInstance().goodsList;
        var goodvo:GoodsVO = gDic.get(id+1199) as GoodsVO ;
        if(id>210)
            goodvo= ConfigLocator.getInstance().goodsList.get(id+20790) as GoodsVO ;
        if(goodvo){
            return goodvo.imgURL;
        }
        switch(rateInfo)
        {
            case "0":
                return StaticConfig.httpServer +"goods/"+ imgIdQ[degree-2] +".jpg";
                break;
            case "1":
                return StaticConfig.httpServer +"goods/"+ imgIdR[degree-2] +".jpg";
                break;
            case "2":
                return StaticConfig.httpServer +"goods/"+ imgIdS[degree-2] +".jpg";
                break;
            case "3":
                return StaticConfig.httpServer +"goods/"+ imgIdD[degree-2] +".jpg";
                break;
        }
        return StaticConfig.httpServer +"goods/"+"default.jpg";
    }


    /**获得心法属性*/
    static public function getPropStr(skillid:int,skillRefinePercent:Number = 0):String
    {
        var toolTip:String = "";
        var cittavo:CittaVO = ConfigLocator.getInstance().cittaDatas.get(Math.floor(skillid / 100));

        if (!cittavo) {
            return "";
        }
        var tipsArr : Array = cittavo.getTip(skillid% 100);
        var skillProp : GoodsPropsVO = ConfigLocator.getInstance().cittaPropDic.get((Math.floor(skillid / 100) - 1) * 9 + (skillid) % 100);

        const propArray:Array = [skillProp.ap,skillProp.ap_magic,skillProp.def,skillProp.def_magic,skillProp.power,skillProp.inelligence,skillProp.strength,skillProp.agility,skillProp.will,skillProp.hp,skillProp.tough,
            skillProp.act,skillProp.hit,skillProp.dodge,skillProp.crit,skillProp.crit_damageValue,skillProp.pierce,skillProp.repel,skillProp.dodge_magic,skillProp.CRIT_REDUCE_DEMAGE,skillProp.aura_base,skillProp.aura_max
        ];
        const propNameArray:Array = [LangTxt.PHY + LangTxt.AP,LangTxt.MAGIC + LangTxt.AP,LangTxt.PHY + LangTxt.DEF,LangTxt.MAGIC + LangTxt.DEF,
            LangTxt.POWER,LangTxt.INTELLIGENCE,LangTxt.STRENGTH,LangTxt.AGILITY,LangTxt.WILL,LangTxt.HP,LangTxt.TOUGH,LangTxt.ACT,LangTxt.HIT,LangTxt.DODGE,LangTxt.CRIT,LangTxt.CRIT_DAMAGE,LangTxt.PIERCE,LangTxt.REPEL,LangTxt.MAGIC_DODGE,LangTxt.TOUGH_VALUE,LangTxt.HEROPANEL_LAB10,LangTxt.HEROPANEL_LAB11
        ];
        const propLength:uint = propArray.length;
        //技能心境
        if(skillRefinePercent == 0)
        {

            var f:String = "";
            for(var i:int = 0;i<propLength;i++)
            {
                if(Number(propArray[i]) != 0)
                {
                    var propStr:String = "";
                    if(propNameArray[i] == LangTxt.CRIT_DAMAGE)
                        propStr = skillProp.crit_damage;
                    else if(propNameArray[i]== LangTxt.TOUGH_VALUE){ //
                        propStr = skillProp.CRIT_REDUCE_DEMAGE;
                    }
                    else
                        propStr = parseInt(propArray[i]).toString();

                    f = "<br>";
                    toolTip +=  "+" +propStr+" " + propNameArray[i] + f;

                }
            }
        }

        return toolTip;
    }






    public function clone():CittaVO
    {
        var vo:CittaVO = new CittaVO();
        vo.id = (id);
        vo.name = name;
        vo.maxlevel = maxlevel;
        vo.rateInfo = rateInfo;
        vo.mainInfo = mainInfo;
        vo.moreInfo = moreInfo;
        vo.degree = (degree);
        vo.skillId = skillId;

        vo.imgIdR = imgIdR;
        vo.imgIdS = imgIdS;
        vo.imgIdD = imgIdD;
        vo.imgIdQ = imgIdQ;

        vo.datas = datas;

        return vo;

    }

    public static function createTootips(skillid:int,type:int = 0,stage:uint = 0,skillRefinePercent:Number = 0):String
    {
        var toolTip:String = "";
        var cittavo:CittaVO = ConfigLocator.getInstance().cittaDatas.get(Math.floor(skillid / 100));

        if (!cittavo) {
            return "";
        }
        var tipsArr : Array = cittavo.getTip(Math.floor(skillid) % 100);
        var proId:int = (Math.floor(skillid / 100) - 1) * 9 + (skillid) % 100;
        var proDic:Dictionary = ConfigLocator.getInstance().cittaPropDic;
        var skillProp : GoodsPropsVO = proDic.get(proId.toString());
        switch(type)
        {
            case 0:
                toolTip = HtmlUtil.fontSizeAndColor(cittavo.name + " " + LangTxt.CITTA_LEVEL.replace('{0}',Math.floor(skillid) % 100), GoodsVO.TEXTCOLOR[cittavo.degree - 1], 32) + "<br/>";
                break;
            case 1:
                toolTip = "";
                break;
            case 2:
                toolTip = HtmlUtil.fontSizeAndColor(cittavo.name + " " + LangTxt.CITTA_LEVEL.replace('{0}',Math.floor(skillid) % 100), GoodsVO.TEXTCOLOR[cittavo.degree - 1], 30) + "<br/>";
                break;
        }

        toolTip += HtmlUtil.color(LangTxt.CAREER+"：" + LangArrayTxt.SKIL_VIEW_1[parseInt(tipsArr[0])] + "<br>", "#fefefe");
        if(tipsArr[1]!="" &&  tipsArr[1]!= undefined)
            toolTip += HtmlUtil.color(tipsArr[1] + "<br>", "#fefefe");

        //levelLab.htmlText = HtmlUtil.color("<br>升级消耗修为：" + tipsArr[4] + "<br><br>", "#99FFFF");

        /*if (int(skillProp.skills) != 0) {
         var skillvo : SkillVO = XMLLocator.getInstance().skillDatas[int(int(skillProp.skills) / 100)];
         var arr : Array = skillvo.getTip(int(skillProp.skills) % 100);
         }*/
        const propArray:Array = [skillProp.ap,skillProp.ap_magic,skillProp.def,skillProp.def_magic,skillProp.power,skillProp.inelligence,skillProp.strength,skillProp.agility,skillProp.will,skillProp.hp,skillProp.tough,
            skillProp.act,skillProp.hit,skillProp.dodge,skillProp.crit,skillProp.crit_damageValue,skillProp.pierce,skillProp.repel,skillProp.dodge_magic,skillProp.CRIT_REDUCE_DEMAGE,skillProp.aura_base,skillProp.aura_max
        ];
        const propNameArray:Array = [LangTxt.PHY + LangTxt.AP,LangTxt.MAGIC + LangTxt.AP,LangTxt.PHY + LangTxt.DEF,LangTxt.MAGIC + LangTxt.DEF,
            LangTxt.POWER,LangTxt.INTELLIGENCE,LangTxt.STRENGTH,LangTxt.AGILITY,LangTxt.WILL,LangTxt.HP,LangTxt.TOUGH,LangTxt.ACT,LangTxt.HIT,LangTxt.DODGE,LangTxt.CRIT,LangTxt.CRIT_DAMAGE,LangTxt.PIERCE,LangTxt.REPEL,LangTxt.MAGIC_DODGE,LangTxt.TOUGH_VALUE,LangTxt.HEROPANEL_LAB10,LangTxt.HEROPANEL_LAB11
        ];
        const propLength:uint = propArray.length;
        //技能心境
        if(skillRefinePercent == 0)
        {
            for(i = 0;i<propLength;i++)
            {
                if(Number(propArray[i]) != 0)
                {
                    var propStr:String = "";
                    if(propNameArray[i] == LangTxt.CRIT_DAMAGE)
                        propStr = skillProp.crit_damage
                    else if(propNameArray[i]== LangTxt.TOUGH_VALUE){ //
                        propStr = skillProp.CRIT_REDUCE_DEMAGE;
                    }
                    else
                        propStr = parseInt(propArray[i]).toString();

                    toolTip += HtmlUtil.color("+" + propStr, "#FFFFFF") + " " + HtmlUtil.color(propNameArray[i]) + "    " + "<br>";
                }
            }

            /*if (Number(skillProp.ap) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.ap).toString(), "#FFFFFF") + " " + LangTxt.PHY + LangTxt.AP + "    " + "<br>";
             if (Number(skillProp.ap_magic) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.ap_magic).toString(), "#FFFFFF") + " " + LangTxt.MAGIC + LangTxt.AP + "    " + "<br>";
             if (Number(skillProp.def) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.def).toString(), "#FFFFFF") + " " + LangTxt.PHY + LangTxt.DEF + "    " + "<br>";
             if (Number(skillProp.def_magic) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.def_magic).toString(), "#FFFFFF") + " " + LangTxt.MAGIC + LangTxt.DEF + "    " + "<br>";
             if (Number(skillProp.power) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.power).toString(), "#FFFFFF") + " " + LangTxt.POWER + "    " + "<br>";
             if (Number(skillProp.inelligence) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.inelligence).toString(), "#FFFFFF") + " " + LangTxt.INTELLIGENCE + "    " + "<br>";
             if (Number(skillProp.strength) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.strength).toString(), "#FFFFFF") + " " + LangTxt.STRENGTH + "    " + "<br>";
             if (Number(skillProp.agility) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.agility).toString(), "#FFFFFF") + " " + LangTxt.AGILITY + "    " + "<br>";
             if (Number(skillProp.will) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.will).toString(), "#FFFFFF") + " " + LangTxt.WILL + "    " + "<br>";
             if (Number(skillProp.hp) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.hp).toString(), "#FFFFFF") + " " + LangTxt.HP + "    " + "<br>";
             if (Number(skillProp.tough) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.tough).toString(), "#FFFFFF") + " " + LangTxt.TOUGH + "    " + "<br>";
             if (Number(skillProp.act) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.act).toString(), "#FFFFFF") + " " + LangTxt.ACT + "    " + "<br>";
             if (Number(skillProp.hit) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.hit).toString(), "#FFFFFF") + " " + LangTxt.HIT + "    " + "<br>";
             if (Number(skillProp.dodge) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.dodge).toString(), "#FFFFFF") + " " + LangTxt.DODGE + "    " + "<br>";
             if (Number(skillProp.crit) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.crit).toString(), "#FFFFFF") + " " + LangTxt.CRIT + "    " + "<br>";
             if ((Number(skillProp.crit_damageValue)) != 0)
             toolTip += HtmlUtil.color("+" + skillProp.crit_damage, "#FFFFFF") + " " + LangTxt.CRIT_DAMAGE + "    " + "<br>";
             if (int(skillProp.pierce) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.pierce).toString(), "#FFFFFF") + " " + LangTxt.PIERCE + "    " + "<br>";
             if (Number(skillProp.repel) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.repel).toString(), "#FFFFFF") + " " + LangTxt.REPEL  + "    " + "<br>";
             if (Number(skillProp.dodge_magic) != 0)
             toolTip += HtmlUtil.color("+" + int(skillProp.dodge_magic).toString(), "#FFFFFF") + " " + LangTxt.MAGIC_DODGE + "    " + "<br>";*/
        }
        else
        {
            var percentValue:Number = 0;
            var percentStr:String = "";
            for(var i:int = 0;i<propLength;i++)
            {
                //暴击伤害不加
                if(propNameArray[i] == LangTxt.CRIT_DAMAGE)
                {
                    if(Number(propArray[i]) != 0)
                    {
                        toolTip += HtmlUtil.color("+" + skillProp.crit_damage, "#FFFFFF") + " " + propNameArray[i] + "    " + "<br>";
                    }
                }
                else
                {
                    if(Number(propArray[i]) != 0)
                    {
                        percentValue = propArray[i] * skillRefinePercent;
                        percentStr = HtmlUtil.color(StringUtil.substitute("(+{0})",[percentValue]),"#00ff00");

                        toolTip += HtmlUtil.color("+" +  parseInt(propArray[i])  + percentStr, "#FFFFFF") + " " + propNameArray[i] + "    " + "<br>";
                    }
                }
            }
        }

        toolTip += SkillVO.createTootips(parseInt(skillProp.skills),1,0,stage);
        return toolTip;
    }
}
}
