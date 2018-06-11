/**
 * Created by huangcb on 2018/3/16.
 */
package com.game.module.task.vo {
import com.game.module.task.struct.TaskNpcStruct;
import com.game.utils.ShellUtils;

import config.ConfigManager;
import config.mission.taskTips.ITaskTipsCfg;

import lang.LangArrayTxt;

import utils.ArrayUtil;
import utils.HtmlUtil;

public class TaskSGLKlass {
   /*
    1	升级	升到XX等级	等级数字，如10,20,30
    2	打怪	打怪	怪物groupid，如30001
    3	战斗力	达到XX战斗力	战斗力数字，如66666
    4	仙战掠夺	仙战玩法中掠夺1次	1
    5	仙战占城	仙战玩法中占领城池据点1次	1
    6	城主与宣战	仙战玩法中成为城主或发起宣战1次	1
    7	收取仙石	仙战玩法中收取仙石1次	1
    8	累计仙石	仙战玩法中当日累计获得XX仙石	仙石数量，如666
    9	阵图	挑战阵图1次	1
    10	决战之地	挑战决战之地1次	1
    11	九疑鼎	使用1次九疑鼎	1
    12	分解物品	分解物品	1
    13	强化装备	强化装备	1
    14	穿戴技能	穿戴技能	1
    15	升级技能	升级技能	1
    16	穿戴法宝	穿戴法宝	1
    17	强化法宝	强化法宝	1
    18	招募散仙	招募散仙	1
    19	锁妖塔通过第N层	锁妖塔通过第N层	层数，如1,5,10，最高曾经打败过这一层便可完成
    20	加入阵营	加入阵营	1
    21	斗剑	参与斗剑1次	1
    22	斗剑历练	斗剑历练1次	1
    23	好友邀请	发起好友邀请1次	1
    24	帮会	加入或创建一个帮会	1
    25	洗炼	洗炼主角1次	1
    26	技能符文	升级1次技能符文	1
    27	宝石合成	宝石合成1次	1
    28	宝石镶嵌	镶嵌宝石N个	主角和上阵散仙的宝石个数，如1,5,6
*/
    static  public function getTips(vo:TaskVO):Array {

        /*
        var tipCfg:ITaskTipsCfg=ArrayUtil.find( ConfigManager.instance.mission_taskTips.taskTipsCfg,function(c:ITaskTipsCfg){
            return c.id==vo.cfg.klass;
        });
        var msg:String=tipCfg.tips;
        if(msg.indexOf("{0}")!=-1){
            if(tipCfg.id==2){
                var npc :TaskNpcStruct= ShellUtils.npcById(vo.cfg.step[0]) as TaskNpcStruct;
                msg=msg.replace("{0}",npc.name);
            }else{
                msg=msg.replace("{0}",vo.plan[0])
            }

        }
      */
        var txtName:String = "<span style='color:#f3ce0b;font-size:35;'>"+vo.cfg.name+"</span>";
        if(vo.state == 0){
            //未完成 红色
            txtName += "<span style='color:#ff0000;font-size:35;'>（"+ LangArrayTxt.TEMP_TASK_STATE[vo.state]+"）</span>";
        }else if(vo.state == 1){
            //完成 绿色
            txtName += "<span style='color:#00ff00;font-size:35;'>（"+ LangArrayTxt.TEMP_TASK_STATE[vo.state]+"）</span>";
        }else{
            txtName += "<span style='color:#f3ce0b;font-size:35;'>（"+ LangArrayTxt.TEMP_TASK_STATE[vo.state]+"）</span>";
        }
        return [txtName,vo.cfg.describe];
    }

    static  public function getClanTaskTips(vo:TaskVO):Array {
        var sta:String = HtmlUtil.color("("+ LangArrayTxt.TEMP_TASK_STATE[vo.state]+")", "#99ffff") + "<br>";
        return [vo.cfg.name,vo.cfg.describe+sta];
    }


}
}
