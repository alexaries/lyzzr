/**
 * Created by dingcj on 2017/11/1.
 */
package com.preset.login.vo {
public class ServerVo {
    public var serverId:String; //服务器id
    public var serverNumber:String; //服务器区号
    public var serverName:String;//服务器名称
    public var serverHost:String;//服务器域名
    public var serverPort:int;//服务器端口
    public var serverStatus:String;//服务器状态 1 未开启 2 流畅 3 维护 4 繁忙 5 爆满
    public var serverType:String;// 1 外网 2 内网
    public var serverSort:int; //排序值
    public var isNew:Boolean; //0 fou 1 shi
    public var isRecommend:Boolean; //0 fou 1 shi
    public var serverVersion:String;//服务器版本

    public static function Create(o:Object):ServerVo {
        var vo:ServerVo = new ServerVo();
        var json:Object = o;
        vo.serverId = json["server_id"];
        vo.serverNumber = json["server_number"];
        vo.serverName = json["server_name"];
        vo.serverHost = json["server_host"];
        vo.serverPort = parseInt(json["server_port"]);
        vo.serverStatus = json["server_status"];
        vo.serverType = json["server_type"];
        vo.serverSort = parseInt(json["server_sort"]);
        vo.isNew = parseInt(json["is_new"]) == 1;
        vo.isRecommend = parseInt(json["is_recommend"]) == 1;
        vo.serverVersion = json["server_version"];
        return vo;
    }

//    192.168.75.108:5601,192.168.72.61:5601,ssh5-tcp.gm.kingnet.com:5601,192.168.72.61:5602
    public static function CreateTestServer1():ServerVo{
        var vo:ServerVo = new ServerVo();
        vo.serverId = "108";
        vo.serverNumber = "内网测试";
        vo.serverName = "张光彩";
        vo.serverHost = "192.168.75.108";
        vo.serverPort = 5601;
        vo.serverStatus = "2";
        vo.serverType = "2";
        vo.serverSort = 108;
        vo.isNew = 0;
        vo.isRecommend = 1;
        vo.serverVersion = "11111";
        return vo;
    }

    public static function CreateTestServer2():ServerVo{
        var vo:ServerVo = new ServerVo();
        vo.serverId = "61";
        vo.serverNumber = "内网测试";
        vo.serverName = "张缨武";
        vo.serverHost = "192.168.72.61";
        vo.serverPort = 5601;
        vo.serverStatus = "2";
        vo.serverType = "2";
        vo.serverSort = 61;
        vo.isNew = 0;
        vo.isRecommend = 1;
        vo.serverVersion = "11111";
        return vo;
    }

    public static function CreateTestServer3():ServerVo{
        var vo:ServerVo = new ServerVo();
        vo.serverId = "1000";
        vo.serverNumber = "1000";
        vo.serverName = "删档测试";
        vo.serverHost = "s1-ssh5.kingnet.com";// 111.231.110.70
        vo.serverPort = 5603;
        vo.serverStatus = "2";
        vo.serverType = "1";
        vo.serverSort = 1000;
        vo.isNew = 1;
        vo.isRecommend = 1;
        vo.serverVersion = "";
        return vo;
    }
}
}
