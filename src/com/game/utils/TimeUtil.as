/**
 * Created by dingcj on 2017/8/22.
 */
package com.game.utils {
public class TimeUtil {

    //00:00:00
    public static function toTime(ss):String {
        var h:int = Math.floor(ss / 3600);
        var m:int = Math.floor((ss % 3600) / 60);
        var s:int = Math.floor(ss % 60);
        return (h > 9 ? String(h) : "0" + h) + ":" + (m > 9 ? String(m) : "0" + m) + ":" + (s > 9 ? String(s) : "0" + s);
    }

    //天00:00:00
    public static function toDate(ss):String {
        var d:int = Math.floor(ss / (3600 * 24));
        var h:int = Math.floor((ss % (3600 * 24)) / 3600);
        var m:int = Math.floor((ss % 3600) / 60);
        var s:int = Math.floor((ss % 60));
        var str:String = "";
        if (d > 0) {
            str = d + "天";
        }
        return str + (h > 9 ? String(h) : "0" + h) + ":" + (m > 9 ? String(m) : "0" + m) + ":" + (s > 9 ? String(s) : "0" + s);
    }

    //00:00
    public static function toTime2(ss):String {
        var m:int = Math.floor((ss % 3600) / 60);
        var s:int = Math.floor(ss % 60);
        return (m > 9 ? String(m) : "0" + m) + ":" + (s > 9 ? String(s) : "0" + s);
    }

    //like:2017-00-00 00:00:00
    public static function toDateYMDHMS(msec:Number):String {
        var dt:Date = new Date(msec);
        return dt.getFullYear() + "-" + (dt.getMonth() + 1) + "-" + dt.getDate() + " " + dt.getHours() + ":" + dt.getMinutes() + ":" + dt.getSeconds();
    }

    //like:2017.01.01
    public static function toDateYMD(msec:Number):String {
        var dt:Date = new Date(msec);
        return dt.getFullYear() + "." + (dt.getMonth() + 1) + "." + dt.getDate();
    }
}
}
