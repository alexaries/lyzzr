
package com.game.vo {
import com.game.module.user.proxy.UserProxy;

import lang.LangTxt;

import laya.utils.Dictionary;

import utils.HtmlUtil;

public class BloodbitVo {

    public var id:int;
    public var name:String ;
    public var rateInfo:String ;
    public var mainInfo:String ;
    public var moreInfo:String ;
    public var degree:int;
    public var maxlevel:int;


    public var datas:Dictionary ;

    public function BloodbitVo()
    {
    }
    /**
     * <bloodbit id="2" name="肩井" rateInfo="需要修为值&x&" mainInfo="修为效率提升&x&%,元神力上限增加&y&%,修为上限增加&z&%"
     moreInfo="猛将血量越高，反击伤害越高" degree="2" maxlevel="3" >
     <item level="0" needLv="20" needp="100" rate="" main="0,0,0" more="" />
     <item level="1" needLv="20" needp="300" rate="" main="0,0,0" more="" />
     <item level="2" needLv="20" needp="475" rate="" main="0,0,0" more="" />
     <item level="3" needLv="20" needp="687" rate="" main="0,0,0" more="" />
     </bloodbit>
     */


    /**获得属性 数组*/
    public function getTip(level : int) : Array {

        level = level == -1?0:level;
        var arr:Array = datas.get(level);
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

    /**获取描述*/
    public  function getTipsByLV(_level:int):String
    {
        var toolTip:String = "";
        var tipsArr:Array = getTip(_level);
        var desArr:Array = String(tipsArr[2]).split("，");
        if (_level < 3) {
            toolTip = LangTxt.NEED_LEVEL + "：" + datas.get(_level + 1)[3]+ "\n";
        }
        else {
            toolTip = LangTxt.OPENED+ "\n";
        }
        toolTip += name+ "\n";
        if (_level < 3) {
            toolTip += LangTxt.NEED_PEXP + "：" + datas.get(_level + 1)[4] + "\n";
        }
        toolTip += LangTxt.BLOODBIT_PROCESS + " " + _level.toString() + "/3"+ "\n";
        toolTip += desArr[0]+ "\n";
        toolTip += desArr[1]+ "\n";
        var str:String = "";
        for (var j:int = 2; j < desArr.length; j++) {
            str += desArr[j] + "\n";
        }
        toolTip += str+ "\n";
        return toolTip;
    }

}
}

