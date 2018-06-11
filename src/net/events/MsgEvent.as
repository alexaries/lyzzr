package net.events {
import utils.ByteArray;

import org.puremvc.as3.patterns.observer.Notification;

/**
 * 服务端向客户端发送消息所触发的事件
 */
public class MsgEvent extends Notification {
    public static var KEEP_ALIVE:String = 0x00.toString(16);
    public static var CHECK_ID_RETURN:String = 0x05.toString(16);
    public static var SECRETBOOKINFO:String = 0x06.toString(16);
    /**
     * 限购次数
     */
    public static var LIMIT_BUY:String = 0x0a.toString(16);
    /**密友奖励*/
    public static var GFRIEND_REWARD:String = 0x07.toString(16);
    public static var LEAVE_EXP:String = 0x08.toString(16);
    public static var CARNIVAL:String = 0x09.toString(16);
    public static var SEVEN_ACTIVITY:String = 0x0B.toString(16);
    public static var SAY_SAY:String = 0x0C.toString(16);
    public static var ACTIVITY_COMPASS:String = 0x0D.toString(16);
    public static var SYS_ALERT_MSG:String = 0x0E.toString(16);
    public static var FIGHT_REPORT_TYPE:String = 0x0F.toString(16);
    public static var GET_TIME:String = 0x11.toString(16);
    /***/
    public static var QQ_BUFF:String = 0x12.toString(16);
    public static var AWARD_INFO:String = 0x13.toString(16);
    public static var N525_INFO:String = 0x14.toString(16);
    public static var SEVEN_BACK_ACTIVITY:String = 0x15.toString(16);
    public static var FRIEND_MOOD:String = 0x17.toString(16);
    /** 符文系统 **/
    public static var RUNE_SYSTEM:String = 0x18.toString(16);
    //天劫
    public static var DISASTER_DATA:String = 0x19.toString(16);
    //	周年盛典
    public static var ANNIVERSARY:String = 0x1B.toString(16);
    /** 新出生七日奖励 */
    public static var REGISTER_SEVEN:String = 0x1C.toString(16);
    public static var FOUR_DETECTIVE:String = 0x1f.toString(16);
    public static var CHAT:String = 0x20.toString(16);
    public static var CHAT_PRIVATE:String = 0x21.toString(16);
    public static var FIND_USER:String = 0x22.toString(16);
    public static var FLAUNT_GOOD:String = 0x23.toString(16);
    public static var SYSTEM_INFO:String = 0x24.toString(16);
    public static var BUG_INFO:String = 0x25.toString(16);
    public static var GOLD_INFO:String = 0x2E.toString(16);
    public static var GOLD_GET:String = 0x2F.toString(16);

    public static var PRACTICE_PLACE_IFNO:String = 0x30.toString(16);
    public static var PRACTICE_PAGE:String = 0x31.toString(16);
    public static var PRACTICE_ROB:String = 0x32.toString(16);
    public static var PRACTICE_OCCUPY:String = 0x33.toString(16);
    public static var PRACTICE_START:String = 0x34.toString(16);
    public static var PRACTICE_STOP:String = 0x35.toString(16);
    public static var PRACTICE_ACC:String = 0x36.toString(16);
    public static var RETREAT:String = 0x37.toString(16);
    public static var BOSS_INFO:String = 0x3A.toString(16);
    /**祭血台*/
    public static var JIXUETAI:String = 0x3B.toString(16);
    /** 夺宝系统 **/
    public static var TREASURE_SYSTEM:String = 0x3E.toString(16);

    public static var MAIL_ID_LIST:String = 0x40.toString(16);
    public static var MAIL_LIST:String = 0x41.toString(16);
    public static var MAIL_CONTENTS:String = 0x42.toString(16);
    public static var MAIL_DELETE:String = 0x43.toString(16);
    public static var MAIL_SEND:String = 0x44.toString(16);
    public static var MAIL_NEW:String = 0x45.toString(16);
    public static var MAIL_CHANGE:String = 0x46.toString(16);
    public static var ACTIVE_INFO:String = 0x4A.toString(16);
    //累计充值兑奖
    public static var ACTIVE_AWARD:String = 0x4B.toString(16);
    public static var ACTIVE_TIME:String = 0x4C.toString(16);
    public static var STRONG_INFO:String = 0x4D.toString(16);
    //跨服服战信息
    public static var ALL_SERVER_INFO:String = 0x4E.toString(16);

    public static var DIALOG_START:String = 0x50.toString(16);
    public static var DIALOG_INTERACTION:String = 0x51.toString(16);
    public static var GET_TASK_LIST:String = 0x52.toString(16);
    public static var GET_USABLE_TASK:String = 0x53.toString(16);
    public static var PLAYER_ABANDON_TASK:String = 0x54.toString(16);
    public static var UPDATE_TASK_PROCESS:String = 0x55.toString(16);
    public static var NEW_TASK:String = 0x56.toString(16);
    public static var TASK_CYC_FRESH:String = 0x57.toString(16);

    public static var CFIGHT_PRE:String = 0x59.toString(16);
    public static var CFIGHT:String = 0x5a.toString(16);
    public static var CFIGHT_LIST:String = 0x5b.toString(16);

    public static var CLAN_REQ_LIST:String = 0x60.toString(16);
    public static var CLAN_REQ_USER:String = 0x61.toString(16);
    public static var CLAN_CREATE:String = 0x62.toString(16);
    public static var CLAN_JOIN_IN:String = 0x63.toString(16);
    public static var CLAN_MEMBER_OPERATE:String = 0x64.toString(16);
    public static var CLAN_INFO_CHANGE:String = 0x65.toString(16);
    public static var CLAN_REQ_ITEM:String = 0x66.toString(16);
    public static var CLAN_MEMBER_LIST:String = 0x67.toString(16);
    public static var CLAN_INFO_UPDATE:String = 0x68.toString(16);
    public static var CLAN_SKILL:String = 0x69.toString(16);
    public static var CLAN_BUILD:String = 0x6A.toString(16);
    public static var CLAN_DEPOT:String = 0x6B.toString(16);
    public static var CLAN_DEPOT_RECORD:String = 0x6C.toString(16);
    public static var CLAN_QQ:String = 0X6D.toString(16);
    public static var CLAN_COPY:String = 0X5C.toString(16);
    public static var CLAN_STONE:String = 0x6E.toString(16);
    public static var CLAN_TREE:String = 0x6F.toString(16);
    public static var KRAKEN:String = 0x71.toString(16);
    public static var LING_SHI:String = 0x71.toString(16);
    public static var MARRIAGE:String = 0x75.toString(16);
    public static var PET_DUNGEON:String = 0x76.toString(16);
    public static var INKTREASURE_INFO:String = 0x78.toString(16);
    public static var FIGHTDEMON_INFO:String = 0x7F.toString(16);
    public static var TRADE_LIST:String = 0x80.toString(16);
    public static var TRADE_INFO:String = 0x81.toString(16);
    public static var TRADE_LAUNCH:String = 0x82.toString(16);
    public static var TRADE_RECOCADE:String = 0x84.toString(16);
    public static var TRADE_SALE_LIST:String = 0x85.toString(16);
    public static var TRADE_SALE_CANCEL:String = 0x86.toString(16);

    /**
     * 活动 七夕活动
     */
    public static var ACTIVITY_SEVEN:String = 0x8B.toString(16);
    /** 元神系统 **/
    public static var SOUL_SYSTEM:String = 0x8E.toString(16);

    public static var COUNTRY_WAR_JOIN:String = 0x90.toString(16);
    public static var COUNTRY_WAR_PROCESS:String = 0x91.toString(16);
    public static var COUNTRY_WAR_RESULT:String = 0x92.toString(16);
    public static var COUNTRY_WAR_STRING:String = 0x93.toString(16);
    public static var COPY_INFO:String = 0x94.toString(16);
    public static var FORMATTON_INFO:String = 0x95.toString(16);
    public static var COPY_AUTO_DATA:String = 0x96.toString(16);
    public static var FORMATTON_AUTO_DATA:String = 0x98.toString(16);
    /**组队副本自动战斗*/
    public static var GROUPCOPY_AUTO_DATA:String = 0x9c.toString(16);


    public static var XUANJI_INFO:String = 0xE6.toString(16);
    public static var XUNAJI_AUTO_DATA:String = 0xE6.toString(16);

    /**
     * 英雄岛
     */
    public static var HERO_ISLAND_DATA:String = 0x97.toString(16);
    public static var HERO_ISLAND_DATA_NEW:String = 0xa6.toString(16);

    public static var GROUP_INFO:String = 0x99.toString(16);
    public static var FIGHT_START:String = 0x9A.toString(16);
    public static var ATTACK_NPC:String = 0x9B.toString(16);
    public static var TASK_RESPONSE_HOOK:String = 0x9D.toString(16);

    public static var CITY_INSIDE_MOVE:String = 0xA0.toString(16);
    public static var MAP_TRANSPORT:String = 0xA1.toString(16);
    public static var MAP_TRANSPORT_UPDATE:String = 0xA2.toString(16);
    public static var MAP_SAMPLEUSER:String = 0xA3.toString(16);
    public static var MAP_POINT_JOIN:String = 0xA4.toString(16);
    public static var CARRER:String = 0xA5.toString(16);
    public static var ENDLESS_TOWER:String = 0xA9.toString(16);
    public static var RIDE_INFO:String = 0xAA.toString(16);
    public static var COPY_DATA_UPDATE:String = 0xAB.toString(16);
    public static var COPY_FIGHT_RESULT:String = 0xAC.toString(16);
    public static var COPY_AUTO_FIGHT:String = 0xAD.toString(16);
    public static var COPY_END_FIGHT:String = 0xAE.toString(16);
    public static var DAILY_DATA:String = 0xAF.toString(16);

    public static var EQ_TO_STRONG:String = 0xB0.toString(16);
    public static var EQ_TO_PUNCH:String = 0xB1.toString(16);
    public static var EQ_EMBED:String = 0xB2.toString(16);
    public static var EQ_UN_EMBED:String = 0xB3.toString(16);
    public static var EQ_PURIFY:String = 0xB4.toString(16);
    public static var EQ_BATCH_DECOMPOSE:String = 0xB5.toString(16);
    public static var GEM_BATCH_UPGRADE:String = 0xB6.toString(16);
    public static var TRUMP_MELT:String = 0xB7.toString(16);
    public static var TRUMP_UPGRADE:String = 0xB8.toString(16);
    public static var EQ_EVOLUTION:String = 0xB9.toString(16);
    public static var EQ_SOUL:String = 0xBA.toString(16);
    public static var EQ_UNSEAL:String = 0xBB.toString(16);
    public static var EQ_BAOJU:String = 0xBD.toString(16);
    public static var USER_STARS:String = 0xBE.toString(16);
    public static var EQ_EXTEND:String = 0xBC.toString(16);

    public static var PACK_INFO:String = 0xC0.toString(16);
    public static var PACK_USE:String = 0xC3.toString(16);
    public static var PACK_EXTEND:String = 0xC4.toString(16);
    public static var ARENA_IFNO:String = 0xC5.toString(16);
    public static var ARENA_UPDATE:String = 0xC6.toString(16);
    public static var ARENA_EXS_UPDATE:String = 0xC7.toString(16); //新历练更新

    public static var SETTING_ALERT:String = 0xCA.toString(16);
    public static var SETTING_PSWD_INFO:String = 0xCB.toString(16);
    public static var SETTING_LOCK:String = 0xCC.toString(16);
    public static var SETTING_PSWD:String = 0xCD.toString(16);

    public static var TRIPOD_INFO:String = 0xCE.toString(16);
    public static var REWARD_DRAW:String = 0xCF.toString(16);

    public static var CHANGE_EQUIPMENT:String = 0xD0.toString(16);
    public static var HOTEL_PUB_HIRE:String = 0xD1.toString(16);
    public static var GET_FIGHTER_NAME:String = 0xD2.toString(16);
    public static var HOTEL_PUB_LIST:String = 0xD3.toString(16);
    public static var FIGHTER_DISMISS:String = 0xD4.toString(16);
    public static var FIGHTER_ACCEPT:String = 0xD5.toString(16);
    public static var PACK_USE_OTHER:String = 0xD7.toString(16);
    public static var FRIEND_LIST:String = 0xD8.toString(16);
    public static var FRIEND_ACTION:String = 0xD9.toString(16);
    public static var SORT_LIST:String = 0xDA.toString(16);
    public static var SORT_PERSONAL:String = 0xDB.toString(16);
    public static var STORE_LIST:String = 0xDC.toString(16);
    public static var STORE_BUY:String = 0xDD.toString(16);
    public static var SHOP_LIST:String = 0xDE.toString(16);
    public static var POTENCIAL:String = 0xDF.toString(16);

    public static var RE_CONNECT:String = 0x01.toString(16);
    public static var LOGIN_REQUEST:String = 0xE0.toString(16);
    public static var NEW_CHARACTER:String = 0xE1.toString(16);
    public static var WALLOW_VERIFY:String = 0xE2.toString(16);
    public static var GUIDE_RESPONSE_STEP:String = 0xE3.toString(16);
    public static var GET_USERNAME:String = 0xE4.toString(16);
    public static var USER_INFO:String = 0xE5.toString(16);
    public static var SWAR_OPER:String = 0xE8.toString(16);
    public static var SWAR_PROCESS:String = 0xE9.toString(16);
    public static var SWAR_INFO:String = 0xEA.toString(16);
    public static var SWAR_TOP:String = 0xEB.toString(16);
    public static var BOOK_SHOP_LIST:String = 0xEC.toString(16);
    public static var BOOK_SHOP_BUY:String = 0xED.toString(16);
    public static var RANK_DATA:String = 0xEE.toString(16);
    public static var RANK_SETTING:String = 0xEF.toString(16);

    public static var ACHIEVEMENT:String = 0xF0.toString(16);
    public static var CAMP_SELECT:String = 0xF1.toString(16);
    public static var BE_DISCONNECT:String = 0xF2.toString(16);
    public static var ALERT_MSG:String = 0xF3.toString(16);
    public static var SIGNIN_INFO:String = 0xFE.toString(16);

    public static var ENDWAR:String = 0xF8.toString(16);//末日之战
    public static var DEFWAR:String = 0x26.toString(16);//墨守成规

    public static var MARRY_HOME:String = 0x77.toString(16);//夫妻家园

    public static var FAIRY_LAND:String = 0x5D.toString(16);  //仙界遗迹
    public static var CLAN_ROLL:String = 0x7E.toString(16);//夺宝奇兵

    public static var COLLECT_CARD:String = 0x5F.toString(16);//收集卡牌


    public static var FRIENDLY:String = 0x5E.toString(16);//友好度

    public static var PUSH_BOBBIN:String = 0x46.toString(16);

    public static var EXTENSION:String = 0x27.toString(16);//扩展协议


    public var msgData:ByteArray;
    public static const HEART_GHOST:String = 0xBF.toString(16);
    //扩展协议
    public static const RUNE_SYSTEM_ALL:String = "RUNE_SYSTEM_ALL";
    public static const RUNE_SYSTEM_UPDATE:String = "RUNE_SYSTEM_UPDATE";
    public static const RUNE_SYSTEM_RET:String = "RUNE_SYSTEM_RET";


    public function MsgEvent(name:String, body:Object = null, type:String = null) {
        super(name, body, type);
    }
}
}
