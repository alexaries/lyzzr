package com.game.utils {
import com.game.module.map.vo.MapConstConfig;
import com.game.module.user.vo.StatesVO;
import com.game.vo.CareerGrowVO;
import com.game.vo.GernalHeroVO;
import com.game.vo.GoodsPropsVO;
import com.game.vo.GoodsVO;
import com.game.vo.MonsterVO;
import com.game.vo.PropertyDefine;

import globals.ConfigLocator;

import lang.LangArrayTxt;
import lang.LangTxt;

import laya.utils.Dictionary;

import utils.ArrayUtil;
import utils.HtmlUtil;

public class UserUtil  {
    public function UserUtil() {
    }


    public static function getVIPLevel(value:uint):int {
        var len:int = MapConstConfig.VIPMoney.length;
        var i:int;
        for (i = 0; i < len; i++) {
            if (value < MapConstConfig.VIPMoney[i]) {
                return i - 1;
                break;
            }
        }

        if (i > len - 1) {
            return len - 1;
        }
        return 0;
    }

    /**
     * 获取玩家或将领buff
     * @param field
     * @param data
     * @param isFighter
     * @return
     *
     */
    public static function getStateVO(field:uint, data:uint, isFighter:Boolean = false):StatesVO {
        var stateVo:StatesVO;
        if (!isFighter) {
            //人身上的Buff stateVo.id小于0x40 field ID小于0x80 大于0x40
            stateVo = new StatesVO();
            stateVo.id = field - 0x80;
            stateVo.remain = data;
            if (stateVo.id < 0) {
                return null;
            }
        } else {
            //将身上的Buff stateVo.id大于0x40 field ID小于0x80
            stateVo = new StatesVO();
            stateVo.id = field;
            stateVo.remain = data;
            if (stateVo.id < 0) {
                return null;
            }
        }
        return stateVo;
    }
    public static function getGernalHeroByID(id:int):GernalHeroVO {
        var heros:Dictionary = ConfigLocator.getInstance().gernalHeros
        return heros.get(id) as GernalHeroVO;
    }

    public static function getMonsterVOByID(id:int)
    {
        var monsters:Dictionary= ConfigLocator.getInstance().monsters;
        return monsters.get(id) as MonsterVO;
    }

    public static function dayNumToTimeString(num:int):String {
        if (num <= 0)
            return "00:00:00";
        var time:String = "";
        var day:int = Math.floor(num / (3600 * 24));
        var hour:int = Math.floor(num / 3600);
        var minute:int = Math.floor((num - hour * 3600) / 60);
        var second:int = num - hour * 3600 - minute * 60;
        if (day > 0) {
            time += day + LangTxt.SHOP_VIEW_8;
            return time;
        }
        time += hour < 10 ? "0" + hour.toString() : hour.toString();
        time += ":";
        time += minute < 10 ? "0" + minute.toString() : minute.toString();
        time += ":";
        time += second < 10 ? "0" + second.toString() : second.toString();
        return time;
    }
    public static function vipFormatGoodData(value:String):String {
        var arr:Array = value.split(":");
        var itemID:uint = parseInt(arr[0]);
        var itemNum:uint = parseInt(arr[1]);
        if (itemID == 0)
            return "";
        var returnStr:String = "";
        switch (itemID) {
            case 1:
                returnStr += HtmlUtil.color(LangTxt.GOLD, "#FFCC33");
                returnStr += HtmlUtil.color("+" + itemNum, "#FFCC33");
                break;
            case 2:
                returnStr += HtmlUtil.color(LangTxt.SILVER, "#FFCC33");
                returnStr += HtmlUtil.color("+" + itemNum, "#FFCC33");
                break;
            case 3:
                returnStr += HtmlUtil.color(LangTxt.GIFTSCORE, "#FFCC33");
                returnStr += HtmlUtil.color("+" + itemNum, "#FFCC33");
                break;
            case 4:

                returnStr += HtmlUtil.color(LangTxt.VIP_GOOD_4, "#FFCC33");
                returnStr += HtmlUtil.color("x" + itemNum, "#FFCC33");
                break;
            case 5:
                returnStr += HtmlUtil.color(LangTxt.VIP_GOOD_5, "#9154E5");
                returnStr += HtmlUtil.color("x" + itemNum, "#9154E5");
                break;
            case 6:
                returnStr += HtmlUtil.color(LangTxt.VIP_GOOD_6, "#2593EF");
                returnStr += HtmlUtil.color("x" + itemNum, "#2593EF");
                break;
            default:
                var goodsvo:GoodsVO = ConfigLocator.getInstance().goodsList.get(itemID);
                if (goodsvo) {
                    returnStr += HtmlUtil.color(goodsvo.name, GoodsVO.TEXTCOLOR[goodsvo.color - 1]);
                    returnStr += HtmlUtil.color("x" + itemNum, GoodsVO.TEXTCOLOR[goodsvo.color - 1]);
                }
                break;
        }
        return returnStr;
    }

    public static function formatGoodData(value:String):String {
        var arr:Array = value.split(":");
        var itemID:uint = parseInt(arr[0]);
        var itemNum:uint = parseInt(arr[1]);
        if (itemID == 0)
            return "";
        var returnStr:String = "";
        switch (itemID) {
            case 1:
                returnStr += HtmlUtil.color(LangTxt.GOLD, "#FFCC33");
                returnStr += HtmlUtil.color("+" + itemNum, "#ffffff");
                break;
            case 2:
                returnStr += HtmlUtil.color(LangTxt.SILVER, "#FFCC33");
                returnStr += HtmlUtil.color("+" + itemNum, "#ffffff");
                break;
            case 3:
                returnStr += HtmlUtil.color(LangTxt.GIFTSCORE, "#FFCC33");
                returnStr += HtmlUtil.color("+" + itemNum, "#ffffff");
                break;
            case 4:
                returnStr += HtmlUtil.color(LangTxt.VIP_GOOD_4, "#FFCC33");
                returnStr += HtmlUtil.color("x" + itemNum, "#ffffff");
                break;
            case 5:
                returnStr += HtmlUtil.color(LangTxt.VIP_GOOD_5, "#9154E5");
                returnStr += HtmlUtil.color("x" + itemNum, "#ffffff");
                break;
            case 6:
                returnStr += HtmlUtil.color(LangTxt.VIP_GOOD_6, "#2593EF");
                returnStr += HtmlUtil.color("x" + itemNum, "#ffffff");
                break;
            case 0xD000:
                //声望
                returnStr += HtmlUtil.color(LangTxt.PRESTIGE, "#FFCC33");
                returnStr += HtmlUtil.color("x" + itemNum, "#ffffff");
                break;
            default:
                var goodsvo:GoodsVO = ConfigLocator.getInstance().goodsList.get(itemID);
                if (goodsvo) {
                    returnStr += HtmlUtil.color(goodsvo.name, GoodsVO.TEXTCOLOR[goodsvo.color - 1]);
                    returnStr += HtmlUtil.color("x" + itemNum, "#ffffff");
                }
                break;
        }
        return returnStr;
    }

    public static function numToTimeString(num:int):String {
        if (num < 0)
            return "00:00:00";
        var time:String = "";
        var hour:int = Math.floor(num / 3600);
        var minute:int = Math.floor((num - hour * 3600) / 60);
        var second:int = num - hour * 3600 - minute * 60;
        time += hour < 10 ? "0" + hour.toString() : hour.toString();
        time += ":";
        time += minute < 10 ? "0" + minute.toString() : minute.toString();
        time += ":";
        time += second < 10 ? "0" + second.toString() : second.toString();
        return time;
    }


    /**
     * 心法加成
     * |物理攻击|法术攻击|物理防御|法术防御|力|智|体|敏|意|体力|身法|灵力|
     * 命中|命中值|闪躲|闪躲值|法术抗性|法术抗性值|暴击|暴击值|暴击抗性|暴击抗性值|破击|破击值|反击|反击值|
     * |入场灵气|灵气上限|暴击伤害%|
     */
    public static function getPropArrayByCittaID(cittaID:int,skillRefinePercent:Number):Array {
        var propertyArray:Array = PropertyDefine.CreateZeroProperty();
        var id:int=Math.floor(Math.floor(cittaID/ 100) - 1) * 9 + Math.floor(cittaID) % 100;
        var tempPropsVO:GoodsPropsVO = ConfigLocator.getInstance().cittaPropDic.get(id);
        if (tempPropsVO)
        {
            propertyArray = PropertyDefine.goodsPropsToArray(tempPropsVO);

            //心境加成
            if(skillRefinePercent > 0)
            {
                for(var i:int = 0,len:int = PropertyDefine.LENGTH;i<len;i++)
                {
                    //暴击伤害没有加成
                    if(i == PropertyDefine.CRIT_DAMAGE_VALUE)
                        continue;

                    propertyArray[i] += propertyArray[i] * skillRefinePercent;
                }
            }
        }
        return propertyArray;
    }


    public static function getCareerGrowVOByID(careerId:int, status:int):CareerGrowVO {
        var returnvo:CareerGrowVO;
        var arr:Array =ConfigLocator.getInstance().careerCfgs;
        var len:int = arr.length;
        for (var i:int = 0; i < len; i++) {
            if ((arr[i] as CareerGrowVO).id == careerId) {
                returnvo = arr[i];
                break;
            }
        }
        return returnvo;
    }

    public static function getCountryName(countryID:int):String {
        // ? "武当" : "峨眉"
        var counrty_names:Array = LangArrayTxt.COUNTRYARR;
        if (countryID > -1 && countryID < counrty_names.length)
            return counrty_names[countryID];
        else
            return "UN_KNOW";
    }
    public static function sortOnHeroList(arr:Array):Array{
        var vo = arr[0]
        arr.shift()
        ArrayUtil.sortOn(arr,["isInBattle","quality","level"],ArrayUtil.SORT_DESCENDING);
        arr.unshift(vo);
        return arr;
    }
}
}
