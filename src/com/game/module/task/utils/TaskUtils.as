package com.game.module.task.utils {

import com.game.module.map.vo.MapModel;
import com.game.module.task.struct.TaskNpcStruct;
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskVO;
import com.game.vo.GoodsVO;
import com.game.vo.TaskCfg;

import config.mission.configmodule.IConfigmodule_module_item;

import globals.ConfigLocator;

import lang.LangArrayTxt;
import lang.LangHtmlTxt;
import lang.LangTxt;

import net.data.structs.task.NpcInteractStruct;

import com.game.utils.ShellUtils;
import utils.StringUtil;

/**
 * @author john
 */
public class TaskUtils {
    public static var TEMP_TASK_TRACK:String = LangTxt.TEMP_TASK_TRACK;
    /**
     * 任务向导
     * 0:寻路
     * 1:面板
     * 2:传送
     */
    /*
     * args:
     * 0:功能
     * 1:功能参数
     * 2.描述
     */
    public static var TEMP_HTML_CMD:String = LangTxt.TEMP_HTML_CMD;
    public static var TEMP_MAIN_DESC:String = LangHtmlTxt.TEMP_MAIN_DESC;
    public static var TEMP_MAIN_FLOW:String = LangHtmlTxt.TEMP_MAIN_FLOW;
    public static var TEMP_MAIN_AWARD:String = LangHtmlTxt.TEMP_MAIN_AWARD;
    public static var TEMP_MAIN_AWARD_ITEM:String = LangHtmlTxt.TEMP_MAIN_AWARD_ITEM;
    // 地址-描述
    public static var TEMP_TASK_PLANS:Array = [];
    public static var TEMP_TASK_TRACK_PATH:String = LangTxt.TEMP_TASK_TRACK_PATH;
    public static var TEMP_TASK_TRACK_PATH_01:String = LangTxt.TEMP_TASK_TRACK_PATH_01;
    public static var TEMP_TASK_PLAN_TYPE01:String = LangTxt.TEMP_TASK_PLAN_TYPE01;
    public static var TEMP_TASK_PLAN_TYPE02:String = LangTxt.TEMP_TASK_PLAN_TYPE02;
    public static var TEMP_TASK_PLAN_TYPE03:String = LangTxt.TEMP_TASK_PLAN_TYPE03;
    public static var TEMP_TASK_PLAN_TYPE04:String = LangTxt.TEMP_TASK_PLAN_TYPE04;
    public static var TEMP_TASK_PLAN_TYPE05:String = LangTxt.TEMP_TASK_PLAN_TYPE05;
    public static var TEMP_TASK_PLAN_TYPE06:String = LangTxt.TEMP_TASK_PLAN_TYPE06;
    public static var TEMP_TASK_PLAN_TYPE07:String = LangTxt.TEMP_TASK_PLAN_TYPE07;
    public static var TEMP_TASK_PLAN_TYPE08:String = LangTxt.TEMP_TASK_PLAN_TYPE08;
    public static var TEMP_TASK_PLAN_TYPE09:String = LangTxt.TEMP_TASK_PLAN_TYPE09;
    public static var TEMP_TASK_PLAN_TYPE10:String = LangTxt.TEMP_TASK_PLAN_TYPE10;
    public static var TEMP_TASK_PLAN_TYPE11:String = LangTxt.TEMP_TASK_PLAN_TYPE11;
    public static var TEMP_TASK_PLAN_TYPE12:String = LangTxt.TEMP_TASK_PLAN_TYPE12;
    public static var TEMP_TASK_PLAN_TYPE13:String = LangTxt.TEMP_TASK_PLAN_TYPE13;
    public static var TEMP_TASK_PLAN_TYPE14:String = LangTxt.TEMP_TASK_PLAN_TYPE14;
    public static var TEMP_TASK_TYPE:Array = LangArrayTxt.TEMP_TASK_TYPE;
    public static var TEMP_TASK_STATE:Array = LangArrayTxt.TEMP_TASK_STATE;
    public static var TEMP_TASK_STEP:String = "({0}/{1})";//LangTxt.TEMP_TASK_STEP;
    public static var TASK_CYC_BASE:uint = 25;
    public static var TASK_CYC_LV_FACTOR:Array = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50];
    public static var TASK_CYC_AWARD_FACTOR:Array = [[0, 7, 10, 14, 21, 36], [0, 600, 800, 1000, 1300, 1600]];
    public static var awardTypes:Array = LangArrayTxt.awardTypes;

    public static function getNpcs(__mapmodel:MapModel, buildId:uint):Array {
        var list:Array = ShellUtils.npcsInBuild(__mapmodel, buildId);
        var item:TaskNpcStruct;
        var i:uint;
        var _npcs:Array = [];
        for (i = 0; i < list.length; i++) {
            item = list[i] as TaskNpcStruct;
            _npcs.push(item);
        }
        return _npcs;
    }

    public static function getNpcIdList(__mapmodel:MapModel, buildId:uint):Array {
        var arr:Array = [];
        var item:TaskNpcStruct;
        var npcs:Array = getNpcs(__mapmodel, buildId);
        for (var i:uint = 0; i < npcs.length; i++) {
            item = npcs[i] as TaskNpcStruct;
            arr[i] = item.id;
        }
        return arr;
    }
    public static function toTaskSort(arr:Array):Array {
        var taskVo:TaskCfg;
        var lists:Array;
        var list:Array;
        var i:uint;
        lists = [];
        for (i = 0; i < arr.length; i++) {
            taskVo = ConfigLocator.getInstance().taskDic.get(arr[i]) as TaskCfg;
            if (taskVo) {
                if (!lists[taskVo.type]) lists[taskVo.type] = [];
                list = lists[taskVo.type];
                list.push(taskVo.id);
            }
        }
        arr = [];
        for (i = 0; i < lists.length; i++) {
            list = lists[i];
            if (list)
                arr = arr.concat(lists[i]);
        }
        return arr;
    }

    public static function toTaskTrackCurHtmlList(__mapmodel:MapModel, taskVo:TaskVO, state:Boolean = false):String {
        var html:String;
        var flow:Array = [];
        if (taskVo.state!=TaskState.PENDING ) {
            var strflow:String = StringUtil.substitute((state ? TEMP_TASK_TRACK_PATH_01: TEMP_TASK_TRACK_PATH), [ShellUtils.cityById(__mapmodel, taskVo.cfg.npcFinish.buildId)[(state ? "name" : "colorName")], ShellUtils.buildById(__mapmodel, taskVo.cfg.npcFinish.buildId)[(state ? "name" : "colorName")], taskVo.cfg.npcFinish[(state ? "name" : "colorName")]])
            flow[0] = StringUtil.substitute(TEMP_HTML_CMD, [0, [taskVo.cfg.npcFinish.buildId, taskVo.taskId, taskVo.cfg.npcFinishID].join(","), strflow]);
        } else {
                flow = toTaskFlow(taskVo, state);
        }
        html = StringUtil.substitute(TEMP_TASK_TRACK, [TEMP_TASK_TYPE[taskVo.cfg.type], taskVo.cfg.name, "(" + TEMP_TASK_STATE[taskVo.state] + ")", flow.join("<br/>&nbsp;")]);
        return html;
    }

    public static function toTaskTrackAccHtmlList(__mapmodel:MapModel, taskVo:TaskCfg, state:Boolean = false):String {
        var html:String;

        var flow:Array = [];

        if (taskVo) {
            var strflow:String = StringUtil.substitute((state ? TEMP_TASK_TRACK_PATH_01: TEMP_TASK_TRACK_PATH), [ShellUtils.cityById(__mapmodel, taskVo.npcPublish.buildId)[(state ? "name" : "colorName")], ShellUtils.buildById(__mapmodel, taskVo.npcPublish.buildId)[(state ? "name" : "colorName")], taskVo.npcPublish[(state ? "name" : "colorName")]]);

            flow[0] = StringUtil.substitute(TEMP_HTML_CMD, [0, [taskVo.npcPublish.buildId, taskVo.id, taskVo.npcPublishID].join(","), strflow]);
            // html = substitute(TEMP_TASK_TRACK, TEMP_TASK_TYPE[taskVo.type], taskVo.name, "", substitute(TEMP_HTML_CMD, 0, taskVo.npcPublish.buildId, substitute(TEMP_TASK_TRACK_PATH, ShellUtils.cityById(taskVo.npcPublish.buildId).name, ShellUtils.buildById(taskVo.npcPublish.buildId).name, taskVo.npcPublish.name)));
        }
        html = StringUtil.substitute(TEMP_TASK_TRACK, [TEMP_TASK_TYPE[taskVo.type], taskVo.name, "", flow.join("<br/>")]);


        return html;
    }

    public static function toTaskTrackCycHtmlList(__mapmodel:MapModel, taskVo:TaskCfg, state:Boolean = false):String {
        var html:String = "";

        var flow:Array = [];
        if (taskVo) {
            var strflow:String = StringUtil.substitute((state ? TEMP_TASK_TRACK_PATH_01: TEMP_TASK_TRACK_PATH), [ShellUtils.cityById(__mapmodel, taskVo.npcPublish.buildId).name, ShellUtils.buildById(__mapmodel, taskVo.npcPublish.buildId).name, taskVo.npcPublish.name])
            flow[0] = StringUtil.substitute(TEMP_HTML_CMD, [0, [taskVo.npcPublish.buildId, taskVo.id, taskVo.npcPublishID].join(","), strflow]);
            // html = substitute(TEMP_TASK_TRACK, TEMP_TASK_TYPE[taskVo.type], taskVo.name, "", substitute(TEMP_HTML_CMD, 0, taskVo.npcPublish.buildId, substitute(TEMP_TASK_TRACK_PATH, ShellUtils.cityById(taskVo.npcPublish.buildId).name, ShellUtils.buildById(taskVo.npcPublish.buildId).name, taskVo.npcPublish.name)));
            html = StringUtil.substitute(TEMP_TASK_TRACK, [TEMP_TASK_TYPE[taskVo.type], taskVo.name, "", flow.join("<br/>")]);
        }


        return html;
    }




    public static function toTaskTrackCurHtmlListArray(__mapmodel:MapModel, taskVo:TaskVO, state:Boolean = false):Array {

        var flow:Array = [];
        if (taskVo.state!=TaskState.PENDING ) {
            var strflow:String = StringUtil.substitute((state ? TEMP_TASK_TRACK_PATH_01: TEMP_TASK_TRACK_PATH), [ShellUtils.cityById(__mapmodel, taskVo.cfg.npcFinish.buildId)[(state ? "name" : "colorName")], ShellUtils.buildById(__mapmodel, taskVo.cfg.npcFinish.buildId)[(state ? "name" : "colorName")], taskVo.cfg.npcFinish[(state ? "name" : "colorName")]])

            flow[0] = StringUtil.substitute(TEMP_HTML_CMD, [0, [taskVo.cfg.npcFinish.buildId, taskVo.taskId, taskVo.cfg.npcFinishID].join(","), strflow]);
        } else {
            flow = toTaskFlow(taskVo, state);
        }
        //"("+taskVo.cfg.id+")"+
        return [taskVo.cfg.name+ "(" + TEMP_TASK_STATE[taskVo.state] + ")", flow.join("<br/>&nbsp;")];
    }

    public static function toTaskTrackAccHtmlListArray(__mapmodel:MapModel, taskVo:TaskCfg, state:Boolean = false):Array {
        var flow:Array = [];

        if (taskVo) {
            var strflow:String = StringUtil.substitute((state ? TEMP_TASK_TRACK_PATH_01: TEMP_TASK_TRACK_PATH), [ShellUtils.cityById(__mapmodel, taskVo.npcPublish.buildId)[(state ? "name" : "colorName")], ShellUtils.buildById(__mapmodel, taskVo.npcPublish.buildId)[(state ? "name" : "colorName")], taskVo.npcPublish[(state ? "name" : "colorName")]]);

            flow[0] = StringUtil.substitute(TEMP_HTML_CMD, [0, [taskVo.npcPublish.buildId, taskVo.id, taskVo.npcPublishID].join(","), strflow]);
            // html = substitute(TEMP_TASK_TRACK, TEMP_TASK_TYPE[taskVo.type], taskVo.name, "", substitute(TEMP_HTML_CMD, 0, taskVo.npcPublish.buildId, substitute(TEMP_TASK_TRACK_PATH, ShellUtils.cityById(taskVo.npcPublish.buildId).name, ShellUtils.buildById(taskVo.npcPublish.buildId).name, taskVo.npcPublish.name)));
        }

        return [taskVo.name+ "", flow.join("<br/>")];
    }

    public static function toTaskTrackCycHtmlListArray(__mapmodel:MapModel, taskVo:TaskCfg, state:Boolean = false):Array {
        var html:String = "";

        var flow:Array = [];
            var strflow:String = StringUtil.substitute((state ? TEMP_TASK_TRACK_PATH_01: TEMP_TASK_TRACK_PATH), [ShellUtils.cityById(__mapmodel, taskVo.npcPublish.buildId).name, ShellUtils.buildById(__mapmodel, taskVo.npcPublish.buildId).name, taskVo.npcPublish.name])
            flow[0] = StringUtil.substitute(TEMP_HTML_CMD, [0, [taskVo.npcPublish.buildId, taskVo.id, taskVo.npcPublishID].join(","), strflow]);
            // html = substitute(TEMP_TASK_TRACK, TEMP_TASK_TYPE[taskVo.type], taskVo.name, "", substitute(TEMP_HTML_CMD, 0, taskVo.npcPublish.buildId, substitute(TEMP_TASK_TRACK_PATH, ShellUtils.cityById(taskVo.npcPublish.buildId).name, ShellUtils.buildById(taskVo.npcPublish.buildId).name, taskVo.npcPublish.name)));



        return  [TEMP_TASK_TYPE[taskVo.type]+ taskVo.name,  flow.join("<br/>")];
    }


    // 0  1   2   3    4    5   6    7
    // 黄？>黄！>蓝？>蓝！>绿！>绿？>灰？
    /*
     * 可提交,可接,将领提交,将领接,循环提交,循环接,进行中
     */
    public static function toTaskIcon(curTaskList:Array, accTaskList:Array, taskVo:TaskVO):uint {
        var icon:uint = 0;

        if (taskVo) {
            if (curTaskList.indexOf(taskVo.taskId) > -1) {
                switch (taskVo.cfg.type) {
                    case 1:
                    case 2:
                    case 3:
                        return taskVo.state!=TaskState.PENDING ? 1 : 7;
                        break;
                }
            }
            if (accTaskList.indexOf(taskVo.taskId) > -1) {
                return 2;
            }
        }
        // if (UserData.instance.cycTaskList.indexOf(id) > -1) {
        // icon = 0;
        // } else
        // if (UserData.instance.accTaskList.indexOf(id) > -1) {
        // icon = 2;
        // }else if (UserData.instance.curTaskList.indexOf(id) > -1) {
        // taskVo = ConfigLocator.getInstance().taskDic[id] as TaskVO;
        // if (taskVo) {
        // switch(taskVo.type) {
        // case 1:
        // icon = taskVo.state ? 1 : 7;
        // break;
        // case 3:
        // icon = taskVo.state ? 1 : 7;
        // break;
        // }
        // }
        // }
        return 0;
    }

    // 0  1   2   3    4    5   6    7
    // 黄？>黄！>蓝？>蓝！>绿！>绿？>灰？

    public static function toNpcIcon(curTaskList:Vector.<TaskVO>, accTaskList:Array, cycTaskList:Array, npcId:uint):Array {
        var icons:Array = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
        var taskVo:TaskCfg;
        var taskId:uint;
        curTaskList.length>0&&curTaskList.forEach(function (__taskVo:TaskVO) {

            if (__taskVo) {
                switch (__taskVo.cfg.type) {
                    case 0:
                        break;
                    case 1:
                    case 2:
                        if (__taskVo.cfg.npcFinishID == npcId) {
                            if (__taskVo.state!=TaskState.PENDING ) {
                                icons[2] = 1;
                            } else {
                                icons[7] = 7;
                            }
                        }
                        break;
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                        if (__taskVo.cfg.npcFinishID== npcId) {
                            if (__taskVo.state!=TaskState.PENDING) {
                                icons[4] = 4;
                            }
                        }
                        break;
                }
            }
        });
        accTaskList.length>0&&accTaskList.forEach(function (taskId:int) {
            taskVo = ConfigLocator.getInstance().taskDic.get(taskId) as TaskCfg;
            if (taskVo) {
                if (taskVo.npcPublishID == npcId) {
                    icons[1] = 2;
                }
            }
        })
        cycTaskList.length>0&&cycTaskList.forEach(function (taskId:int) {
            taskVo = ConfigLocator.getInstance().taskDic.get(taskId) as TaskCfg;
            if (taskVo) {
                if (taskVo.npcPublishID == npcId) {
                    icons[3] = 3;
                }
            }
        });

        return icons;
    }


    public static function toTaskDesc(id:uint):String {
        var desc:String;
        var taskVo:TaskCfg;
        var reg:RegExp;
        var str:String;
        var tar:String;
        var src:String;
        var args:Array;
        var type:uint;
        var val:uint;
        desc = "";
        reg = /\[(.+?)\]/g;
        taskVo = ConfigLocator.getInstance().taskDic.get(id) as TaskCfg;
        if (taskVo) {
            desc = taskVo.describe;
            //todo
            while ((reg.test(desc)) && (str = reg.exec(desc)[0]) != null) {
                args = (str).split(",");
                tar = args[0];
                args = (args[1]).split(":");
                type = args[0];
                val = args[1];
                switch (type) {
                    case 1:
                        // NPC
                        src = "";
                        break;
                    case 2:
                        // 据点
                        break;
                    case 3:
                        break;
                    case 4:
                        break;
                }
            }
        }
        return desc;
    }

    /**
     * 1:对话;2:杀怪;3:采集;4:护送;5:使用;6:收集;7:送信;8:探索;9:特殊;10:特殊;
     */
    public static function toTaskFlow(taskVo:TaskVO, state:Boolean = false):Array {
        var arr:Array;
        var flag:int;
        var i:int;
        var n:uint;
        var args:Array;
        var npc:TaskNpcStruct;
        var goods:GoodsVO;
        arr = [];
        if (taskVo) {
            switch (taskVo.cfg.klass) {
                case 1:
                {
                    arr = [];
                    args = [];
                    break;
                }

                case 2:
                {
                    arr = [];
                    args = [];
                    flag = taskVo.cfg.step[0];
                    n = Math.floor((taskVo.cfg.step.length - 1) / 2);
                    for (i = 0; i < n; i++) {
                        npc = ShellUtils.npcById(taskVo.cfg.step[i * 2 + 1]) as TaskNpcStruct;
                        taskVo.monsters = npc.id;
                        args[1] = taskVo.cfg.step[i * 2 + 2];
                        args[2] = taskVo.plan[i];
                        // npc["name"];
                        args[3] = StringUtil.substitute(TEMP_HTML_CMD, [0, ([npc.buildId, taskVo.taskId, npc.id] as Array).join(","), npc[(state ? "name" : "colorName")]]);
                        arr[i] = StringUtil.substitute(TEMP_TASK_PLAN_TYPE02, [args[3], StringUtil.substitute(TEMP_TASK_STEP, [args[2], args[1]])]);
                    }
                    break;
                }

                case 3:
                {
                    arr = [];
                    args = [];
                    break;
                }

                case 4:
                {
                    arr = [];
                    args = [];
                    break;
                }

                case 5:
                {
                    arr = [];
                    args = [];
                    break;
                }

                case 6:
                {
                    arr = [];
                    args = [];
                    args[0] = taskVo.cfg.step[0];
                    args[1] = taskVo.cfg.step[1];
                    npc = ShellUtils.npcById(args[0]) as TaskNpcStruct;
                    goods = ConfigLocator.getInstance().goodsList.get(args[1]) as GoodsVO;
                    args[3] = StringUtil.substitute(TEMP_HTML_CMD, [0, ([npc.buildId, taskVo.taskId, npc.id] as Array).join(","), npc[(state ? "name" : "colorName")]]);
                    arr[0] = StringUtil.substitute(TEMP_TASK_PLAN_TYPE06, [args[3], goods.name, taskVo.plan[0], taskVo.cfg.step[2]]);
                    break;
                }

                case 7:
                    try {
                        arr = [];
                        args = [];
                    } catch (err:Error) {
                    }
                    break;
                case 8:
                {
                    arr = [];
                    args = [];
                    break;
                }
                case 9:
                {
                    arr = [];
                    args = [];
                    arr[0] = StringUtil.substitute(TEMP_HTML_CMD, [1, taskVo.taskId, StringUtil.substitute(TEMP_TASK_PLAN_TYPE09, [taskVo.cfg.describe])]);
                    break;
                }
                case 10:
                {
                    arr = [];
                    args = [];
                    arr[0] = StringUtil.substitute(TEMP_HTML_CMD, [1, taskVo.taskId, StringUtil.substitute(TEMP_TASK_PLAN_TYPE09, [taskVo.cfg.describe])]);
                    break;
                }
                case 19:
                {
                    arr = [];
                    args = [];
                    var  goods_name= StringUtil.substitute(TEMP_HTML_CMD, [5,taskVo.taskId, "锁妖塔"]);
                    arr[0] = StringUtil.substitute(TEMP_TASK_PLAN_TYPE07, [goods_name,   taskVo.cfg.step[0]]);
                    break;
                }
                default:
                {
                    var describe={
                         11 :"穿戴装备",
                         12 :"分解装备",
                         13 :"强化装备",
                         14 :"穿戴技能",
                         15 :"升级技能",
                         16 :"穿戴法宝",
                         17 :"强化法宝",
                         18 :"招募散仙",
                         20 :"加入阵营"
                    };
                    arr = [];
                    args = [];
                    arr[0] = StringUtil.substitute(TEMP_HTML_CMD, [5, taskVo.taskId, StringUtil.substitute(TEMP_TASK_PLAN_TYPE09, [describe[taskVo.cfg.klass]])]);
                    break;
                }
            }
        }
        return arr;
    }

    public static function toTaskAward(id:uint):Array {
        var awards:Array;
        var taskVo:TaskCfg;
        awards = [];
        taskVo = ConfigLocator.getInstance().taskDic.get(id) as TaskCfg;
        if (taskVo) {
            if (taskVo.awardExp > 0) {
                awards.push(StringUtil.substitute(TEMP_MAIN_AWARD_ITEM, [awardTypes[0], taskVo.awardExp]));
            }
            // if (taskVo.awardCoin != 0) {
            // awards.push(substitute(TEMP_MAIN_AWARD_ITEM, awardTypes[1], taskVo.awardCoin));
            // }
            if (taskVo.awardTael>0) {
                awards.push(StringUtil.substitute(TEMP_MAIN_AWARD_ITEM, [awardTypes[1], taskVo.awardTael]));
            }
            // if (taskVo.awardFriend != 0) {
            // awards.push(substitute(TEMP_MAIN_AWARD_ITEM, awardTypes[3], taskVo.awardFriend));
            // }
            // if (taskVo.awardAchievement != 0) {
            // awards.push(substitute(TEMP_MAIN_AWARD_ITEM, awardTypes[4], taskVo.awardAchievement));
            // }
            if (taskVo.awardDesc != "") {
                awards.push(StringUtil.substitute(TEMP_MAIN_AWARD_ITEM, [awardTypes[3], LangTxt.TASK_VIEW_3]));
            }
            switch (taskVo.type) {
                case 4:
                    awards = [];
                    awards.push(StringUtil.substitute(TEMP_MAIN_AWARD_ITEM, [awardTypes[0], LangTxt.TASK_VIEW_4]));
                    break;
                case 5:
                    awards = [];
                    awards.push(StringUtil.substitute(TEMP_MAIN_AWARD_ITEM, [awardTypes[1], LangTxt.TASK_VIEW_5]));
                    break;
            }
        }
        return awards;
    }

    public static function toTaskAwardGoods(id:uint):Array {
        var result:Array;
        var awards:Array;
        var n:uint;
        var taskVo:TaskCfg;
        result = [];
        taskVo = ConfigLocator.getInstance().taskDic.get(id) as TaskCfg;
        if (taskVo) {
            awards = taskVo.awardTools;
           // awards = [1, 2, 3, 1, 2, 3, 1, 2, 3, 1, 2, 3];
            n = awards.length / 3;
            for (var i:uint = 0; i < n; i++) {
                result.push({
                    index: i,
                    itemid: (awards[i * 3 + 0]),
                    itemNum: awards[i * 3 + 1],
                    type: awards[i * 3 + 2]
                });
            }
        }
        return result;
    }

    public static function toNpcFunction(npcId:uint):Array {
        var arr:Array = [];
        var npcFunction:Object;
        var funcs:Array;
        npcFunction = ConfigLocator.getInstance().npcFunctionDic.get(npcId) as Object;
        if (npcFunction) {
            funcs = String(npcFunction["func"]).split(",");
            arr = toNpcTalks(funcs);
        }
        return arr;
    }

    public static function toNpcTalks(funcs:Array):Array {
        var arr:Array = [];
        var talk:NpcInteractStruct;
        var module:IConfigmodule_module_item;
        arr = [];
        for (var i:int = 0; i < funcs.length; i++) {
            var funcId:uint = funcs[i];

            module = ConfigLocator.getInstance().moduleDic.get(funcId);
            if (module) {
                talk = new NpcInteractStruct();
                talk.interactToken = 0;
                talk.interactId = module.id;
                talk.interactType = module.win;
                talk.interactMsg = module.name;
                arr.push(talk);
            }
        }
        return arr;
    }

    public static function toTaskCycAward(type:uint, color:uint, lv:uint):Number {
        var n:Number = 0;
        switch (type) {
            case 0:
                var value1:uint = Math.floor(Math.min(lv, 99) / 10);
//					if (lv < 30) {
//						n = TASK_CYC_AWARD_FACTOR[type][color] * lv + TASK_CYC_BASE;
//					} else {
                n = TASK_CYC_AWARD_FACTOR[type][color] * (value1 * 5 * (lv - 10) + TASK_CYC_BASE);
//					}
                break;
            case 1:
                n = TASK_CYC_AWARD_FACTOR[type][color];
                break;
        }
        // 活动期间 奖励双倍
        //if(UserData.instance.timeAble("2013.1.31-2013.2.6")&&[4,5].indexOf(StaticConfig.platflag)>-1)
        //	return n*2 ;
        return n;
    }


}
}