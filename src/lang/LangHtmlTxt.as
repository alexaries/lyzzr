package lang {

import utils.CSSStyleCfg;
import utils.HtmlUtil;

/**
 * @author caoqingshan
 */
public class LangHtmlTxt {
    public static var TEMP_MAIN_DESC:String = "<span style='color:#ffd542;font-size:" + CSSStyleCfg.FontSize_1 + "'>" + LangTxt.TASK_VIEW_27 + ":</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span  style='font-size:" + CSSStyleCfg.defaultFontSize + "'>{0}</span>";
    public static var TEMP_MAIN_FLOW:String = "<span style='color:#ffd542;font-size:" + CSSStyleCfg.FontSize_1 + "'>" + LangTxt.TASK_VIEW_28 + ":</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span  style='font-size:" + CSSStyleCfg.defaultFontSize + "'>" + LangTxt.TASK_VIEW_34 + ":</span>&nbsp;<span style='font-size:" + CSSStyleCfg.defaultFontSize + "'>{0}</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span style='font-size:" + CSSStyleCfg.defaultFontSize + "'>" + LangTxt.TASK_VIEW_38 + ":</span>&nbsp;<span style='font-size:" + CSSStyleCfg.defaultFontSize + "'>{1}</span><br/><span style='font-size:" + CSSStyleCfg.defaultFontSize + "'>{2}</span>";
    public static var TEMP_MAIN_AWARD:String = "<span style='color:#ffd542;font-size:" + CSSStyleCfg.defaultFontSize + "'>" + LangTxt.TASK_VIEW_29 + ":</span><br/>&nbsp;&nbsp;&nbsp;&nbsp;<span style='font-size:" + CSSStyleCfg.defaultFontSize + "'>{0}</span>";
    public static var TEMP_MAIN_AWARD_ITEM:String = "<span style='color:#869bc5;font-size:" + CSSStyleCfg.defaultFontSize + "'>{0}:</span><span style='color:#feffec;font-size:" + CSSStyleCfg.defaultFontSize + "'>{1}</span>&nbsp;&nbsp;&nbsp;&nbsp;";
    public static var ACTIVITY_61_VIEW_5:String = HtmlUtil.color(LangTxt.ACTIVETIME_GET_ALREADY, '#cccccc');
    public static var ACTIVITY_61_VIEW_6:String = "{0}<br/>" + HtmlUtil.color(LangTxt.ACTIVITY_PACK_CONTECT + "：", '#6BFFFF') + "<br/><span style='font-size:" + CSSStyleCfg.defaultFontSize + "'>{1}</span>";
    public static var ClanActionview_fightDes:String = HtmlUtil.color("帮派战报名规则", "#FFFF00") + "\n" + "帮派战于20:00:00开始报名" + "\n" +
            "报名人数大于等于5人时，则帮派自动参加帮战" + "\n" +
            "报名人数不足5人的帮派则不能参加帮派战" + "\n";
    public static var ITEM_TIP:String = "<span style='color:#22dd22;font-size:" + CSSStyleCfg.defaultFontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>{0}</span>" + "<br/>" + "<span style='color:#ffffff;font-size:" + CSSStyleCfg.defaultFontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>{1}</span>";

    public static var ARENA_FIGHT_WIN_TIP:String = "您&nbsp;战胜了&nbsp;{0}";
    public static var ARENA_FIGHT_LOSE_TIP:String = "{0}&nbsp;战胜了&nbsp;您";
}
}
