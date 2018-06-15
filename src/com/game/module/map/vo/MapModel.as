package com.game.module.map.vo {
import config.ConfigManager;

import laya.utils.Dictionary;

public class MapModel {
    public function MapModel() {

    }
    private function cityHandle():void {
        var npcsTemp:Array = [];
         ConfigManager.instance.scene_city.config.city.forEach(function(o:ICity_config_city){
             var npcTemp:CityBaseInfoVO = new CityBaseInfoVO();
             npcTemp.id = o.id;
             npcTemp.name = o.name;
             npcTemp.info = o.info;
             npcTemp.map = o.map;
             npcTemp.type = o.type;
             npcTemp.flag=o.flag;
             npcTemp.defaultID =o.defaulted;
             npcsTemp.push(npcTemp);
         });
        allCityBaseInfoList = npcsTemp;
    }
    private function getBuildName( name:int):String {
        var langs= ConfigManager.instance.scene_buildLang.lang.filter(function(l:IBuildLang_lang){
            return l.id==name;
        })
        if(langs.length>0) return langs[0].txt;
        return "";
    }
    private function buildHandle():void {
        var dic:Dictionary=new Dictionary();
        ConfigManager.instance.scene_build.config.normal.build.forEach(function(o:IBuild_config_normal_build){
            var npcTemp:BuildBaseInfoVO = new BuildBaseInfoVO();
            npcTemp.id = o.id;
            npcTemp.name = getBuildName(o.name);
            npcTemp.info = o.tips;
            npcTemp.type = o.type;
            npcTemp.isAutoPk = o.autoPk;
            npcTemp.status = o.status;
          //  npcTemp.copyID=o.copyID;
            npcTemp.value = o.value;
            npcTemp.gold = o.gold;
            dic.set(npcTemp.id,npcTemp);
        })

        allBuildBaseInfoVOList = dic;

//        var transDic:Dictionary = new Dictionary();

//        var pathDic:Dictionary = new Dictionary();
        // 生成   路径节点 信息

//        ConfigManager.instance.scene_build.config.tran.build.forEach( function(ot:IBuild_config_tran_build){
//            var tranTemp:TranBuildBaseInfoVO = new TranBuildBaseInfoVO();
//            tranTemp.id = ot.id;
//            tranTemp.name = getBuildName(ot.name);
//            tranTemp.info = ot.tips;
//            tranTemp.type = ot.type;
//            tranTemp.toID = ot.toBuildId;
//            tranTemp.status = ot.status;
//            tranTemp.isAutoPk = ot.autoPk;
//            transDic.set(tranTemp.id,tranTemp);
//            var arr:Array;
//            var obj:MapNode;
//            if (pathDic.indexOf(tranTemp.id >> 8)==-1) {
//                obj = new MapNode();
//                arr = new Array();
//                arr.push(tranTemp.toID >> 8);
//                obj.data = arr;
//                obj.id = tranTemp.id >> 8;
//            } else {
//                obj = pathDic.get(tranTemp.id >> 8);
//                arr = obj.data as Array;
//                arr.push(tranTemp.toID >> 8);
//            }
//            pathDic.set(tranTemp.id >> 8,obj);
//        });


//        allTranBuildBaseInfoVOList = transDic;
//        allTranList = pathDic;
    }
    public function  init(){
        cityHandle();
        buildHandle();

    }
    //后台 传来的建筑ID
    public   var defaultBuildID:int;
    //当前 所在的ID
    public   var currBuildID:int;

    //public static var mapLoaderUrl:String = "../assets/map/NHZhou.swf";

    public var enableCreateRole:Boolean;
    /*城池信息*/
    /**
     * 返回数组   元素为:
     * @see CityBaseInfoVO
     * */
    public var allCityBaseInfoList:Array;
    /*据点信息*/
    public var allBuildBaseInfoVOList:Dictionary;
    /*传送点信息*/
//    public var allTranBuildBaseInfoVOList:Dictionary;
////
//    public var allTranList:Dictionary;

    /*地图上的npc数据	因为地图上面的是动态的	加载新地图的时候  重新拉取数据*/
    public var mapNpcBaseInfoVOList:Array;
    /*地图上的npc数据	因为地图上面的是动态的	加载新地图的时候  重新拉取数据*/
    public var mapNpclength:int;

    public var mapNodes:Array;
    public var isAutoRun:Boolean = false;

    public var userlist:Array;

    //护送任务据点 数组
    public var escortTaskHolds:Array;

    public var escortTaskID:uint;

    public var escortNpcId:uint;

    //护送任务是否正在进行当中
    //public var isescortDoing:Boolean = false;

    public var castleBuildLefts:Array;

    public var castlePlayers:Array;

    public var castleName:String = "某某山东省大厦";
    /**
     * 0 - 普通战
     * 1 - 名城攻城战
     * 2 - 名城守城战
     * */
    public var castleType:int = 0;

    public var castleBuildName:String = "XX据点列表";

    //public var castleAttackAble:Boolean = true ;

    public var castleResultAble:Boolean = false;

    public var taskGuiderChanged:Boolean = false;

    public var REWARD_ENABLE:Boolean = false;

    public var IS_NEED_OPENBUILD:Boolean = false;

    public var CASTLE_RELIVE_NUM:int;

    public var CASTLE_RELIVE_FLAG:Boolean = false;


}
}