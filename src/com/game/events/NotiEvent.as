/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.events {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class NotiEvent extends Notification implements INotification {
    public static var BAOJU_PURIFICATION_OPEN_SKILL_RETURN:String = "BAOJU_PURIFICATION_OPEN_SKILL_RETURN";
    public static var BAOJU_PURIFICATION_RETURN:String = "BAOJU_PURIFICATION_RETURN"; //

    public static var SHOW_ACTIVITY_ICON:String = "show_activity_icon";//显示活动图标
    public static var REMOVE_ACTIVITY_ICON:String = "remove_activity_icon";//移除活动图标

    //充值
    public static const REQUEST_ADD_MONEY:String = "request_add_money";
    public static const REQUEST_OPEN_FORTH:String = "request_open_forth";//打开墨家
    public static const REQUEST_OPEN_FORTH_GIFT:String = "request_open_forth_gift";//打开墨家奖励
    public static const ANTI_ADDICTION:String = "antiAddiction";	//防沉迷
    //声音
    public static const MUSIC_CHANGE:String = "musicChange";	//播放音乐,body:String(音乐路径)
    public static const MUSIC_EFFECT:String = "musicEffect";	//播放音乐,body:String(音乐库链接)
    public static const MUSIC_FIGHT_CLOSE:String = "musicFightclose";	//播放当前国家背景音乐
    public static const SOUND_VOLUME_SET:String = "soundVolumeSet";	//改变声音音量,body:int(音量大小0-1)
    public static const MUSIC_SET:String = "music_set";//设置音乐开关

    public static const MAP_BUILD_CLICK:String = "mapBuildClick";
    public static const SHOW_RECHARGE:String = "showRecharge";
    public static const SHOW_SHORTCUT:String = "showShortcut";
    public static const SHOW_SHORTCUT_NEW:String = "showShortcutNew";
    public static const SHOW_SHORTCUT_USE:String = "showShortcutUse";
    public static const SHOW_GOLD_AD:String = "showGoldAd";
    public static const SHOW_CDKEY:String = "showCdKey";
    public static const SHOW_CHARGEPOPUP:String = "showChargePopup";
    public static const INIT_COMMAND:String = "initcommand";
    public static const INIT_DATACOMMAND:String = "initdatacommand";

    public static const USER_STARS_INIT:String = "userStarsInit";
    public static const USER_REQUEST_STARS:String = "userRequestStars";
    public static const USER_INFO:String = "userInfo";
    public static const USER_INFO_UPDATE:String = "userInfoUpdate";
    public static const USER_LEVEL_UPDATE:String = "userLevelUpdate";
    public static const USER_TITLE_CHANGE_MSG:String = "userTitleChangeMsg";
    public static const PLAYER_MOVE_START:String = "playerMoveStart";

    public static const POPUP_WIN:String = "popupWin";
    public static const POPUP_DLG:String = "popupDlg";
    public static const POPUP_DEMO:String = "popupDemo";
    public static const CLOSE_ALL:String = "closeAll";

    public static const GUIDE_REQUEST_HERO_ADD_HP:String = "guideRequestHeroAddHp";
    public static const GUIDE_REQUEST_HERO_EQ_CHANGE:String = "guideRequestHeroEqChange";
    public static const GUIDE_RESPONSE_FIRE_HERO:String = "guideResponseFireHero";
    public static const GUIDE_REQUEST_FIRE_HERO:String = "guideRequestFireHero";
    public static const GUIDE_ANALYSIS:String = "guideAnalysis";
    public static const GUIDE_BUBBLE_TIP:String = "guideBubbleTip";
    //
    public static const TASK_SLG:String = "TASK_SLG";
    public static const INIT_TASK:String = "initTask";
    public static const TASK_REQUEST_CURR_LIST:String = "taskRequestCurrList";
    public static const TASK_REQUEST_ACCEPT_LIST:String = "taskRequestAcceptList";
    public static const TASK_REQUEST_GIVE_UP:String = "taskRequestGiveUp";
    public static const TASK_REQUEST_CYC_FRESH:String = "taskRequestCycFresh";
    public static const TASK_RESPONSE_CURR_LIST:String = "taskResponseCurrList";
    public static const TASK_RESPONSE_ACCEPT_LIST:String = "taskResponseAcceptList";
    public static const TASK_RESPONSE_GIVE_UP:String = "taskResponseGiveUp";
    public static const TASK_RESPONSE_CYC_FRESH:String = "taskResponseCycFresh";

    public static const TASK_REQUEST_DIALOG:String = "taskRequestDialog";
    public static const TASK_REQUEST_DIALOG_RETURN:String = "taskRequestDialogReturn";
    public static const TASK_RESPONSE_DIALOG:String = "taskResponseDialog";
    public static const TASK_RESPONSE_DIALOG_RETURN:String = "taskResponseDialogReturn";

    public static const TASK_RESPONSE_CURR_LIST_UPDATE:String = "taskResponseCurrListUpdate";
    public static const TASK_RESPONSE_NEW_TASK:String = "taskResponseNewTask";

    public static const TASK_RESPONSE_HOOK:String = "taskResponseHook";
    public static const TASK_REQUEST_HOOK:String = "taskRequestHook";
    public static const TASK_REQUEST_HOOK_STOP:String = "taskRequestHookStop";
    public static const TASK_REQUEST_HOOK_ADD:String = "taskRequestHookAdd";

    public static const TASK_COMPLETE:String = "taskComplete";
    public static const TASK_GUIDE_LINK_DO:String = "taskGuideLink_do";
    public static const TASK_GUIDE_LINK:String = "taskGuideLink";
    public static const TASK_GUIDE_NPC:String = "taskGuideNpc";
    public static const TASK_GUIDE_DLG:String = "taskGuideDlg";
    public static const GUIDE_TAB_CHANGE:String = "guideTabChange";
    public static const TASK_TRACK_SHOW:String = "taskGuideShow";
    public static const TOWER_REQUEST:String = "towerRequest";

    public static const BOOKSTORE_RESPONSE_LIST:String = "bookstoreResponseList";

    public static const HOTEL_RESPONSE_PUB_LIST:String = "hotelResponsePubList";

    public static const HEROIC_RESPONSE_POTENCIAL:String = "heroicResponsePotencial";

    public static const HEROIC_REQUEST_RETREAT:String = "heroicRequestRetreat";

    public static const GUIDE_REFRESH:String = "guideRefresh";

    public static const MODEL_IS_TRACK:String = "modelIsTrack";
    public static const MODEL_MAP_ICONS_CHANGE:String = "modelMapIconsChange";
    public static const MODEL_BUILD_CHANGE:String = "modelBuildChange";

    public static const BUFFER_SHOW:String = "bufferShow";
    public static const BUFFER_CHANGE:String = "bufferChange";

    //日常
    public static const DAILY_RESPONSE_DATA:String = "dailyResponseData";
    public static const DAILY_REQUEST_DATA:String = "dailyRequestData";

    public static const CHAT_GET_INFO:String = "chatGetInfo";

    public static const CHAT_GET_ERROR:String = "chatGetError";

    public static const ROLL_SCREEN:String = "rollScreen";//滚屏信息
    public static const ROLL_ALERT:String = "rollAlert";//滚屏提示

    //背包
    public static const PACK_DEAL_REQUEST:String = "packlistrequest"; //请求背包列表信息

    public static const MAIL_ID_LIST:String = "mailIdList";

    //斗剑场
    public static const ARENA_INFO_CMD:String = "arenaInfoCmd";
    //活跃度
    public static const ACTIVE_INFO_CMD:String = "activeInfoCmd";//总信息

    //变强之路
    public static const STRONG_INFO_CMD:String = "strongInfoCmd";

    //帮派
    public static const CLAN_VIEW:String = "clan_view";
    public static const CLAN_COPY_CMD:String = "CLAN_COPY_CMD";

    public static const CLAN_SKILL_PRO:String = "CLAN_SKILL_PRO";
    public static const CLAN_SKILL_PRO_GET:String = "CLAN_SKILL_PRO_GET";

    //地图
    public static const MAP_INIT:String = "mapInit";
    public static const ARRIVE_BUILD:String = "arrive_build";
    public static const MAP_AUTO_RUN:String = "mapAutoRun";
    public static const MAP_CHANGE:String = "mapChange";

    //将领信息更新
    public static const HERO_INFO_UPDATE:String = "hero_info_update";
    public static const HERO_DATA_UPDATE:String = "hero_data_update";
    public static const MENU_STATE_CHANGE:String = "menu_state_change";
    /**
     * data: Array [type,visible]<br>
     * type:0 all<br>
     * type:1 top<br>
     * type:2 bottom<br>
     * type:3 other<br><br>
     * visible:0 false<br>
     * visible:1 true<br>
     * */
    public static const MENU_VISIBLE:String = "menu_visible";
    public static const DONATION_CHANGE:String = "DONATION_CHANGE";
    public static const DONATION_VIP_LEVEL:String = "DONATION_VIP_LEVEL";//通过充值而来的VIP更新
    public static const VIP_LEVEL:String = "VIP_LEVEL";

    public static const NEWVIP_INFO:String = "NEWVIP_INFO";//
    public static const NEWVIP_INFO_SEND:String = "NEWVIP_INFO_SEND";//

    public static const GROUP_COPY_REQUEST_INFO:String = "groupCopyRequestInfo";

    public static const GROUP_COPY_REQUEST_LOBBY_JOIN:String = "groupCopyRequestLobbyJoin";


    public static const WELCOME_OK:String = "welcome_ok";

    public static const JS_FRIEND_INVITE:String = "jsFriendInvite";
    public static const REQ_SYS_SERVER_TIME:String = "req_sys_server_time";

    public static const ACTIVITY_COMMAND:String = "activity_command";

    public static const GIFT_DIFF:String = "gift_diff";

    public static const REFRESH_TURNTABLE:String = "RefreshTurntable";//刷新，或者隐藏

    public static const SHOW_RETURNPLAYER_BTN:String = "showReturnplayerBtn";//隐藏回流按钮，当returnPlayerProxy.returnPlayerLv == 0

    public static const FOURTH_CAREER_CHANGEPANEL:String = "fourthCareerChangepanel";

    public static const SWORDFIGHT_JOIN:String = "swordfightJoin";//参加
    public static const SWORDFIGHT_INFO:String = "swordfightInfo";//请求个人

    public static const AUTO_MAP_ARRIVE:String = "autoMapArrive";
    public static const AUTO_MAP_HOOK:String = "autoMapHhook";

    public static const CHARGE_SUCESS:String = "chargeSuccess";//充值成功

    public static const QQ_BACK_UPDATED_NEW:String = "QQ_BACK_UPDATED_NEW";//更新

    public static const QQ_IM_RESPONSE_INFO:String = "QQ_IM_RESPONSE_INFO";
    public static const QQ_IM_REQUEST_INFO:String = "QQ_IM_REQUEST_INFO";

    public static const SPREWARD:String = "SPREWARD";//蜀山奇遇

    public static const PrayTree_reward_timer:String = "prayTree_reward_timer";

    public static const TASK_REFRESH:String = "TASK_REFRESH";
    public static const TASK_REFRESH_INIT:String = "TASK_REFRESH_INIT";

    public static var XMAS_HIDEANDSEEK__OPENDIALOG:String = "XMAS_HIDEANDSEEK__OPENDIALOG";

    public static const OPEN_PET_DUNGEON_VIEW:String = "openPetDungeonView";//打开宠物副本界面
    public static const JOIN_FIGHT_DEMON_TEAM:String = "JOIN_FIGHT_DEMON_TEAM ";//加入抗击天魔副本

    //结婚
    public static const MARRIAGE_SEND_INFO:String = "MARRIAGE_SEND_INFO";//初始化信息

    public static const FUND_SEND_INFO:String = "FUND_SEND_INFO";//

    public static const CHAOS_SEND_INFO:String = "CHAOS_SEND_INFO";

    public static const TIANYUAN_SEND_INFO:String = "TIANYUAN_SEND_INFO";

    public static const FIGHTDEMON_POPUPREPLY:String = "FIGHTDEMON_POPUPREPLY";//决战天魔弹窗

    public static const HOOK_MINI_FIRST:String = "HOOK_MINI_FIRST"; //挂机界面初始最小化
    public static const HOOK_MINICLOSE:String = "HOOK_MINICLOSE"; //挂机界面关闭

    public static const TITLE_UPDATE:String = "TITLE_UPDATE";//称号界面更新
    public static const TITLE_UPDATELB:String = "TITLE_UPDATELB";//称号界面文本更新

    public static const RED_NPC_VIEW:String = "RED_NPC_VIEW";  //红包npc面板

    public static const REFRESH_POWER:String = "REFRESH_POWER";
    public static const HERO_ADD_PRO_REFRESH:String = "HERO_ADD_PRO_CAL"

    public static const SHOW_CALCULATOR:String = "show_calculator";//虚拟数字键盘

    public static const SHOW_FRAME_MSG:String = "show_frame_msg";

    public static const SHOW_REDPOINT:String = "SHOW_REDPOINT";   //显示或隐藏红点
    public static const INFO_REDPOINT:String = "INFO_REDPOINT";   //分发接受到的红点消息
    public static const SHOW_REDPOINT_MAINICON:String = "SHOW_REDPOINT_MAINICON";   //显示或隐藏红点 （客户端自己控制 主界面按钮）

    public static var OPEN_HOME:String = "open_home";
    public static var CLOSE_HOME:String = "close_home";

    //争霸天下
    public static var CITYWAR_CITYINFO_S:String = "CITYWAR_CITYINFO_S";
    public static var CITYWAR_GIFTINFO_S:String = "CITYWAR_GIFTINFO_S";
    public static var CITYWAR_OCCUPY_S:String = "CITYWAR_OCCUPY_S";

    public static var CITYWAR_NODEFIGHTMSG_S:String = "CITYWAR_NODEFIGHTMSG_S";

    public static const CITYWAR_CHANGEMAP_C:String = "CITYWAR_CHANGEMAP_C";//

    public static var OPEN_MONEY = "OPEN_MONEY";
    public static var CLOSE_MONEY = "CLOSE_MONEY";

    public function NotiEvent(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
    }
}
}
