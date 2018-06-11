package net.events {
/**
 *
 S->C    C->S    改为    S->C    C->S    描述
 0x00    0x00        0x00    0x00    保持连接
 0xF0    0xF0        0x20    0x20    聊天
 0xF1    0xF1        0x21    0x21    私聊
 0xF2    0xF2        0x22    0x22    寻找玩家
 0xF3    0xF3        0x23    0x23    炫耀
 0xF7                0x24            系统信息
 0xF8    0xF8        0x25    0x25    bug提交
 0xE0    0xE0        0x30    0x30    修炼地信息
 0xE1    0xE1        0x31    0x31    翻页请求
 0xE2    0xE2        0x32    0x32    修炼占位
 0xE3    0xE3        0x33    0x33    占据修炼位
 0xE4    0xE4        0x34    0x34    开始修炼
 0xE5    0xE5        0x35    0x35    停止修炼
 0xA6    0xA6        0x40    0x40    邮件ID列表
 0xA0    0xA0        0x41    0x41    邮件信息列表
 0xA1    0xA1        0x42    0x42    邮件内容
 0xA2    0xA2        0x43    0x43    邮件删除
 0xA3    0xA3        0x44    0x44    邮件发送
 0xA4                0x45            新邮件通知
 0xA5    0xA5        0x46    0x46    邮件信息改变
 0x80    0x80        0x50    0x50    玩家点击npc触发
 0x81    0x81        0x51    0x51    玩家点击对话
 0x82    0x82        0x52    0x52    玩家获取当前任务列表
 0x83    0x83        0x53    0x53    玩家获取当前可接任务列表
 0x85    0x85        0x54    0x54    玩家接受，提交，放弃任务
 0x86                0x55            更新任务进度
 0x87                0x56            新任务信息
 0x8B    0x8B        0x57    0x57    师门任务
 0x90    0x90        0x60    0x60    帮派列表信息
 0x91    0x91        0x61    0x61    自己的帮派信息
 0x92    0x92        0x62    0x62    创建帮派
 0x93    0x93        0x63    0x63    加入帮派
 0x94    0x94        0x64    0x64    帮派成员操作
 0x95    0x95        0x65    0x65    帮派信息更改
 0x96    0x96        0x66    0x66    请求某个帮派的信息
 0x97    0x97        0x67    0x67    请求自己所属帮派的成员列表
 0x98                0x68            帮派信息更新
 0x99    0x99        0x69    0x69    帮派科技
 0x9B    0x9B        0x6A    0x6A    帮派驻地信息
 0xC0    0xC0        0x80    0x80    交易列表
 0xC1    0xC1        0x81    0x81    根据交易ID请求交易内容
 0xC2    0xC2        0x82    0x82    发起交易
 0xC3                0x83            回复交易
 0xC4    0xC4        0x84    0x84    确认取消和删除交易状态操作
 0xC5    0xC5        0x85    0x85    寄售列表
 0xC6    0xC6        0x86    0x86    发起寄售
 0xC7                0x87            购买或下架指定物品
 0x62    0x62        0x90    0x90    参加国战 (退出国战)
 0x63                0x91            国战进行数据
 0x64                0x92            国战结果
 0x66                0x93            国战信息
 0x67    0x67        0x94    0x94    副本数据
 0x68    0x68        0x95    0x95    阵图数据
 0x6C    0x6C        0x9A    0x9A    战斗数据
 0x61    0x61        0x9B    0x9B    NPC战斗
 0x77                0x9C            战斗结束
 0x6D    0x6D        0x9D    0x9D    挂机
 0x6E                0x9E            挂机停止
 0x6F                0x9F            挂机加速
 0x51    0x51        0xA0    0xA0    城内定位
 0x52    0x52        0xA1    0xA1    传送
 0x53                0xA2            城内变化
 0x54                0xA3            据点玩家简单信息列表
 0x55                0xA4            据点玩家进入
 0x58    0x58        0xAA    0xAA    进入离开通天塔
 0x59    0x59        0xAB    0xAB    通天塔信息
 0x5A    0x5A        0xAC    0xAC    通天塔战斗
 0x5B    0x5B        0xAD    0xAD    自动通天塔战斗
 0x5C    0x5C        0xAE    0xAE    立即完成通天塔战斗
 0x5F    0x5F        0xAF    0xAF    通天塔次数
 0x40    0x40        0xB0    0xB0    装备强化
 0x41    0x41        0xB1    0xB1    装备打孔
 0x43    0x43        0xB2    0xB2    宝石镶嵌
 0x44    0x44        0xB3    0xB3    宝石拆卸
 0x47    0x47        0xB4    0xB4    装备洗炼
 0x49    0x49        0xB5    0xB5    批量分解
 0x4B    0x4B        0xB6    0xB6    宝石批量合成
 0x30    0x30        0xC0    0xC0    背包信息
 0x31                0xC1            放入九疑鼎
 0x32                0xC2            物品卖出
 0x33    0x33        0xC3    0xC3    物品使用
 0x34    0x34        0xC4    0xC4    背包扩展
 0xD0    0xD0        0xC5    0xC5    斗剑场信息
 0xD1    0xD1        0xC6    0xC6    斗剑场挑战
 0x39    0x39        0xCE    0xCE    九疑鼎
 0x38    0x38        0xCF    0xCF    在线奖励
 0x21    0x21        0xD0    0xD0    装备改变
 0x22    0x22        0xD1    0xD1    雇用散仙
 0x23    0x23        0xD2    0xD2    散仙信息
 0x26    0x26        0xD3    0xD3    酒馆列表
 0x27    0x27        0xD4    0xD4    解雇散仙
 0x28    0x28        0xD5    0xD5    接收散仙
 0xA8    0xA8        0xD8    0xD8    关系列表请求
 0xA9    0xA9        0xD9    0xD9    关系操作
 0xE8    0xE8        0xDA    0xDA    排行榜
 0xE9    0xE9        0xDB    0xDB    玩家个人排行信息
 0xB0    0xB0        0xDC    0xDC    商城信息
 0xB1    0xB1        0xDD    0xDD    商城购买
 0x29                0xDE            加血
 0x2C    0x2C        0xDF    0xDF    潜力洗炼
 0x10    0x10        0xE0    0xE0    登陆
 0x11    0x11        0xE1    0xE1    创建角色
 0x12                0xE2            防沉迷
 0x13    0x13        0xE3    0xE3    新手引导步骤
 0x14    0x14        0xE4    0xE4    请求玩家信息
 0x15    0x15        0xE5    0xE5    个人信息改变
 0x1A    0x1A        0xEC    0xEC    查询书商
 0x1B    0x1B        0xED    0xED    买书
 0x1D    0x1D        0xEE    0xEE    读阵型
 0x1E    0x1E        0xEF    0xEF    改变阵型
 0x0C    0x0C        0xF0    0xF0    成就
 0x0D    0x0D        0xF1    0xF1    选择阵营
 0x0E                0xF2            连接断开
 0x0F                0xF3            警告提示信息

 */
public class MsgConst {
    /**保持连接*/
    public static const KEEP_ALIVE:uint = 0x00;
    //重连接
    public static const RE_CONNECTION:uint = 0x01;
    /***/
    public static const SECRETBOOK_INFO:uint = 0x06;
    /**密友奖励*/
    public static const GFRIEND_REWARD:uint = 0x07;
    /***/
    public static const LEAVE_EXP:uint = 0x08;
    /**蜀山嘉年华*/
    public static const CARNIVAL:uint = 0x09;
    /**七日活动*/
    public static const SEVEN_ACTIVITY:uint = 0x0B;
    /***/
    /**说说*/
    public static const SAY_SAY:uint = 0x0C;
    /***/
    public static const ACTIVITY_COMPASS:uint = 0x0D;
    /***/
    public static const FIGHT_REPORT_TYPE:uint = 0x0F;
    public static const QQ_BUFF:uint = 0x12;
    public static const AWARD_INFO:uint = 0x13;
    public static const N525_INFO:uint = 0x14;
    /**七日活动*/
    public static const SEVEN_BACK_ACTIVITY:uint = 0x15;
    public static const FRIEND_MOOD:uint = 0x17;
    /**天劫*/
    public static const DISASTER:uint = 0x19;
    /**周年盛典活动*/
    public static const ANNIVERSARY:uint = 0x1B;
    /** 新出生七日奖励 */
    public static const REGISTER_SEVEN:uint = 0x1C;
    /** 第四职业 */
    public static const FOURTH_CAREER:uint = 0x1D;
    /** 格子游戏(寻墨探险) */
    public static const TILE_GAME:uint = 0x1E;
    /***/
    public static const FOUR_DETECTIVE:uint = 0x1F;
    /***/
    /**聊天*/
    public static const CHAT:uint = 0x20;
    /**私聊*/
    public static const WHISPER:uint = 0x21;
    /**寻找玩家*/
    public static const CHECK_USER:uint = 0x22;
    /**炫耀*/
    public static const FLAUNT:uint = 0x23;
    /**BUG投诉*/
    public static const BUG:uint = 0x25;
    /** 寻墨挂机*/
    public static const TILE_HOOK:uint = 0x2A;
    /**黄钻激活码领取*/
    public static const CDKEY_GET:uint = 0x2D;
    /**黄钻信息*/
    public static const GOLD_INFO:uint = 0x2E;
    /**黄钻领取*/
    public static const GOLD_GET:uint = 0x2F;
    /**修炼地信息*/
    public static const PLACE_INFO:uint = 0x30;
    /**修炼地翻页*/
    public static const PRACTICE_PAGE_CHANGE:uint = 0x31;
    /**修炼地挑战*/
    public static const PLACE_ROB:uint = 0x32;
    /**修炼地占领*/
    public static const PLACE_OCCUPY:uint = 0x33;
    /**开始修炼*/
    public static const PRACTICE_START:uint = 0x34;
    /**停止修炼*/
    public static const PRACTICE_STOP:uint = 0x35;
    /**修炼加速*/
    public static const PRACTICE_ACC:uint = 0x36;
    /**闭关修炼*/
    public static const RETREAT:uint = 0x37;
    /**世界boss*/
    public static const FIGHT_BOSS:uint = 0x3A;
    /**祭血台*/
    public static const JIXUETAI:uint = 0x3B;
    /**邮件ID列表*/
    public static const MAIL_ID_LIST:uint = 0x40;
    /**邮件信息列表*/
    public static const MAIL_LIST:uint = 0x41;
    /**邮件内容*/
    public static const MAIL_CONTENT:uint = 0x42;
    /**邮件删除*/
    public static const MAIL_DELETE:uint = 0x43;
    /**邮件发送*/
    public static const MAIL_SEND:uint = 0x44;
    /**邮件信息改变*/
    public static const MAIL_CHANGE:uint = 0x46;
    /**活跃度信息*/
    public static const ACTIVE_INFO:uint = 0x4A;
    /**活跃度奖励领取  累计充值兑奖*/
    public static const ACTIVE_AWARD:uint = 0x4B;
    /**活跃度*/
    public static const ACTIVE_TIME:uint = 0x4C;
    /**变强之路信息*/
    public static const STRONG_INFO:uint = 0x4D;
    /**跨服服战信息*/
    public static const ALL_SERVER_INFO:uint = 0x4E;

    /**点击NPC对话*/
    public static const DIALOG_START:uint = 0x50;
    /**点击交互动作*/
    public static const NPC_INTERACT:uint = 0x51;
    /**当前任务列表请求*/
    public static const CURR_TASK_LIST:uint = 0x52;
    /**当前可接任务列表请求*/
    public static const CURR_AVAILABLE_TASK:uint = 0x53;
    /**玩家接受、提交、放弃某任务请求*/
    public static const TASK_ACTION:uint = 0x54;
    /**循环任务刷新*/
    public static const TASK_CYC_REFRESH:uint = 0x57;

    /**帮派战（非战斗时）*/
    public static const CLAN_FIGHT_PRE:uint = 0x59;
    /**帮派战（战斗时）*/
    public static const CLAN_FIGHT:uint = 0x5a;
    /**请求帮会战排名列表*/
    public static const CLAN_FIGHT_LIST:uint = 0x5b;

    /**请求帮派列表信息*/
    public static const CLAN_LIST:uint = 0x60;
    /**请求自己帮派信息*/
    public static const CLAN_SELF:uint = 0x61;
    /**帮派创建*/
    public static const CLAN_CREATE:uint = 0x62;
    /**申请加入帮派*/
    public static const CLAN_APPLY:uint = 0x63;
    /**帮派成员操作*/
    public static const CLAN_OPERATE:uint = 0x64;
    /**帮派信息改变*/
    public static const CLAN_INFO_CHANGE:uint = 0x65;
    /**请求某个帮派信息*/
    public static const CLAN_REQ_OTHER:uint = 0x66;
    /**请求帮派成员列表信息*/
    public static const CLAN_PLAYER_LIST:uint = 0x67;
    /**请求帮派科技信息*/
    public static const CLAN_SKILL:uint = 0x69;
    /**帮派驻地信息*/
    public static const CLAN_BUILD:uint = 0x6A;
    /**帮派仓库信息*/
    public static const CLAN_DEPOT:uint = 0x6B;
    /**仓库记录信息*/
    public static const CLAN_DEPOT_RECORD:uint = 0x6C;
    /**帮派副本系统*/
    public static const CLAN_COPY:uint = 0x5C;

    /**请求交易列表信息*/
    public static const TRADE_LIST:uint = 0x80;
    /**根据交易ID请求交易内容*/
    public static const TRADE_INFO:uint = 0x81;
    /**发起交易*/
    public static const TRADE_LAUNCH:uint = 0x82;
    /**回复交易*/
    public static const TRADE_REPLY:uint = 0x83;
    /**确认取消删除交易*/
    public static const TRADE_OPERATION:uint = 0x84;
    /**请求寄售列表*/
    public static const TRADE_SALE_LIST:uint = 0x85;
    /**发起寄售*/
    public static const TRADE_SALE_LAUNCH:uint = 0x86;
    /**购买或下架*/
    public static const TRADE_SALE_CANCEL:uint = 0x87;
    /**交易金库*/
    public static const TRADE_TREASURY:uint = 0x7E;
    /**决战天摸排*/
    public static const FIGHT_DEMON:uint = 0x7F;
    /**妖王再临*/
    public static const KRAKEN:uint = 0x71;
    /**结婚系统*/
    public static const MARRIAGE:uint = 0x75;
    /**墨宝系统*/
    public static const INKTREASURE_AWAD_INFO:uint = 0x78;
    /**活动*/
    public static const ACTIVITY_SEVEN:uint = 0x8B;
    /**活动*/
    public static const SOUL_SYSTEM:uint = 0x8E;
    /**组队*/
    public static const GROUP_INFO:uint = 0x99;
    /**请求战报*/
    public static const FIGHT_REPORT:uint = 0x9A;
    /**打怪*/
    public static const ATTACK_NPC:uint = 0x9B;
    /**战斗退出*/
    public static const FIGHT_EXIT:uint = 0x9C;
    /**挂机停止*/
    public static const TASK_HOOK_STOP:uint = 0x9E;
    /**挂机加速*/
    public static const TASK_HOOK_ADD:uint = 0x9F;
    /**加入国战*/
    public static const CAMPS_WAR_JOIN:uint = 0x90;
    /**副本数据*/
    public static const COPY_DATA:uint = 0x94;
    /**阵图数据*/
    public static const FORMATION_DATA:uint = 0x95;
    /**副本自动战斗*/
    public static const COPY_AUTO_DATA:uint = 0x96;
    /**阵图自动战斗*/
    public static const FORMATION_AUTO_DATA:uint = 0x98;
    /**英雄岛*/
    public static const HERO_ISLAND_DATA:uint = 0x97;
    /**组队副本自动战斗*/
    public static const GROUPCOPY_AUTO:uint = 0x9C;
    /**挂机*/
    public static const TASK_HOOK:uint = 0x9D;
    /**地图获取据点信息*/
    public static const MAP_LOCATE:uint = 0xA0;
    /**地图传送*/
    public static const MAP_TRANSPORT:uint = 0xA1;
    /**锁妖塔*/
    public static const ENDLESS_TOWER:uint = 0xA9;
    /**进入离开通天塔*/
    public static const RIDE_INFO:uint = 0xAA;
    /**请求通天塔信息*/
    public static const BABEL_UPDATE:uint = 0xAB;
    /**开始通天塔战斗*/
    public static const BABEL_START:uint = 0xAC;
    /**开始自动通天塔战斗*/
    public static const BABEL_AUTO_START:uint = 0xAD;
    public static const BABEL_JOIN:uint = 0x58;
    /**立即完成通天塔战斗*/
    public static const BABEL_END:uint = 0xAE;
    /**日常*/
    public static const DAILY:uint = 0xAF;
    /**装备强化*/
    public static const EQ_ENHANCE:uint = 0xB0;
    /**装备打孔*/
    public static const EQ_PUNCH:uint = 0xB1;
    /**宝石镶嵌*/
    public static const EQ_EMBED:uint = 0xB2;
    /**宝石拆卸*/
    public static const EQ_UN_EMBED:uint = 0xB3;
    /**装备洗炼*/
    public static const EQ_PURIFY:uint = 0xB4;
    /**批量分解*/
    public static const EQ_DECOMPOSE:uint = 0xB5;
    /**宝石批量合成*/
    public static const GEM_UPGRADE:uint = 0xB6;
    /**法宝熔炼*/
    public static const TRUMP_MELT:uint = 0xB7;
    /**法宝升阶*/
    public static const TRUMP_UPGRADE:uint = 0xB8;
    /**法宝升阶*/
    public static const EQ_EVOLUTION:uint = 0xB9;
    /**装备注灵*/
    public static const EQ_SOUL:uint = 0xBA;
    /**装备解封*/
    public static const EQ_UNSEAL:uint = 0xBB;
    /**宝具通灵*/
    public static const EQ_BAOJU:uint = 0xBD;
    /**镇封星辰*/
    public static const USER_STARS:uint = 0xBE;
    /**背包列表信息*/
    public static const PACK_INFO:uint = 0xC0;
    /**背包添加到九疑鼎*/
    public static const PACK_TRIPOD:uint = 0xC1;
    /**背包卖出*/
    public static const PACK_SELL:uint = 0xC2;
    /**背包使用*/
    public static const PACK_USE:uint = 0xC3;
    /**背包扩展*/
    public static const PACK_EXTEND:uint = 0xC4;
    /**斗剑场信息*/
    public static const ARENA_INFO:uint = 0xC5;
    /**斗剑场挑战*/
    public static const ARENA_FIGHT_INFO:uint = 0xC6;
    /**刷新历练*/
    public static const ARENA_REFRESH:uint = 0xC7;
    /**奖励领取*/
    public static const ARENA_AWARD_GET:uint = 0xC8;
    /**斗剑场翻页*/
    public static const ARENA_PAGE:uint = 0xC9;
    /**斗剑场加速*/
    public static const ARENA_SPEED:uint = 0xCA;

    /** 加锁解锁*/
    public static const SETTING_LOCK:uint = 0xCC;
    /** 密宝设置*/
    public static const SETTING_PSWD:uint = 0xCD;

    /**九疑鼎*/
    public static const TRIPOD_INFO:uint = 0xCE;
    /**在线奖励*/
    public static const REWARD:uint = 0xCF;
    /**装备改变*/
    public static const CHANGE_EQ:uint = 0xD0;
    /**雇用散仙*/
    public static const HIRE_HERO:uint = 0xD1;
    /**散仙信息*/
    public static const HERO_INFO:uint = 0xD2;
    /**酒馆列表*/
    public static const HOTEL_LIST:uint = 0xD3;
    /**解雇散仙*/
    public static const FIRE_HERO:uint = 0xD4;
    /**接收散仙*/
    public static const ACCEPT_FIGHTER:uint = 0xD5;
    /**使用物品*/
    public static const USE_PACK_NEW:uint = 0xD7;
    /**关系列表请求*/
    public static const FRIEND_LIST:uint = 0xD8;
    /**关系列表操作*/
    public static const FRIEND_ACTION:uint = 0xD9;
    /**排行榜*/
    public static const SORT_LIST:uint = 0xDA;
    /**玩家个人排行信息*/
    public static const SORT_PERSON:uint = 0xDB;
    /**商城信息请求*/
    public static const STORE_LIST:uint = 0xDC;
    /**商城购买*/
    public static const STORE_BUY:uint = 0xDD;
    /**加血*/
    public static const ADD_HP:uint = 0xDE;
    /**潜力洗炼*/
    public static const POTENTIAL:uint = 0xDF;
    /**登陆*/
    public static const LOGIN:uint = 0xE0;
    /**创建角色*/
    public static const CREATE_ROLE:uint = 0xE1;
    /**新手引导步骤*/
    public static const NEW_HAND_STEP:uint = 0xE3;
    /**请求玩家信息*/
    public static const USER_INFO:uint = 0xE4;
    /**BUFFER信息改变*/
    public static const STATE:uint = 0xE5;
    /**跨服戰操作*/
    public static const SWAR_OPER:uint = 0xE8;
    /**跨服戰信息*/
    public static const SWAR_INFO:uint = 0xEA;
    /**跨服戰第一*/
    public static const SWAR_TOP:uint = 0xEB;
    /**查询书商*/
    public static const BOOK_LIST:uint = 0xEC;
    /**买书*/
    public static const BOOK_BUY:uint = 0xED;
    /**读阵型*/
    public static const READ_BATTLE:uint = 0xEE;
    /**改变阵型*/
    public static const BATTLE_CHECK:uint = 0xEF;
    /**成就*/
    public static const ARCHIEVEMENT:uint = 0xF0;
    /**阵营选择*/
    public static const CAMPS_CHOICE:uint = 0xF1;
    public static const GUIDE_ANALYSIS:uint = 0xF4;

    /**职业第一信息*/
    public static const CARRER:uint = 0xA5;

    /** 装备属性转化*/
    public static const PROPERTY_SWAP:uint = 0xBC;
    /** 陷害游戏(仙界第一场外活动) */
    public static const FRAME_GAME:uint = 0xE7;
    /** 华山论剑 */
    public static const SWORDFIGHT:uint = 0x2B;
    public static const RUNE_SYSTEM:uint = 0x18;

    /**
     * 水晶梦境
     */
    public static const DREAM_TILE:uint = 0x29;

    /**
     * 灵宠系统
     */
    public static const PET:uint = 0xA8;
    /**
     * 战斗力对比
     */
    public static const POWER_CONTRAST:uint = 0xA7;
    /** 回流活动 */
    public static const RETURN_ACTIVITY:uint = 0xFE;
    public static const ENDWAR:uint = 0xF8;
    public static const DEFWAR:uint = 0x26;
    public static const HEART_GHOST:uint = 0xBF;//心魔

    public static const BUYBACK:uint = 0xFA;//回购
    public static const MO_FANG:uint = 0xFB;//墨方
    public static const Marry_HOME:uint = 0x77;//夫妻家园

    public static const MARRAY:uint = 0x74;//婚礼

    public static const FAIRY_LAND:uint = 0x5D;//仙界遗址
    public static const CLAN_ROLL:uint = 0x7E;//夺宝奇兵

    public static const COLLECT_CARD:uint = 0x5F;//收集卡牌
    public static const FRIENDLY:uint = 0x5E;//友好度


    public static const XUANJI:uint = 0xE6;//璇玑
    public static const ZHEN_YUAN:uint = 0xE6;//阵元
    public static const LING_SHI:uint = 0x71;//灵侍

    public static const EXTENSION:uint = 0x27;//扩展协议
    public static const QIAN_YUAN:uint = 0x70;

    //乾元
}
}
