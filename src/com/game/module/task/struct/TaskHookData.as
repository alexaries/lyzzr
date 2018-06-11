/**
 * Created by dingcj on 2017/9/27.
 */
package com.game.module.task.struct {
import com.game.module.daily.vo.DailyVo;
import com.game.module.noviceVip.proxy.NoviceVIPProxy;
import com.game.module.pack.proxy.PackProxy;
import com.game.module.pack.util.PackUtil;
import com.game.module.pack.vo.PackVO;
import com.game.module.user.vo.StatesVO;
import com.game.utils.FilterUtil;
import com.game.vo.UserData;

import config.ConfigManager;
import config.mission.daily.IDaily_root_act1_item;

import lang.LangTxt;

import net.consts.StaticConfig;

import utils.HtmlUtil;

import utils.StringUtil;

public class TaskHookData {
    public var time:uint = 0;
    public var addType:uint = 0;
    public var max:uint = 0;

    public var noviceVIPProxy:NoviceVIPProxy;
    public var userData:UserData;
    public var dailyVo:DailyVo;
    public var packProxy:PackProxy;

    public function get cbbDB():Array {
        var arr:Array = [];
        arr = LangTxt.HOOK_ADD_STR.split(",");
        if (can9360) {
            arr.push(LangTxt.HOOK_ADD_STR1);
        }
        return arr;
    }

    public function get exp():Number {
        if (dailyVo == null)return 0;
        return dailyVo.exp * 60;
    }

    public function get expEx():Number {
        var lv:int = userData.userVO.level;
        var n:Number = 0;
        switch (addType) {
            case 1:
                n = exp * 0.2;
                break;
            case 2:
                n = exp * 0.5;
                break;
            case 3:
                n = exp * 0.8;
                break;
        }

        //如果是新手御剑，再加上百分之100的加成
//        if (noviceVIPProxy.canAddExp) {
//            n += exp * 1;
//        }
        if (StaticConfig.isReturnServer && lv < 70) {
            n = n * 2;
        }
        //如果有青木之佑
        if (stateVoClanTreeQuality1[0]) {
            n += exp * 0.2;
        }
        if (stateVoClanTreeQuality1[1]) {
            n += exp * 0.1
        }
        if (stateVoClanTreeQuality1[2]) {
            n += exp * 0.2
        }

        //加上机关库
        if (userData.gearHookAdd > 0)
            n += exp * userData.gearHookAdd / 100;

        n = Math.floor(n);
        return n;
    }

    public function get hour():uint {
        var n:int = Math.floor(time / 3600);
        return n;
    }

    public function get max_hour():uint {
        var n:int = 0;
        switch (addType) {
            case 1:
                if (stateVo5 && stateVo5.remain > 0) {
                    n = Math.floor(stateVo5.remain / 3600)
                }
                break;
            case 2:
                if (stateVo6 && stateVo6.remain > 0) {
                    n = Math.floor(stateVo6.remain / 3600)
                }
                break;
            case 3:
                if (stateVo9360 && stateVo9360.remain > 0) {
                    n = Math.floor(stateVo9360.remain / 3600)
                }
                break;
        }
        return 999 - n;
    }

    public function get hour1():uint {
        var n:int = 1;
        switch (addType) {
            case 1:
                n = add55n;
                break;
            case 2:
                n = add56n;
                break;
            case 3:
                n = add9360n;
                break;
        }
        if (n > max_hour) {
            n = max_hour;
        }
        return n;
    }

    public function get add55():PackVO {
        var pv:PackVO = packProxy.packDic.get(55);
        return pv;
    }

    public function get add56():PackVO {
        var pv:PackVO = packProxy.packDic.get(56);
        return pv;
    }

    public function get add9360():PackVO {
        var pv:PackVO = packProxy.packDic.get(9360);
        return pv;
    }

    public function checkAdd56(n:uint):Boolean {
        var pv:PackVO = add56;
        return pv && pv.totalNum >= n;
    }

    public function checkAdd55(n:uint):Boolean {
        var pv:PackVO = add55;
        return pv && pv.totalNum >= n;
    }

    public function checkAdd9360(n:uint):Boolean {
        var pv:PackVO = add9360;
        return pv && pv.totalNum >= n;
    }

    public function get tip0():String {
        //var str:String = StringUtil.substitute(LangTxt.HOOK_TIP0);
        var str = LangTxt.HOOK_TIP0;
        return str;
    }

    public function get tip1():String {
        //var str:String = StringUtil.substitute(LangTxt.HOOK_TIP1);
        var str = LangTxt.HOOK_TIP1;
        return str;
    }

    public function get stateVo6():StatesVO {
        var list:Array = userData.userVO.buffList;
        var svo:StatesVO;
        var result:StatesVO;
        //list = BufferView.statesArr;
        for (var i:uint = 0; i < list.length; i++) {
            svo = list[i] as StatesVO;
            if (svo.id == 6) {
                result = svo;
                break;
            }
        }
        return result;
    }

    public function get stateVo5():StatesVO {
        var list:Array = userData.userVO.buffList;
        var svo:StatesVO;
        var result:StatesVO;
        //list = BufferView.statesArr;
        for (var i:uint = 0; i < list.length; i++) {
            svo = list[i] as StatesVO;
            if (svo.id == 5) {
                result = svo;
                break;
            }
        }
        return result;
    }

    public function get stateVo9360():StatesVO {
        var list:Array = userData.userVO.buffList;
        var svo:StatesVO;
        var result:StatesVO;
        //list = BufferView.statesArr;
        for (var i:uint = 0; i < list.length; i++) {
            svo = list[i] as StatesVO;
            if (svo.id == 10) {
                result = svo;
                break;
            }
        }
        return result;
    }

    /**
     *青木护佑 加成
     * @return
     *
     */
    public function get stateVoClanTreeQuality1():Vector.<Boolean> {
        var list:Array = userData.userVO.buffList;
        var svo:StatesVO;
        var result:StatesVO;
        //list = BufferView.statesArr;
        var arr:Vector.<Boolean> = new <Boolean>[false, false, false]
        for (var i:uint = 0; i < list.length; i++) {
            svo = list[i] as StatesVO;
            if (svo.id == 96) {
                //result = svo;
                arr[0] = true;
            }
            if (svo.id == 97) {
                arr[1] = true
            }
            if (svo.id == 98) {
                arr[2] = true
            }
        }
        return arr;
    }

    public function get can9360():Boolean {
        var flag:Boolean = false;
        flag = (add9360 || (stateVo9360 && stateVo9360.remain > 0));
        return flag;
    }

    public function get autoState():Boolean {
        var flag:Boolean = false;
        if (addType == 3 && !can9360) {
            flag = true;
        }
        return flag;
    }

    public function get stateStr():String {
        var T:String = "<font color='#{1}' size='12'>{0}</font>";
        var colors:Array = ["ffff00", "ff0000"];
        var str:String = StringUtil.substitute(T, [0, colors[0]]);
        switch (addType) {
            case 0:
                str = StringUtil.substitute(T, [LangTxt.HOOK_NULL, colors[0]]);
                break;
            case 1:
                if (stateVo5 && stateVo5.remain > 0) {
                    str = StringUtil.substitute(T, [stateVo5.remain, colors[1]]);
                } else {
                    str = StringUtil.substitute(T, [0, colors[0]]);
                }
                break;
            case 2:
                if (stateVo6 && stateVo6.remain > 0) {
                    str = StringUtil.substitute(T, [stateVo6.remain, colors[1]]);
                } else {
                    str = StringUtil.substitute(T, [0, colors[0]]);
                }
                break;
            case 3:
                if (stateVo9360 && stateVo9360.remain > 0) {
                    str = StringUtil.substitute(T, [stateVo9360.remain, colors[1]]);
                } else {
                    str = StringUtil.substitute(T, [0, colors[0]]);
                }
                break;
        }
        return str;
    }

    public function get stateTime():int {
        var ss:int = 0;
        switch (addType) {
            case 0:
                ss = 0;
                break;
            case 1:
                if (stateVo5 && stateVo5.remain > 0) ss = stateVo5.remain;
                else ss = 0;
                break;
            case 2:
                if (stateVo6 && stateVo6.remain > 0) ss = stateVo6.remain;
                else ss = 0;
                break;
            case 3:
                if (stateVo9360 && stateVo9360.remain > 0) ss = stateVo9360.remain;
                else ss = 0;
                break;
        }
        return ss;
    }

    public function get actList():Array {
        var result:Array = [];
        var status:Array = dailyVo.stateList;
        var index:uint = status.indexOf(1);
        for (var i:uint = 0; i < ConfigManager.instance.mission_daily.root.act1.item.length; i++) {
            var item:IDaily_root_act1_item = ConfigManager.instance.mission_daily.root.act1.item[i];
            if (item.index == index) {
                result.unshift(item);
            } else {
                result.push(item);
            }
        }
        return result;
    }

    public function get timeTip0():String {
        var str:String = LangTxt.HOOK_TIME0_TIP0;
        return str;
    }

    public function get timeTip1():String {
        var str:String = "";
        if (userData.viplevel < 4) {
            str = LangTxt.HOOK_TIME1_TIP0;
        } else if (userData.viplevel < 8) {
            str = LangTxt.HOOK_TIME1_TIP1;
        }
        return str;
    }

    public function get timeTip2():String {
        var str:String = "";
        if (userData.viplevel < 1) {
            str = LangTxt.HOOK_TIME2_TIP0;
        } else if (userData.viplevel < 4) {
            str = LangTxt.HOOK_TIME2_TIP1;
        }
        return str;
    }

    public function get time1AddVisible():Boolean {
        var flag:Boolean = true;
        if (userData.viplevel >= 8) {
            flag = false;
        }
        return flag;
    }

    public function get time2AddVisible():Boolean {
        var flag:Boolean = true;
        if (userData.viplevel >= 4) {
            flag = false;
        }
        return flag;
    }

    public function get add55n():uint {
        var n:uint = 0;
        if (add55) {
            n = add55.totalNum;
        }
        return n;
    }

    public function get add56n():uint {
        var n:uint = 0;
        if (add56) {
            n = add56.totalNum;
        }
        return n;
    }

    public function get add9360n():uint {
        var n:uint = 0;
        if (add9360) {
            n = add9360.totalNum;
        }
        return n;
    }

    public function get goods():Array {
        var arr:Array;
        switch (addType) {
            case 0:
                arr = [55, 0, false];
                break;
            case 1:
                arr = [55, add55n, true];
                break;
            case 2:
                arr = [56, add56n, true];
                break;
            case 3:
                arr = [9360, add9360n, true];
                break;
        }
        return arr;
    }

    public function get goodsFilter():Array {
        var arr:Array;
        switch (addType) {
            case 1:
            case 2:
            case 3:
                arr = [];
                break;
            default:
                arr = FilterUtil.grayColorFilters;
                break;
        }
        return arr;
    }

    public function get btnAddToolTip():String {
        var str:String = "剩余加速次数:{0}，可通过提升vip等级增加加速次数。";
        str = StringUtil.substitute(str, [max]);
        return str;
    }

    public function get expExHTML():String {
        var str:String = "";
        if (expEx > 0) {
            //str = StringUtil.substitute("<font color='#00ff00'>+{0}</font>", [expEx]);
            str = "+" + expEx;
        }
        return str;
    }

    public function get tfv3HTML():String {
        var arr:Array = [];
//        var str:String = "";
//        arr.push(expHTML);
//        arr.push(expExHTML);
//        str = StringUtil.substitute(LangTxt.HOOK_LABEL3, [arr.join("")]);
        return (HtmlUtil.fontSize("当前挂机速度:" + exp, 48) + HtmlUtil.fontSizeAndColor(expExHTML + "", "#00ff00", 48) + HtmlUtil.fontSize("经验/分钟", 48));
//        return str;
    }


    public function get showTip():Boolean {
        var flag:Boolean = false;
        if (!noviceVIPProxy.isOpenVIP) {
            if (noviceVIPProxy.isOverSevenDay) {
            } else {
                flag = true;
            }
        } else {
            if (noviceVIPProxy.leftTime == 0) {
            } else {
                flag = true;
            }
        }
        return flag;
    }
}
}
