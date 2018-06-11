/**
 * Created by dingcj on 2017/11/1.
 */
package com.preset.login.vo {
import globals.PlatformSDK;

import net.consts.StaticConfig;

public class Server {
    public static var userId:String = "1";
    public static var currServerVo:ServerVo;
    public static var lastLoginServerVo:ServerHistroyLoginVo;
    public static var serverList:Array = [];//ServerVo
    public static var serverLoginList:Array = [];//ServerVo
    public static var serverRecommendList:Array = [];//ServerVo
    public static var serverHistroyLoginList:Array = [];//ServerHistroyLoginVo

    public static var channelId:String = "2";
    public static var version:Number = 1;

    public function Server() {
    }

    public static function Pasre(json:Object):void {
        currServerVo = null;
        lastLoginServerVo = null;
        serverList = [];
        serverLoginList = [];

        serverRecommendList = [];
        serverHistroyLoginList = [];
        if (json == null)return;

        //server_list
        var serverLst:Array = json["server_list"];
        if (serverLst != null && serverLst.length > 0) {
            for (var i = 0; i < serverLst.length; i++) {
                var vo:ServerVo = ServerVo.Create(serverLst[i]);
                if (vo.serverStatus != "1") {
                    if (vo.serverType == "1") {
                        serverList.push(vo);
                    }
                    else if (vo.serverType == "2") {
                        //if (VersionNo.ProtocolVersionNo == int.Parse(vo.serverVersion))
                        if (parseInt(vo.serverVersion) == 1) {
                            serverList.push(vo);
                        }
                    }
                    if (vo.isNew || vo.isRecommend) {
                        serverRecommendList.push(vo);
                    }
                }
            }

            SortList();
        }
        //server_login
        var loginLst:Array = json["server_login"];
        if (loginLst != null && loginLst.length > 0) {
            for (var i = 0; i < loginLst.length; i++) {
                var _vo:ServerHistroyLoginVo = ServerHistroyLoginVo.Create(loginLst[i]);
                serverHistroyLoginList.push(_vo);
                var serverVo:ServerVo = GetServerVo(serverHistroyLoginList[i].serverId);
                if (serverVo != null) {
                    serverLoginList.push(serverVo);
//                    if (!serverRecommendList.indexOf(serverVo)) {
//                        serverRecommendList.push(serverVo);
//                    }
                }
            }
            SortLoginList();
        }

        SortRecommendList();

        if (serverHistroyLoginList.length > 0) {
            currServerVo = GetServerVo(serverHistroyLoginList[0].serverId);
            lastLoginServerVo = serverHistroyLoginList[0];
        }
//        if (currServerVo == null) {
//            currServerVo = serverRecommendList.length > 0 ? serverRecommendList[serverRecommendList.length - 1] : serverList[0];
//        }

//        if(StaticConfig.platform == PlatformSDK.QZONE || StaticConfig.platform == PlatformSDK.QZONE_IOS){
//            serverList.push(ServerVo.CreateTestServer3());
//        }else if(StaticConfig.platform == PlatformSDK.AWY){
//            serverList.push(ServerVo.CreateTestServer1());
//            serverList.push(ServerVo.CreateTestServer2());
//        }
    }

    private static function SortList():void {
        for (var i = 0; i < serverList.length - 1; i++) {
            for (var j = i + 1; j < serverList.length; j++) {
                if (serverList[j].serverPort > serverList[i].serverSort) {
                    var vo:ServerVo = serverList[i];
                    serverList[i] = serverList[j];
                    serverList[j] = vo;
                }
            }
        }
    }

    private static function SortLoginList():void {
        for (var i = 0; i < serverHistroyLoginList.length - 1; i++) {
            for (var j = i + 1; j < serverHistroyLoginList.length; j++) {
                if (serverHistroyLoginList[j].time > serverHistroyLoginList[i].time) {
                    var vo:ServerHistroyLoginVo = serverHistroyLoginList[i];
                    serverHistroyLoginList[i] = serverHistroyLoginList[j];
                    serverHistroyLoginList[j] = vo;
                }
            }
        }
    }

    private static function SortRecommendList():void {
        for (var i = 0; i < serverRecommendList.length - 1; i++) {
            for (var j = i + 1; j < serverRecommendList.length; j++) {
                if (serverRecommendList[j].isNew && !serverRecommendList[i].isNew) {
                    var vo:ServerVo = serverRecommendList[i];
                    serverRecommendList[i] = serverRecommendList[j];
                    serverRecommendList[j] = vo;
                }
                else if ((serverRecommendList[j].isNew && serverRecommendList[i].isNew) || (!serverRecommendList[j].isNew && !serverRecommendList[i].isNew)) {
                    if (serverLoginList.indexOf(serverRecommendList[j]) && !serverLoginList.indexOf(serverRecommendList[i])) {
                        var vo:ServerVo = serverRecommendList[i];
                        serverRecommendList[i] = serverRecommendList[j];
                        serverRecommendList[j] = vo;
                    }
                    else if ((serverLoginList.indexOf(serverRecommendList[j]) && serverLoginList.indexOf(serverRecommendList[i])) || (!serverLoginList.indexOf(serverRecommendList[j]) && !serverLoginList.indexOf(serverRecommendList[i]))) {
                        if (serverRecommendList[j].serverSort > serverRecommendList[i].serverPort) {
                            var vo:ServerVo = serverRecommendList[i];
                            serverRecommendList[i] = serverRecommendList[j];
                            serverRecommendList[j] = vo;
                        }
                    }
                }
            }
        }
    }

    public static function GetServerVo(serverId:String):ServerVo {
        for (var i = 0; i < serverList.length; i++) {
            if (serverList[i].serverId == serverId) {
                return serverList[i];
            }
        }
        return null;
    }

    public static function GetLoginServerVo(serverId:String):ServerHistroyLoginVo {
        for (var i = 0; i < serverHistroyLoginList.length; i++) {
            if (serverHistroyLoginList[i].serverId == serverId) {
                return serverHistroyLoginList[i];
            }
        }
        return null;
    }
}
}