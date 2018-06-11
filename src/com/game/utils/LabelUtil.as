/**
 * Created by dingcj on 2017/8/22.
 */
package com.game.utils {
import com.game.module.heroic.vo.HeroVO;

import laya.ui.Label;

import net.consts.StaticConfig;

public class LabelUtil {

    private static var qualityArr:Array = ["普通", "优秀", "超级", "传奇"];
    private static var careerArr:Array = ["天师", "慈航", "剑仙"/*, "墨"*/];
    private static var colorArr:Array = ["green", "blue", "purple", "yellow"];
    // 潜力的数值区间
    private static var POTENTINAL:Array = [0.8, 1, 1.2, 1.4, 2.4, 3.0];

    public static var commonColor:String = "#defafa";
    public static var greenColor:String = "#92ca51";
    public static var blueColor:String = "#4ba1d0";
    public static var purpleColor:String = "#ff4ee4";
    public static var yellowColor:String = "#fff721";
    public static var redColor:String = "#e74f48";
    public static var greyColor:String = "#8d929b";
    public static var whiteColor:String = "#ffffff";

    public static function common(str:String, label:Label):void {
        label.color = "#defafa";
        label.text = str;
    }

    public static function green(str:String, label:Label):void {
        label.color = "#92ca51";
        label.text = str;
    }

    public static function blue(str:String, label:Label):void {
        label.color = "#4ba1d0";
        label.text = str;
    }

    public static function purple(str:String, label:Label):void {
        label.color = "#ff4ee4";
        label.text = str;
    }

    public static function yellow(str:String, label:Label):void {
        label.color = "#fff721";
        label.text = str;
    }

    public static function red(str:String, label:Label):void {
        label.color = "#e74f48";
        label.text = str;
    }

    public static function grey(str:String, label:Label):void {
        label.color = "#8d929b";
        label.text = str;
    }

    public static function white(str:String, label:Label):void {
        label.color = "#ffffff";
        label.text = str;
    }

    public static function color(quality:uint, str:String, label:Label) {
        if (quality == 1)green(str, label);
        else if (quality == 2)blue(str, label);
        else if (quality == 3)purple(str, label);
        else if (quality == 4)yellow(str, label);
        else if (quality == 5)red(str, label);
        else common(str, label);
    }

    public static function occu(career:uint):String {
        return careerArr[career];
    }

    public static function quality(q:uint):String {
        return qualityArr[q - 1];
    }

    public static function getColorByQuality(quality:int):String {
        if (quality == 1)return greenColor;
        else if (quality == 2)return blueColor;
        else if (quality == 3)return purpleColor;
        else if (quality == 4) return yellowColor;
        else if (quality == 5)return redColor;
        return commonColor;
    }

    //主角头像
    public static function playerIcon(careerId:int, sex:int):String {
        var returnstr:String = "";
        var returnPreString:String = "";

        var version:String = "";
        if (StaticConfig.skinVersion > 0) {
            version = "_v" + (StaticConfig.skinVersion + 1);
        }

        returnPreString = StaticConfig.httpServer + "avatars/user/";
        returnstr = returnPreString + (careerId * 2 + sex + 1) + version + ".jpg";
        return returnstr;
    }

    public static function playerIcon2(headId:int):String {
        var version:String = "";
        if (StaticConfig.skinVersion > 0) {
            version = "_v" + (StaticConfig.skinVersion + 1);
        }
        return StaticConfig.httpServer + "avatars/user/" + headId + version + ".jpg";
    }

    //general hero头像
    public static function heroIcon(imgId:int):String {
        var returnstr:String = "";
        var returnPreString:String = "";

        var version:String = "";
        if (StaticConfig.skinVersion > 0) {
            version = "_v" + (StaticConfig.skinVersion + 1);
        }

        returnPreString = StaticConfig.httpServer + "avatars/general/";
        returnstr = returnPreString + toMixString(imgId, 4) + ".jpg";
        return returnstr;
    }

    //头像底
    public static function iconBg(color:int):String {
        color = color == 0 ? 0 : color - 1;
        return "common/surface/frame_" + colorArr[color] + ".png";
    }

    //职业底
    public static function careerBg(color:int):String {
        color = color == 0 ? 0 : color - 1;
        if (color >= 3) {
            return "common/surface/corner_golden_circle.png";
        }
        else {
            return "common/surface/corner_" + colorArr[color] + "_circle.png";
        }
    }

    //职业
    public static function careerIcon(careerId:int, careerUpgrade:Boolean = false):String {
        if (careerId < 8) {
            var fp:int = careerUpgrade ? careerId + 4 : careerId;
            return HeroVO.careersIcon[fp] + ".png";
        }
        return "";
    }

    //monster头像
    public static function npcIcon(imgId:int) {
        return StaticConfig.httpServer + "avatars/npc/" + toMixString(imgId, 4) + ".jpg";
    }

    private static function toMixString(i:int, len:int):String {
        var s:String = i.toString();
        var return_s:String = "";
        for (var j:int = s.length; j < len; j++) {
            return_s += "0";
        }
        return_s += s;
        return return_s;
    }

    public static function getQualityByPotential(_potential:int):int {
        var potential:Number = Math.round(_potential * 100) / 100
        // 散仙的好坏 的划分
        var len:int = POTENTINAL.length;
        var q:int = 1;
        for (var i:int = 0; i < len; i++) {
            if (potential < POTENTINAL[i]) {
                return i + 1;
            }
        }
        return q;
    }

    //加载npc 职业 性别 id
//    var resID:String = FfUtil.toResId(0, 0, bossId);
//    var body:MovieClip = new MovieClip();
//    body.loadAtlas(StaticConfig.fightAvatarsUrl, resID, true);
//    body.gotoAndPlay(FfClipName.stand + "z", true);
//    addChild(body);
//
//    body.pos(320, 530);
//    body.size(400, 400);

    public static function subString(msg:String):String {
        var arr = msg.match(/&(\S*)&/);
        return arr[1];
    }
}
}
