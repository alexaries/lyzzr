package utils {
import com.game.module.map.proxy.MapService;

import net.consts.StaticConfig;
import net.utils.ColorUtil;

import org.puremvc.as3.patterns.facade.Facade;

public class HtmlUtil {
    // public static const COLOR_REGEXP:RegExp = /\[([.\S\s]+?)\]/g;
    // public static const COLOR_REGEXP:RegExp = /\[([\S\s^\[\]]+?)\]/g;
    public static const COLOR_REGEXP:RegExp = /\[([^\[\]]+?)\]/g;
    public static var setLink:Boolean = false;
    public static var txtNormalColor:String = "";
    public static var currReplaceNum:uint = 0;
    public static var totalReplaceNum:uint = 0;

    public function HtmlUtil() {
    }


    // -----------------------------------------华丽的分隔线
    public static function color(content:String, theColor:String = "#ffffff"):String {
        return "<span style='color:" + theColor + ";font-size:" + CSSStyleCfg.defaultFontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + content + "</span>";
    }

    public static function fontSizeAndColor(content:String, theColor:String, fontSize:int):String {
        return "<span style='color:" + theColor + ";font-size:" + fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + content + "</span>";
    }

    public static function colorAlign(content:String, theColor:String = "#ffffff", align:String = "left"):String {
        return "<span style='color:" + theColor + ";font-size:" + CSSStyleCfg.defaultFontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + ";text-align:" + align + "'>" + content + "</span>";

    }

    public static function fontSize(content:String, fontSize:int):String {
        return "<span style='color:" + CSSStyleCfg.defaultFontColor1 + ";font-size:" + fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + content + "</span>";
    }

    public static function p(content:String, align:String = "left"):String {
        return "<p align=\"" + align + "\">" + content + "</p>";
    }

    public static function u(content:String):String {
        return "<u>" + content + "</u>";
    }

    public static function customColor(content:String, theColor:String):String {
        return "&" + theColor + "&" + content;
    }

    public static function bold(content:String):String {
        return "<b>" + content + "</b>";
    }

    public static function autoBr(content:String, length:int = 15):String {
        return content;
    }

    public static function removeHtml(content:String):String {
        var result:String = content.replace(/\<\/?[^\<\>]+\>/gmi, "");
        result = result.replace(/[\r\n ]+/g, "");
        return result;
    }

    public static function nameHtml(content:String):String {
        var result:String = content.replace(/\</gmi, "&lt;");
        result = result.replace(/\>/gmi, "&gt;");
        return result;
    }

    public static function chatHtml(content:String):String {
        var result:String = content.replace(/&lt;/gmi, "<");
        result = result.replace(/&gt;/gmi, ">");
        return result;
    }

    /**
     * 合服，用来区别名将的名字 的方法
     * */
    public static function replaceHeroName(heroName:String):String {
        var num:int = 0;
        var serverId:int;
        var index:int = heroName.length - 1;
        if (index > 0) {
            serverId = heroName.charCodeAt(index);
            if (serverId < 32 && serverId > 0) {
                num = (num * 31 + serverId - 1);
                index--;
            } else {
                return heroName;
            }
            while (index > 0) {
                serverId = heroName.charCodeAt(index);
                if (serverId < 32 && serverId > 0) {
                    num = (num * 31 + serverId - 1);
                    index--;
                } else
                    break;
            }
            num++;
            if (num != Number(StaticConfig.serverId))
                return heroName.substr(0, index + 1) + ".S" + num.toString();
            else
                return heroName.substr(0, index + 1);
        }
        return heroName;
    }

    public static function addEventParameter(str:String, parameter:String):String {
        return "<a href=\"event:" + parameter + "\">" + str + "</a>";
    }

    public static function getSenderName(text:String):String {
        var pattern:RegExp = /\[([^\[\]]+?)\]/;
        var obj:Object = pattern.exec(text);
        if (obj && obj[1]) {
            var str:String = obj[1];
            var array:Array = str.split(":");
            return array[2];
        }
        return "";
    }

    public static function shiftColorText(text:String, link:Boolean = false, withColor:Boolean = false, fontSize:int = 32):String {
        setLink = link;
        var str:String;
        if (withColor) {
            if (text.indexOf("[") != -1 && text.indexOf("]") != -1) {
                var first:String = text.substr(7, text.indexOf("[") - 7)
                var rStr:String = text.substr(text.indexOf("["), text.indexOf("]") - text.indexOf("[") + 1);
                var left:String = text.substr(text.indexOf("]") + 1, text.length)
                str = "<span style='color:" + text.substr(0, 7) + ";font-size:" + fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + first + "</span>";
                str += rStr.replace(COLOR_REGEXP, replaceStr);
                str += "<span style='color:" + text.substr(0, 7) + ";font-size:" + fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + left + "</span>";
            } else {
                str = "<span style='color:" + text.substr(0, 7) + ";font-size:" + fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + text.substr(7, text.length).replace(COLOR_REGEXP, replaceStr) + "</span>";
            }

        } else {
            str = text.replace(COLOR_REGEXP, replaceStr);
        }
        return str;
    }

    private static function replaceStr():String {
        return "";
    }

    public static function shiftColorTxtStr(str:String, color:int):String {
        currReplaceNum = 0;
        totalReplaceNum = 1;
        var result:Object = COLOR_REGEXP.exec(str);
        while (result != null) {
            result = COLOR_REGEXP.exec(str);
            totalReplaceNum++;
        }
        txtNormalColor = ColorUtil.CHAT_COLOR_1[color];
        if (str.substr(0, 1) != "[")
            str = "&" + txtNormalColor + "&" + str;
        var tmpStr:String = str.replace(COLOR_REGEXP, replaceColorStr);
        //todo

        // if (tmpStr.substr(tmpStr.length - 1, 1) == "&" && ("#" + tmpStr.substr(tmpStr.length - 7, 6)) >= 0)
        if (tmpStr.substr(tmpStr.length - 1, 1) == "&" && ("#" + tmpStr.substr(tmpStr.length - 7, 6)))
            tmpStr = tmpStr.substr(0, tmpStr.length - 9);
        // 切掉后面多算的一个
        return tmpStr;
    }

    public static function replaceColorStr():String {
        return "";
    }

    public static function  get mapService():MapService {
        return Facade.getInstance().retrieveProxy(MapService.NAME) as MapService;
    }
}
}