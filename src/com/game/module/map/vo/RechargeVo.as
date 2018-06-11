package com.game.module.map.vo {
import com.game.consts.URLConfig;

import lang.LangTxt;

import net.consts.StaticConfig;

import utils.CSSStyleCfg;
import utils.HtmlUtil;
import utils.StringUtil;

/**
 * @author john
 */
public class RechargeVo {
    public static var TIP_STR:String = LangTxt.VIP_LAB3;
    public static var TYPE_STR:Array = [LangTxt.VIP_LAB4, LangTxt.VIP_LAB5];
    public static var DISCOUNT_STR:String = HtmlUtil.fontSizeAndColor(LangTxt.VIP_LAB6, '#FEFFAF', CSSStyleCfg.defaultFontSize);
    public static var DISCOUNT_TYPES:Array = [LangTxt.YELLOW_QQ, LangTxt.BLUE_QQ];
    public static var URLACT_LIST:Array = [];
    public var count:uint = 100;

    /**
     * 平台特权标志<br>
     * 0 - 黄<br>
     * 1 - 蓝<br>
     * 2 - 3366<br>
     * 3 - 官网<br>
     * 4 - FaceBook
     */
    public function get plat():uint {
        var n:uint = StaticConfig.platflag;
        return n;
    }

    public function get type():uint {
        var n:uint = 0;
        switch (plat) {
            case 4:
                n = 1;
                break;
            default:
                n = 0;
                break;
        }
        return n;
    }

    public function get discount_type():uint {
        var n:uint = 10000;
        switch (StaticConfig.platflag) {
            case 0:
                n = 0;
                break;
            case 1:
                n = 1;
                break;
            case 2:
                n = 1;
                break;
        }
        return n;
    }

    public function get price():uint {
        var n:uint = 0;
        switch (plat) {
            case 4:
                n = 2;
                break;
            default:
                n = 10;
                break;
        }
        return n;
    }

    public function get stone():uint {
        var n:uint = 10;
        return n;
    }

    public function get countPay():uint {
        return count * price;
    }

    public function get countGet():uint {
        return count * stone;
    }

    public function get tip():String {
        var str:String = StringUtil.substitute(TIP_STR, [TYPE_STR[type], countPay, countGet]);
        return str;
    }

    public function get discountPay():uint {
        return countPay * 0.8;
    }

    public function get discountUrl():String {
        var str:String = "";
        switch (discount_type) {
            case 0:
                str = URLConfig.openGoldurl;
                break;
            case 1:
                str = URLConfig.openBlueurl;
                break;
            default:
        }
        return str;
    }

    public function get discountTip():String {
        var str:String = StringUtil.substitute(DISCOUNT_STR, [DISCOUNT_TYPES[discount_type], discountPay, discountUrl]);
        return str;
    }
}
}
