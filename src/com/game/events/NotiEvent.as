/**
 * Created by huangcb on 2017/8/18.
 */
package com.game.events {
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.observer.Notification;

public class NotiEvent extends Notification implements INotification {
    public static var PET_COMPETITION_MYINO_REFRESH:String = "PET_COMPETITION_MYINO_REFRESH";//个人信息
    public static var PET_COMPETITION_RANK_REFRESH:String = "PET_COMPETITION_RANK_REFRESH";//排名
    //public static var PET_COMPETITION_LOGININFO_REFRESH:String = "PET_COMPETITION_LOGININFO_REFRESH";//
    public static var PET_COMPETITION_OTHERINFO_RETURN:String = "PET_COMPETITION_OTHERINFO_RETURN"; //他人灵宠信息返回
    public static var PET_COMPETITION_TOPTHREEINFO_RETURN:String = "PET_COMPETITION_TOPTHREEINFO_RETURN"; //三甲
    public static var PET_COMPETITION_REFRESH_MYTOALPOINT:String = "PET_COMPETITION_REFRESH_MYTOALPOINT"; //刷新胜点

    public static var PET_COMPETITION_REQUEST_OTHERPET:String = "PET_COMPETITION_REQUEST_OTHERPET";//请求他人灵宠
    public static var PET_COMPETITION_REQUEST_FIGHT:String = "PET_COMPETITION_REQUEST_FIGHT";//请求挑战
    public static var PET_COMPETITION_REQUEST_BUY:String = "PET_COMPETITION_REQUEST_BUY";//请求购买

    public static var GET_NEW_ITEM:String = "GET_NEW_ITEM";

    public static var KUISHAO_XINGSHI_EQUIP_REFRESH:String = "KUISHAO_XINGSHI_EQUIP_REFRESH";//更新星石
    public static var KUISHAO_XINGSHI_MERGE_REFRESH:String = "KUISHAO_XINGSHI_MERGE_REFRESH";//星石合成
    public static var KUISHAO_XINGSHI_ONKEY_MERGE:String = "KUISHAO_XINGSHI_ONKEY_MERGE"

    public static var BAOJU_PURIFICATION_OPEN_SKILL_REQ:String = "BAOJU_PURIFICATION_OPEN_SKILL_REQ";//宝具开启新技能
    public static var BAOJU_PURIFICATION_REQ:String = "BAOJU_PURIFICATION_REQ";//宝具炼化

    public static var BAOJU_PURIFICATION_OPEN_SKILL_RETURN:String = "BAOJU_PURIFICATION_OPEN_SKILL_RETURN";
    public static var BAOJU_PURIFICATION_RETURN:String = "BAOJU_PURIFICATION_RETURN"; //


    public static var SHIP_REQUEST_SHIPINFO:String = "SHIP_REQUEST_SHIPINFO";//请求某人船只信息
    public static var SHIP_REQUEST_CHECK_ENEMYINFO:String = "SHIP_REQUEST_CHECK_ENEMYINFO";//仇人信息
    public static var SHIP_REQUEST_DELETE_ENEMY:String = "SHIP_REQUEST_DELETE_ENEMY";
    public static var SHIP_REQUEST_ROB:String = "SHIP_REQUEST_ROB";//
    public static var SHIP_REQUEST_REFRESH_SHIPQUALITY:String = "SHIP_REQUEST_REFRESH_SHIPQUALITY"//刷新船只品质
    public static var SHIP_REQUEST_INVVIENT_FRIEND:String = "SHIP_REQUEST_INVVIENT_FRIEND";//邀请好友
    public static var SHIP_REQUEST_ADD_COUNT:String = "SHIP_REQUEST_ADD_COUNT"//增加次数
    public static var SHIP_REQUEST_USE_SUPRISE:String = "SHIP_REQUEST_USE_SUPRISE"

    public static var SHIP_RETURN_REFRESH_GlOBALINFO:String = "SHIP_RETURN_REFRESH_GlOBALINFO"
    public static var SHIP_RETURN_ALLSHIPINFO:String = "SHIP_RETURN_ALLSHIPINFO";
    public static var SHIP_RETURN_DETAIL_SHIPINFO:String = "SHIP_RETURN_DETAIL_SHIPINFO";//船只详细信息
    public static var SHIP_RETURN_SURPRISE:String = "SHIP_RETURN_SURPRISE";//个人奇遇
    public static var SHIP_RETURN_LOG:String = "SHIP_RETURN_LOG"
    public static var SHIP_RETURN_RANK:String = "SHIP_RETURN_RANK"
    public static var SHIP_RETURN_ENEMYLIST:String = "SHIP_RETURN_ENEMYLIST";
    public static var SHIP_RETURN_REFRESH_SELECTSHIP:String = "SHIP_RETURN_REFRESH_SHIPQUALITY" //刷新船只品质
    public static var SHIP_RETURN_INVIT_FRIEND_POP:String = "SHIP_RETURN_INVIT_FRIEND_POP" //邀请好友返回
    public static var SHIP_RETURN_REFRESH_ROOM_ONESHIP:String = "SHIP_RETURN_REFRESH_ROOM_ONESHIP" //刷新房间某只船的信息
    public static var SHIP_RETURN_REFRESH_MYPARTERNERNAME:String = "SHIP_RETURN_REFRESH_MYPARTERNERNAME"
    public static var SHIP_RETURN_ALTERT_INFO:String = "SHIP_RETURN_ALTERT_INFO";//弹提示信息

    public static var GAME789_ROOMLIST_REFRESH:String = "GAME789_ROOMLIST_REFRESH";//刷新房间列表
    public static var GAME789_MYROOMINFO_REFRESH:String = "GAME789_MYROOMINFO_REFRESH";//刷新我的房间列表
    public static var GAME789_GAMEROOM_REFRESH:String = "GAME789_GAMEROOM_REFRESH";
    public static var GAME789_GAMEROOM_REFRESH_CHAT:String = "GAME789_GAMEROOM_REFRESH_CHAT";
    public static var GAME789_GAMEROOM_REFRESH_LOG:String = "GAME789_GAMEROOM_REFRESH_LOG";
    public static var GAME789_SHOW_MYROOM:String = "GAME789_SHOW_MYROOM"

    public static var GAME789_REQUEST_JOIN:String = "GAME789_REQUEST_JOIN";//请求加入
    public static var GAME789_REQUEST_ROOM_MANAGER:String = "GAME789_REQUEST_ROOM_MANAGER"
    public static var GAME789_REQUEST_GAMEROOM_SELECT:String = "GAME789_REQUEST_GAMEROOM_SELECT";
    public static var GAME789_REQUEST_BUY:String = "GAME789_REQUEST_BUY";

    public static var HOMESYSTEM_PLANT_HIT_START:String = "HOMESYSTEM_PLANT_HIT_START";//
    public static var HOMESYSTEM_PLANTITEM_DRAGUP:String = "HOMESYSTEM_PLANTITEM_DRAGUP"
    public static var HOMESYSTEM_PLANT_FLOWER:String = "HOMESYSTEM_PLANT_FLOWER"
    public static var HOMESYSTEM_PLANT_GET_REWARD:String = "HOMESYSTEM_PLANT_GET_REWARD"//收获
    public static var HOMESYSTEM_LOOK_TREEANDFLOWER_RETURN:String = "HOMESYSTEM_LOOK_TREEANDFLOWER";//查看金钱树与花圃
    public static var HOMESYSTEM_INFO:String = "HOMESYSTEM_INFO"
    public static var HOMESYSTEM_BUILD_SUCCESS:String = "HOMESYSTEM_BUILD_SUCCESS";//建造成功
    public static var HOMESYSTEM_BUILD_UP_RETURN:String = "HOMESYSTEM_BUILD_UP_RETURN";//升级返回

    public static var ZHUANMING_PACK_ITEMSELECT:String = "ZHUANMING_PACK_ITEMSELECT";
    public static var ZHUANMING_POP_INPUTNUM:String = "ZHUANMING_POP_INPUTNUM"

    public static var ZHUANMING_REFRESH_ALLEQUIP:String = "ZHUANMING_REFRESH_ALLEQUIP";
    public static var ZHUANMING_EQUIP_REFRESH:String = "ZHUANMING_EQUIP_REFRESH"
    public static var ZHUANMING_INFO:String = "ZHUANMING_INFO";
    public static var ZHUANMING_PRODUCT_REFRESH:String = "ZHUANMING_PRODUCT_REFRESH"
    public static var ZHUANMING_MERGE_REFRESH:String = "ZHUANMING_MERGE_REFRESH"
    public static var ZHUANMING_LOCK_REFRESH:String = "ZHUANMING_LOCK_REFRESH"

    public static var FABAODIAOWEN_PACKITEM_CLICK:String = "FABAODIAOWEN_PACKITEM_CLICK";
    public static var FABAODIAOWEN_PACKITEM_DRAG:String = "FABAODIAOWEN_PACKITEM_DRAG";
    public static var FABAODIAOWEN_PACK_CHANGE:String = "FABAODIAOWEN_PACK_CHANGE";
    public static var FABAODIAOWEN_TRAIN_RETURN:String = "FABAODIAOWEN_TRAIN_RETURN"
    public static var FABAODIAOWEN_MERGE_RETURN:String = "FABAODIAOWEN_MERGE_RETURN"

    public static var YIJUAN_ITEM_DRAG:String = "YIJUAN_ITEM_DRAG"
    public static var YIJUAN_EQUIP_UPDATE:String = "YIJUAN_EQUIP_UPDATE"
    public static var YIJUAN_ITEM_CLICK:String = "YIJUAN_ITEM_CLICK";
    public static var YIJUAN_UP_RETRUN:String = "YIJUAN_UP_RETRUN"

    public static var SHOW_ACTIVITY_ICON:String = "show_activity_icon";//显示活动图标
    public static var REMOVE_ACTIVITY_ICON:String = "remove_activity_icon";//移除活动图标

    //充值
    public static const REQUEST_ADD_MONEY:String = "request_add_money";
    public static const REQUEST_OPEN_FORTH:String = "request_open_forth";//打开墨家
    public static const REQUEST_OPEN_FORTH_GIFT:String = "request_open_forth_gift";//打开墨家奖励
    public static const ANTI_ADDICTION:String = "antiAddiction";	//防沉迷
    public static const FIGHTER_CLICK:String = "fighter_click";//点击玩家头像或武将头像
    //声音
    public static const MUSIC_CHANGE:String = "musicChange";	//播放音乐,body:String(音乐路径)
    public static const MUSIC_EFFECT:String = "musicEffect";	//播放音乐,body:String(音乐库链接)
    public static const MUSIC_FIGHT_CLOSE:String = "musicFightclose";	//播放当前国家背景音乐
    public static const SOUND_VOLUME_SET:String = "soundVolumeSet";	//改变声音音量,body:int(音量大小0-1)
    public static const MUSIC_SET:String = "music_set";//设置音乐开关

    public static const MENU_FILL_CHANGE:String = "menuFillChange";
    public static const MENU_BTN_EFFECT:String = "menuBtnEffect";
    public static const MENU_BTN_FLASH:String = "menuBtnFlash";
    public static const MENU_WIN_CHANGE:String = "menuWinChange";
    public static const ANIMATION_PLAY:String = "ANIMATION_PLAY";//动画播放
    public static const ANIMATION_ADDLOVESTR:String = "ANIMATION_ADDLOVESTR";//添加爱情字串
    public static const ANIMATION_MARRY_FIREWORKS:String = "ANIMATION_MARRY_FIREWORKS";//结婚烟花
    public static const ANIMATION_STOP:String = "ANIMATION_STOP";//动画停止
    public static const MAP_MENU_ENABLED:String = "MAP_MENU_ENABLED";//禁点操作
    public static const MAP_BUILD_CLICK:String = "mapBuildClick";
    public static const WORLD_MAP:String = "worldMap";
    public static const WORLD_MAP_CMD:String = "worldMapCmd";
    public static const SHOW_RECHARGE:String = "showRecharge";
    public static const SHOW_SHORTCUT:String = "showShortcut";
    public static const SHOW_SHORTCUT_NEW:String = "showShortcutNew";
    public static const SHOW_SHORTCUT_USE:String = "showShortcutUse";
    public static const SHOW_GOLD_AD:String = "showGoldAd";
    public static const SHOW_CDKEY:String = "showCdKey";
    public static const SHOW_CHARGEPOPUP:String = "showChargePopup";
    public static const SHOW_BUY_POPUP:String = "showBuyPopup";
    public static const FRESH_BUY_POPUP:String = "fresh_buy_popup"
    public static const PRE_INIT_COMMAND:String = "PRE_INIT_COMMAND";
    public static const INIT_COMMAND:String = "initcommand";
    public static const INIT_DATACOMMAND:String = "initdatacommand";
    public static const INIT_PROXY:String = "initProxy";
    public static const SET_CONNECTION:String = "SET_CONNECTION";

    public static const USER_STARS_INIT:String = "userStarsInit";
    public static const USER_RESPONSE_STARS:String = "userResponseStars";
    public static const SHOW_STARS_CONVERT_PANEL:String = "show_stars_convert_panel";
    public static const USER_REQUEST_STARS:String = "userRequestStars";
    public static const USER_INFO:String = "userInfo";
    public static const USER_INFO_UPDATE:String = "userInfoUpdate";
    public static const USER_LEVEL_UPDATE:String = "userLevelUpdate";
    public static const USER_TITLE_CHANGE_CMD:String = "userTitleChangeCmd";
    public static const USER_TITLE_CHANGE_MSG:String = "userTitleChangeMsg";
    public static const PLAYER_MOVE_START:String = "playerMoveStart";
    //黄钻
    public static const GOLD_INFO_CMD:String = "goldInfoCmd";
    public static const GOLD_INFO_MSG:String = "goldInfoMsg";
    public static const GOLD_GET_CMD:String = "goldGetCmd";
    public static const GOLD_GET_MSG:String = "goldGetMsg";
    public static const CDKEY_GET_CMD:String = "cdkeyGetCmd";
    public static const CDKEY_GET_MSG:String = "cdkeyGetMsg";
    public static const GOLD_OPEN:String = "goldopen";
    //成就
    public static const ACHIEVEMENT_CMD:String = "achievement_cmd";
    public static const ACHIEVEMENT_MSG:String = "achievement_msg";
    //
    public static const SHELL_INIT:String = "shellInit";
    public static const POPUP_WIN:String = "popupWin";
    public static const POPUP_DLG:String = "popupDlg";
    public static const POPUP_DEMO:String = "popupDemo";
    public static const CLOSE_WIN:String = "closeWin";
    public static const CLOSE_ALL:String = "closeAll";

    public static const GUIDE_REQUEST_STEP:String = "guideRequestStep";
    public static const GUIDE_RESPONSE_STEP:String = "guideResponseStep";
    public static const GUIDE_STEP_CHANGE:String = "guideStepChange";
    public static const GUIDE_WARM:String = "guideWarm";
    public static const GUIDE_REQUEST_CAMP_SELECT:String = "guideRequestCampSelect";
    public static const GUIDE_RESPONSE_CAMP_SELECT:String = "guideResponseCampSelect";
    public static const GUIDE_RESPONSE_HERO_UPDATE:String = "guideResponseHeroUpdate";
    public static const GUIDE_REQUEST_HERO_ADD_HP:String = "guideRequestHeroAddHp";
    public static const GUIDE_REQUEST_HERO_EQ_CHANGE:String = "guideRequestHeroEqChange";
    public static const GUIDE_RESPONSE_FIRE_HERO:String = "guideResponseFireHero";
    public static const GUIDE_REQUEST_FIRE_HERO:String = "guideRequestFireHero";
    public static const GUIDE_REQUEST_RANK_SAVE:String = "guideRequestRankSave";
    public static const GUIDE_MENU_OPEN:String = "guideMenuOpen";
    public static const GUIDE_ANALYSIS:String = "guideAnalysis";
    public static const GUIDE_BUBBLE_TIP:String = "guideBubbleTip";

    public static const AWARD_RESPONSE_INFO:String = "awardResponseInfo";
    public static const AWARD_REQUEST_INFO:String = "awardRequestInfo";
    public static const SEVEN_COMPASS_AWARD:String = "sevenCompassAward";
    public static const SEVEN_BACK_COMPASS_AWARD:String = "sevenBackCompassAward";


    public static const LEAVE_REQUEST_EXP:String = "leaveRequestExp";
    public static const LEAVE_RESPONSE_EXP:String = "leaveResponseExp";
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
    public static const GUIDE_UPDATE:String = "guideUpdate";
    public static const GUIDE_TAB_CHANGE:String = "guideTabChange";
    public static const TASK_TRACK_SHOW:String = "taskGuideShow";
    public static const TASK_TIP_SHOW:String = "taskTipShow";
    public static const TASK_TIP_HIDE:String = "taskTipHide";
    public static const TOWER_REQUEST:String = "towerRequest";

    public static const TASK_FIGHT_HOOK:String = "taskFightHook";

    public static const FIGHT_POPUP:String = "fightPopup";
    public static const FIGHT_RESPONSE_NPC:String = "fightRespnoseNpc";
    public static const FIGHT_RESPONSE_PLAYER:String = "fightRespnosePlayer";
    public static const FIGHT_RESPONSE_BATTLE:String = "fightRespnoseBattle";
    public static const FIGHT_RESPONSE_EXIT:String = "fightRespnoseExit";
    public static const FIGHT_INTERRUPT:String = "fightInterrupt";

    public static const FIGHT_REQUEST_NPC:String = "fightRequestNpc";
    public static const FIGHT_REQUEST_BATTLE:String = "fightRequestBattle";
    public static const FIGHT_REQUEST_EXIT:String = "fightRequestExit";
    public static const FIGHT_START:String = "fightStart";
    public static const FIGHT_END:String = "fightEnd";

    public static const FIGHT_REQUEST_REPORT_TYPE:String = "fightRequestReportType";
    public static const FIGHT_RESPONSE_REPORT_TYPE:String = "fightResponseReportType";

    public static const SHOP_RESPONSE_BUY:String = "shopRespnoseBuy";
    public static const SHOP_RESPONSE_LIST:String = "shopRespnoseList";

    public static const SHOP_FRESH_LIMITDATE:String = "shopFreshLimitdate";

    public static const SHOP_REQUEST_BUY:String = "shopRequestBuy";
    public static const SHOP_REQUEST_LIST:String = "shopRequestList";
    public static const BOOKSTORE_RESPONSE_LIST:String = "bookstoreResponseList";
    public static const BOOKSTORE_RESPONSE_BUY:String = "bookstoreResponseBuy";
    public static const BOOKSTORE_REQUEST_LIST:String = "bookstoreRequestList";
    public static const BOOKSTORE_REQUEST_BUY:String = "bookstoreRequestBuy";
    public static const OPEN_HYEARRP:String = "openhyearrp";
    public static const HOLIDAYGIFT_UPDATE:String = "HOLIDAYGIFT_UPDATE";

    public static const HOTEL_RESPONSE_PUB_LIST:String = "hotelResponsePubList";
    public static const HOTEL_RESPONSE_PUB_HIRE:String = "hotelResponsePubHire";

    public static const HOTEL_REQUEST_PUB_LIST:String = "hotelRequestPubList";
    public static const HOTEL_REQUEST_PUB_HIRE:String = "hotelRequestPubHire";


    public static const HEROIC_RESPONSE_POTENCIAL:String = "heroicResponsePotencial";
    public static const HEROIC_REQUEST_POTENCIAL:String = "heroicRequestPotencial";

    public static const HEROIC_RESPONSE_RETREAT:String = "heroicResponseRetreat";
    public static const HEROIC_REQUEST_RETREAT:String = "heroicRequestRetreat";

    public static const SAYSAY_RESPONSE_UPDATE:String = "saysayResponseUpdate";
    public static const SAYSAY_REQUEST_UPDATE:String = "saysayRequestUpdate";
    public static const SAYSAY_REQUEST_NEW:String = "saysayRequestNew";
    public static const SAYSAY_RESPONSE_INFO:String = "saysayResponseInfo";
    public static const SAYSAY_GET_GIFT:String = "saysayGetGift";


    public static const GUIDE_DLG_REQUEST:String = "guideDlgRequest";
    public static const GUIDE_WIN_REQUEST:String = "guideWinRequest";
    public static const GUIDE_INFO:String = "guideInfo";
    public static const GUIDE_REFRESH:String = "guideRefresh";
    public static const GUIDE_INDEX:String = "guideIndex";
    public static const GUIDE_INDEX1:String = "guideIndex1";

    public static const MODEL_IS_TRACK:String = "modelIsTrack";
    public static const MODEL_MAP_ICONS_CHANGE:String = "modelMapIconsChange";
    public static const MODEL_BUILD_CHANGE:String = "modelBuildChange";
    public static const MODEL_IS_IN_FIGHT:String = "modelIsInFight";
    public static const MODEL_IS_IN_COPY:String = "modelIsInCopy";
    public static const MODEL_IS_IN_HOOK:String = "modelIsInHook";

    public static const BUFFER_SHOW:String = "bufferShow";
    public static const BUFFER_CHANGE:String = "bufferChange";
    public static const HERO_BUFF_CHANGE:String = "heroBufferChange";
    public static const HERO_BUFF_SHOW:String = "heroBufferShow";

    public static const SKILL_LEATH_CHANGE:String = "skill_leath_change";

    public static const SECRETARY_GUIDE_LINK:String = "secretaryGuideLink";
    public static const SECRETARY_OPEN:String = "secretaryOepn";
    public static const SECRETARY_TYPE:String = "secretaryType";
    public static const SECRETARY_ADD:String = "secretaryAdd";
    public static const SECRETARY_SHOW:String = "secretaryShow";
    //日常
    public static const DAILY_RESPONSE_DATA:String = "dailyResponseData";
    public static const DAILY_REQUEST_DATA:String = "dailyRequestData";
    public static const DAILY_GROUP_DATA:String = "daily_group_data";
    public static const DAILY_GROUP_STOP:String = "daily_group_stop";
    public static const ACTIVITY_RESPONSE_COMPASS:String = "activity_response_compass";
    public static const ACTIVITY_REQUEST_COMPASS:String = "activity_request_compass";

    //天劫
    public static const DISASTER_REQUEST:String = "disasterRequest";
    public static const DISASTER_RESPONSE_DATA:String = "disasterResponseData";
    public static const DISASTER_BOSS_RESPONSE:String = "disasterBossResponse";
    public static const DISASTER_OPEN_RULE:String = "disasterOpenRule";
    public static const DISASTER_ATTACK_CMD:String = "disasterAttackCmd";
    public static const DISASTER_FIGHT_CMD:String = "disasterFightCmd";
    public static const DISASTER_AUTO_FIGHT_CMD:String = "disasterAutoFightCmd";
    public static const DISASTER_DONATE_CMD:String = "disasterDonateCmd";
    //聊天
    public static const REFRESH_MENU_WIN_CONFIG:String = "refreshMenuWinConfig";
    public static const CHAT_GET_INFO:String = "chatGetInfo";
    public static const CHAT_GET_WHISPER_INFO:String = "chatGetWhisperInfo";
    public static const CHAT_GET_ERROR:String = "chatGetError";
    public static const CLIENT_ROLL_MSG:String = "CLIENT_ROLL_MSG";
    public static const CHAT_GET_COMMON_MSG:String = "chatGetCommonMsg";
    public static const CHAT_CHECK_NAME:String = "chatCheckName";	//检查用户名
    public static const CHAT_CHECK_NAME_EXIST = "chatCheckNameExist";//本地已经存在
    public static const CHAT_CHECK_NAME_RET:String = "chatCheckNameRet";	//检查用户名返回,body:CheckNameMsg
    public static const CHAT_SET_LOUD:String = "chatSetLoud";
    public static const CHAT_ADD_LOUD:String = "chatAddLoud";//添加大喇叭消息,body:ChatStruct对象
    public static const CHAT_SHOW_SYS_MSG:String = "chatShowSysMsg";//在聊天窗口显示一条系统信息,body:String(显示内容)
    public static const CHAT_SHOW_MSG:String = "chatShowMsg";//在聊天窗口显示一条信息,body:String(显示内容)
    public static const CHAT_WHISPER_SET:String = "chatWhisperSet";//设置私聊,body:SimpleParams
    public static const CHAT_FLAUNT:String = "chatFlaunt";	//聊天炫耀,body:FlaunParams
    public static const SHOW_MAIL_INFO:String = "showMailInfo";//显示战报信息;


    //------------------
    public static const CHANGE_CHANNEL:String = "change_channel";
    public static const NOTIF_SHOW:String = "notif_show"; //通知面板显示
    public static const CITY_FIGHT_NOTIF:String = "city_fight_notif"; //攻城战通知
    public static const NOTIF_MSG_ADD:String = "noticeMsgAdd";	//在通知面板上添加消息,body:String(可用html)
    //Bug提交通知
    public static const BUG_SENDING:String = "BUG_SEDING";
    public static const BUG_ERROR:String = "bug_error";  //bug错误信息返回, body类型String
    public static const ROLL_SCREEN:String = "rollScreen";//滚屏信息
    public static const ROLL_ALERT:String = "rollAlert";//滚屏提示
    public static const ROLL_MIDDLE_SCREEN:String = "ROLL_MIDDLE_SCREEN"//居中滚屏
    public static const ROLL_LOUD:String = "rollLoud";//系统消息大喇叭
    public static const RANK_SETTING_RETURN:String = "rankSettingReturn";
    public static const UPDATE_VERSION:String = "update_version";//更新公告
    //背包
    public static const PACK_SELL:String = "packsell";         //卖出物品
    public static const PACK_PUT_TRIPOD:String = "packPutTripod";  //摧毁物品
    public static const PACK_USE:String = "packusebysingle";      //使用物品
    public static const PACK_USE_BACK:String = "packUseBack";      //使用物品返回
    public static const PACK_DEAL_REQUEST:String = "packlistrequest"; //请求背包列表信息
    public static const PACK_LIST_EVENT:String = "packListEvent";//返回[容量,具体数据]
    public static const CAPACITY_UPDATE_RETURN:String = "capacityUpdateReturn";//背包容量更新
    public static const PACK_EXTEND_REQ:String = "packExtendReq";//请求背包扩展数据
    public static const PACK_CHANGE_PAGE:String = "PACK_CHANGE_PAGE";//背包 切页
    //炫耀
    public static const FLAUNT_SHOW:String = "flauntShow";	//炫耀显示,body:FlauntParams
    public static const FLAUNT_SHOW_WHISPER:String = "flauntShowWhisper";	//炫耀显示私聊,body:FlauntParams
    public static const FLAUNT_SHOW_RETURN:String = "flauntShowReturn";	//炫耀显示返回,body:FlauntStruct

    public static const SEND_CHAT_INFOS:String = "send_chat_infos";	//发送聊天消息
    //排行榜
    public static const SORT_GET_DATA:String = "sortGetData";
    public static const SORT_GET_PERSONAL_DATA:String = "sortGetPersonalData";
    public static const SORT_DATA_LOADED:String = "sortDataLoaded";
    public static const SORT_PERSONAL_DATA_LOADED:String = "sortPersonalDataLoaded";
    public static const SORT_SUPPORT:String = "sort_support";
    public static const SORT_REDPOINT:String = "SORT_REDPOINT";
    //回流排行
    public static const SORTBACK_DATA_LOADED:String = "sortBackDataLoaded";
    //邮件
    public static const MAIL_INIT:String = "mailInit";
    public static const MAIL_NEW_CALL:String = "mailNewCall";
    public static const MAIL_WRITE:String = "mailWrite";
    public static const MAIL_ID_LIST:String = "mailIdList";
    public static const MAIL_REQUEST_PAGE:String = "mailRequestPage";
    public static const MAIL_RESPONSE_PAGE:String = "mailResponsePage";
    public static const MAIL_REQUEST_CONTENT:String = "mailRequestContent";
    public static const MAIL_RESPONSE_CONTENT:String = "mailResponseContent";
    public static const MAIL_REQUEST_DELETE:String = "mailRequestDelelte";
    public static const MAIL_RESPONSE_DELETE:String = "mailResponseDelelte";
    public static const MAIL_REQUEST_SEND:String = "mailRequestSend";
    public static const MAIL_RESPONSE_SEND:String = "mailResponseSend";
    public static const MAIL_REQUEST_FRIEND_GOOD_ACT:String = "mailRequestFriendGoodAct";
    public static const MAIL_RESPONSE_COMM_HERO:String = "mailResponseCommHero";
    public static const MAIL_RESPONSE_SHOW_SUB:String = "mailResponShowDetailOrWrite"
    //好友
    public static const RELATION_LIST_MSG:String = "relationListMsg";//请求list
    public static const RELATION_LIST_CMD:String = "relationListCmd";
    public static const RELATION_ACT_MSG:String = "relationActMsg";//好友操作
    public static const RELATION_ACT_CMD:String = "relationActCmd";
    public static const RELATION_INVITE_CMD:String = "relationInviteCmd";
    public static const LAUNCH_MAIL_WRITE:String = "launchMaillWrite";//打开写邮件面版,在好友面版,发起写信消息时用到
    public static const LAUNCH_TRADE:String = "launchTrade";//打开发起交易面版,在好友面版,发起交易消息时用到
    public static const RELATION_RESPONSE_MOOD:String = "relationResponseMood";
    public static const RELATION_REQUEST_MOOD:String = "relationRequestMood";
    public static const RELATION_TAB:String = "relationTab";//关系面板切页
    public static const QQFRIENDS_LIST_UPDATED:String = "QQFRIENDS_LIST_UPDATED";
    //修炼
    public static const PRACTICE_PLACE_INFO_CMD:String = "practicePlaceInfoCmd";
    public static const PRACTICE_PAGE_CMD:String = "practicePageCmd";
    public static const PRACTICE_ROB_CMD:String = "practiceRobCmd";
    public static const PRACTICE_OCCUPY_CMD:String = "practiceOccupyCmd";
    public static const PRACTICE_START_CMD:String = "practiceStartCmd";
    public static const PRACTICE_STOP_CMD:String = "practiceStopCmd";
    public static const PRACTICE_ACC_CMD:String = "practiceAccCmd";
    public static const PRACTICE_PLACE_INFO_MSG:String = "practicePlaceInfoMsg";
    public static const PRACTICE_PAGE_MSG:String = "practicePageMsg";
    public static const PRACTICE_ROB_MSG:String = "practiceRobMsg";
    public static const PRACTICE_OCCUPY_MSG:String = "practiceOccupyMsg";
    public static const PRACTICE_START_MSG:String = "practiceStartMsg";
    public static const PRACTICE_STOP_MSG:String = "practiceStopMsg";
    public static const PRACTICE_ACC_MSG:String = "practiceAccMsg";
    public static const PRACTICE_RESPONSE_OCCUPY:String = "paracticeResponseOccupy";
    public static const PRACTICE_HOOK_UPDATE:String = "practice_hook_update";
    //九疑鼎
    public static const TRIPOD_SEND_CMD:String = "tripod_send_cmd";
    public static const TRIPOD_INFO_MSG:String = "tripodInfoMsg";
    public static const TRIPOD_GLOW:String = "tripod_glow";
    public static const TRIPOD_INFO_ALL:String = "tripodInfoAll";

    //斗剑场
    public static const ARENA_INFO_CMD:String = "arenaInfoCmd";
    public static const ARENA_INFO_MSG:String = "arenaInfoMsg";
    public static const ARENA_FIGHT_CMD:String = "arenaFightCmd";
    public static const ARENA_FIGHT_INFO_MSG:String = "arenaFightInfoMsg";
    public static const ARENA_REFRESH_CMD:String = "arenaRefreshCmd";
//    public static const ARENA_REFRESH_MSG:String = "arenaRefreshMsg";
    public static const ARENA_AWARD_GET_CMD:String = "arenaAwardCmd";
//    public static const ARENA_AWARD_GET_MSG:String = "arenaAwardMsg";
//    public static const ARENA_PAGE_CMD:String = "arenaPageCmd";
//    public static const ARENA_BENFU_CMD:String = "arenabenfuCmd";
//    public static const ARENA_KUAFU_CMD:String = "arenakuafuCmd";
//    public static const ARENA_CHOOSE_EXS_ITEM:String = "arenaChooseExsItem";

//    public static const ARENA_SPEED_CMD:String = "arenaSpeedCmd";
//    public static const ARENA_EXERCISE_SELECTED:String = "arenaExerciseSelected";
    public static const ARENA_EXS_UPDATE:String = "arenaExsUpdate";//新历练属性更新
    //活跃度
    public static const ACTIVE_INFO_CMD:String = "activeInfoCmd";//总信息
//    public static const ACTIVE_INFO_CMD_NEW:String = "activeInfoCmdNew";//总信息
    public static const ACTIVE_INFO_MSG:String = "activeInfoMsg";
    public static const ACTIVE_AWARD_CMD:String = "activeAwardCmd";//奖励
//    public static const ACTIVE_AWARD_MSG:String = "activeAwardMsg";
    public static const ACTIVE_INFO:String = "activeInfo";
    public static const ACTIVE_RESPONSE_FOUR_DETECTIVE:String = "activeResponseFourDetective";
    public static const ACTIVE_REQUEST_FOUR_DETECTIVE:String = "activeRequestFourDetective";
    public static const ACTIVE_RESPONSE_TIME:String = "activeResponseTime";
    public static const ACTIVE_REQUEST_TIME:String = "activeRequestTime";

    //第四职业传功
    public static const THEFOURCAREER_THEWORK:String = "thefourcareerthework";
    public static const THEFOURCAREER_THEWORK_RESULT:String = "thefourcareertheworkresult";

    //变强之路
    public static const STRONG_INFO_CMD:String = "strongInfoCmd";
    public static const STRONG_INFO_MSG:String = "strongInfoMsg";

    public static const STRONG_ROAD_CMD:String = "strongRoadCmd";
    public static const STRONG_ROAD_MSG:String = "strongRoadMsg";

    public static const STRONG_ROAD_ALERT:String = "strongRoadAlert";

    public static const STRONG_AWARD_CMD:String = "strongAwardCmd";
    public static const STRONG_AWARD_MSG:String = "strongAwardMsg";


    //帮派
    public static const CLAN_VIEW:String = "clan_view";
    public static const CLAN_FIGHT_SIGNUP:String = "clan_view";
//    public static const CLAN_SELECET_INDEX:String = "clan_selecet_index";
    public static const CLAN_INVITE:String = "CLAN_INVITE";
    public static const CLAN_FIGHT_TRANS_POP:String = "CLAN_FIGHT_TRANS_POP";
    public static const CLAN_SKILL_DATA_UPDATE:String = "CLAN_SKILL_DATA_UPDATE";
    public static const CLAN_COPY_CMD:String = "CLAN_COPY_CMD";
    public static const CLANCOPY_TRANS_POP:String = "CLANCOPY_TRANS_POP";
    public static const CC_READY_INFO_MSG:String = "CC_READY_INFO_MSG";
    public static const CC_FIGHT_MSG:String = "CC_FIGHT_MSG";
    public static const CF_PRE_CALLFOR:String = "CF_PRE_CALLFOR";
    public static const CLAN_FIRE:String = "CLAN_FIRE";
    public static const CF_PRE_BETINFO:String = "CF_PRE_BETINFO";
    public static const CF_PRE_REDPOINT : String = "CF_PRE_REDPOINT";

    public static const CLAN_SKILL_PRO:String = "CLAN_SKILL_PRO";
    public static const CLAN_SKILL_PRO_GET:String = "CLAN_SKILL_PRO_GET";

    public static const CLAN_CLICK_BG:String = "CLAN_CLICK_BG";//点击 背景

    public static const CLAN_REDPOINT:String = "CLAN_REDPOINT";

    //地图
    public static const MAP_INIT:String = "mapInit";
    public static const ARRIVE_BUILD:String = "arrive_build";
    public static const MAP_AUTO_RUN:String = "mapAutoRun";
    public static const MAP_CHANGE:String = "mapChange";
    //副本
    public static const COPY_SHOW:String = "copy_show";
    //阵图
    public static const FORMATION_SHOW:String = "formation_show";
    /**
     * 副本 通天塔 阵图通关消息
     */
    public static const COPY_OVER:String = "COPY_OVER";


    //将领信息更新
    public static const HERO_INFO_UPDATE:String = "hero_info_update";
    public static const HERO_DATA_UPDATE:String = "hero_data_update";
    public static const MENU_STATE_CHANGE:String = "menu_state_change";
//    public static const MENU_ICON_BUBBLE_SHOW:String = "menu_icon_bubble_show";
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
    public static const HIDE_VIP_FLAG:String = "HIDE_VIP_FLAG";//isHIdeVIP update
    public static const FINDTA_CHAT_MESSAGE:String = "FINDTA_CHAT_MESSAGE";

    public static const NEWVIP_INFO:String = "NEWVIP_INFO";//
    public static const NEWVIP_INFO_SEND:String = "NEWVIP_INFO_SEND";//

    /**
     * 春节充值 更新
     */
    public static const YEAR_ACTIVITY_UPDATE:String = "YEAR_ACTIVITY_UPDATE";
    /**切换页*/
    public static const PAGE_CHANGE:String = "PAGE_CHANGE";
    /**显示规则面板*/
    public static const SHOW_RULE_PANEL:String = "SHOW_RULE_PANEL";
    /**离开帮派*/
    public static const LEFT_CLAN:String = "LEFT_CLAN";


    //炼器
    public static const EQ_TOSTRONG_RETURN:String = "eq_tostrong_return";
    public static const EQ_TOSTRONG_SEND:String = "eq_tostrong_send";
    public static const EQ_DECOMPOSE_RETURN:String = "eq_decompose_return";
    public static const EQ_DECOMPOSE_SEND:String = "eq_decompose_send";
    public static const EQ_PURIFICATION_RETURN:String = "eq_purification_return";
    public static const EQ_PURIFICATION_SEND:String = "eq_purification_send";
    public static const EQ_PUNCH_RETURN:String = "eq_punch_return";
    public static const EQ_PUNCH_SEND:String = "eq_punch_send";
    public static const GEM_EMBED_RETURN:String = "gem_embed_return";
    public static const GEM_EMBED_SEND:String = "gem_embed_send";
    public static const GEM_UNEMBED_RETURN:String = "gem_unembed_return";
    public static const GEM_UNEMBED_SEND:String = "gem_unembed_send";
    public static const GEM_COMPOUND_RETURN:String = "gem_compound_return";
    public static const GEM_COMPOUND_SEND:String = "gem_compound_send";
    public static const GEM_SELECT_CONFIRM:String = "gem_select_confirm";
    public static const EQ_DECOMPOSE_PUSH_ALL:String = "eq_decompose_push_all";
    public static const TRUMP_MELT_SEND:String = "trump_melt_send";
    public static const TRUMP_UPGRADE_SEND:String = "trump_upgrade_send";
    public static const TRUMP_MELT_RETURN:String = "trump_melt_return";
    public static const TRUMP_UPGRADE_RETURN:String = "trump_upgrade_return";
    public static const EQ_EVOLUTION_RETURN:String = "eq_evolution_return";
    public static const EQ_EVOLUTION_SEND:String = "eq_evolution_send";
    public static const EQ_SOUL_RETURN:String = "eq_soul_return";
    public static const EQ_SOUL_SEND:String = "eq_soul_send";
    public static const EQ_UNSEAL_RETURN:String = "eq_unseal_return";
    public static const EQ_UNSEAL_SEND:String = "eq_unseal_send";
    public static const EQ_TO_STRONG_ACT:String = "eq_to_strong_act";
    public static const EQ_TO_STRONG_ACT_UPDATA:String = "eq_to_strong_act_updata";
    public static const EQ_EXTEND:String = "eq_exend_send";
    public static const EQ_EXTEND_RETURN:String = "eq_exend_return";
    public static const EQ_EXTEND_SELECT_EQ:String = "EQ_EXTEND_SELECT_EQ";

    //在线奖励
    public static const ON_REWARD_DRAW:String = "on_reward_draw";
    public static const REWARD_GET:String = "reward_get";

    //交易
    public static const SALE_LIST_RETURN:String = "sale_list_return";
    public static const SALE_LIST_SEND:String = "sale_list_send";
    public static const SALE_LAUNCH_SEND:String = "sale_launch_send";
    public static const SALE_OPERATE:String = "sale_operate";
    //组队
    public static const GROUP_INVITE:String = "groupInvite";//聊天模块邀请组队
    public static const GROUP_INVITE_ALL:String = "groupInviteAll";//立即加入
    public static const GROUP_COPY_REQUEST_INFO:String = "groupCopyRequestInfo";
    public static const GROUP_COPY_RESPONSE_INFO:String = "groupCopyResponseInfo";

    public static const GROUP_COPY_REQUEST_LOBBY_JOIN:String = "groupCopyRequestLobbyJoin";
    public static const GROUP_COPY_RESPONSE_LOBBY_JOIN:String = "groupCopyResponseLobbyJoin";

    public static const GROUP_COPY_REQUEST_ROOM_JOIN:String = "groupCopyRequestRoomJoin";
    public static const GROUP_COPY_RESPONSE_ROOM_JOIN:String = "groupCopyResponseRoomJoin";

    public static const GROUP_COPY_REQUEST_ROOM_JOIN_AUTO:String = "groupCopyRequestRoomJoinAuto";
    public static const GROUP_COPY_RESPONSE_ROOM_JOIN_AUTO:String = "groupCopyResponseRoomJoinAuto";

    public static const GROUP_COPY_REQUEST_ROOM_INFO:String = "groupCopyRequestRoomInfo";
    public static const GROUP_COPY_RESPONSE_ROOM_INFO:String = "groupCopyResponseRoomInfo";

    public static const GROUP_COPY_REQUEST_ROOM_EXIT:String = "groupCopyRequestRoomExit";
    public static const GROUP_COPY_RESPONSE_ROOM_EXIT:String = "groupCopyResponseRoomExit";

    public static const GROUP_COPY_REQUEST_ROOM_KICK:String = "groupCopyRequestRoomKick";
    public static const GROUP_COPY_RESPONSE_ROOM_KICK:String = "groupCopyResponseRoomKick";

    public static const GROUP_COPY_REQUEST_ROOM_CAPTAIN:String = "groupCopyRequestRoomCaptain";
    public static const GROUP_COPY_RESPONSE_ROOM_CAPTAIN:String = "groupCopyResponseRoomCaptain";

    public static const GROUP_COPY_REQUEST_ROOM_SORT:String = "groupCopyRequestRoomSort";
    public static const GROUP_COPY_RESPONSE_ROOM_SORT:String = "groupCopyResponseRoomSort";

    public static const GROUP_COPY_REQUEST_ROOM_FIGHT:String = "groupCopyRequestRoomFight";
    public static const GROUP_COPY_RESPONSE_ROOM_FIGHT:String = "groupCopyResponseRoomFight";

    public static const GROUP_COPY_REQUEST_CREATE_ROOM:String = "groupCopyRequestCreateRoom";
    public static const GROUP_COPY_RESPONSE_CREATE_ROOM:String = "groupCopyResponseCreateRoom";

    public static const GROUP_COPY_REQUEST_LOBBY_ROOM_LIST:String = "groupCopyRequestLobbyRoomList";
    public static const GROUP_COPY_RESPONSE_LOBBY_ROOM_LIST:String = "groupCopyResponseLobbyRoomList";

    public static const GROUP_COPY_REQUEST_AWARD_START:String = "groupCopyRequestAwardStart";
    public static const GROUP_COPY_RESPONSE_AWARD_START:String = "groupCopyResponseAwardStart";

    public static const GROUP_COPY_REQUEST_AWARD_END:String = "groupCopyRequestAwardEnd";
    public static const GROUP_COPY_RESPONSE_AWARD_END:String = "groupCopyResponseAwardEnd";

    public static const GROUP_COPY_RESPONSE_AWARD_INFO:String = "groupCopyResponseAwardInfo";

    public static const GROUP_COPY_ROOM_ID_CHANGE:String = "groupCopyRoomIdChange";

    public static const SECRETBOOK_REQUEST_INFO:String = "secretbookRequestInfo";
    public static const SECRETBOOK_RESPONSE_INFO:String = "secretbookResponseInfo";

    public static const WELCOME_OK:String = "welcome_ok";
    public static const WELCOME_POPUP:String = "welcome_popup";

    public static const AS_QQCLOCK_CALLBACK:String = "asQQClockCallback";
    public static const JS_QQCLOCK_REMINDER:String = "jsQQClockReminder";
    public static const JS_QQCLOCK_SEND:String = "jsQQClockSend";
    public static const JS_QQ3366_FAV:String = "jsQQ3366Fav";
    public static const JS_FRIEND_INVITE:String = "jsFriendInvite";
    public static const JS_FRIEND_REACTIVE:String = "jsFriendReactive";
    public static const JS_FRIEND_SENDREQUEST:String = "jsFriendSendRequest";

    public static const MODULE_LOAD:String = "moduleLoad";
    public static const SWF_LOAD:String = "swfModuleLoad";
    public static const SWF_END:String = "swfModuleEnd";
    public static const SWF_CLOSE:String = "swfModuleClose";

    public static const RECHARGE_RESPONSE_LIST:String = "rechargeResponseList";
    public static const RECHARGE_RESPONSE_UPDATE:String = "rechargeResponseUpdate";

    public static const SYS_SERVER_TIME:String = "sysServerTime";
    public static const SYS_REG_TIME:String = "sys_Reg_time";
    public static const SYS_BACK_TIME:String = "sys_Back_time";

    public static const REQ_SYS_SERVER_TIME:String = "req_sys_server_time";

    public static const ACTIVITY_COMMAND:String = "activity_command";
    public static const STORY_LOAD:String = "storyLoad";
    public static const STORY_PLAY:String = "storyPlay";
    public static const GIFT_DIFF:String = "gift_diff";

    public static const START_TURN:String = "StartTurn";
    public static const END_TURN:String = "EndTurn";
    public static const SET_TURNTABLE:String = "SetTurntable";
    public static const REFRESH_TURNTABLE:String = "RefreshTurntable";//刷新，或者隐藏

    public static const SHOW_RETURNPLAYER_BTN:String = "showReturnplayerBtn";//隐藏回流按钮，当returnPlayerProxy.returnPlayerLv == 0
    public static const RETURN_STATUS_UPDATE:String = "returnStatusUpdate";//回流状态更新

    public static const BRITHDAY_PROXY_UPDATE:String = "brithdayTableProxyUpdate";//生日转盘数据更新 0 索引 1 抽奖次数 2 是否可邀请

    //	周年盛典
    public static const ANNIVERSARY_GIFTS_INFO:String = "anniversaryGiftsInfo";	//	获得红包信息
    public static const ANNIVERSARY_GET_GIFTS_INFO:String = "anniversaryGetGiftsInfo";	//	获取红包信息

    public static const ANNIVERSARY_GET_GIFTS:String = "anniversaryGetGifts";	//	获取红包
    public static const ANNIVERSARY_ROUTE_INFO:String = "anniversaryRouteInfo";	//	获得剑侠路信息
    public static const ANNIVERSARY_ROUTE_AWARDS:String = "anniversaryRouteAwards";	//	获得剑侠路奖励
    public static const ANNIVERSARY_GET_ROUTE_INFO:String = "anniversaryGetRouteInfo";	//	获取剑侠路信息
    public static const ANNIVERSARY_GET_ROUTE_REWARDS:String = "anniversaryGetRouteRewards";	//	领取当前剑侠奖励
    public static const ANNIVERSARY_GET_ROUTE_STEPS:String = "anniversaryGetRouteSteps";	//	进行一次剑侠漫游
    public static const ANNIVERSARY_GET_ROUTE_MULTI_STEPS:String = "anniversaryGetRouteMultiSteps";	//	进行一次剑侠漫游

    public static const VOICEOFSS_RETURN:String = "voiceofssReturn";
    public static const VOICEOFSS_GET_REWARD:String = "voiceofssGetReward";

    public static const BLUEGIFT_RETURN:String = "blueGift";
    public static const BLUEGIFT_GET_REWARD:String = "blueGiftGetReward";

    public static const CARRERHOT_INIT:String = "carrerHotInit";
    public static const CARRERHOT_UPDATE:String = "carrerHotUpdate";
    public static const CARRERMATCH_UPDATE:String = "carrerMatchUpdate";//1 citta 2 skill
    //蓝钻优惠活动
    public static const BLUE_FAVORABLE_VIEW:String = "bluefavorableview";//购买蓝钻优惠活动物品
    //QQ_GAME_AWARD
    public static const QQ_GAMEAWARD_VIEW:String = "qq_gameaward_view";
    //充值奖励
    public static const XSGIFT:String = "xsgift";
    public static const XSGIFT_GET:String = "xsgift_get";
    public static const RECHARGE_H5:String = "recharge_h5";//充值

    //3366VIP奖励
    public static const GIFT3366:String = "gift3366";
    public static const GIFT3366_GET:String = "gift3366_get";


    public static const REGISTER_SEVEN_REQUEST:String = "registerSevenRequest";//注册七天客户端请求
    public static const REGISTER_SEVEN_UPDATE:String = "registerSeventUpdate";//注册七天数据更新

    //元神相关
    public static const OPENSOUL:String = "opensoul";
    public static const GETSOULINFO:String = "getsoulinfo";
    public static const SOULLEVELUP:String = "soullevelup";
    public static const SOULSWALLOW:String = "soulswallow";
    public static const USESOULSKILL:String = "usesoulskill";
    public static const GETALLSOULINFO:String = "getallsoulinfo";
    public static const NINGSHEN:String = "NINGSHEN";//凝神

    public static const FRAME_GAME_REQUEST:String = "frameGameRequest";//陷害游戏请求
    public static const FRAME_GAME_UPDATE:String = "frameGameUpdate";
    public static const FRAME_GAME_STATE:String = "frameGameState";//状态改变

    public static const FOURTH_CAREER_REQUEST:String = "fourthCareerRequest";
    //第四职业面板
    public static const FOURTH_CARRER_GETINFO:String = "fouthCarrerGetinfo";//获取数据
    public static const FOURTH_CARRER_SELECTPLACE:String = "fourthCarrerChoosePlace";//选择地点
    public static const FOURTH_CARRER_LOTTERY:String = "fourthCarrerLottery";//寻墨摇奖
    public static const FOURTH_CAREER_CANCELGAME:String = "fourthCareerCancelgame";//停止探险
    public static const FOURTH_CAREER_BUYHERO:String = "fourthCareerBuyhero";
    public static const FOURTH_CAREER_CHANGEPANEL:String = "fourthCareerChangepanel";

    public static const FOURTH_CAREER_UPDATE:String = "fourthCareerUpdate";//
    public static const FOURTH_CAREER_OPEN:String = "fourth_career_open";

    public static const TILE_GAME_INFO:String = "tileGameInfo";
    public static const TILE_GAME_MOVE:String = "tileGameMove";
    public static const TILE_GAME_SELECT:String = "tileGameSelect";
    public static const TILE_GAME_UPDATE:String = "tileGameUpdate";

    public static const FIGHTDEMONGUIDE_VIEW_CLICK:String = "fightdemonguideview";
    //寻墨挂机
    public static const TILE_HOOK_START:String = "tileHookStart";//请求
    public static const TILE_HOOK_STOP:String = "tileHookStop";
    public static const TILE_HOOK_NOW:String = "tileHookNow";

    public static const TILE_HOOK_UPDATE:String = "tileHookUpdate";

    public static const TALK_PANEL_CLICK:String = "talkPanelClick";

    public static const FAST_EQUIP:String = "fastEquip";
    public static const FAST_EQUIP_USE:String = "fastEquipUse";

    public static const RECODER_LOAD_SKIN:String = "recoderLoadSkin";
    public static const RECODER_LOAD_CONFIG:String = "recoderLoadConfig";
    public static const RECODER_LOAD_UI:String = "recoderLoadUI";
    public static const RECODER_LOAD_ZIP:String = "recoderLoadZip";
    public static const RECODER_LOAD_FIGHT_DATA:String = "recoderLoadFightData";

    public static const CARD_REWARD_UPDATE:String = "cardRewardUpdate";
    public static const CARD_REWARD_REFRESH:String = "cardRewardRefresh";
    public static const CARD_REWARD_CHOOSE:String = "cardRewardChoose";//选择
    public static const CARD_REWARD_CANCEL:String = "cardRewardCancel";//取消

    public static const SWORDFIGHT_UPDATE:String = "swordfightUpdate";//华山论剑数据更新
    public static const SWORDFIGHT_STATE_UPDATE:String = "swordfightState";//蜀山论剑状态更新
    public static const SWORDFIGHT_SELF_UPDATE:String = "swordfightSelfUpdate";//蜀山论剑个人状态更新
    public static const SWORDFIGHT_JOIN:String = "swordfightJoin";//参加
    public static const SWORDFIGHT_EXIT:String = "swordfightExit";//退出
    public static const SWORDFIGHT_INFO:String = "swordfightInfo";//请求个人
    public static const SWORDFIGHT_USESKILL:String = "swordfightUseskill";//使用技能
    public static const SWORDFIGHT_BUY_POWER:String = "swordfightBuyPower";//购买霸气
    public static const SWORDFIGHT_BUY_ANGER:String = "swordfightBuyAnger";//购买怒气

    public static const DREAM_TILE_UPDATE:String = "dreamTileUpdate";//水晶梦境更新


    //通灵宝具
    public static const BAOJU_UPGRADE:String = "baoju_upgrade";
    public static const BAOJU_UPGRADE_LIST:String = "baoju_upgrade_list";
    public static const BAOJU_UPGRADE_RESPONSE:String = "baoju_upgrade_response";
    public static const BAOJU_LOOK_LISTITEM:String = "BAOJU_LOOK_LISTITEM";

    public static const DREAM_TILE_REQUEST_ENTRYINFO:String = "dreamTileRequestEntryinfo";//水晶梦境请求入口数据
    public static const DREAM_TILE_REQUEST_SELECT:String = "dreamTileRequestSelect";//水晶梦境请求选择入口
    public static const DREAM_TILE_REQUEST_CANCEL:String = "dreamTileRequestCancel";//水晶梦境请求取消
    public static const DREAM_TILE_REQUEST_INFO:String = "dreamTileRequestInfo";//水晶梦境请求数据
    public static const DREAM_TILE_REQUEST_MOVE:String = "dreamTileRequestMove";//水晶梦境请求移动
    public static const DREAM_TILE_REQUEST_OPTION:String = "dreamTileRequestOption";//水晶梦境请求选择
    public static const DREAM_TILE_USE_EYE:String = "dreamTileUseEye";//使用梦境之眼
    public static const DREAM_TILE_BUY_EYE:String = "dreamTileBuyEye";//购买梦境之眼

    /**
     * 圣诞节
     * */
    public static const CHRISTMAS:String = "christmas";
    //QQ空间礼包
    public static const GET_QZONE_GIFT:String = "get_qzone_gift";
    public static const QZONE_GIFT:String = "qzone_gift";

    public static const GEMGIFT_INFO_REQUEST:String = "gemgiftinforequest";
    public static const GEMGIFT_REFRESH_REQUEST:String = "gemgiftrefreshrequest";
    public static const GEMGIFT_BUY_REQUEST:String = "gemgiftbuyrequest";
    public static const GEMGIFT_GET_REWARD_REQUEST:String = "gemgiftgetrewardrequest";

    public static const GEMGIFT_INFO_RESPONSE:String = "gemgiftinforesponse";
    public static const GEMGIFT_REFRESH_RESPONSE:String = "gemgiftrefreshresponse";
    public static const GEMGIFT_BUY_RESPONSE:String = "gemgiftbuyresponse";
    public static const GEMGIFT_GET_REWARD_RESPONSE:String = "gemgiftgetrewardresponse";

    public static const SYS_USE_GOODS:String = "sysUseGoods";


    //大闹龙宫
    public static const DRAGON_PALACE_UPDATE:String = "DRAGON_PALACE_UPDATE";
    public static const DRAGON_PALACE_REQUEST_INFO:String = "DRAGON_PALACE_REQUEST_INFO";//请求初始数据
    public static const DRAGON_PALACE_REQUEST_FIND:String = "DRAGON_PALACE_REQUEST_FIND";//请求探宝

    //领金蛋活动
    public static const SNAKE_EGG_UPDATE:String = "snakeEggUpdate";//领金丹活动
    public static const SNAKE_EGG_REQUEST_INFO:String = "snakeEggRequestInfo";
    public static const SNAKE_EGG_REQUEST_GREATING:String = "snakeEggRequestGreating";
    public static const SNAKE_EGG_REQUEST_AWARD:String = "snakeEggRequestAward";

    //蛇年红包
    public static const SNAKE_REDENVELOPE_UPDATE:String = "snakeRedEnvelopeUpdate";
    public static const SNAKE_REDENVELOPE_INFO:String = "snakeRedEnvelopeInfo";//获取数据
    public static const SNAKE_REDENVELOPE_AWARD:String = "snakeRedEnvelopeAward";//领取奖励
    public static const SNAKE_REDENVELOPE_REPAIR:String = "snakeRedEnvelopeRepair";//补领
    public static const SNAKE_REDENVELOPE_DOUBLE:String = "snakeRedEnvelopeDouble";//双倍

    //蛇年福袋
    public static const SNAKE_BAG_UPDATE:String = "snakeBagUpdate";
    public static const SNAKE_BAG_INFO:String = "snakeBagInfo";
    public static const SNAKE_BAG_CLOSE:String = "snakeBagClose";//扎紧福袋
    public static const SNAKE_BAG_OPEN:String = "snakeBagOpen";//打开福袋
    public static const SNAKE_BAG_SAVE:String = "snakeBagSave";//存钱
    public static const SNAKE_BAG_GET_AWARD:String = "snakeBagGetAward";//领取福袋

    //马年红包
    public static const HYEARRP_UPDATE:String = "HyearrpUpdate";
    public static const HYEARRP_INFO:String = "HyearrpInfo";//获取数据
    public static const HYEARRP_AWARD:String = "HyearrpAward";//领取奖励
    public static const HYEARRP_REPAIR:String = "HyearrpRepair";//补领
    public static const HYEARRP_DOUBLE:String = "HyearrpDouble";//双倍
    //Pet
    public static const PET_PROXY_UPDATE:String = "PET_PROXY_UPDATE";//0 信息更新 1 品阶更新 2 根骨更新 3 资源更新  7品阶突破(非初始化) 8 祝福值增加 4根骨突破(非init) 5根骨小周天 6根骨大周天 10 品阶id变化 11根骨id变化 12 战斗宠物发生变化 13 是否领取过宠物 14 传承完成
    public static const PET_SANHUN_UPDATE:String = "PET_SANHUN_UPDATE";

    public static const PET_REQUEST_INFO:String = "PET_REQUEST_PET_INFO";//请求宠物数据
    public static const PET_REQUEST_PINJIE_INFO:String = "PET_REQUEST_PINJIE_INFO";//请求品阶数据
    public static const PET_REQUEST_GENGU_INFO:String = "PET_REQUEST_GENGU_INFO";//请求根骨数据
    public static const PET_UPGRADE_PINJIE:String = "PET_UPGRADE_PINJIE";//突破品阶
    public static const PET_AUTO_UPGRADE_PINJIE:String = "PET_AUTO_UPGRADE_PINJIE";//突破品阶
    public static const PET_USE_SMALLDAY:String = "PET_USE_SMALLDAY";//小周天
    public static const PET_USE_BIGDAY:String = "PET_USE_BIGDAY";//大周天
    public static const PET_UPGRADE_GENGU:String = "PET_UPGRADE_GENGU";//突破根骨
    public static const PET_RECRUIT:String = "PET_RECRUIT";//招募灵宠
    public static const PET_FIRE:String = "PET_FIRE";//解雇灵宠
    public static const PET_GET_GIFT:String = "PET_GET_GIFT";//领取奖励
    public static const PET_RECRUIT_RESPONSE:String = "PET_RECRUIT_RESPONSE";//招募灵宠返回
    public static const PET_FIRE_RESPONSE:String = "PET_FIRE_RESPONSE";//解散灵宠返回
    public static const PET_SET_FIGHTER:String = "PET_SET_FIGHTER";//设置出战灵宠
    public static const PET_FREE_GET_PET:String = "PET_FREE_GET_PET";//免费领取宠物
    public static const PET_EXTENDS:String = "PET_EXTENDS";//传承
    public static const PET_UPGRADE_SANHUN:String = "PET_UPGRADE_SANHUN";//升级三魂
    public static const PET_QIPO_INFO_RETURN:String = "PET_QIPO_INFO_RETURN";//七魄信息返回
    public static const PET_QIPO_INFO_REQUEST:String = "PET_QIPO_INFO_REQUEST";//请求七魄信息
    public static const PET_UPGRADE_QIPO:String = "PET_UPGRADE_QIPO";//升级七魄返回
    public static const PET_UPLEVEL_QIPO_REQUEST:String = "PET_UPLEVEL_QIPO_REQUEST";//请求升级七魄
    public static const PET_FEISHENG_DOTASK:String = "PET_FEISHENG_DOTASK";//灵宠飞升做任务
    public static const PET_FEISHENG_TRAIN:String = "PET_FEISHENG_TRAIN";//灵宠飞升培养
    public static const PET_FEISHENG_REFRESH:String = "PET_FEISHENG_REFRESH";//飞升刷新
    public static const PET_NEIDAN_TASK:String = "PET_NEIDAN_TASK";//内丹道具获取
    //聚宝盆
    public static const TREASURE_BOWL_UPDATE:String = "TREASURE_BOWL_UPDATE";//数据 1:请求信息 2:购买聚宝盆 3:领取奖品
    public static const TREASURE_BOWL_INFO:String = "TREASURE_BOWL_INFO";
    public static const TREASURE_BOWL_BUY:String = "TREASURE_BOWL_BUY";//购买聚宝盆
    public static const TREASURE_BOWL_GET:String = "TREASURE_BOWL_GET";//领取聚宝盆


    public static const AUTO_MAP_ARRIVE:String = "autoMapArrive";
    public static const AUTO_MAP_HOOK:String = "autoMapHhook";
    //累计在线获得奖励
    public static const REQUEST_ONLIENREEWARD:String = "requestOnlineReward";
    public static const REFRESH_ONLINEDATA:String = "refreshOnlinedata";

    //灵宠空间
    public static const PETSPACE_UPDATE:String = "PETSPACE_UPDATE";
    public static const PETSPACE_REQUEST_INFO:String = "PETSPACE_REQUEST_INFO";//请求初始数据
    public static const PETSPACE_REQUEST_FIND:String = "PETSPACE_REQUEST_FIND";//请求探宝
    public static const PETSPACE_EXCHANGE:String = "PETSPACE_EXCHANGE";//兑换仙宠
    //新手御剑
    public static const NOVICE_VIP_UPDATE:String = "NOVICE_VIP_UPDATE";//更新
    public static const NOVICE_VIP_INFO:String = "NOVICE_VIP_INFO";//请求信息
    public static const NOVICE_VIP_DAYREWARD:String = "NOVICE_VIP_DAYREWARD";//每日奖励
    public static const NOVICE_VIP_BUY_1:String = "NOVICE_VIP_BUY_1";//限购1
    public static const NOVICE_VIP_BUY_2:String = "NOVICE_VIP_BUY_2";//限购1
    public static const NOVICE_VIP_BUY_3:String = "NOVICE_VIP_BUY_3";//限购1
    public static const NOVICE_VIP_OPEN:String = "NOVICE_VIP_OPEN";//开启VIP
    public static const NOVICE_VIP_ADDTIME:String = "NOVICE_VIP_ADDTIME";//增加时间
    public static const NOVICE_VIP_REQUEST:String = "NOVICE_VIP_REQUEST";


    public static const CHARGE_SUCESS:String = "chargeSuccess";//充值成功

    public static const SIGNIN2013_SIGNIN:String = "signin2013_sign";//注册
    public static const SIGNIN2013_GETREWARD:String = "signin2013_getreward";//领取奖励

    public static const REQUEST_SIGNIN2013_STATUS:String = "requestSignin2013";//请求服务器获取注册情况
    public static const SIGNIN2013_SIGNSUCCESS:String = "signin2013_signsuccess";//注册成功
    public static const SIGNIN2013_GETREWARDSUCCESS:String = "signin2013_getrewardsuccess";//领取成功
    public static const SIGNIN2013_refeshSignInData:String = "signin2013_refresh";//刷新数据

    //妖王再临
    public static const KRAKEN_INFO:String = "KRAKEN_INFO";
    public static const KRAKEN_BUYTIMES:String = "KRAKEN_BUYTIMES";
    public static const KRAKEN_LINGSHI:String = "KRAKEN_LINGSHI";
    public static const KRAKEN_FIGHT:String = "KRAKEN_FIGHT";
    public static const KRAKEN_AUTOFIGHT:String = "KRAKEN_AUTOFIGHT";

    //惊羽楼
    public static const PUZZLE_INFO:String = "PUZZLE_INFO";
    //答题活动
    public static const QUESTION_INIT:String = "question_init";
    public static const QUESTION_RESPONE:String = "question_respone";
    public static const QUESTION_REQ:String = "question_req";
    public static const QUESTION_COUNTDOWN:String = "question_countdown";
    public static const QUESTION_CHANGE:String = "QUESTION_CHANGE";

    public static const SPECIALVIP_DAILYREWARD:String = "specialVip_dailyGetReward";
    public static const OPENSPEICALVIP_REQUESTLOTTERYNUM:String = "openspecialvip_requestlotteryTimes";//开通黄钻 请求抽奖次数

    public static const LUCK_STAR_UPDATE:String = "LUCK_STAR_UPDATE";
    public static const LUCK_STAR_REQUEST_INFO:String = "LUCK_STAR_REQUEST_INFO";
    public static const LUCK_STAR_REQUEST_GET:String = "LUCK_STAR_REQUEST_GET";


    public static const TEXT_ACTIVITY_UPDATE:String = "TEXT_ACTIVITY_UPDATE";
    public static const TEXT_ACTIVITY_INFO:String = "TEXT_ACTIVITY_INFO";
    public static const TEXT_ACTIVITY_USE:String = "TEXT_ACTIVITY_USE";
    public static const TEXT_ACTIVITY_ALL:String = "TEXT_ACTIVITY_ALL";
    public static const TEXT_ACTIVITY_EXCHANGE:String = "TEXT_ACTIVITY_EXCHANGE";
    public static const TEXT_ACTIVITY_EXCHANGE1:String = "TEXT_ACTIVITY_EXCHANGE1";
    public static const TEXT_ACTIVITY_EXCHANGE2:String = "TEXT_ACTIVITY_EXCHANGE2";

    public static const NVWA_STONE_UPDATE:String = "NVWA_STONE_UPDATE";//女娲神石
    public static const NVWA_STONE_REQUEST_INFO:String = "NVWA_STONE_REQUEST_INFO";
    public static const NVWA_STONE_REQUEST_OPEN:String = "NVWA_STONE_REQUEST_OPEN";

    public static const UPGRADEREWARD_RESPONSE:String = "UPGRADEREWARD_RESPONSE";
    public static const OPEN_ENDWAR:String = "OPEN_ENDWAR";//开启末日之战 显示右下角TIP用

    public static const PET_UPGRADE_REQUEST:String = "PET_UPGRADE_REQUEST";//灵宠进阶请求(进化值满时)
    public static const PET_UPGRADE_UPDATE:String = "PET_UPGRADE_UPDATE";

    public static const PET_PACK_UPDATE:String = "PET_PACK_UPDATE";//灵宠背包数据更新
    public static const PET_PACK_ON_EQUIP:String = "PET_PACK_ON_EQUIP";//灵宠装上装备
    public static const PET_PACK_OFF_EQUIP:String = "PET_PACK_OFF_EQUIP";//灵宠卸下装备
    public static const PET_PACK_JEWEL_MERGE:String = "PET_PACK_JEWEL_MERGE";//请求精魄合成
    public static const PET_PACK_EQUIP_UPGRADE:String = "PET_PACK_EQUIP_UPGRADE";//请求装备升级
    public static const PET_PACK_ON_JEWEL:String = "PET_PACK_ON_JEWEL";//镶嵌宝石
    public static const PET_PACK_OFF_JEWEL:String = "PET_PACK_OFF_JEWEL";//取下宝石

    public static const QQBROWER_RESPONSE:String = "QQBROWER_RESPONSE"; //QQ浏览器信息
    public static const QQNAVIGATE_RESPONSE:String = "QQNAVIGATE_RESPONSE"; //QQ浏览器信息
    public static const QQMUSIC_RESPONSE:String = "QQMUSIC_RESPONSE"; //QQ浏览器信息
    public static const QQTENPAY_RESPONSE:String = "QQTENPAY_RESPONSE";
    //八部浮屠
    public static const PET_EQUIP_OUTPUT_UPDATE:String = "PET_EQUIP_OUTPUT_UPDATE"
    public static const PET_EQUIP_OUTPUT_REQUESTINFO:String = "PET_EQUIP_OUTPUT_REQUESTINFO";
    public static const PET_EQUIP_OUTPUT_REQUESTGROWUP:String = "PET_EQUIP_OUTPUT_REQUESTGROWUP";
    public static const PET_EQUIP_OUTPUT_REQUESTSTRONGTHEN:String = "PET_EQUIP_OUTPUT_REQUESTSTRONGTHEN";
    public static const PET_EQUIP_OUTPUT_REQUESTBUY:String = "PET_EQUIP_OUTPUT_REQUESTBUY";
    public static const PET_EQUIP_OUTPUT_REQUESTGET:String = "PET_EQUIP_OUTPUT_REQUESTGET";

    public static const Request_WEEK_ACTIVITY_INFO:String = "request_WeekActivity_info";
    public static const Request_WEEK_ACTIVITY_REWARDS:String = "request_WeekActivity_rewards";//奖励展示

    public static const WEEK_ACTIVITY_HOLDER_REFRESH:String = "weekActivity_holderRefresh";
    public static const WEEK_ACTIVITY_GETREWARDS:String = "weekActivity_get_rewards";//领取奖励

    public static const QDGOLDOFFER_SEND_STATUS:String = "sendSever_qd_goldoffer";
    public static const QDGOLDOFFER_CURRENT_STATUS:String = "qd_current_status";

    public static const REQUEST_WEEK_ACTIVITY_SENDTOME:String = "Request_week_activity_sendToMe";
    public static const REQUEST_WEEK_ACTIVITY_HOLDERSEND:String = "Request_week_activity_holdersend";

    public static const ZHAOCAI_UPGRADE:String = "ZHAOCAI_UPGRADE";
    public static const ZHAOCAI_REQUEST_INFO:String = "ZHAOCAI_REQUEST_INFO";
    public static const ZHAOCAI_REQUEST_TURN:String = "ZHAOCAI_REQUEST_TURN";

    public static const RIYUE_UPDATE:String = "RIYUE_UPDATE";
    public static const RIYUE_REQUEST_INFO:String = "RIYUE_REQUEST_INFO";
    public static const RIYUE_REQUEST_EXCHANGE:String = "RIYUE_REQUEST_EXCHANGE";

    public static const POWER_CONTRAST_LOOK:String = "POWER_CONTRAST_REQUEST";//战力对比查看
    public static const POWER_CONTRAST_GET:String = "POWER_CONTRAST_GET";//获取(战斗的时候，获取不查看)
    public static const POWER_CONTRAST_UPDATE:String = "POWER_CONTRAST_UPDATE";//战斗力对比更新
    //弹出公告
    public static const POPUPSYS:String = "popupsys";
    public static const NOTICE_PRATICE_BUFFEVENT:String = "notic_practice_buff_change";// 获取buff后 传递给 修炼界面


    public static const TD_BATTLE_SHOW:String = "TD_BATTLE_SHOW";//显示
    public static const TD_BATTLE_HIDE:String = "TD_BATTLE_HIDE";//隐藏
    public static const TD_BATTLE_END:String = "TD_BATTLE_END";//战斗结束(播放结束)

    public static const TD_BATTLE_UPDATE:String = "TD_BATTLE_UPDATE";//墨守成规 战斗 更新
    public static const TD_BATTLE_ATTACK_EACHOTHER:String = "TD_BATTLE_ATTACK_EACHOTHER";//互相攻击
    public static const TD_BATTLE_ATTACK_WALL:String = "TD_BATTLE_ATTACK_WALL";//攻击城墙
    public static const TD_BATTLE_START_ROUND:String = "TD_BATTLE_START_ROUND";//开始回合
    public static const TD_BATTLE_ROUND_RESET:String = "TD_BATTLE_ROUND_RESET";//回合重置，没死的移上去，数组，
    public static const TD_BATTLE_ROUND_OVER:String = "TD_BATTLE_ROUND_OVER";//回合结束

    public static const QQ_SHOW_UPDATE:String = "QQ_SHOW_UPDATE";//update
    public static const QQ_SHOW_SET:String = "QQ_SHOW_SET";//设置QQ秀

    public static const BUY_BACK_INFO_UPDATED:String = "BUY_BACK_INFO_UPDATED";//数据已经更新
    public static const BUY_BACK_ITEM_UPDATED:String = "BUY_BACK_ITEM_UPDATED";//单个物品更新
    public static const BUY_BACK_INFO:String = "BUY_BACK_INFO";
    public static const BUY_BACK_ITEM:String = "BUY_BACK_ITEM";//回购

    public static const QQ_BACK_UPDATED:String = "QQ_BACK_UPDATED";//更新
    public static const QQ_BACK_GET:String = "QQ_BACK_GET";//请求领取
    public static const QQ_BACK_INFO:String = "QQ_BACK_INFO";

    public static const QQ_BACK_UPDATED_NEW:String = "QQ_BACK_UPDATED_NEW";//更新
    public static const QQ_BACK_GET_NEW:String = "QQ_BACK_GET_NEW";//请求领取
    public static const QQGAME_GIFT_GET:String = "qq_back_get_new";//请求领取

    public static const QQ_IM_RESPONSE_INFO:String = "QQ_IM_RESPONSE_INFO";
    public static const QQ_IM_REQUEST_INFO:String = "QQ_IM_REQUEST_INFO";

    public static const SPREWARD:String = "SPREWARD";//蜀山奇遇

    public static const SPREWARD_GET:String = "SPREWARD_GET";//蜀山奇遇领取
    public static const SPREWARD_NEW:String = "SPREWARD_NEW";//蜀山奇遇 回流版

    public static const QQBACKONLINE_RESPONSE:String = "QQBACKONLINE_RESPONSE";//设置QQ秀
    public static const QQBACKONLINE_ICON:String = "QQBACKONLINE_ICON";//设置QQ秀

    public static const MO_FANG_CHANGEPANEL:String = "MO_FANG_CHANGEPANEL";//切换面板
    public static const MO_FANG_GOTO_FACTORY:String = "MO_FANG_GOTO_FACTORY";//前往机关术
    public static const MO_FANG_UPDATED:String = "MO_FANG_UPDATED";//墨方更新
    public static const MO_FANG_ONEKEY_MAKE:String = "MO_FANG_ONEKEY_MAKE";//墨方一键制作
    public static const MO_FANG_MAKE:String = "MO_FANG_MAKE";//墨方制作
    public static const MO_FANG_EQUIP_ON:String = "MO_FANG_EQUIP_ON";//墨方装备
    public static const MO_FANG_EQUIP_OFF:String = "MO_FANG_EQUIP_OFF";//墨方卸下
    public static const MO_FANG_MAKE_SUCCESS:String = "MO_FANG_MAKE_SUCCESS";//制作成功
    public static const MO_FANG_UPGRADE_SIGNET:String = "MO_FANG_UPGRADE_SIGNET";//升级印记
    public static const MO_FANG_ONEKEY_UPGRADE_SIGNET:String = "MO_FANG_ONEKEY_UPGRADE_SIGNET";//一键升级印记
    public static const MO_FANG_TRANSFORM:String = "MO_FANG_TRANSFORM";//转化
    public static const MO_FANG_TANGRAM:String = "";//墨方 打开七巧板
    public static const MO_FANG_SPACE_REWARD:String = "MO_FANG_SPACE_REWARD";//墨方 震位奖励
    public static const MO_FANG_REQUEST_CHANGE_SCHEME:String = "MO_FANG_REQUEST_CHANGE_SCHEME";//切换方案

    public static const CAMP_SELECT_RESPONSE:String = "CAMP_SELECT_RESPONSE";//

    public static const CARD_GATHER:String = "CARD_GATHER";//周年庆卡片收集
    public static const CARD_GATHER_RESPONSE:String = "CARD_GATHER_RESPONSE";

    public static const OPEN_PRAYTREE_VIEW:String = "openPrayView";//打开许愿树面板
    public static const PrayTree_Requst_DoPray:String = "doRequestPray";//请求许愿
    public static const PrayTree_Request_selectedWish:String = "Request_selectedWish";//选择愿望
    public static const PrayTree_refresh_MyInfo:String = "refreshMyInfo";//刷新我的信息

    public static const PrayTree_request_MyInfo:String = "requestMyInfo";//请求我的信息
    public static const PrayTree_request_otherInfo:String = "requestOtherInfo";//请求好友信息
    public static const PrayTree_friendStruct_change:String = "prayTree_friendStructChange";//好友信息更改
    /**
     *青木佑护
     */
    public static const ClanTree_Quality1Buff_change:String = "ClanTree_Quality1Buff_change";//青木护佑 改变
    public static const OpenServiceGift_selcted:String = "openservice_selected";//
    public static const OpenServiceGift_request_server:String = "OpenServiceGift_request_server";
    public static const OpenServiceGift_refresh_info:String = "OpenServiceGift_refresh_info";
    /**
     * 国庆
     * */
    public static const QUOQING_SEND_INFO:String = "guoqing_send_info";
    public static const QUOQING_CALL_INFO:String = "guoqing_call_info";
    public static const TIANSHU_SEND_INFO:String = "tianshu_send_info";
    public static const TIANSHU_CALL_INFO:String = "tianshu_call_info";
    public static const TIANSHU_SEND_MEMBER_INFO:String = "tianshu_send_member_info";
    public static const TIANSHU_DAYGIFT:String = "TIANSHU_DAYGIFT";

    public static const PrayTree_reward_timer:String = "prayTree_reward_timer";
//    public static const AreaFlag_Buff_over:String = "areaflag_buff_over";

    //金库
    public static const TRADE_TREASURY_UPDATE:String = "TRADE_TREASURY_UPDATE";//金库更新
    public static const TRADE_TREASURY_REQUEST_INFO:String = "TRADE_TREASURY_REQUEST_INFO";//请求金库数据
    public static const TRADE_TREASURY_REQUEST_GET:String = "TRADE_TREASURY_REQUEST_GET";//请求提取
    public static const QQBROWER_LOGIN_REWARD:String = "QQBROWER_LOGIN_REWARD";


    //决战天魔
    public static const FIGHT_DEMON_REQUEST_STATE:String = "FIGHT_DEMON_REQUEST_STATE";//玩家状态
    public static const FIGHT_DEMON_INFO:String = "FIGHT_DEMON_INFO";//界面信息


    //七石斗法
    public static const SEVENSTONE_UPDATED:String = "SEVENSTONE_UPDATED";//数据更新  3个人数据更新
    public static const SEVENSTONE_SERVERRANK_UPDATED:String = "SEVENSTONE_SERVERRANK_UPDATED";//2 服务器排行更新
    public static const SEVENSTONE_QQRANK_UPDATED:String = "SEVENSTONE_QQRANK_UPDATED";// 好友列表更新
    public static const SEVENSTONE_TIME_UPDATED:String = "SEVENSTONE_TIME_UPDATED";//时间更新
    public static const SEVENSTONE_COMPLETE:String = "SEVENSTONE_COMPLETE";//已经完成，数据更新
    public static const SEVENSTONE_FAIL:String = "SEVENSTONE_FAIL";//失败
    public static const SEVENSTONE_START:String = "SEVENSTONE_START";//游戏可以进入
    public static const SEVENSTONE_REQUEST_MYINFO:String = "SEVENSTONE_REQUEST_MYINFO";//请求个人数据
    public static const SEVENSTONE_REQUEST_QQRANK:String = "SEVENSTONE_REQUEST_QQRANK";//QQ好友排名
    public static const SEVENSTONE_REQUEST_SERVERRANK:String = "SEVENSTONE_REQUEST_SERVERRANK";//全服排名
    public static const SEVENSTONE_REQUEST_START:String = "SEVENSTONE_REQUEST_START";//请求开始
    public static const SEVENSTONE_REQUEST_PLAY:String = "SEVENSTONE_REQUEST_PLAY";//开始玩
    public static const SEVENSTONE_REQUEST_COMPLETE:String = "SEVENSTONE_REQUEST_COMPLETE";//完成
    public static const SEVENSTONE_REQUEST_ADDTIME:String = "SEVENSTONE_REQUEST_ADDTIME";//加时
    public static const SEVENSTONE_REQUEST_REPLAY:String = "SEVENSTONE_REQUEST_REPLAY";//重玩
    public static const SEVENSTONE_REQUEST_TIMEROVER:String = "SEVENSTONE_NOTICE_TIMEROVER";//通知时间结束
    public static const SEVENSTONE_REQUEST_CONTINUE:String = "SEVENSTONE_REQUEST_CONTINUE";//继续
    public static const SEVENSTONE_REQUEST_RESET:String = "SEVENSTONE_REQUEST_RESET";//重置
    public static const SEVENSTONE_REQUEST_EXIT:String = "SEVENSTONE_REQUEST_EXIT";//退出
    public static const SEVENSTONE_REQUEST_SELFREWARD:String = "SEVENSTONE_REQUEST_SELFREWARD";
    public static const SEVENSTONE_REQUEST_QQHELP:String = "SEVENSTONE_REQUEST_QQHELP";

    public static const PACK_OPT_CHANGE_NAME:String = "PACK_OPT_CHANGE_NAME";
    public static const TRADE_PACKVIEW_SHOW:String = "TRADE_PACKVIEW_SHOW";

    //成长基金
    public static const GROWREWARD_UPDATED:String = "GROWREWARD_UPDATED";//数据更新
    public static const GROWREWARD_BUY:String = "GROWREWARD_BUY";//购买
    public static const GROWREWARD_GET:String = "GROWREWARD_GET";//领取

    //情义罗盘
    public static const FRIENDSHIP_UPDATED:String = "FRIENDSHIP_UPDATED";
    public static const FRIENDSHIP_ROLLTASK:String = "FRIENDSHIP_ROLLTASK";//开始Roll任务
    public static const FRIENDSHIP_ROLLREWARD:String = "FRIENDSHIP_ROLLREWARD";//Roll奖励

    public static const FRIENDSHIP_REQUEST_INFO:String = "FRIENDSHIP_REQUEST_INFO";//
    public static const FRIENDSHIP_REQUEST_INVITE:String = "FRIENDSHIP_REQUEST_INVITE";//邀请
    public static const FRIENDSHIP_REQUEST_EXITTEAM:String = "FRIENDSHIP_REQUEST_EXITTEAM";//退出
    public static const FRIENDSHIP_REQUEST_GIVEUP:String = "FRIENDSHIP_REQUEST_GIVEUP";//放弃任务
    public static const FRIENDSHIP_REQUEST_NOWCOMPLETE:String = "FRIENDSHIP_REQUEST_NOWCOMPLETE";//立刻完成
    public static const FRIENDSHIP_REQUEST_ROLLREWARD:String = "FRIENDSHIP_REQUEST_ROLLREWARD";//财富之星
    public static const FRIENDSHIP_REQUEST_ADDTIMES:String = "FRIENDSHIP_REQUEST_ADDTIMES";//增加任务奖励倍数
    public static const FRIENDSHIP_REQUEST_BUYDICE:String = "FRIENDSHIP_REQUEST_BUYDICE";//购买骰子
    public static const FRIENDSHIP_REQUEST_GETTASKREWARD:String = "FRIENDSHIP_REQUEST_GETTASKREWARD";//领取任务奖励
    public static const FRIENDSHIP_REQUEST_ROLLTASK:String = "FRIENDSHIP_REQUEST_ROLLTASK";
    public static const GUIDE_HIDE:String = "GUIDE_HIDE";
    public static const GUIDE_SHOW:String = "GUIDE_SHOW";
    public static const TASK_REFRESH:String = "TASK_REFRESH";
    public static const FIGHT_PREV_POPUP:String = "FIGHT_PREV_POPUP";
    public static const TASK_REFRESH_INIT:String ="TASK_REFRESH_INIT" ;
    public static var PACK_OPT_PUT_SELECTNUM:String = "PACK_OPT_PUT_SELECTNUM";
    public static var SHOW_SIGN:String ="SHOW_SIGN" ;
    public static var HERO_RED_UPDATE:String ="HERO_RED_UPDATE";

    ;//鹊桥
    public static const FRIENDSHIP_REQUEST_GETREWARDTIMES:String = "FRIENDSHIP_REQUEST_GETREWARDTIMES";//领取财富之星
    public static const FRIENDSHIP_REQUEST_GETREWARD:String = "FRIENDSHIP_REQUEST_GETREWARD";//财富之星 抽奖
    public static const FRIENDSHIP_REQUEST_BUYREWARD:String = "FRIENDSHIP_REQUEST_BUYREWARD";//购买财富之星

    public static const FRIENDSHIP_REQUEST_GETTODAYSTAR:String = "FRIENDSHIP_REQUEST_GETTODAYSTAR";//领取每日财富之星
    public static const FRIENDSHIP_REQUEST_GETTEAMSTAR:String = "FRIENDSHIP_REQUEST_GETTEAMSTAR";//领取团队财富之星
    public static const FRIENDSHIP_REQUEST_DAYGIFT:String = "FRIENDSHIP_REQUEST_DAYGIFT";//领取每日奖励
    public static const FRIENDSHIP_DAYGIFT_INFO:String = "FRIENDSHIP_DAYGIFT_INFO";//每日奖励

    public static const RUNE_DEBLOCK_FAILED:String = "RUNE_DEBLOCK_FAILED";
    public static var SHSHQY_AWAD_INFO:String = "SHSHQY_AWAD_INFO";//蜀山奇遇
    public static const SHSHQY3366_AWAD_INFO:String = "SHSHQY3366_AWAD_INFO";//3366充值
    public static const BOCAI_AWAD_INFO:String = "BOCAI_AWAD_INFO";//繁体博彩
    public static const INKTREASURE_AWAD_INFO:String = "INKTREASURE_AWAD_INFO";//墨宝
    public static var XMAS_HIDEANDSEEK_REQUEST:String = "XMAS_HIDEANDSEEK_REQUEST";
    public static var XMAS_HIDEANDSEEK__OPENDIALOG:String = "XMAS_HIDEANDSEEK__OPENDIALOG";

    public static const OPEN_FIGHT_DEMON_VIEW:String = "OPEN_FIGHT_DEMON_VIEW";//打开抗击天魔界面
    public static const CLOSE_FIGHT_DEMON_VIEW:String = "CLOSE_FIGHT_DEMON_VIEW";//关闭抗击天魔界面
    public static const OPEN_PET_DUNGEON_VIEW:String = "openPetDungeonView";//打开宠物副本界面
    public static const CLOSE_PET_DUNGEON_VIEW:String = "CLOSE_PET_DUNGEON_VIEW";//关闭宠物副本界面
    public static const JOIN_FIGHT_DEMON_TEAM:String = "JOIN_FIGHT_DEMON_TEAM ";//加入抗击天魔副本
    public static const Exit_FIGHT_DEMON_TEAM:String = "Exit_FIGHT_DEMON_TEAM ";//退出抗击天魔副本
    public static const FIGHT_DEMON_FAILUREGUIDE:String = "FIGHT_DEMON_FAILUREGUIDE ";
    public static const PET_DUNGEON_SHOW:String = "PET_DUNGEON_SHOW";
    public static const PET_DUNGEON_GET_INFO:String = "PET_DUNGEON_GET_INFO";//协助列表00消息获得
    public static const PET_DUNGEON_ASSIST_CHANGE:String = "PET_DUNGEON_ASSIST_CHANGE";//协助列表改变
    public static const PET_DUNGEON_CREATE_ROOM:String = "PET_DUNGEON_CREATE_ROOM";//创建房间
    public static var PET_DUNGEON_CREATE_TEAM:String = "PET_DUNGEON_CREATE_TEAM";//创建队伍
    public static var PET_DUNGEON_JOIN_TEAM:String = "PET_DUNGEON_JOIN_TEAM";//加入队伍
    public static var PET_DUNGEON_EXIT_TEAM:String = "PET_DUNGEON_EXIT_TEAM";//退出队伍
    public static var PET_DUNGEON_KICK_OUT_TEAM:String = "PET_DUNGEON_KICK_OUT_TEAM";//踢出队伍
    public static var PET_DUNGEON_FORMATION_CHANGE:String = "PET_DUNGEON_FORMATION_CHANGE";//阵型改变
    public static var PET_DUNGEON_REFRESH_MONSTER:String = "PET_DUNGEON_REFRESH_MONSTER";//刷新珍兽
    public static var PET_DUNGEON_INVITE_REQ:String = "PET_DUNGEON_INVITE_REQ";//宠物副本邀请组队，发送邀请请求
    public static var PET_DUNGEON_INVITE:String = "PET_DUNGEON_INVITE";//宠物副本邀请组队，点击聊天框连接
    public static var PET_DUNGEON_DISMISS_TEAM:String = "PET_DUNGEON_DISMISS_TEAM";//自己是队员，房主主动解散队伍时
    public static var PET_DUNGEON_COUNT_DOWN:String = "PET_DUNGEON_COUNT_DOWN";//战斗开始倒计时
    public static var PET_DUNGEON_KICK_OUT_MEMBER:String = "PET_DUNGEON_KICK_OUT_MEMBER";//踢出一个队员
    public static var PET_DUNGEON_INVITE_FRIEND:String = "PET_DUNGEON_INVITE_FRIEND";//邀请好友
    public static var PET_DUNGEON_REJECT:String = "PET_DUNGEON_REJECT";//被好友拒绝邀请
    public static var PET_DUNGEON_INVITE_FRIEND_REQ:String = "PET_DUNGEON_INVITE_FRIEND_REQ";//请求邀请好友
    public static var PET_DUNGEON_INVITE_REJECT:String = "PET_DUNGEON_INVITE_REJECT";//拒绝好友邀请

    public static const QT_SIGN_HTTP_SHARE:String = "QT_SIGN_HTTP_SHARE";
    public static const QT_SIGN_HTTP_REQUEST:String = "QT_SIGN_HTTP_REQUEST";
    public static const QT_SIGN_HTTP_RESPONSE:String = "QT_SIGN_HTTP_RESPONSE";

    //结婚
    public static const MARRIAGE_SEND_INFO:String = "MARRIAGE_SEND_INFO";//初始化信息
    public static const MARRIAGE_SEND_RECORD:String = "MARRIAGE_REQUEST_RECORD";//请求列表
    public static const MARRIAGE_SEND_PLAYER:String = "MARRIAGE_SEND_PLAYER";

    public static const MARRIAGE_SEND_GIVEUP:String = "MARRIAGE_SEND_GIVEUP";//离婚
    public static const MARRIAGE_SEND_GIVEUP_REPLY:String = "MARRIAGE_SEND_GIVEUP_REPLY";//离婚回复

    public static const MARRIAGE_SEND_BEENGAGED:String = "MARRIAGE_SEND_BEENGAGED";//预定婚礼
    public static const MARRIAGE_SEND_BEENGAGED_REPLY:String = "MARRIAGE_SEND_BEENGAGED_REPLY";//预定婚礼回复
    public static const MARRIAGE_SEND_BEENGAGED_CANCEL:String = "MARRIAGE_SEND_BEENGAGED_CANCEL";//取消婚礼
    public static const MARRIAGE_SEND_BEENGAGED_CANCEL_REPLY:String = "MARRIAGE_SEND_BEENGAGED_CANCEL_REPLY";//取消婚礼回复

    public static const MARRIAGE_SEND_SEEKING:String = "MARRIAGE_SEND_SEEKING";//请求证婚
    public static const MARRIAGE_SEND_SEEKING_CANCEL:String = "MARRIAGE_SEND_SEEKING_CANCEL";//取消征婚
    public static const MARRIAGE_SEND_SEEKING_ASK:String = "MARRIAGE_SEND_SEEKING_ASK";//请求结缘
    public static const MARRIAGE_SEND_SEEKING_ASK_REPLY:String = "MARRIAGE_SEND_SEEKING_ASK_REPLY";//结缘回复
    public static const MARRIAGE_SEND_SEEKING_MODIFY:String = "MARRIAGE_SEND_SEEKING_MODIFY";//结缘回复
    public static const MARRIAGE_SEND_SEEKING_AGAIN:String = "MARRIAGE_SEND_SEEKING_AGAIN";//结缘回复

    public static const MARRIAGE_CALL_RECORED:String = "MARRIAGE_CALL_RECORED";
    public static const MARRIAGE_CALL_INFO:String = "MARRIAGE_CALL_INFO";
    public static const MARRIAGE_CALL_STATE:String = "MARRIAGE_CALL_STATE";
    public static const MARRIAGE_CALL_PLAYER:String = "MARRIAGE_CALL_PLAYER";
    public static const MARRIAGE_CALL_HINT:String = "MARRIAGE_CALL_HINT";
    public static const MARRIAGE_CALL_SEEKING:String = "MARRIAGE_CALL_SEEKING";
    public static const MARRIAGE_CALL_BEENGAGED:String = "MARRIAGE_CALL_BEENGAGED";
    public static const MARRIAGE_CALL_DATE:String = "MARRIAGE_CALL_DATE";
    public static const MARRIAGE_CALL_TIME:String = "MARRIAGE_CALL_TIME";
    public static const MARRY_REQUEST_CANCEL1:String = "MARRY_REQUEST_CANCEL1";//

    public static const MARRIAGE_SHOW:String = "MARRIAGE_SHOW";
    public static const MARRIAGE_HP:String = "MARRIAGE_HP";
    public static const LUCKTABLENY_UPDATED:String = "LUCKTABLENY_UPDATED";//更新
    public static const LUCKTABLENY_TURN:String = "LUCKTABLENY_TURN";//后台告诉转
    public static const LUCKTABLENY_REQUEST_INFO:String = "LUCKTABLENY_REQUEST_INFO";//请求信息
    public static const LUCKTABLENY_REQUEST_TURN:String = "LUCKTABLENY_REQUEST_TURN";//请求转
    public static const LUCKTABLENY_REQUEST_GIFT:String = "LUCKTABLENY_REQUEST_GIFT";//请求奖励

    public static const TOPUPREWARD_UPDATED:String = "TOPUPREWARD_UPDATED";
    public static const TOPUPREWARD_REQUEST_RANK:String = "TOPUPREWARD_REQUEST_RANK";
    public static const TOPUPREWARD_REQUEST_MYINFO:String = "TOPUPREWARD_REQUEST_MYINFO";


    public static const MarryHomeRequestInfo:String = "MarryHomeRequestInfo";
    public static const MarryHomeRequestPet:String = "MarryHomeRequest";
    public static const MarryHomeRequestGetReward:String = "MarryHomeRequestGetReward"//领取奖励
    public static const MarryHomeRequestChangeName:String = "MarryHomeRequestChangeName";//更换名字
    public static const MarryHomeRequestChangeToken:String = "MarryHomeRequestChangeToken";//更换信物
    public static const MarryHomeRequestFish:String = "MarryHomeRequestFish";//钓鱼

    public static const MarryHome_State_Return:String = "MarryHome_State_Return";// 夫妻家园状态返回
    public static const MarryHome_PetState_Return:String = "MarryHome_PetState_Return";//夫妻家园宠物返回
    public static const MarryHome_fish_Return:String = "MarryHome_fish_Return";//钓鱼返回
    public static const MarryHome_Tiltel_Pop:String = "MarryHome_Tiltel_Pop";//右下角提示
    //结婚 S-C
    public static const MARRY_MODEL_UPDATED:String = "MARRY_MODEL_UPDATED";//Model
    public static const MARRY_ANSWER_RESULT:String = "MARRY_ANSWER_RESULT";//
    //C-S
    public static const MARRY_REQUEST_FIREWORKS:String = "MARRY_REQUEST_FIREWORKS";//放烟花
    public static const MARRY_REQUEST_LILY:String = "MARRY_REQUEST_LILY";//百合
    public static const MARRY_REQUEST_ANSWER:String = "MARRY_REQUEST_ANSWER";//选择答案
    //public static const MARRY_REQUEST_EAT:String = "MARRY_REQUEST_EAT";//入席
    public static const MARRY_REQUEST_EATOVER:String = "MARRY_REQUEST_EATOVER";//吃完
    public static const MARRY_REQUEST_CLICKDOOR:String = "MARRY_REQUEST_CLICKDOOR";//点击洞房
    public static const MARRY_REQUEST_GETEGG:String = "MARRY_REQUEST_GETEGG";//

    public static const WEIYUN_MODEL_UPDATED:String = "WEIYUN_MODEL_UPDATED";//update
    public static const WEIYUN_REQUEST_INFO:String = "WEIYUN_REQUEST_INFO";
    public static const WEIYUN_REQUEST_GETREWARD:String = "WEIYUN_REQUEST_GETREWARD";

    public static const FUND_SEND_INFO:String = "FUND_SEND_INFO";//
    public static const FUND_CALL_INFO:String = "FUND_CALL_INFO";//
    public static const FLUANT_MARRY_HOME_PET:String = "FLUANT_MARRY_HOME_PET";

    public static const MARRYHOME_COPYINFO_REQUEST:String = "MARRYHOME_COPYINFO_REQUET"; //夫妻家园副本信息请求
    public static const MARRYHOME_COPYOPER_REQUEST:String = "MARRYHOME_COPYOPER_REQUEST" //夫妻家园副本操作请求
    public static const MARRYHOME_COPY_INVIT_REQUEST:String = "MARRYHOME_COPY_INVIT_REQUEST";//夫妻家园邀请ta
    public static const MARRYHOME_COPY_FIGHT_REQUEST:String = "MARRYHOME_COPY_FIGHT_REQUEST";//开始战斗
    public static const MARRYHOME_TITLE_REQUEST:String = "MARRYHOME_TITLE_REQUEST"//请求后缀

    public static const MARRYHOME_COPYINFO_RETURN:String = "MARRYHOME_COPYINFORETURN";  //夫妻家园副本信息返回
    public static const MARRYHOME_COPYOPER_RETURN:String = "MARRYHOME_COPYOPERRETURN";  //夫妻家园副本操作返回
    public static const MARRYHOME_COPYFIGHT_RETURN:String = "MARRYHOME_COPYFIGHT_RETURN";//夫妻家园战斗返回
    public static const MARRYHOME_TITLE_RETURN:String = "MARRYHOME_TITLE_RETURN";//后缀返回

    public static const CHAOS_SEND_INFO:String = "CHAOS_SEND_INFO";
    public static const CHAOS_CALL_INFO:String = "CHAOS_CALL_INFO";
    public static const CHAOS_AWARD_PROMPT:String = "CHAOS_AWARD_PROMPT";

    public static const TIANYUAN_SEND_INFO:String = "TIANYUAN_SEND_INFO";
    public static const TIANYUAN_CALL_INFO:String = "TIANYUAN_CALL_INFO";

    public static const TIANYUAN_SEND_MEMBER:String = "TIANYUAN_SEND_MEMBER";

    public static const CHAOS_FIGHT_SEND_INFO:String = "CHAOS_FIGHT_SEND_INFO";
    public static const CHAOS_FIGHT_CALL_INFO:String = "CHAOS_FIGHT_CALL_INFO";


    public static const JS_SPORT:String = "JS_SPORT";

    public static const GM_COMMAND:String = "GM_COMMAND";

    public static const CLAN_ROLL_INFO_RETURN:String = "CLAN_ROLL_INFO_RETURN";//夺宝奇兵初始信息返回
    public static const CLAN_ROLL_JONIN_RETURN:String = "CLAN_ROLL_JONIN_RETURN"//夺宝响应
    public static const CLAN_ROLL_RANKREFRESH_RETURN:String = "CLAN_ROLL_RANKREFRESH_RETURN";//本轮排行更新
    public static const CLAN_ROLL_WHEELEND:String = "CLAN_ROLL_WHEELEND";//本轮结束
    public static const CLAN_WINNER_MSG:String = "CLAN_WINNER_MSG";//夺宝成功时发送请求

    public static const CLAN_ROLL_INFO_REQUEST:String = "CLAN_ROLL_INFO_REQUEST";//请求夺宝奇兵信息
    public static const CHAT_SHOW_CLANROLL_MSG:String = "CHAT_SHOW_CLANROLL_MSG";
    public static const CLAN_ROLL_REFRESH:String = "CLAN_ROLL_REFRESH";//数据刷新
    public static const FIGHTDEMON_POPUPREPLY:String = "FIGHTDEMON_POPUPREPLY";//决战天魔弹窗
    public static const PACK_OPT_CHANGE_SEX:String = "PACK_OPT_CHANGE_SEX";
    public static const PACK_ITEM_BINDING:String = "PACK_ITEM_BINDING";//背包物品绑定

    public static const HEART_GHOST_UPDATED:String = "HEART_GHOST_UPDATED";//心魔数据更新  0
    public static const HEART_GHOST_REQUEST_COMBAT:String = "HEART_GHOST_REQUEST_COMBAT";//抗击心魔
    public static const HEART_GHOST_REQUEST_ONEKEY:String = "HEART_GHOST_REQUEST_ONEKEY";//一键抗击

    public static const SKILL_OPENCHANGEVIEW:String = "SKILL_OPENCHANGEVIEW";//
    public static const SKILL_OPENPRACTICEVIEW:String = "SKILL_OPENPRACTICEVIEW";//
    public static const SKILL_HEROSELECTED:String = "SKILL_HEROSELECTED";//
    public static const SKILL_HEROLIST_VISIBLE:String = "SKILL_HEROLIST_VISIBLE";//  技能界面散仙头像

    public static const SKILLSTAGE_UPDATED:String = "SKILLSTAGE_UPDATED";//
    public static const SKILLSTAGE_REQUEST_UPGRADE:String = "SKILLSTAGE_REQUEST_UPGRADE";
    public static const SKILLSTAGE_REQUEST_ONEKEY:String = "SKILLSTAGE_REQUEST_ONEKEY";
    public static const SKILLSTAGE_REQUEST_GIVEUP:String = "SKILLSTAGE_REQUEST_GIVEUP";
    public static const CLANTOTM_SELECT_CHANGE:String = "CLANTOTM_SELECT_CHANGE";

    public static const COLLECTCARD_PACKITEM_SELECT:String = "COLLECTCARD_PACKITEM_SELECT";


    public static const COLLECTCARD_REQUEST_LIST:String = "COLLECTCARD_REQUEST_LIST";//请求卡牌所有初始信息
    public static const COLLECTCARD_REQUEST_EQUIPCHANGE:String = "COLLECTCARD_PACK_CHANGE"; //穿卸卡
    public static const COLLECTCARD_REQUEST_ADDCARD:String = "COLLECTCARD_REQUEST_ADDCARD";//请求刷卡牌
    public static const COLLECTCARD_REQUEST_UPCARD:String = "COLLECTCARD_REQUEST_UPCARD";//升级卡牌
    public static const COLLECTCARD_REQUEST_EXCHANGECARD:String = "COLLECTCARD_REQUEST_EXCHANGECARD";//兑换卡牌

    public static const COLLECTCARD_RETURN_ALLLIST:String = "COLLECTCARD_RETURN_ALLLIST";//更新所有卡牌列表(装备，背包，套组)
    public static const COLLECTCARD_RETURN_UPCARD:String = "COLLECTCARD_RETURN_UPCARD";//升级卡牌返回
    public static const COLLECTCARD_RETURN_ADDCARD:String = "COLLECTCARD_RETURN_ADDCARD";//刷出卡牌返回
    public static const COLLECTCARD_RETURN_CHANGEEQUIP:String = "COLLECTCARD_RETURN_CHANGEEQUIP";//穿卸卡牌
    public static const COLLECTCARD_SUIT_COLLECTCHANGE:String = "COLLECTCARD_SUIT_COLLECTCHANGE";//套卡收集更改

    public static const COLLECTCARD_SUIT_GETREARD:String = "COLLECTCARD_SUIT_GETREARD";//领取套装收集奖励

    public static const RECORD_POINT:String = "RECORD_POINT";//记录统计点

    public static const PUSH_BOBBIN:String = "PUSH_BOBBIN";
    public static const MOPAI_BOBBIN:String = "MOPAI_BOBBIN";
    public static const CHANGE_BOBBIN:String = "CHANGE_BOBBIN";
    public static const SWITCH_BOBBIN:String = "SWITCH_BOBBIN";

    public static const CONFIG_FILE_INIT:String = "CONFIG_FILE_INIT";

    public static const GIFTAWARD_SHOW:String = "GIFTAWARD_SHOW";
    public static const AUTO_SHOW:String = "AUTO_SHOW";

    public static const BOXCLICK1:String = "BOXCLICK1";
    public static const BOXCLICK2:String = "BOXCLICK2";


    public static const LABAUPDATE:String = "LABAUPDATE";  //拉霸数据更新
    public static const LABA_LOTTERY_INFO:String = "LABA_LOTTERY_INFO";  //拉霸抽奖结果返回
    public static const LABA_BUYRETURN:String = "LABA_BUYRETURN";  //购买物品结果返回
    public static const LABA_GETGIFT:String = "LABA_GETGIFT";  //点击领取奖励
    public static const LABA_LOTTERY:String = "LABA_LOTTERY";  //点击抽奖
    public static const LABA_GIFT_SHOW:String = "LABA_GIFT_SHOW";  //显示我的奖励面板
    public static const LABA_RANK:String = "LABA_RANK";  //拉霸每日排行更新


    public static const SHOW_TOP_MENU:String = "SHOW_TOP_MENU";
    public static const HIDE_TOP_MENU:String = "HIDE_TOP_MENU";

    public static const ANSWER_STATE_CHANGE:String = "ANSWER_STATE_CHANGE"; //状态改变
    public static const ANSWER_QUETION_CHANGE:String = "ANSWER_QUETION_CHANGE" //问题
    public static const ANSWER_SUPPORT_CHANGE:String = "ANSWER_SUPPORT_CHANGE"; //支持人数
    public static const ANSWER_LOGANDITEM_CHANGE:String = "ANSWER_LOGANDITEM_CHANGE";//日记及使用道具更新
    public static const ANWER_REPLAY_END:String = "ANWER_REPLAY_END";//答题结束
    public static const ANSWER_GET_OPENLEFTTIME:String = "ANSWER_GET_OPENLEFTTIME";//获取剩余时间
    public static const ANSWER_RANK_CHANGE:String = "ANSWER_RANK_CHANGE"//排名更新

    public static const FIGHTBOSS_SEND_INFO:String = "FIGHTBOSS_SEND_INFO";
    public static const FIGHTBOSS_CALL_INFO:String = "FIGHTBOSS_CALL_INFO";
    public static const CLANBOSS_STATUS_CHANGE:String = "CLANBOSS_STATUS_CHANGE" //帮派boss状态改变
    public static const CLANSHOP_STATUS_CHANGE:String = "CLANSHOP_STATUS_CHANGE"; //帮贡商店刷新
    public static var FIRSTGOLD_STATE:String = "FIRSTGOLD_STATE";

    public static const CLICK_LIST:String = "CLICK_LIST" //点击炼妖壶list单项
    public static const MAXI_INFO:String = "MAXI_INFO" //获取炼妖壶信息
    public static const MAXI_REFRESH:String = "MAXI_REFRESH" //自动刷新
    public static const MAXI_REFRESH1:String = "MAXI_REFRESH1" //手动刷新
    public static const MAXI_TOFIGHT:String = "MAXI_TOFIGHT" //去杀怪
    public static const MAXI_CLICKRECT:String = "MAXI_CLICKRECT" //点击壶中界方框，进入对应怪物界面
    public static const MAXI_REFRESHVIEW:String = "MAXI_REFRESHVIEW" //刷新界面
    public static const MAXI_FIGHT_RETURN:String = "MAXI_FIGHT_RETURN" //战斗返回信息
    public static const CLAN_IMPEACH_REQUEST:String = "CLAN_IMPEACH_REQUEST";
    public static const CLAN_IMPEACH_RETURN:String = "CLAN_IMPEACH_RETURN";
    public static const MAXI_NOTICE:String = "MAXI_NOTICE";

    public static const FEISHENG_ACTIVITY_REFRESH:String = "FEISHENG_ACTIVITY_REFRESH";

    public static const FINDTA_REQUEST_INFO:String = "FINDTA_REQUEST_INFO";
    public static const FINDTA_RESPONSE_INFO:String = "FINDTA_RESPONSE_INFO";

    public static const FINDTA_ANIMATION:String = "FINDTA_ANIMATION";

    public static const HOOK_MINI:String = "HOOK_MINI"; //挂机界面最小化

    public static const HOOK_MINI_FIRST:String = "HOOK_MINI_FIRST"; //挂机界面初始最小化
    public static const HOOK_MINICLOSE:String = "HOOK_MINICLOSE"; //挂机界面关闭
    public static const HOOK_MINIEFFECT:String = "HOOK_MINIEFFECT"; //挂机界面最小化特效


    public static const THANKFULUPDATE:String = "THANKFULUPDATE";  //感恩回馈数据更新
    public static const REBATEUPDATE:String = "REBATEUPDATE";  //购物返利数据更新
    public static const REBATE_TODAY:String = "REBATE_TODAY";  //购物返利 （今日返利）数据更新
    public static const REBATE_TOTALRANK:String = "REBATE_TOTALRANK";  //购物返利 （总排行）数据更新
    public static const REBATE_BAG:String = "REBATE_BAG";  //购物返利 （钱袋）数据更新
    public static const REBATE_BTN:String = "REBATE_BTN";  //隐藏按钮
    public static const SERVEYS_CLOSE:String = "SERVEYS_CLOSE";//问卷调查关闭
    public static const SERVEYS_START:String = "SERVEYS_START";//开始问卷调查
    public static const SERVEYS_OPTION:String = "SERVEYS_OPTION";//问卷调查选取答案
    public static const SERVEYS_GETREWARD:String = "SERVEYS_GETREWARD";//问卷调查领奖
    public static const SERVEYS_NEXTPROBLEM:String = "SERVEYS_NEXTPROBLEM";//问卷下一题
    public static const SERVEYS_REFRESH:String = "SERVEYS_REFRESH";

    public static const CAREER_UPGRADE_REQUETTASK:String = "CAREER_UPGRADE_REQUETTASK";
    public static const CAREER_UPGRADE_REFRESHTASKSTATE:String = "CAREER_UPGRADE_REFRESHTASKSTATE";
    public static const CAREER_UPGRADE_TASKRETURN:String = "CAREER_UPGRADE_TASKRETURN";
    public static const CAREER_UPGRADE_FEISHENGSUC:String = "CAREER_UPGRADE_FEISHENGSUC";

    public static const ANNIVERSARYSHARE_REQUEST:String = "ANNIVERSARYSHARE_REQUEST";//周年庆分享请求
    public static const ANNIVERSARYSHARE_INFO:String = "ANNIVERSARYSHARE_INFO";//周年庆分享信息

    public static const FEISHENG_GIFT_UPDATED:String = "FEISHENG_GIFT_UPDATED";
    public static const FEISHENG_GIFT_REQUEST_GET:String = "FEISHENG_GIFT_REQUEST_GET";

    public static const SCORE_BUY:String = "SCORE_BUY";  //使用积分购买
    public static const CANGBAO_RECORD:String = "CANGBAO_RECORD";  //兑换记录
    public static const CANGBAO_UPDATE:String = "CANGBAO_UPDATE";  //界面更新
    public static const FEISHENG_GIFT_REQUEST_GETDOUBLE:String = "FEISHENG_GIFT_REQUEST_GETDOUBLE";
    public static const CLANBOSS_STATUS_ALLOT:String = "CLANBOSS_STATUS_ALLOT";
    public static const CLAN_BOSS_ALLOT:String = "CLAN_BOSS_ALLOT";
    public static const BFGIFT_INFO:String = "BFGIFT_INFO";//百服大礼包信息
    public static const BFGIFT_REQUEST:String = "BFGIFT_REQUEST";//百服大礼包请求
    public static const BFGIFT_NOTICE:String = "BFGIFT_NOTICE";//百服大礼包世界消息
    public static const SURPRISE_REQUEST:String = "SURPRISE_REQUEST";//喜从天降请求
    public static const SURPRISE_INFO:String = "SURPRISE_INFO";//喜从天降信息

    public static const SURPRISE_THANKSHIM:String = "SURPRISE_THANKSHIM";//感谢他
    public static const INVITEINWINTER_BUY:String = "INVITEINWINTER_BUY";//相约在冬季购买预约计划
    public static const INVITEINWINTER_INFO:String = "INVITEINWINTER_INFO";//相约在冬季返回信息

    public static const HUNQI_TURN:String = "HUNQI_TURN";//魂器 转动罗盘
    public static const HUNQI_DOUHUN:String = "HUNQI_DOUHUN";//魂器 斗魂界面更新
    public static const HUNQI_QILINGUPDATE:String = "HUNQI_QILINGUPDATE";//魂器  器灵信息更新

    public static const HUNQI_CLICK:String = "HUNQI_CLICK";//魂器 点击

    public static const TITLE_UPDATE:String = "TITLE_UPDATE";//称号界面更新
    public static const TITLE_UPDATELB:String = "TITLE_UPDATELB";//称号界面文本更新

    public static const IMPROVEATTI_UPDATE:String = "IMPROVEATTI_UPDATE";//属性更新


    public static const QIANYUAN_SYSTEM_MSG:String = "QIANYUAN_SYSTEM_MSG";//乾元仙地msg
    public static const QIANYUAN_INTO:String = "QIANYUAN_INTO";//链接进入


    public static const JIUTIANXZ_EXIT:String = "JIUTIANXZ_EXIT";//退出九天仙阵
    public static const JIUTIANXZ_ADD:String = "JIUTIANXZ_ADD";//九天仙阵加速
    public static const JIUTIANXZ_CHOOSE_MAP:String = "JIUTIANXZ_CHOOSE_MAP";//九天仙阵选择地图
    public static const JIUTIANXZ_COPY_RESET:String = "JIUTIANXZ_COPY_RESET";//九天仙阵副本重置
    public static const JIUTIANXZ_COPY_CLEAN:String = "JIUTIANXZ_COPY_CLEAN";//九天仙阵副本扫荡
    public static const JIUTIANXZ_COPY_FIGHT:String = "JIUTIANXZ_COPY_FIGHT";//九天仙阵点击挑战
    public static const JIUTIANXZ_REFUSE:String = "JIUTIANXZ_REFUSE";//九天仙阵前端年拒绝
    public static const JIUTIANXZ_GET_POS:String = "JIUTIANXZ_GET_POS";//九天仙阵占领据点
    public static const JIUTIANXZ_INFO_RETURN:String = "JIUTIANXZ_INFO_RETURN";//九天仙阵消息返回
    public static const JIUTIANXZ_BOSS_EXIT:String = "JIUTIANXZ_BOSS_EXIT";//退出九天仙阵BOSS
    public static const JIUTIANXZ_BOSS_FIGHT:String = "JIUTIANXZ_BOSS_FIGHT";//攻击九天仙阵BOSS
    public static const JIUTIANXZ_BOSS_INFO:String = "JIUTIANXZ_BOSS_INFO";//九天仙阵BOSS信息
    public static const JIUTIANXZ_BOSS_OPEN:String = "JIUTIANXZ_BOSS_OPEN";//九天仙阵BOSS按钮打开
    public static const JIUTIANXZ_BOSS_CLOSE:String = "JIUTIANXZ_BOSS_CLOSE";//九天仙阵BOSS按钮打开
    public static const JIUTIANXZ_RANK_REQUEST:String = "JIUTIANXZ_RANK_REQUEST";//九天仙阵请求排行榜
    public static const JIUTIANXZ_BOSS_GOTO:String = "JIUTIANXZ_BOSS_GOTO";//前往击杀BOSS

    public static const XUNBAOUPDATE:String = "XUNBAOUPDATE";//寻宝更新
    public static const XUNBAO_INIT:String = "XUNBAO_INIT";//寻宝初始化
    public static const XUNBAO_START:String = "XUNBAO_START";//开始寻宝
    public static const XUNBAO_RANK:String = "XUNBAO_RANK";//排行

    public static const LICONGTIANJIANG_TURN:String = "LICONGTIANJIANG_TURN";//转动转盘
    public static const LICONGTIANJIANG_GETAWARD:String = "LICONGTIANJIANG_GETAWARD";//领取奖励
    public static const LICONGTIANJIANG_REFRESH:String = "LICONGTIANJIANG_REFRESH"; //刷新界面
    public static const LICONGTIANJIANG_REFRESH_NUM:String = "LICONGTIANJIANG_REFRESH_NUM";//刷新祈福令数量
    public static const LICONGTIANJIANG_LOG:String = "LICONGTIANJIANG_LOG";//记录
    public static const LICONGTIANJIANG_GOOD:String = "LICONGTIANJIANG_GOOD";//礼物箱
    public static const LICONGTIANJIANG_TEAMRANK:String = "LICONGTIANJIANG_TEAMRANK";//队伍排行
    public static const LICONGTIANJIANG_RANK:String = "LICONGTIANJIANG_RANK";//每日排行
    public static const LICONGTIANJIANG_INFO:String = "LICONGTIANJIANG_INFO";//信息更新


    public static const JIXUETAI_MYINFO:String = "JIXUETAI_MYINFO";//我的信息
    public static const JIXUETAI_RANK:String = "JIXUETAI_RANK";//祭血台排行
    public static const JIXUETAI_PILLAGE:String = "JIXUETAI_PILLAGE";//祭血台血鼎掠夺
    public static const JIXUETAI_PILLAGE_STATUS:String = "JIXUETAI_PILLAGE_STATUS";//祭血台血鼎掠夺状态
    public static const JIXUETAI_PILLAGE_RUNTIME:String = "JIXUETAI_PILLAGE_RUNTIME";//祭血台血鼎 cd倒计时
    public static const JIXUETAI_JUDIAN:String = "JIXUETAI_JUDIAN";//据点信息
    public static const JIXUETAI_RECORD:String = "JIXUETAI_RECORD";//祭血台记录
    public static const JIXUETAI_PK:String = "JIXUETAI_PK";//祭血台PK
    public static const JIXUETAI_FIRE:String = "JIXUETAI_FIRE";//祭血台煽火
    public static const JIXUETAI_BTN:String = "JIXUETAI_BTN";  //隐藏按钮
    public static const RESEARCH_BTN:String = "RESEARCH_BTN";  //隐藏按钮

    public static const MIJING_BTN:String = "MIJING_BTN";  //秘境按钮

    //清明节
    public static const TOMB_INFO:String = "TOMB_INFO";  //我的信息
    public static const TOMB_RECORD:String = "TOMB_RECORD";  //我的记录信息
    public static const TOMB_MYRANK:String = "TOMB_MYRANK";  //我的个人排行
    public static const TOMB_GROUPRANK:String = "TOMB_GROUPRANK";  //队伍排行
    public static const TOMB_EXCHANGE:String = "TOMB_EXCHANGE";  //兑换
    public static const TOMB_EXCHANGE_STATUS:String = "TOMB_EXCHANGE_STATUS";  //兑换成功与否

    public static const SSCQ2_EXCHANGE_STATUS:String = "SSCQ2_EXCHANGE_STATUS";  //初始状态
    public static const SSCQ2_AWARD:String = "SSCQ2_AWARD";  //奖励领取
//		public static const SSCQ2_CDKEY:String = "SSCQ2_CDKEY";  //cdkey

    public static const JUNEGIFTUPDATE:String = "JUNEGIFTUPDATE";  //更新

    public static const MORRA_INFO:String = "MORRA_INFO";  //基本信息
    public static const MORRA_MYRANK:String = "MORRA_MYRANK";  //个人排行榜
    public static const MORRA_GROUPRANK:String = "MORRA_GROUPRANK";  //队伍排行榜
    public static const MORRA_RESULT_NORMAL:String = "MORRA_RESULT_NORMAL";  //猜拳结果返回(普通)
    public static const MORRA_RESULT_TEN:String = "MORRA_RESULT_TEN";  //猜拳结果返回(必胜)
    public static const MORRA_RESULT_ALL:String = "MORRA_RESULT_ALL";  //猜拳结果返回(一键)
    public static const MORRA_ACHIEVE:String = "MORRA_ACHIEVE";  //成就结果返回
    public static const MORRA_FILL:String = "MORRA_FILL";  //灌酒返回
    public static const MORRA_EXCHANGE:String = "MORRA_EXCHANGE";  //领取奖励
    public static const MORRA_RECORD:String = "MORRA_RECORD";  //灌酒记录

    public static const Lucky_lottery_refresh:String = "Lucky_lottery_refresh"//抽奖返回
    public static const Lucky_Lottery_rank_refresh:String = "Lucky_Lottery_rank_refresh";//刷新排行

    public static const RESEARCH_CLOSE:String = "RESEARCH_CLOSE";//问卷调查关闭
    public static const RESEARCH_START:String = "RESEARCH_START";//开始问卷调查
    public static const RESEARCH_OPTION:String = "RESEARCH_OPTION";//问卷调查选取答案
    public static const RESEARCH_GETREWARD:String = "RESEARCH_GETREWARD";//问卷调查领奖
    public static const RESEARCH_NEXTPROBLEM:String = "RESEARCH_NEXTPROBLEM";//问卷下一题
    public static const RESEARCH_REFRESH:String = "RESEARCH_REFRESH";

    public static const RESEARCH_REFRESH_LIST:String = "RESEARCH_REFRESH_LIST";//刷新


    public static const RED_BUYINFO:String = "RED_BUYINFO";  //购买通知
    public static const RED_NPC_VIEW:String = "RED_NPC_VIEW";  //红包npc面板
    public static const RED_NOTICE:String = "RED_NOTICE";  //红包提示
    public static const RED_RANK:String = "RED_RANK";  //红包排行榜
    public static const RED_LOG:String = "RED_LOG";  //红包记录

    public static const CLANSNATCH_REG:String = "CLANSNATCH_REG";//报名
    public static const CLANSNATCH_ATTACK:String = "CLANSNATCH_ATTACK";//前往攻击
    public static const CLANSNATCH_CLANLIST:String = "CLANSNATCH_CLANLIST";//请求帮派列表返回
    public static const CLANSNATCH_NODES:String = "CLANSNATCH_NODES";//请求资源战 据点 面板返回
    public static const CLANSNATCH_NODEINFO:String = "CLANSNATCH_NODEINFO";//据点信息
    public static const CLANSNATCH_NODEINFO_SINGLE:String = "CLANSNATCH_NODEINFO_SINGLE";//单个头像信息
    public static const CLANSNATCH_LOG:String = "CLANSNATCH_LOG";//记录
    public static const CLANSNATCH_RANK:String = "CLANSNATCH_RANK";//排行
    public static const CLANSNATCH_UPDATEINFO:String = "CLANSNATCH_UPDATEINFO";//更新 玩家信息
    public static const CLANSNATCH_RESULT:String = "CLANSNATCH_RESULT";//战斗结果
    public static const CLANSNATCH_LOSSONE:String = "CLANSNATCH_LOSSONE";//帮派资源沦陷
    public static const CLANSNATCH_LOSSALL:String = "CLANSNATCH_LOSSALL";//帮派所有资源沦陷
    public static const CLANSNATCH_READYTIME:String = "CLANSNATCH_READYTIME";//准备时间
    public static const CLANSNATCH_END:String = "CLANSNATCH_END";//结束通知
    public static const CLANSNATCH_LEAVE:String = "CLANSNATCH_LEAVE";//离开
    public static const CLANSNATCH_START:String = "CLANSNATCH_START";//开始
    public static const CLANSNATCH_SCORE:String = "CLANSNATCH_SCORE";//积分

    public static const CLANSNATCH_BTN:String = "CLANSNATCH_BTN";//按钮通知


    public static const CUILINGGE_CLICK:String = "CUILINGGE_CLICK";//淬灵阁 点击
    public static const CUILINGGE_EQ_INFO:String = "CUILINGGE_EQ_INFO";//灵珠佩戴信息
    public static const CUILINGGE_INFO:String = "CUILINGGE_INFO";//淬灵阁 信息
    public static const CUILINGGE_REFINE:String = "CUILINGGE_REFINE";//淬灵阁 淬炼
    public static const CUILINGGE_CLOTH:String = "CUILINGGE_CLOTH";//淬灵阁 穿戴
    public static const CUILINGGE_RESOLVE:String = "CUILINGGE_RESOLVE";//淬灵阁 分解
    public static const CUILINGGE_MERGE:String = "CUILINGGE_MERGE";//淬灵阁 合成
    public static const CUILINGGE_UPGRADE:String = "CUILINGGE_UPGRADE";//淬灵阁 升阶


    public static const SHIKONG_INFO:String = "SHIKONG_INFO";  //基本信息
    public static const SHIKONG_SELECT:String = "SHIKONG_SELECT";  //选择
    public static const SHIKONG_LEFTTIMES:String = "SHIKONG_LEFTTIMES";  //剩余次数
    public static const SHIKONG_VALUE:String = "SHIKONG_VALUE";  //进度值


    public static const HELPER_EXCHANGE:String = "HELPER_EXCHANGE";//
    public static const HELPER_INFO:String = "HELPER_INFO";//
    public static const HELPER_UPDATE:String = "HELPER_UPDATE";//
    public static const HELPER_CHECKPANEL:String = "HELPER_CHECKPANEL";//

    public static const TIANTI_STC_BASEINFO:String = "TIANTI_STC_BASEINFO";// 基本信息返回
    public static const TIANTI_STC_SIGN:String = "TIANTI_STC_SIGN";// 报名状态信息返回
    public static const TIANTI_STC_WINTEAMINFO:String = "TIANTI_STC_WINTEAMINFO";// 选中冠军团队信息返回
    public static const TIANTI_STC_WINNERLISTINFO:String = "TIANTI_STC_WINNERLISTINFO";// 历届冠军团队信息返回
    public static const TIANTI_STC_INFO32:String = "TIANTI_STC_INFO32";// 入围赛信息（32强）信息返回
    public static const TIANTI_STC_INFO16:String = "TIANTI_STC_INFO16";// 入围赛信息（16强）信息返回
    public static const TIANTI_STC_INFO8:String = "TIANTI_STC_INFO8";// 入围赛信息（8强）信息返回
    public static const TIANTI_STC_INFO4:String = "TIANTI_STC_INFO4";// 入围赛信息（4强）信息返回
    public static const TIANTI_STC_INFO2:String = "TIANTI_STC_INFO2";// 入围赛信息（2强）信息返回
    public static const TIANTI_STC_INFO1:String = "TIANTI_STC_INFO1";// 入围赛信息（1强）信息返回
    public static const TIANTI_STC_TEAMLISTINFO:String = "TIANTI_STC_TEAMLISTINFO";// 队伍列表信息返回
    public static const TIANTI_STC_TEAMINFO:String = "TIANTI_STC_TEAMINFO";// 队伍信息返回
    public static const TIANTI_STC_APPLYTEAMINFO:String = "TIANTI_STC_APPLYTEAMINFO";// 队伍申请列表信息返回
    public static const TIANTI_STC_VOTEINFO:String = "TIANTI_STC_VOTEINFO";// 投注后返回
    public static const TIANTI_STC_VOTEPANELINFO:String = "TIANTI_STC_VOTEPANELINFO";// 投注界面信息返回
    public static const TIANTI_STC_REPORTPANELINFO:String = "TIANTI_STC_REPORTPANELINFO";// 战报界面信息返回
    public static const TIANTI_STC_EFFECT:String = "TIANTI_STC_EFFECT";// 创建队伍返回 特效
    public static const TIANTI_STC_FABAO:String = "TIANTI_STC_FABAO";// 法宝检测
    public static const TIANTI_STC_SIGNNUM:String = "TIANTI_STC_SIGNNUM";// 已报名队伍数量
    public static const TIANTI_STC_NEWPLAYER:String = "TIANTI_STC_NEWPLAYER";// 新申请人员提示
    public static const TIANTI_STC_CHAT:String = "TIANTI_STC_CHAT";//  聊天
    public static const TIANTI_STC_ONLINE:String = "TIANTI_STC_ONLINE";//  是否在线

    public static const TIANTI_SELECT:String = "TIANTI_SELECT";//天梯 选中 散仙
    public static const TIANTI_RPT_SEND:String = "TIANTI_RPT_SEND";//天梯 发送战报
    public static const TIANTI_BOXCLICK:String = "TIANTI_BOXCLICK";  //阵法选择
    public static const TIANTI_DRAG:String = "TIANTI_DRAG";// 	头像拖动事件
    public static const TIANTI_HIT_START:String = "TIANTI_HIT_START";// 	开始拖动事件
    public static const TIANTI_HIT_END:String = "TIANTI_HIT_END";// 	停止拖动事件
    public static const TIANTI_INVITE:String = "TIANTI_INVITE";// 邀请事件
    public static const TIANTI_APPLY:String = "TIANTI_APPLY";// 点击 发送申请事件
    public static const TIANTI_CHECK:String = "TIANTI_CHECK";// 点击 发送 查看
    public static const TIANTI_SHOWHEROLIST:String = "TIANTI_SHOWHEROLIST";// 点击  显示散仙列表

    public static const TIANTI_AGREE_OR_REJECT:String = "TIANTI_AGREE_OR_REJECT";// 处理 入队申请（同意或拒绝）

    public static const GAMEROOM_QQ_INFO:String = "GAMEROOM_QQ_INFO";  // 接收消息
    public static const GAMEROOM_QQ_BTN:String = "GAMEROOM_QQ_BTN";//按钮通知

    public static const ZHUOYAO_INFO:String = "ZHUOYAO_INFO";  //基本信息
    public static const ZHUOYAO_END:String = "ZHUOYAO_END";  //捉妖返回


    public static const KUAFU_RANK_INFO:String = "KUAFU_RANK_INFO";  //排行返回


    public static const FISH_RANK:String = "FISH_RANK";  //排行榜返回
    public static const FISH_INFO:String = "FISH_INFO";  //基本信息返回
    public static const FISH_LEFTINFO:String = "FISH_LEFTINFO";  //基本信息返回
    public static const SELECT_PLAYERINFO:String = "SELECT_PLAYERINFO";  //查看的玩家 信息
    public static const FISH_UPDATE_TIMES:String = "FISH_UPDATE_TIMES";  //次数更新
    public static const FISH_START:String = "FISH_START";  //开始钓鱼  播放动作
    public static const FISH_MYROBINFO:String = "FISH_MYROBINFO";  //我的偷鱼 结果
    public static const FISH_MYLOG:String = "FISH_MYLOG";  //日志记录
    public static const FISH_END:String = "FISH_END";  //结束钓鱼  播放动作
    public static const FISH_SHOWRESULT:String = "FISH_SHOWRESULT";  //结束钓鱼  收获成果
    public static const FISH_NOTICEINFO:String = "FISH_NOTICEINFO";  //提示信息
    public static const FISH_ADDFRIEND:String = "FISH_ADDFRIEND";  //添加好友
    public static const FISH_RELATION:String = "FISH_RELATION";  //关系数据
    public static const FISH_FIND:String = "FISH_FIND";  //定位操作
    public static const FISH_DELETE:String = "FISH_DELETE";  //删除操作
    public static const FISH_UPDATE_STATUS:String = "FISH_UPDATE_STATUS";  //状态更新

    public static const TOURS_INFO:String = "TOURS_INFO";  //状态更新
    public static const GOSSIP_INFO:String = "GOSSIP_INFO";  //基本信息
    public static const GOSSIP_VALUE:String = "GOSSIP_VALUE";  //更新 进度
    public static const GOSSIP_DOOR:String = "GOSSIP_DOOR";  //开门


    public static const CHARM_INFO:String = "CHARM_INFO";  //基本信息
    public static const CHARM_REFRESH:String = "CHARM_REFRESH";  //刷新符咒
    public static const CHARM_STATUS:String = "CHARM_STATUS";  //战斗状态
    public static const CHARM_EAT:String = "CHARM_EAT";  //吞噬
    public static const CHARM_SKILL_OP:String = "CHARM_SKILL_OP";  //装卸技能
    public static const CHARM_SKILLS:String = "CHARM_SKILLS";  //已学技能
    public static const CHARM_RENAME:String = "CHARM_RENAME";  //改名字
    public static const CHARM_SHOW_DATA:String = "CHARM_SHOW_DATA";  //图鉴数据
    public static const CHARM_SHOW_GIFT:String = "CHARM_SHOW_GIFT";  //图鉴奖励

    public static const CHARM_TO_USE:String = "CHARM_TO_USE";  //去使用
    public static const CHARM_SKILL_USE:String = "CHARM_SKILL_USE";  //操作技能
    public static const CHARM_SKILL_DROP:String = "CHARM_SKILL_DROP";  //散功
    public static const CHARM_UP:String = "CHARM_UP";  //升级
    public static const CHARM_LIGHTEN:String = "CHARM_LIGHTEN";  //点亮


    public static const SHOPPINGDAY_INFO:String = "SHOPPINGDAY_INFO";  // 已购信息
    public static const SHOPPINGDAY_BUY:String = "SHOPPINGDAY_BUY";  //购买 返回
    public static const SHOPPINGDAY_LOG:String = "SHOPPINGDAY_LOG";  //记录
    public static const SHOPPINGDAY_TOBUY:String = "SHOPPINGDAY_TOBUY";  //购买


    public static const BlOODCHANGE:String = "BlOODCHANGE";  //经脉
    public static const PACK_PRO_TIP:String = "PACK_PRO_TIP";
    public static const REFRESH_POWER:String = "REFRESH_POWER";
    public static const CHANGE_POWER:String = "CHANGE_POWER";//更改战力
    public static const HERO_ADD_PRO_REFRESH:String = "HERO_ADD_PRO_CAL"

    public static const SHOW_CALCULATOR:String = "show_calculator";//虚拟数字键盘

    public static const EQ_ONEKEY:String = "EQ_ONEKEY";//

    public static const GEM_INFO_UPDATE:String = "gem_info_update";
    public static const SHOW_FRAME_MSG:String = "show_frame_msg";


    public static const SHOW_REDPOINT:String = "SHOW_REDPOINT";   //显示或隐藏红点
    public static const INFO_REDPOINT:String = "INFO_REDPOINT";   //分发接受到的红点消息
    public static const SHOW_REDPOINT_MAINICON:String = "SHOW_REDPOINT_MAINICON";   //显示或隐藏红点 （客户端自己控制 主界面按钮）

    public static var HERO_REFRESH_REDPOINT:String = "HERO_REFRESH_REDPOINT";
    public static var EQUPGRADE_REFRESH_REDPOINT:String = "EQUPGRADE_REFRESH_REDPOINT"
    public static var PACK_REDPOINT_REFRESH:String = "PACK_REDPOINT_REFRESH";
    public static var SKILL_RUNE_OKMELT:String = "SKILL_RUNE_OKMELT";
    public static var  SKILL_RUNE_REFRESH_RETURN:String = "SKILL_RUNE_REFRESH_RETURN";
    public static var ITEM_TWEENTO_PACK:String = "ITEM_TWEENTO_PACK";

    public static var OPEN_HOME:String = "open_home";
    public static var CLOSE_HOME:String = "close_home";



    //争霸天下
    public static var CITYWAR_MYCITYINFO_S:String = "CITYWAR_MYCITYINFO_S";
    public static var CITYWAR_CITYLIST_S:String = "CITYWAR_CITYLIST_S";
    public static var CITYWAR_CITYINFO_S:String = "CITYWAR_CITYINFO_S";
    public static var CITYWAR_SELECTCITYINFO_S:String = "CITYWAR_SELECTCITYINFO_S";
    public static var CITYWAR_GIFTINFO_S:String = "CITYWAR_GIFTINFO_S";
    public static var CITYWAR_ALTARINFO_S:String = "CITYWAR_ALTARINFO_S";
    public static var CITYWAR_OCCUPY_S:String = "CITYWAR_OCCUPY_S";
    public static var CITYWAR_ALLOT_S:String = "CITYWAR_ALLOT_S";
    public static var CITYWAR_LOOT_S:String = "CITYWAR_LOOT_S";
    public static var CITYWAR_DECLARATION_S:String = "CITYWAR_DECLARATION_S";

    public static var CITYWAR_ASSIST_S:String = "CITYWAR_ASSIST_S";
    public static var CITYWAR_TEAMINFO_S:String = "CITYWAR_TEAMINFO_S";
    public static var CITYWAR_FIGHTMSG_S:String = "CITYWAR_FIGHTMSG_S";
    public static var CITYWAR_NODEFIGHTMSG_S:String = "CITYWAR_NODEFIGHTMSG_S";
    public static var CITYWAR_PLAYERFIGHTINFO_S:String = "CITYWAR_PLAYERFIGHTINFO_S";
    public static var CITYWAR_RESULTMSG_S:String = "CITYWAR_RESULTMSG_S";

    public static const CITYWAR_DECLARE_NOTICE:String = "CITYWAR_DECLARE_NOTICE";//发消息
    public static const CITYWAR_SHOWTIP_C:String = "CITYWAR_SHOWTIP_C";//TIP
    public static const CITYWAR_TIMEDOWN_C:String = "CITYWAR_TIMEDOWN_C";//
    public static const CITYWAR_INVITE_C:String = "CITYWAR_INVITE_C";//
    public static const CITYWAR_CHANGEMAP_C:String = "CITYWAR_CHANGEMAP_C";//
    public static const INVITE_CITY_TEAM:String = "INVITE_CITY_TEAM"
    public static const CITYWAR_SEND_INVITTEAM:String = "CITYWAR_SEND_INVITTEAM"

    public static const CITYWAR_OPEN_VIEW:String = "CITYWAR_OPEN_VIEW";



    public function NotiEvent(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
    }
}
}
