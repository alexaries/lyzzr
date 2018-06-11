package com.game.module.task.vo.item {

import com.game.module.daily.vo.DailyVo;

import config.ConfigManager;
import config.mission.daily.IDaily_root_act_item;
import config.mission.daily.IDaily_root_time_item;
import config.mission.dailyLang.IDailyLang_lang;

import lang.LangTxt;

import utils.ArrayUtil;
import utils.StringUtil;

/**
 * @author john
 */
public class DailyLimitActItemVo {
    public var index:uint;
    public var dataVo:DailyVo;

    public function get list():Vector.<IDaily_root_act_item> {

        return ConfigManager.instance.mission_daily.root.act.item
    }

    public function get item():IDaily_root_act_item {
        return list[index];
    }

    public function get name():String {

        var _lang:IDailyLang_lang = ArrayUtil.find(ConfigManager.instance.mission_dailyLang.lang, function (l:IDailyLang_lang) {
            return l.id == item.name;
        });
        return _lang.txt;
    }

    public function get nameStr():String {
        return StringUtil.substitute("<span style='color:#feffec;font-size:30px'>{0}</span>", [name]);
    }

    public function get buttonType():uint {
        return (item.btn);
    }

    public function get buttonStr():String {
        return [LangTxt.VIEW, LangTxt.TRANS, LangTxt.OPEN][buttonType];
    }

    public function get build():int {
        return item.build;
    }

    public function getStr(n:uint):String {
        return StringUtil.substitute("<p align='center'><span style='color:#ffff00;font-size:30px'>{0}</span></p>", [n]);
    }

    public function get dayIndex():uint {
        var n:uint = 0;
        switch (index) {
            case 0:
                n = 1;
                break;
            case 1:
                n = 3;
                break;
        }
        return n;
    }

    public function get dayIndexValue():String {
        return dayIndex > 0 ? dataVo.dayValueList[dayIndex] : "";
    }

    public function get dayIndexValueString():String {
        return StringUtil.substitute("<p align='center'>{0}</p>", [dayIndexValue]);
    }

}
}
