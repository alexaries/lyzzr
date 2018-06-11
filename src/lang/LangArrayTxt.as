package lang {
/**
 * @author caoqingshan
 */
public class LangArrayTxt {
    private static var _COUNTRY_STR:String = "正道,魔宗,";
    private static var _SEX_STRING:String = "男,女,童";
    private static var _TIME_INFO_STR:String = "&x&秒以前,&x&分钟以前,&x&小时以前,&x&天以前,&x&月以前,还在未来";
    private static var _COLOR_STR:String = "白色,绿色,蓝色,紫色,橙色,暗金,全部,颜色";
    private static var _FILTERTYPE_STRING:String = "等级,颜色,部位";
    private static var _EQUIPPOS_STRING:String = "武器,头部,胸部,肩部,腰带,腿部,项链,戒指,法宝,变身法宝,全部,光环法宝,灵,悟,信";
    private static var _HEROCAREERS_STRING:String = "天师,慈航,剑仙";/*,墨,妖*/
    private static var _HEROTYPES_STRING:String = "主将,一般,传奇";
    private static var _PAGE_STRS:String = "首页,上页,下页,末页";
    private static var _RANK_CONST_STR:String = "第一名,第二名,第三名,本帮派荣誉";
    private static var _CF_STATUS_STR:String = "等待出战,战斗中,已阵亡,'连胜8场，禁止战斗'";
    private static var _CDYNAMIC_TYPE_STR:String = "城战,人事,技艺,技艺";
    private static var _CLAN_POST_STRING:String = "成员,精英,长老,副帮主,帮主,待批准";
    private static var _PLACESTR_STRING:String = "武当山,昆仑山,峨嵋山,黄山,九华山,衡山,无";
    private static var _CLAN_BUILD_STRING:String = "玉珠峰(3),光明顶(5),十王峰(6),万佛顶(7),祝融峰(8),玉虚顶(10)";
    private static var _CLAN_BUILD_STRING1:String = "玉珠峰,光明顶,十王峰,万佛顶,祝融峰,玉虚顶";
    private static var _CSKILLEFT_STRING:String = "帮派总人数 x 人,北门耐久度 x,守护者出战人数 x 个,守护者等级 x 级,据点防守的NPC数量 x 个,南门耐久度 x ,帮派成员挂机加速效果 x ,城门图腾BOSS的等级 x 级,帮派图腾BOSS的等级 x 级,可提升帮派其他技艺等级";
    private static var _CDYNAMIC_STRING:String = "'[&x&]加入了帮派', '[&x&]离开了帮派', '经浴血奋战成功守护了帮派', '势单力薄，帮派不幸被攻破了', '帮众冲锋陷阵[&x&]的帮派并将其攻破，抢夺荣誉&y&点', '帮主[&x&]给[&y&]分配了帮派宝箱*&z&', '今日帮派城战第一名[&x&]获得帮派宝箱*3，<br/>			第二名[&y&]获得帮派宝箱*2，<br/>			第三名[&z&]获得帮派宝箱*1，<br/>本帮派排名第&p&', '今日帮派城战第一名[&x&]获得帮派宝箱*3，<br/>			第二名[&y&]获得帮派宝箱*2，<br/>			第三名[&z&]获得帮派宝箱*1', '帮派技艺[&x&]提升到了&y&级 ', '[&x&]的帮派职位提升到了&y&', '[&x&]招募了橙将&y& ', '与[&x&]结盟了 帮派频道消息', '与[&x&]解盟了 帮派频道消息', '[&x&]将帮主移交给了[&y&]', '今日夺城战已结束，英雄之城被攻破。恭喜帮派[&x&]夺得第一，获得帮派宝箱*3。<br/>			第二名帮派[&y&]获得帮派宝箱*2。<br/>			第三名帮派[&z&]获得帮派宝箱*1。<br/>			本帮派排名第&p& ', '今日夺城战已结束，英雄之城被攻破。恭喜帮派[&x&]夺得第一，获得帮派宝箱*3。<br/>			第二名帮派[&y&]获得帮派宝箱*2。<br/>			本帮派排名第&p&', '今日夺城战已结束，英雄之城被攻破。恭喜帮派[&x&]夺得第一，获得帮派宝箱*3。<br/>			本帮派排名第&p&', '今日夺城战已结束，英雄之城未被攻破。', '今日守城战已结束，恭喜帮派[&x&]防守成功，获得帮派宝箱*5。', '今日守城战已结束，名城[&s1&]被攻破。恭喜帮派[&s2&]夺得第一，获得帮派宝箱*3。<br/>			第二名帮派[&s3&]获得帮派宝箱*2。<br/>			第三名帮派[&s4&]获得帮派宝箱*1。', '今日守城战已结束，名城[&s1&]被攻破。恭喜帮派[&s2&]夺得第一，获得帮派宝箱*3。<br/>			第二名帮派[&s3&]获得帮派宝箱*2', '今日守城战已结束，名城[&s1&]被攻破。恭喜帮派[&s2&]夺得第一，获得帮派宝箱*3。', '[&s1&]招募了暗金将&s2& '";
    private static var _GOODS_TYPE_STRING:String = "'普通', '宝石', '任务', '装备', '其它'";
    private static var _EQ_TYPESTR:String = "武器,头盔,护甲,肩部,腰部,腿部,项链,戒指,法宝,法宝,法宝,变身法宝";
    private static var _RANGE_TYPES_STR:String = "单,全,排,列,十,品";
    private static var _AP_TYPES_STR:String = "物,法,疗,增,态,特";
    private static var _STATUS_TYPES_STR:String = "无,乱,晕,封,毒,反";
    private static var _PROTECT_TYPES_STR:String = "无需保护,护法弟子,仙府禁法";
    private static var _PRACTICE_SUBTITLE_STR:String = "无主之地,公共修炼场,帮派修炼场";
    private static var _ACTIVETIME_WEEKDAY_STR:String = "一,二,三,四,五,六,日";
    private static var _EQ_SOUL_STRING:String = "攻击魂力,防御魂力,暴击魂力,破击魂力,身法魂力,坚韧魂力,毁灭魂力,生命魂力,";
    private static var _SHELL_VIEW_3_STR:String = "白,绿,蓝,紫,橙,金";
    private static var _SKIL_VIEW_1_STR:String = "全部,天师, 慈航,剑仙";//,墨,妖
    private static var _SKIL_VIEW_4_STR:String = "被动技能,主动技能,无双技能";
    private static var _SORT_VIEW_1_STR:String = "等级榜,斗剑榜,荣誉榜,帮派榜";
    private static var _TASK_VIEW_18_STR:String = "师门,衙门";
    private static var _TEMP_TASK_TYPE_STR:String = ",主,支,日,师,衙,帮派";
    private static var _TEMP_TASK_STATE_STR:String = "未完成,已完成,可接取";
    private static var _SALE_VIEW_1_STR:String = "普,装,法,阵,心,宝,魂,元,通";
    private static var _SALE_VIEW_4_STR:String = "普通|,炼器|,装备|武器&护头&护胸&护肩&护腰&护腿&项链&戒指,心法|增益心法&技能心法&心法碎片,法宝|被动法宝&无双法宝&法宝碎片,阵法|七绝锁云阵&四象元灵阵&奇门遁甲阵&天罡地煞阵&都天烈火阵&颠倒八卦阵&北斗七星阵&五行灭绝阵&紫微太极阵&金刚伏魔阵&须弥九宫阵&两仪微尘阵&阵元,宝石|力量&敏捷&智力&力量&耐力&意志&生命&攻击&防御&命中&反击&闪避&暴击&破击&身法&坚韧&法抗,魂魄|攻击之魂&防御之魂&暴击之魂&破击之魂&身法之魂&坚韧之魂&毁灭之魂&生命之魂,元神|元神技能&怪物元神,我的摊位|";
    private static var _countryArr:Array = ["正道", "魔宗", ""];
    private static var _BAOJU_TYPESTR:String = "灵，悟，信";
    private static var _BAOJU_PROPSTR:String = "物理攻击、法术攻击、物理防御、法术防御、生命、坚韧、身法、命中、躲避、暴击、破击、反击";
    private static var _PET_CARRER_STRS:Array = ["", "金系灵宠，可在战斗中辅助攻击敌方散仙", "木系灵宠，可在战斗中增强我方散仙攻击力", "水系灵宠，可在战斗中增强我方散仙防御力", "火系灵宠，可在战斗中恢复我方散仙生命和灵气"]
    public static var PETSPACE_PLACE_STRS:Array = ["", "可获得少量龙元和凤髓",
        "可获得龙元和凤髓，且有几率遇见绿色灵宠",
        "可获得龙元和凤髓，且有几率遇见蓝色灵宠",
        "可获得大量龙元和凤髓，且有几率遇见蓝色灵宠或产生兽神感应",
        "可获得大量龙元和凤髓以及兽魂，且有几率产生兽神感应"];
    public static const ADDTION_NAMES:Array = ['物攻', '法攻', '身法', '生命'];
    public static const FRIENDLY_INFO:Array = ["友好度", "好友关系", "友情值"];

    public static function get COUNTRYARR():Array {
        return _countryArr;
    }

    public static function set COUNTRY_STR(value:String):void {
        _COUNTRY_STR = value;
        _countryArr = value.split(',');
    }

    private static var _sexArray:Array = ["男", "女", "童"];

    public static function get SEXARRAY():Array {
        return _sexArray;
    }

    public static function set SEX_STRING(value:String):void {
        _SEX_STRING = value;
        _sexArray = value.split(',');
    }

    private static var _time_info:Array = ['&x&秒以前', '&x&分钟以前', '&x&小时以前', '&x&天以前', '&x&月以前', '还在未来'];

    public static function get TIME_INFOARR():Array {
        return _time_info;
    }

    public static function set TIME_INFO_STR(value:String):void {
        _TIME_INFO_STR = value;
        _time_info = value.split(',');
    }

    private static var _color_names:Array = ["白色", "绿色", "蓝色", "紫色", "橙色", "暗金", "全部", "颜色"];

    public static function get COLOR_NAMES():Array {
        return _color_names;
    }

    public static function set COLOR_STR(value:String):void {
        _COLOR_STR = value;
        _color_names = value.split(',');
    }

    ///////////////魂器/////////////
    private static var prop:Array = ["特殊属性", "暴击抗性", "破击抗性", "反击抗性", "攻击穿透"];

    public static function get property():Array {
        return prop;
    }

    private static var _hunqiColor:Array = ["绿色", "蓝色", "紫色", "橙色", "红色"];
    public static function get hunqiColor():Array {
        return _hunqiColor;
    }

    private static var _equip_pos_names:Array = ["武器", "头部", "胸部", "肩部", "腰带", "腿部", "项链", "戒指", "法宝", "变身法宝", "全部", "光环法宝", "先天法宝"];

    public static function get EQUIPPOS_NAMES():Array {
        return _equip_pos_names;
    }

    public static function set EQUIPPOS_STRING(value:String):void {
        _EQUIPPOS_STRING = value;
        _equip_pos_names = value.split(',');
    }

    private static var _filtertype:Array = ["等级", "颜色", "部位"];

    public static function get FILTER_TYPE():Array {
        return _filtertype;
    }

    public static function set FILTERTYPE_STRING(value:String):void {
        _FILTERTYPE_STRING = value;
        _filtertype = value.split(',');
    }

    private static var _herocareers:Array = ["天师", "慈航", "剑仙"];//, "墨(帝)", "妖(仙)"

    public static function get HERO_CAREERS():Array {
        return _herocareers;
    }

    private static var _newHerocareers:Array = ["全职业","天师", "慈航", "剑仙"];//, "墨", "圣", "佛", "尊", "帝", "妖", "仙"

    public static function get NEW_HERO_CAREERS():Array {
        return _newHerocareers;
    }

    public static function set HEROCAREERS_STRING(value:String):void {
        _HEROCAREERS_STRING = value;
        _herocareers = value.split(',');
    }

    private static var _herotypes:Array = ["主将", "一般", "传奇"];

    public static function get HERO_TYPES():Array {
        return _herotypes;
    }

    public static function set HEROTYPES_STRING(value:String):void {
        _HEROTYPES_STRING = value;
        _herotypes = value.split(',');
    }

    private static var _pageStrings:Array = ['首页', '上页', '下页', '末页'];

    public static function get PAGE_STRINGS():Array {
        return _pageStrings;
    }

    private static var _pageStrArr:Array = ['首页', '上一页', '下一页', '末页'];

    public static function get PAGE_STR_ARR():Array {
        return _pageStrings;
    }

    public static function set PAGE_STRS(value:String):void {
        _PAGE_STRS = value;
        _pageStrings = value.split(',');
    }

    public static function get PAGESTRS():Array {
        return _pageStrings;
    }

    public static function get EQPOS_NAME():Array {
        return _equip_pos_names;
    }

    public static function get TIME_INFO_ARR():Array {
        return _time_info;
    }

    private static var _rank_const_arr:Array = ["第一名", "第二名", "第三名", "本帮派荣誉"];

    public static function get RANK_CONST_ARR():Array {
        return _rank_const_arr;
    }

    public static function set RANK_CONST_STR(value:String):void {
        _RANK_CONST_STR = value;
        _rank_const_arr = value.split(',');
    }

    private static var _cf_status_tips:Array = ["等待出战", "战斗中", "已阵亡", "连胜8场，禁止战斗"];

    public static function get CF_STATUS_TIPS():Array {
        return _cf_status_tips;
    }

    public static function set CF_STATUS_STR(value:String):void {
        _CF_STATUS_STR = value;
        _cf_status_tips = value.split(',');
    }

    private static var _cdynamicTypes:Array = ["城战", "人事", "技艺", "技艺"];

    public static function get CDYNAMIC_TYPE_ARR():Array {
        return _cdynamicTypes;
    }

    public static function set CDYNAMIC_TYPE_STR(value:String):void {
        _CDYNAMIC_TYPE_STR = value;
        _cdynamicTypes = value.split(',');
    }

    private static var _clan_poststr_arr:Array = ["成员", "精英", "长老", "副帮主", "帮主", "待批准"];

    public static function get CLAN_POSTSTR_ARR():Array {
        return _clan_poststr_arr;
    }

    public static function set CLAN_POST_STRING(value:String):void {
        _CLAN_POST_STRING = value;
        _clan_poststr_arr = value.split(',');
    }

    private static var _placeStr_arr:Array = ["武当山", "昆仑山", "峨嵋山", "黄山", "九华山", "衡山", "无"];

    public static function get PLACESTR_ARR():Array {
        return _placeStr_arr;
    }

    public static function set PLACESTR_STRING(value:String):void {
        _PLACESTR_STRING = value;
        _placeStr_arr = value.split(',');
    }

    private static var _clan_buildstr_arr:Array = ["玉珠峰(3)", "光明顶(5)", "十王峰(6)", "万佛顶(7)", "祝融峰(8)", "玉虚顶(10)"];

    public static function get CLAN_BUILDSTR_ARR():Array {
        return _clan_buildstr_arr;
    }

    public static function set CLAN_BUILD_STRING(value:String):void {
        _CLAN_BUILD_STRING = value;
        _clan_buildstr_arr = value.split(',');
    }

    private static var _clan_buildstr_arr1:Array = ["玉珠峰", "光明顶", "十王峰", "万佛顶", "祝融峰", "玉虚顶"];

    public static function get CLAN_BUILDSTR_ARR1():Array {
        return _clan_buildstr_arr1;
    }

    public static function set CLAN_BUILD_STRING1(value:String):void {
        _CLAN_BUILD_STRING1 = value;
        _clan_buildstr_arr1 = value.split(',');
    }

    private static var _cskilleft_arr:Array = ["帮派总人数 x 人", "北门耐久度 x", "守护者出战人数 x 个", "守护者等级 x 级", "据点防守的NPC数量 x 个", "南门耐久度 x ", "帮派成员挂机加速效果 x ", "城门图腾BOSS的等级 x 级", "帮派图腾BOSS的等级 x 级", "可提升帮派其他技艺等级"];

    public static function get CSKILLEFT_ARR():Array {
        return _cskilleft_arr;
    }

    public static function set CSKILLEFT_STRING(value:String):void {
        _CSKILLEFT_STRING = value;
        _cskilleft_arr = value.split(',');
    }

    private static var _cdynamic_arr:Array = ["[&x&]加入了帮派", "[&x&]离开了帮派", "经浴血奋战成功守护了帮派", "势单力薄，帮派不幸被攻破了", "帮众冲锋陷阵[&x&]的帮派并将其攻破，抢夺荣誉&y&点", "帮主[&x&]给[&y&]分配了帮派宝箱*&z&", "今日帮派城战第一名[&x&]获得帮派宝箱*3，<br/>			第二名[&y&]获得帮派宝箱*2，<br/>			第三名[&z&]获得帮派宝箱*1，<br/>本帮派排名第&p&", "今日帮派城战第一名[&x&]获得帮派宝箱*3，<br/>			第二名[&y&]获得帮派宝箱*2，<br/>			第三名[&z&]获得帮派宝箱*1", "帮派技艺[&x&]提升到了&y&级 ", "[&x&]的帮派职位提升到了&y&", "[&x&]招募了橙将&y& ", "与[&x&]结盟了 帮派频道消息", "与[&x&]解盟了 帮派频道消息", "[&x&]将帮主移交给了[&y&]", "今日夺城战已结束，英雄之城被攻破。恭喜帮派[&x&]夺得第一，获得帮派宝箱*3。<br/>			第二名帮派[&y&]获得帮派宝箱*2。<br/>			第三名帮派[&z&]获得帮派宝箱*1。<br/>			本帮派排名第&p& ", "今日夺城战已结束，英雄之城被攻破。恭喜帮派[&x&]夺得第一，获得帮派宝箱*3。<br/>			第二名帮派[&y&]获得帮派宝箱*2。<br/>			本帮派排名第&p&", "今日夺城战已结束，英雄之城被攻破。恭喜帮派[&x&]夺得第一，获得帮派宝箱*3。<br/>			本帮派排名第&p&", "今日夺城战已结束，英雄之城未被攻破。", "今日守城战已结束，恭喜帮派[&x&]防守成功，获得帮派宝箱*5。", "今日守城战已结束，名城[&s1&]被攻破。恭喜帮派[&s2&]夺得第一，获得帮派宝箱*3。<br/>			第二名帮派[&s3&]获得帮派宝箱*2。<br/>			第三名帮派[&s4&]获得帮派宝箱*1。", "今日守城战已结束，名城[&s1&]被攻破。恭喜帮派[&s2&]夺得第一，获得帮派宝箱*3。<br/>			第二名帮派[&s3&]获得帮派宝箱*2", "今日守城战已结束，名城[&s1&]被攻破。恭喜帮派[&s2&]夺得第一，获得帮派宝箱*3。", "[&s1&]招募了暗金将&s2& "];

    public static function get CDYNAMIC_ARR():Array {
        return _cdynamic_arr;
    }

    public static function set CDYNAMIC_STRING(value:String):void {
        _CDYNAMIC_STRING = value;
        _cdynamic_arr = value.split(',');
    }

    private static var _top_prop_names:Array = [LangTxt.POWER, LangTxt.AGILITY, LangTxt.STRENGTH, LangTxt.INTELLIGENCE];

    public static function get TOP_PROPS_NAME():Array {
        _top_prop_names = [LangTxt.POWER, LangTxt.AGILITY, LangTxt.STRENGTH, LangTxt.INTELLIGENCE];
        return _top_prop_names;
    }

    public static function get ADDED_PROPS_NAME():Array {
        return [LangTxt.HP, LangTxt.ACT, LangTxt.HIT, LangTxt.DODGE, LangTxt.CRIT, LangTxt.PIERCE, LangTxt.REPEL];
    }

    // ----裝備相關內容	---------------
    private static var _goods_type_names:Array = [LangTxt.COMM, '宝石', '任务', '装备', '其它'];

    public static function get GOODS_TOPTYPE():Array {
        return _goods_type_names;
    }

    public static function set GOODS_TYPE_STRING(value:String):void {
        _GOODS_TYPE_STRING = value;
        _goods_type_names = value.split(',');
    }

    public static function get HEROIC_PROP_ENUM():Array {
        return [LangTxt.POWER, LangTxt.STRENGTH, LangTxt.AGILITY, LangTxt.INTELLIGENCE, LangTxt.WILL, LangTxt.TOUGH, LangTxt.ACT, LangTxt.HIT, LangTxt.DODGE, LangTxt.CRIT, LangTxt.CRIT_DAMAGE, LangTxt.PIERCE, LangTxt.REPEL, LangTxt.MAGIC_DODGE];
    }

    private static var _mode_names:Array = [LangTxt.COMM, LangTxt.DIFFICULTY];

    public static function set MODE_NAMES(value:String):void {
        _mode_names = value.split(',');
    }

    public static function get MODE_NAME():Array {
        _mode_names = [LangTxt.COMM, LangTxt.DIFFICULTY];
        return _mode_names;
    }

    private static var _info_filter:Array = [];

    public static function get INFO_FILTER():Array {
        _info_filter = [LangTxt.ALL, LangTxt.MYSELF];
        return _info_filter;
    }

    public static function set INFO_FILTER_STR(value:String):void {
        _info_filter = value.split(',');
    }

    private static var _eqTypeArr:Array = ["武器", "头盔", "护甲", "肩部", "腰部", "腿部", "项链", "戒指", "法宝", "法宝", "法宝", "变身法宝", "仙兵", "仙衣", "仙器"];

    public static function get EQ_TYPE_ARR():Array {
        return _eqTypeArr;
    }

    public static function set EQ_TYPESTR(value:String):void {
        _EQ_TYPESTR = value;
        _eqTypeArr = value.split(',');
    }

    private static var _range_types:Array = ["单", "全", "排", "列", "十", "品"];

    public static function get RANGE_TYPES():Array {
        return _range_types;
    }

    public static function set RANGE_TYPES_STR(value:String):void {
        _RANGE_TYPES_STR = value;
        _range_types = value.split(',');
    }

    private static var _ap_types:Array = ["物", "法", "疗", "增", "态", "特"];

    public static function get AP_TYPES():Array {
        return _ap_types;
    }

    public static function set AP_TYPES_STR(value:String):void {
        _AP_TYPES_STR = value;
        _ap_types = value.split(',');
    }

    private static var _status_types:Array = ["无", "乱", "晕", "封", "毒", "反"];

    public static function get STATUS_TYPES():Array {
        return _status_types;
    }

    public static function set STATUS_TYPES_STR(value:String):void {
        _STATUS_TYPES_STR = value;
        _status_types = value.split(',');
    }

    public static function get CHAT_TABS():Array {
        return [LangTxt.WORLD, LangTxt.COUNTRY, LangTxt.CLAN, LangTxt.WHISPER, LangTxt.SYSTEM];
    }

    public static function get PACK_TAB():Array {
        return [LangTxt.COMM, LangTxt.EQUIP, LangTxt.TRUMP, LangTxt.BATTLE, LangTxt.CITTA, LangTxt.JEWELS, LangTxt.PSYCHE, LangTxt.SOUL, LangTxt.TONGLING, LangTxt.HUNQI, "灵珠"];
    }

    private static var _protect_types:Array = ["无需保护", "护法弟子", "仙府禁法"];

    public static function get PROTECT_TYPES():Array {
        return _protect_types;
    }

    public static function set PROTECT_TYPES_STR(value:String):void {
        _PROTECT_TYPES_STR = value;
        _protect_types = value.split(',');
    }

    private static var _practice_subtitle:Array = ["无主之地", "公共修炼场", "帮派修炼场"];

    public static function get PRACTICE_SUBTITLE():Array {
        return _practice_subtitle;
    }

    public static function set PRACTICE_SUBTITLE_STR(value:String):void {
        _PRACTICE_SUBTITLE_STR = value;
        _practice_subtitle = value.split(',');
    }

    private static var _activetime_weekday:Array = ["一", "二", "三", "四", "五", "六", "日"];

    public static function get ACTIVETIME_WEEKDAY():Array {
        return _activetime_weekday;
    }

    public static function set ACTIVETIME_WEEKDAY_STR(value:String):void {
        _ACTIVETIME_WEEKDAY_STR = value;
        _activetime_weekday = value.split(',');
    }

    private static var _eq_soul_arr:Array = ["攻击魂力", "防御魂力", "暴击魂力", "破击魂力", "身法魂力", "坚韧魂力", "毁灭魂力", "生命魂力", ""];

    public static function get EQ_SOUL_ARR():Array {
        return _eq_soul_arr;
    }

    public static function set EQ_SOUL_STRING(value:String):void {
        _EQ_SOUL_STRING = value;
        _eq_soul_arr = value.split(',');
    }

    private static var _shell_view_3:Array = ["白", "绿", "蓝", "紫", "橙", "金"];

    public static function get SHELL_VIEW_3():Array {
        return _shell_view_3;
    }

    public static function set SHELL_VIEW_3_STR(value:String):void {
        _SHELL_VIEW_3_STR = value;
        _shell_view_3 = value.split(',');
    }

    private static var _skil_view_1:Array = ["全部", "天师", "慈航", "剑仙", "墨", "妖", "符咒"];

    public static function get SKIL_VIEW_1():Array {
        return _skil_view_1;
    }

    public static function set SKIL_VIEW_1_STR(value:String):void {
        _SKIL_VIEW_1_STR = value;
        _skil_view_1 = value.split(',');
    }

    private static var _skil_view_4:Array = ["被动技能", "主动技能", "无双技能", "召唤技能", "仙器技能"];

    public static function get SKIL_VIEW_4():Array {
        return _skil_view_4;
    }

    public static function set SKIL_VIEW_4_STR(value:String):void {
        _SKIL_VIEW_4_STR = value;
        _skil_view_4 = value.split(',');
    }

    public static function get SKIL_VIEW_7():Array {
        return [LangTxt.SKILL, LangTxt.SKILL_EXP_2, LangTxt.SKILL_REFINE, LangTxt.SKILL_RUNE, LangTxt.SKILL_UPGRADESTAGE, "铭纹", "雕纹", "打磨"];
    }


    //	private static var _sort_view_1 : Array = ["等级榜", "斗剑榜", "荣誉榜", "帮派榜"];
    private static var _sort_view_1:Array = ["战斗力", "等级榜", "斗剑榜", "帮派榜"];

    public static function get SORT_VIEW_1():Array {
        return _sort_view_1;
    }

    private static var _skil_view_11:Array = ["全部心法", "技能心法", "增益心法", "可学心法"];

    public static function get SKIL_VIEW_11():Array {
        return _skil_view_11;
    }

    public static function set SORT_VIEW_1_STR(value:String):void {
        _SORT_VIEW_1_STR = value;
        _sort_view_1 = value.split(',');
    }

    private static var _task_view_18:Array = ["师门", "衙门"];

    public static function get TASK_VIEW_18():Array {
        return _task_view_18;
    }

    public static function set TASK_VIEW_18_STR(value:String):void {
        _TASK_VIEW_18_STR = value;
        _task_view_18 = value.split(',');
    }

    public static function get TASK_VIEW_34():Array {
        return [{label: LangTxt.TASK_CURR_STR}, {label: LangTxt.TASK_AVI_STR}, {label: LangTxt.TASK_TYPE2}];
    }

    public static function get TASK_VIEW_38():Array {
        return [{label: LangTxt.TASK_CURR_STR + LangTxt.TASK}, {label: LangTxt.TASK_AVI_STR + LangTxt.TASK}];
    }

    public static var TEMP_TASK_PLANS:Array = [];
    private static var _temp_task_type:Array = ["", "主", "支", "日", "师", "衙", "帮派"];

    public static function get TEMP_TASK_TYPE():Array {
        return _temp_task_type;
    }

    public static function set TEMP_TASK_TYPE_STR(value:String):void {
        _TEMP_TASK_TYPE_STR = value;
        _temp_task_type = value.split(',');
    }

    public static function get GOODFRIELD_SUBTITLE():Array {
        return [LangTxt.NAME, LangTxt.SEX, LangTxt.LEVEL, LangTxt.CAREER, LangTxt.CLAN, LangTxt.OPERATION];
    }

    private static var _temp_task_state:Array = ["未完成", "已完成", "可接取","不可接取"];

    public static function get TEMP_TASK_STATE():Array {
        return _temp_task_state;
    }

    public static function set TEMP_TASK_STATE_STR(value:String):void {
        _TEMP_TASK_STATE_STR = value;
        _temp_task_state = value.split(',');
    }

    public static function get awardTypes():Array {
        return [LangTxt.EXP, LangTxt.SILVER, LangTxt.FIGHT_SCORE, LangTxt.OTHER_GOODS];
    }

    private static var _sale_view_1:Array = ["普", "装", "法", "阵", "心", "宝", "魂", "元", "通"];

    public static function get SALE_VIEW_1():Array {
        return _sale_view_1;
    }

    public static function set SALE_VIEW_1_STR(value:String):void {
        _SALE_VIEW_1_STR = value;
        _sale_view_1 = value.split(',');
    }

    public static function get SALE_VIEW_3():Array {
        return [LangTxt.COMM, LangTxt.EQUIP_UP, LangTxt.EQUIP, LangTxt.CITTA, LangTxt.TRUMP, LangTxt.BATTLE, LangTxt.JEWELS, LangTxt.MY_SALESHOP];
    }

    public static function get PILLS_PROP():Array {
        return [LangTxt.POWER, LangTxt.AGILITY, LangTxt.INTELLIGENCE, LangTxt.WILL, LangTxt.STRENGTH, LangTxt.SOUL_VALUE, LangTxt.ATTACK, LangTxt.DEF, LangTxt.CRIT, LangTxt.PIERCE, LangTxt.DODGE, LangTxt.REPEL, LangTxt.TOUGH, LangTxt.ACT];
    }

    private static var _sale_view_4:Array =
            [["普通", 1, []],
                ["炼器", 2, []],
                ["装备", 3, [["武器", 1], ["护头", 2], ["护胸", 3], ["护肩", 4], ["护腰", 5], ["护腿", 6], ["项链", 7], ["戒指", 8]]],
                ["心法", 4, [["增益心法", 1], ["技能心法", 2], ["心法碎片", 3]]],
                ["法宝", 5, [["被动法宝", 1], ["无双法宝", 2], ["法宝碎片", 3], ["光环法宝", 4]]],
                ["阵法", 6, [["七绝锁云阵", 1], ["四象元灵阵", 2], ["奇门遁甲阵", 3], ["天罡地煞阵", 4], ["都天烈火阵", 5], ["颠倒八卦阵", 6], ["北斗七星阵", 7], ["五行灭绝阵", 8], ["紫微太极阵", 9], ["金刚伏魔阵", 10], ["须弥九宫阵", 11], ["两仪微尘阵", 12], ["阵元", 13]]],
                ["宝石", 7, [["力量", 1], ["敏捷", 2], ["智力", 3], ["耐力", 4], ["意志", 5], ["生命", 6], ["攻击", 7], ["防御", 8], ["命中", 9], ["反击", 10], ["闪避", 11], ["暴击", 12], ["破击", 13], ["身法", 14], ["坚韧", 15], ["法抗", 16], ["星石", 17]]],
                ["魂魄", 8, [["攻击之魂", 1], ["防御之魂", 2], ["暴击之魂", 3], ["破击之魂", 4], ["身法之魂", 5], ["坚韧之魂", 6], ["毁灭之魂", 7], ["生命之魂", 8]]],
                ["元神", 9, [["元神技能", 1], ["怪物元神", 2]]],
                ["宝具", 10, [["灵", 1], ["悟", 2], ["信", 3]]],
                ["仙装", 11, [["仙兵", 1], ["仙衣", 2], ["仙器", 3]]],
                ["我的摊位", 12, []]];

    public static function set SALE_VIEW_4_STR(value:String):void {
        _SALE_VIEW_4_STR = value;
        var arr:Array = value.split(',');
        var a1:Array = [];
        var a2:Array;
        var a3:Array;
        var a1i:uint = 1;
        var a2i:uint;
        for each (var strTmp:String in arr) {
            var aTmp:Array = strTmp.split("|");
            a2 = [];
            if (aTmp[1] && String(aTmp[1]).length > 0) {
                var tmp:Array = String(aTmp[1]).split("&");
                a2i = 1;
                for each (var str:String in tmp) {
                    a3 = [str, a2i];
                    a2.push(a3);
                    a2i++;
                }
            }
            a1.push([aTmp[0], a1i, a2]);
            a1i++;
        }
        _sale_view_4 = a1;
    }

    public static function get SALE_VIEW_4():Array {
        return _sale_view_4;
    }


    public static var SALE_VIEW_8:Array = [["蓝色装备x1", "混元离土 x1", "七星元木x1", "乾坤净水x1"], ["银票x1", "银票x2", "银票x3", "银票x4"], ["初级挂机加速符x1", "高级挂机加速符x1或修为加速符x1", "高级挂机加速符x3或修为加速符x3", "高级挂机加速符x5或修为加速符x5"], ["凝神丹x1", "凝神丹x2", "凝神丹x3", "凝神易筋丹x1"], ["太乙真金x1", "太乙精金x1", "五行真金x1", "五行精金x1"], ["补髓丹x1", "补髓丹x2", "补髓丹x3", "补髓益元丹x1"], ["轩辕混沌元胎x1", "女娲混沌元胎x1", "盘古混沌元胎x1", "先天混沌元胎x1"]];
    public static var ICQ_SEARCH_TYPE:Array = ["精确查找", "有缘人"];
    public static var CN_NUM:Array = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "二十一", "二十二", "二十三", "二十四", "二十五", "二十六", "二十七", "二十八", "二十九", "三十"];
    public static var STRONG_SOULS:Array = ["不屈之魂", "骁勇之魂", "剑仙之魂", "逍遥之魂", "女娲之魂"];

    public static const xianTypeArray:Array = ["仙兵", "仙衣", "仙器"];
    private static var _baojuTypeArr:Array = ["灵", "悟", "信"];

    public static function get BAOJU_TYPE_ARR():Array {
        return _baojuTypeArr;
    }

    public static function set BAOJU_TYPESTR(value:String):void {
        _BAOJU_TYPESTR = value;
        _baojuTypeArr = value.split(',');
    }

    private static var _baojuPropArr:Array =
            [LangTxt.PHY + LangTxt.AP,
                LangTxt.MAGIC + LangTxt.AP,
                LangTxt.PHY + LangTxt.DEF,
                LangTxt.MAGIC + LangTxt.DEF,
                LangTxt.HP,
                LangTxt.TOUGH,
                LangTxt.ACT,
                LangTxt.HIT,
                LangTxt.DODGE,
                LangTxt.CRIT,
                LangTxt.PIERCE,
                LangTxt.REPEL
            ];

    public static function get BAOJU_PROP_ARR():Array {
        return _baojuPropArr;
    }

    public static function set BAOJU_PROPSTR(value:String):void {
        _BAOJU_PROPSTR = value;
        _baojuPropArr = value.split(',');
    }

    public static function get PET_CARRER_STR():Array {
        return _PET_CARRER_STRS;
    }

    public static var marry_fishIconStr:Array = ["一条好吃的白鱼，可以增加宠物成长值3，获得物品自动增加宠物成长值",
        "一条美味的七星鱼，可以增加宠物成长值5，获得物品自动增加宠物成长值",
        "一条珍馐的金锦鱼，可以增加宠物成长值7，获得物品自动增加宠物成长值",
        "一个记忆碎片，可以增加1次当日追忆次数，获得物品即自动增加当日追忆次数",
        "<font color = '#FF0000'>获得后宠物成长值+10</font>,沉在池塘底的千年古迹，是一位剑侠使用礼券钓鱼时发现的，因此使用礼券钓鱼，有机会捕获",
        "<font color = '#FF0000'>获得后宠物成长值+15</font>,沉在池塘底的万年古迹，是一位剑侠使用仙石钓鱼时发现的，因此使用仙石钓鱼，有机会捕获"
    ];
    public static var marry_tokenStr:Array = ["沧海月明珠有泪，蓝田日暖玉生烟。一只精致可爱的蓝田玉玉兔，可以增加夫妻双方出战的所有散仙30生命，成功举行婚礼后生效",
        "光滑细腻，纯白均一。一只晶莹剔透的京白玉玉兔，可以增加夫妻双方出战的所有散仙180生命，成功举行婚礼后生效。",
        "如切如磋，如琢如磨，方才能得到一只珍贵的羊脂玉玉兔，一枚羊脂玉玉兔，可以增加夫妻双方出战的所有散仙400生命，成功举行婚礼后生效"];

    public static const TREASURE_TAB_NAMES:Array = ["魔宫宝窟", "三尸皇陵", "紫海金殿", "藏月岛", "幻龙漩涡", "灵翠宫", "魔狱妖阵", "冰渊洞天", "妖尸幻境"]


    public static const PAGE_ARRAY:Array = ["上一页", "下一页"];
    public static const CITY_TYPE_NAME:Array = ["公共遗迹", "一级遗迹", "二级遗迹", "三级遗迹", "灵气水晶"];
    public static const ADD_ATTRIBUTE:Array = ["", "攻击", "", "物防", "魔防", "身法", "血量"];
    public static const CLICK_CITY_MENU:Array = ["遗迹信息", "发起攻击"];
    public static const CLICK_MEMBER_MENU:Array = ["踢出队伍", "成员信息"];
    public static const MEMBER_TITLE:Array = ["队员", "队长"];
    public static const OUM_ARRAY:Array = ["万", "千"];
    public static const SUCCESS_FAILED:Array = ['失败', '成功'];
    public static const FRIEND_INFO_MENU:Array = ['私聊', '斗剑', '赠花', '许愿树', '对酒', '结拜'];

    public static const NAME_OF_CLAN:Array = ['无图腾', '辉煌之翼', "凌云圣翼", "腾云驾雾", "玄天仙藤", "爱神闪蝶", "破天一剑", "龙腾盛世", "霹雳雷霆", "死亡之美", "傲视苍穹", "绿野仙踪", "龙腾天下", "百战天虫", "牛头的舞蹈", "紫陌红尘", "如来神掌", "只手遮天", "腾空万里", "紫金铃铛", "恶魔羽翼", "剑起云深", "九锡禅杖", "金猴嬉戏", "蓝色妖姬", "传龟袭紫", "粽传心意", "金色海浪", "中原霸主", "花好月圆", "云中白鹤", "瑞雪纷飞", "荆棘之冠", "金鸡报晓", "大吉大利", "庄周梦蝶", "蔷薇妖娆", "蜀山剑尊", "修仙狂魔", "星际传说"];

    public static const FLOATNUM:Array = ["白皮", "1點半", "2點半", "3點半", "4點半", "5點半", "6點半", "7點半", "8點半", "9點半"];
    public static const INTEGERNUM:Array = ["鱉十", "1點", "2點", "3點", "4點", "5點", "6點", "7點", "8點", "9點"];
    public static const HEROPOWER_DETAIL:Array = ["散仙属性","穿戴装备","增益心法","技能加成","阵法加成","帮派加成"]
    public static var SPECIAL_NUM:Array = ["一", "二", "三", "四", "五", "六", "七", "八", "九", "十", "十一", "十二", "十三", "十四", "十五", "十六", "十七", "十八", "十九", "二十", "二十一", "二十二", "二十三", "二十四", "二十五", "二十六", "二十七", "二十八", "二十九", "三十"];

}
}
