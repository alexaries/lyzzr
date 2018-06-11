/**
 * Created by huangcb on 2017/8/21.
 */
package com.game.module.map.util {
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.map.vo.CityBaseInfoVO;
import com.game.module.map.vo.MapModel;
import com.game.module.map.vo.MapNode;
import com.game.module.map.vo.MapVO;
import com.game.module.map.vo.NpcBaseInfoVO;
import com.game.module.map.vo.TranBuildBaseInfoVO;

import laya.utils.Dictionary;

import com.game.utils.ShellUtils;

public class MapUtil {

    //存放各个国家的xml,变量为国家的ID
    public static var countryXMLs:Dictionary = new Dictionary();

    public function MapUtil() {
    }

    //	---	查询 地图数据相关信息	------

    /**
     * 返回 建筑基础数据
     * @param id
     * @return
     *
     */
    public static function getBuildBaseInfoVObyId(__mapmodel:MapModel, id:int):BuildBaseInfoVO {

        //其他
        var dic:Dictionary = __mapmodel.allBuildBaseInfoVOList;

        return dic.get(id) as BuildBaseInfoVO ;
    }

    /**
     * 返回 传送点基础数据
     * @param id
     * @return
     *
     */
//    public static function getTranBuildBaseInfoVObyId(__mapmodel:MapModel, id:int):TranBuildBaseInfoVO {
//        var dic:Dictionary = __mapmodel.allTranBuildBaseInfoVOList;
//        return dic.get(id) as TranBuildBaseInfoVO;
//    }

    /**
     * 返回城市基础数据    默認是尋找小地圖  ,输入的type为2的时候则是寻找帮派战据点
     * @param id
     * @return
     *
     */
    public static function getCityBaseInfoVObyId(__mapmodel:MapModel, id:int, type:int = 1):CityBaseInfoVO {
        var returnvo:CityBaseInfoVO = null;
        var lng:int = __mapmodel.allCityBaseInfoList.length;
        for (var i:int = 0; i < lng; i++) {
            var vo:CityBaseInfoVO = __mapmodel.allCityBaseInfoList[i];
            if (vo.id == id && vo.type == type) {
                returnvo = vo;
                break;
            }
        }
        return returnvo;
    }

    /**
     * 返回npc基础信息数据
     * @param id
     * @return
     *
     */
    public static function getMapNpcsByLocId(__mapmodel:MapModel, locId:int):Array {
        var returneArr:Array = new Array();

        var lng:int = 0;
        if (__mapmodel.mapNpcBaseInfoVOList) {
            lng = __mapmodel.mapNpcBaseInfoVOList.length;
        }

        for (var i:int = 0; i < lng; i++) {
            var obj:Object = __mapmodel.mapNpcBaseInfoVOList[i];
            if (obj.locID == locId) {
                returneArr = obj.npcdata;
                break;
            }
        }

        return returneArr;
    }

    /**
     * 返回npc基础信息数据
     * @param id
     * @return
     *
     */
    public static function getNPCInfoByNpcID(__mapmodel:MapModel, npcID:uint):NpcBaseInfoVO {
        var lng:int = 0;
        if (__mapmodel.mapNpcBaseInfoVOList) {
            lng = __mapmodel.mapNpcBaseInfoVOList.length;
        }

        for (var i:int = 0; i < lng; i++) {
            var obj:Object = __mapmodel.mapNpcBaseInfoVOList[i];
            var arr:Array = obj.npcdata as Array;
            for (var j:int = 0; j < arr.length; j++) {
                var npcvo:NpcBaseInfoVO = arr[j] as NpcBaseInfoVO;
                if (npcvo && npcvo.id == npcID) {
                    return npcvo;
                }
            }
        }
        return null;
    }

    //	---	查询 地图数据相关信息	------

    //	---	地图自动行走的路线生成函数	----

//    private static var autoRunPonitArray:Array;

    /**
     Construct the path, not including the start node.
     当找到终点,依次返回其父节点,就是要搜索的路径
     */
    protected static function constructPath(node:MapNode):Array {
        var path:Array = new Array();
        while (node.pathParent != null) {
            path.unshift(node);
            node = node.pathParent;
        }
        return path;
    }

//    public static function search(__mapmodel:MapModel, startID:uint, goalID:uint):Array {
//
//        // list of visited nodes
//        var closedList:Array = new Array();	//存放已经访问过的节点,是(FIFO)表
//        // list of nodes to visit (sorted)
//        var openList:Array = new Array();	//存放已经即将访的节点
//
//        var startNode:MapNode = __mapmodel.allTranList.get(startID);
//        var goalNode:MapNode = __mapmodel.allTranList.get(goalID);
//        if(startID==goalID){
//            return [];
//        }
//        openList.push(startNode);
//
//        startNode.pathParent = null;
//
//        while (!openList.length == 0) {
//            var node:MapNode = openList.pop();
//            if (node == goalNode) {
//                // path found!
//                return constructPath(goalNode);
//            } else {
//
//                closedList.push(node);
//
//                var arr:Array = node.data as Array;
//                var lng:int = arr.length;
//                for (var i:int = 0; i < lng; i++) {
//                    var neighborNode:MapNode = __mapmodel.allTranList.get(arr[i]);
//                    if (closedList.indexOf(neighborNode) == -1 && openList.indexOf(neighborNode) == -1) {
//                        neighborNode.pathParent = node;
//                        openList.push(neighborNode);
//                    }
//                }
//            }
//        }
//        // no path found
//        return null;
//    }

    /**
     * 查找  地图一到地图二 中间的据点
     * @param startID
     * @param goalID
     * @return
     *
     */
//    public static function getTransPoints(__mapmodel:MapModel, startID:uint, goalID:uint):Array {
//        var arrDic:Array =  __mapmodel.allTranBuildBaseInfoVOList.values
//        for (var i:int = 0; i < arrDic.length; i++) {
//            var obj:TranBuildBaseInfoVO = arrDic[i] as TranBuildBaseInfoVO;
//
//            if ((obj.id >> 8) == startID && ((obj.toID >> 8)) == goalID) {
//                return [obj.id, obj.toID];
//            }
//        }
//        return null;
//    }

    /**
     *
     * @param nowID        据点ID
     * @param locID        据点ID
     *
     */
//    public static function getAllPointArray(__mapmodel:MapModel, nowID:uint, locID:uint):void {
//        var arrPath:Array = search(__mapmodel, nowID >> 8   , locID>> 8  );
//        var obj:Object;
//        if (!autoRunPonitArray) {
//            autoRunPonitArray = new Array();
//        }
//        while (arrPath.length > 0) {
//            var id:uint = arrPath.shift().id;
//            var points:Array = getTransPoints(__mapmodel, nowID >> 8, id);
//
//            var targetID:uint = points[0];
//            autoRunPonitArray = autoRunPonitArray.concat(autoRunArrayWithOutTrans(nowID, targetID));
//            //传送
//            obj = new Object();
//            obj.locID = points[0];
//            obj.flag = 1;
//            autoRunPonitArray.push(obj);
//            nowID = points[1];
//        }
//        autoRunPonitArray = autoRunPonitArray.concat(autoRunArrayWithOutTrans(nowID, locID));
//    }

    public static function autoRunArrayWithOutTrans(currentID:int, targetID:int):Array {
        var returnArray:Array = [];
        var obj:Object;
        if (targetID == currentID) {
            return returnArray;
        }
        if (targetID >> 8 == currentID >> 8) {
            //可以直通过城内移动
            obj = new Object();
            obj.locID = targetID;
            obj.flag = 0;
            returnArray.push(obj);
        }
        return returnArray;
    }

//    public static function getAutoRunArray(__mapmodel:MapModel, mapnow:MapVO, locID:int):Array {
//        autoRunPonitArray = [];
//        var currentID:int;
//        currentID = mapnow.nodeId;
//        getAllPointArray(__mapmodel, currentID, locID);
//        return autoRunPonitArray;
//    }


    //	---	地图自动行走的路线生成函数	----

    /**
     * 走到某点 是否需要开启PK
     * */
//    public static function isNeedPK(__mapmodel:MapModel, nodeID:int, country:int):Boolean {
//        if (!nodeID)
//            return false;
//        var buildvo:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(__mapmodel, nodeID);
//        if (!buildvo) {
//            buildvo = MapUtil.getTranBuildBaseInfoVObyId(__mapmodel, nodeID);
//        }
//        if (!buildvo)
//            return false;
//
//        switch (buildvo.isAutoPk) {
//            case 0:
//                return false;
//                break;
//            case 1:
//                return true;
//                break;
//            case 2:
//                if (buildvo.status != 0 && buildvo.status != ( country + 1))
//                    return true;
//                else
//                    return false;
//                break;
//        }
//
//        return false;
//    }

    public static function getCityNameByID(__mapmodel:MapModel, locID:int):String {
        var returnStr:String;
        var buildvo:BuildBaseInfoVO = getBuildBaseInfoVObyId(__mapmodel, locID);

        if (buildvo)
            returnStr = buildvo.name;
        else
            returnStr = "";

        return returnStr;
    }


    /*通过 据点id  找到 城市id*/
    public static function getCityIdByBuildID(nodeId:uint):uint
    {
        var cityId:uint = nodeId >> 8;
        return cityId;
    }
}
}