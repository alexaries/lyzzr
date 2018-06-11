/**
 * Created by guanll on 2018/4/11.
 */
package com.game.common.vo {
import com.preset.login.vo.Server;

import laya.utils.Browser;

import net.consts.StaticConfig;

public class AcConfigRequest {
    private static var instance:AcConfigRequest;
    public static function getInstance():AcConfigRequest {
        if (instance == null) instance = new AcConfigRequest( );
        return instance;
    }

    public var config:*;
    public function AcConfigRequest(){
    }

    public function requestAcConfigByJsonP():void {
        var host:String = "ssh5.list.kingnet.com";
        if (StaticConfig.PROTOCOL == "https://") {
            host = "ssh5-list.kingnet.com";
        }

        //http://ssh5.list.kingnet.com/new/shushan/app/getConfig.php?sid=1
        var id:String = "789";
        if(Server.currServerVo){
            id = Server.currServerVo.serverId;
        }
        var url:String = StaticConfig.PROTOCOL + host + "/new/shushan/app/getConfig.php?sid=" + id;
        var script:* = Browser.createElement("script");
        script.id = "acConfig";
        script.src = url;
        Browser.document.body.appendChild(script);
        trace("开始拉取活动配置", url);
    }

    public function onJsonPComplete(data:*):void {
        var s = Browser.getElementById("acConfig");
        if (s) {
            Browser.document.body.removeChild(s);
        }

        config = data;
        trace(config);
    }

    public function checkActivity(id:int):Boolean{
        var ac:Object;
        var isShow:Boolean = false;
        switch(id){
            case 1:
                //微信关注有礼
                ac = getActivityConfig(1);
                if(ac && isInTime(ac.time)){
                    isShow = true;
                }
                break;
        }

        return isShow;
    }

    public function getActivityConfig(id:int):Object{
        if(!config || !config.activities){
            return null;
        }
        var conf:Object;
        for each(var ac:Object in config.activities){
            /*"id":"1",
              "time":"2018.4.11 10:00~2018.5.19 20:00",
              "title":"关注有礼",
              "type":"1",*/
            if(parseInt(ac.id) == id){
                conf = ac;
                break;
            }
        }

        return conf;
    }

    public function isInTime(limit:String):Boolean {
        var region:Array = limit.split("~");
        var start:String = region[0];
        var end:String = region[1];

        var arr1:Array = start.split(" ");
        var arr11:Array = arr1[0].split(".");
        var arr12:Array = arr1[1].split(":");
        var startY:int = parseInt(arr11[0]);
        var startMO:int = parseInt(arr11[1])-1;
        var startD:int = parseInt(arr11[2]);
        var startH:int = parseInt(arr12[0]);
        var startM:int = parseInt(arr12[1]);

        var arr2:Array = end.split(" ");
        var arr21:Array = arr2[0].split(".");
        var arr22:Array = arr2[1].split(":");
        var endY:int = parseInt(arr21[0]);
        var endMO:int = parseInt(arr21[1])-1;
        var endD:int = parseInt(arr21[2]);
        var endH:int = parseInt(arr22[0]);
        var endM:int = parseInt(arr22[1]);

        var nowDate:Date = new Date();
        var startDate:Date = new Date();
        startDate.setFullYear(startY);
        startDate.setMonth(startMO);
        startDate.setDate(startD);
        startDate.setHours(startH);
        startDate.setMinutes(startM);
        var endDate:Date = new Date();
        endDate.setFullYear(endY);
        endDate.setMonth(endMO);
        endDate.setDate(endD);
        endDate.setHours(endH);
        endDate.setMinutes(endM);
        var now:Number = nowDate.getTime();
        var __start:Number = startDate.getTime();
        var __end:Number = endDate.getTime();
        return __start <= now && now < __end;
    }
}
}
