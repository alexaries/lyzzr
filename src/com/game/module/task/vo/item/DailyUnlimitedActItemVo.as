package com.game.module.task.vo.item {
import com.game.module.daily.vo.DailyVo;
import com.game.module.task.struct.TaskNpcStruct;

import config.ConfigManager;
import config.mission.daily.IDaily_root_act1_item;

import globals.ServiceTime;

import lang.LangTxt;

import net.consts.StaticConfig;

import utils.CSSStyleCfg;
import utils.HtmlUtil;

import com.game.utils.ShellUtils;

import utils.StringUtil;

/**
 * @author john
 */
public class DailyUnlimitedActItemVo {
    public var index:uint;
    public var dataVo:DailyVo;

    public function get list():Array {
        var xList:Vector.<IDaily_root_act1_item> = ConfigManager.instance.mission_daily.root.act1.item;
        var item:IDaily_root_act1_item;
        var result:Array = [];
        var status:Array = dataVo.stateList;
        var index:uint = status.indexOf(1);
        var week:uint = ServiceTime.getInstance().nowDate.getDay();
        for (var i:uint = 0; i < xList.length; i++) {
            item = xList[i];
            if ((item.index) == index) {
                result.unshift(item);
            } else {
                result.push(item);
            }
        }
        return result;
    }

    public function get item():IDaily_root_act1_item {
        return list[index];
    }


    public function get name():String {
        if (!item)return "";

        var str:String = dataVo.getLangTxt(item.name);
        switch (id) {
            case 4:
                if (dataVo.boos1) {
                    str = dataVo.boos1.name;
                    if (dataVo.boss1Name && dataVo.boss1Name != "") {
                        str = dataVo.boss1Name;
                    }
                }
                break;
            case 5:
                if (dataVo.boos2) {
                    str = dataVo.boos2.name;
                    if (dataVo.boss2Name && dataVo.boss2Name != "") {
                        str = dataVo.boss2Name;
                    }
                }
                break;
        }
        return str;
    }

    public function get id():uint {
        if (!item)return 0;
        return (item.index);
    }

    public function get nameStr():String {
        return StringUtil.substitute(HtmlUtil.fontSizeAndColor("{0}", '#FFFF00', CSSStyleCfg.FontSize_1), [name]);
    }

    public function get time():String {
        if (!item) return "";
        var str:String = dataVo.getLangTxt(item.time);
        return str;
    }

    public function get timeStr():String {
        return HtmlUtil.color(time, '#FFFFCC');
    }

    public function get award():String {
        if (!item)return "";
        var str:String = dataVo.getLangTxt(item.award) + "";
        return str;
    }

    public function get awardStr():String {
        return HtmlUtil.color(award, '#00FF00');
    }

    public function get tipStr():String {
        return StringUtil.substitute("<span>{0}</span>&nbsp;&nbsp;&nbsp;&nbsp;<span>{1}<br/>{2}</span>", [nameStr, timeStr, awardStr]);
    }

    public function get state():uint {
        var arr:Array = dataVo.stateList;
        var n:uint = arr[id];
        return n;
    }

    public function get sendState():uint {
        var n:uint = state;
        switch (id) {
            // case 3:
            // if (state == 3) {
            // n = 1;
            // }
            // break;
            case 4:
            case 5:
                if (state == 1 && dataVo.bossLeftSoul == 10) {
                    n = 1;
                } else {
                    n = 0;
                }
                break;
            default:
                n = 1;
                break;
        }
        return n;
    }

    public function get stateStr():String {
        var str:String = "";
        str = StringUtil.substitute("<p align='right'>{0}</p>", [
                    [LangTxt.NO_START, LangTxt.DAILY_ING, LangTxt.BEEN_OVER, LangTxt.JOINING][state]]
        );
        return str;
    }

    public function get bmp():String {
        if (!item)return "";
        var str:String = (item.bmp);
//        switch (id) {
//            case 4:
//            case 5:
//                str = bossBmp;
//                break;
//        }
        return str;
    }

    public function get bmpUrl():String {
        if (!bmp) {
            return "";
        }
        return StringUtil.substitute(StaticConfig.httpServer + "{0}", [bmp]);
    }

    public function get buttonType():uint {
        if (!item)return 0;
        var n:uint = (item.btn);
        return n;
    }

    public function get buttonStr():String {
        var str:String = [LangTxt.TRANS, LangTxt.TRANS, LangTxt.VIEW][buttonType];
        switch (id) {
            case 3:
                if (state == 3) {
                    str = LangTxt.SIGNUP;
                }
                break;
            case 6:
                if (state == 3) {
                    str = LangTxt.SIGNUP;
                }
                break;
        }
        return str;
    }

    public function get build():uint {
        var n = parseInt(item.build);
        switch (id) {
            case 4:
            case 5:
                n = dataVo.buildId;
                break;
        }
        return n;
    }

    public function get bossList():Array {
        return (item.list).split(",");
    }

    public function get bossId():uint {
        var n:uint = 0;
        switch (id) {
            case 4:
                n = dataVo.boss1Id;
                break;
            case 5:
                n = dataVo.boss2Id;
                break;
        }
        return n;
    }

    public function get boss():TaskNpcStruct {
        var struct:TaskNpcStruct;
        struct = ShellUtils.npcById(bossId);
        return struct;
    }

    public function get isBossing():Boolean {
        return dataVo.bossId != 0;
    }

    public function get bossBuildId():int
    {
        return dataVo.buildId;
    }

    public function get bossIndex():int {
        var n:int = -1;
        if (bossList) {
            n = bossList.indexOf((bossId));
        }
        return n;
    }

    public function get bossBmpList():Array {
        return (item.bmp).split(",");
    }

    public function get bossBmp():String {
        var str:String = "";
        if (bossBmpList) {
            if (bossIndex > -1) {
                str = bossBmpList[bossIndex];
            }
        }
        return str;
    }
}
}
