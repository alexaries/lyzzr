package com.game.module.map.vo {
import net.consts.StaticConfig;

//地图显示  使用
public class NpcBaseInfoVO {
    public var id:uint;
    public var name:String;
    public var title:String;

    public function NpcBaseInfoVO() {
        super();
    }

    //状态，是不是有任务
    public var status:int = 0;
    //查找此npc的buildID
    public var buildID:int = -1;

    public var level:uint = 0;

    /**头像编号*/
    public var imgID:int;
    /**模型编号*/
    public var roleID:String = "";
    /**默认对话*/
    public var info:String = "";

    /**
     * 功能行为id
     *  无行为    无特别功能行为的怪物    0x0000  <br>
     *    普通任务npc    普通任务面板    0x0001<br>
     *    采集的物品npc    采集任务的获取物品    0x0002<br>
     *    循环任务npc    循环任务面板，多个颜色的任务，有刷新，付费多次刷新，自动完成功能    0x0004<br>
     *    装备强化npc    装备强化与分解功能面板    0x0008<br>
     *    装备洗练npc    装备洗练面板    0x0010<br>
     *    宝石大师npc    宝石打孔，镶嵌，合成面板    0x0020<br>
     *    装备置换npc    装备置换面板    0x0040<br>
     *    商店npc    有战功兑换，铜钱商店等多个npc，共用同样的面板    0x0080<br>
     *    阵型技能npc    类似普通任务npc，以任务名形式同时存在多条可学阵型或技能    0x0100<br>
     *    活动npc    可以输入激活码进行礼包或者卡片兑换的npc    0x0200<br>
     *    探索类怪物    探索任务需要探索的怪物    0x0400<br>
     *    潜力洗练npc    将领潜力洗练功能    0x0800<br>
     * */
    public var functionId:uint = 0;
    public var footHoldId:uint;

    /**
     * 服务器传过来的Type
     */
    public var type:int;

    /**
     * 2 表示   怪物
     * 4表示    NPC
     * 6表示   名将
     */
    public var npcType:int;

    public var half:uint;

    public function get imgString():String {
        var midd:String = "";
        switch (npcType) {
            case 2:
            case 4:
                midd = "avatars/npc/";
                break;
            case 6:
                midd = "avatars/general/";
                break;
        }
        return StaticConfig.httpServer + midd + toMixString(imgID, 4) + ".jpg";
    }

    private function toMixString(i:int, len:int):String {
        var s:String = i.toString();
        var return_s:String = "";
        for (var j:int = s.length; j < len; j++) {
            return_s += "0";
        }
        return_s += s;
        return return_s;
    }
}
}