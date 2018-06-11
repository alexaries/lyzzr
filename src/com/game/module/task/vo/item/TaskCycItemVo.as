package com.game.module.task.vo.item {
import com.game.module.task.utils.TaskUtils;
import com.game.utils.ShellUtils;
import com.game.vo.TaskCfg;

import globals.ConfigLocator;

import lang.LangTxt;

import utils.StringUtil;

/**
 * @author john
 */
public class TaskCycItemVo {
    public var data:Object;
    public var id:uint;
    public var color:uint;
    public var pos:int;

    public var cmd:uint;
    public var award:String;
    public var vipCfgs:Array;
    public var canCycTaskFinish:Boolean;

    public function get task():TaskCfg {
        var task:TaskCfg;
        task = ConfigLocator.getInstance().taskDic.get(id) as TaskCfg;
        return task;
    }

    public function setAward(level:int):void {
        var n:Number = 0;
        if (task) {
            n = TaskUtils.toTaskCycAward(task.type - 4, color, level);
        }
        award =n+"";
    }

    public function get unit():String {
        var str:String = "";
        if (task) {
            str = [LangTxt.EXP, LangTxt.SILVER][task.type - 4];
        }
        return str;
    }

    public function get labName() : String {
        var str : String = "";
        if (task) {
            str = StringUtil.substitute("<font color='#{0}' >{1}</font>", [ShellUtils.SYS_COLOR[color - 1],task.name]);
        }
        return str;
    }

    public function get labAward() : String {
        var str : String = "";
        if (task) {
            str = StringUtil.substitute(LangTxt.TASK_VIEW_12, [award, unit]);
        }
        return str;
    }

    public function get taDesc() : String {
        var str : String = "";
        if (task) {
            str = StringUtil.substitute(LangTxt.TASK_VIEW_13, [task.describe]);
        }
        return task.describe;
    }
}
}
