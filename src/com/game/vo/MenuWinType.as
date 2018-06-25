package com.game.vo {
public class MenuWinType {
    public static const USER_INFO:String = "userInfo";	       				//人物
    public static const RANK_SORT:String = "ranksort";	       				//排行
    public static const DAILY:String = "daily_panel";   	   //日常
    public static const COMMONWINDOW = "common_window";//通用弹窗

    //#region NEW
    public static const COPY_INFO_VIEW = "COPY_INFO_VIEW";//副本信息
    public static const COPY_MOP_VIEW = "COPY_MOP_VIEW";//副本扫荡界面

    public static const BATTLE_VIEW = "BATTLE_VIEW";//战斗
    public static const EXPERT_VIEW = "EXPERT_VIEW";//专家界面
    /**
     *剧情 播放
     */
    public static const PLOT_VIEW:String = "plot_view";
    /**
     *羁绊
     */
    public static const JIBAN_VIEW:String = "jiban_view";
    public static const JIBAN_INFOVIEW:String = "jibaninfo_view";

    public static const TAVERN_HIRE_VIEW:String = "tavern_hire_view";//招募成功界面
    public static const TAVERN_TU_VIEW:String = "tavern_tu_view";//散仙图鉴
    public static const TAVERN_VIEW = "tavern_view";//酒馆招募
    public static const HEROES_INFO:String = "heros_info";	   //英雄志

    public static const COMPANY_VIEW:String = "COMPANY_VIEW";//公司界面
    //#endregion

    public static const TASK_NPC_VIEW:String = "taskNpcView";
    public static const TASK_GUIDE_VIEW:String = "taskGuideView";
    public static const TASK_DIALOG_VIEW:String = "taskDialogView";

    // 领取奖励
    public static const REWARD_DRAW:String = "reward_draw";

    public static const RECHARGE_WIN:String = "recharge_win";//充值面板 全屏板
    public static const DefWarNoticeWin:String = "DefWarNoticeWin";//墨守城规之战预告

    public static const FIGHT_DEMON:String = "FIGHT_DEMON";//抗击天魔
    public static const HideAndSeekTaskNpcView:String = "HideAndSeekTaskNpcView";//福羊npc对话框

    public static const ACTIVITY_SPRITE_FIND:String = "ACTIVITY_SPRITE_FIND";//玫瑰精灵对话面板

    public static const REDENVELOPE_NPC_VIEW:String = "REDENVELOPE_NPC_VIEW";//抢红包npc面板
    public static const CHAT_VIEW:String = "CHAT_VIEW";
    public static const PCHAT_VIEW:String = "PCHAT_VIEW";
    public static const NEWVIP_VIEW:String = "NEWVIP_VIEW";

    public static const ACTIVE:String = "ACTIVE";
    public static const HERO_DISPLAY_VIEW:String = "hero_display_view";

    public static const SYS_ALERT_VIEW = "sys_alert_view";//系统公告
    public static const GOODSITEM_TWEEN = "GOODSITEM_TWEEN";

    public function MenuWinType() {
    }
}
}
