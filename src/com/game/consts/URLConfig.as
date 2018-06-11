/**
 * Created by huangcb on 2017/8/21.
 */
package com.game.consts {
import com.game.module.pack.vo.PackVO;

import utils.LunaUtil;

public class URLConfig  {
    public static var skin:int =0 ;
    public static const openGoldurl:String ="openGoldurl" ;
    public static const openBlueurl:String = "openBlueurl";
    public static var BUYU_URL_1:String="String";
    public static var banLevel:uint;
    public static var banExistWords:Array=[];
    public static var banSelectableWords:Array=[];
    public static var rideTime:String = "";
    public static var rideQuality:int;
    public static var popQGameAwardValue:int;
    /**商城打折时间*/
    public static var shopTime:String = "2017.1.27-2017.1.28";
    public static var shopDiscount:Number = 0.6;

    private static var qiangHuaFabaoDate:Vector.<Date>;
    public static var qiangHuaFabaoTime:String = "2015.1.16-2016.1.18";
    public static var qiangHuaFabaoLevel:uint = 12;
    public static var isInQiangHuaTime:Boolean;



    public function URLConfig() {

    }

    public static function get isInQiangHuaFabaoTime():Boolean
    {
//        if(!qiangHuaFabaoDate) qiangHuaFabaoDate = LunaUtil.getTwoDateFromString(URLConfig.qiangHuaFabaoTime);
//        var startTime:uint = qiangHuaFabaoDate[0].time / 1000;
//        var endTime:uint = qiangHuaFabaoDate[1].time / 1000;
//        return startTime < UserData.instance.nowTime && UserData.instance.nowTime < endTime;
        return false;
    }

    //检测法宝是否可以强化
    //判断法宝是否是橙色法宝 || 是仙器
    public static function checkFabaoIsInQiangHuaActivity(vo:PackVO):Boolean
    {
        //仙器
        if(vo.type == 173)
        {
            if(vo.color >= 5)
                return true;
            else
                return false;
        }
        //普通法宝
        else if(vo.type == 10 || vo.type == 12 || vo.type == 16)
        {
            return vo.color >= 5;
        }
        else
            return false;
    }


}
}