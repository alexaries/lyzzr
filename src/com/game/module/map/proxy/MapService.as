/**
 * Created by huangcb on 2017/8/21.
 */
package com.game.module.map.proxy {
import com.game.events.NotiEvent;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.events.MapServiceEvent;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.map.vo.MapConstConfig;
import com.game.module.map.vo.MapModel;
import com.game.module.map.vo.MapVO;
import com.game.module.map.vo.NpcBaseInfoVO;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;

import config.ConfigManager;
import config.userInfo.monster.IMonster_item;
import config.userInfo.npc.INpc_item;

import net.data.recvMsg.map.BuildUsersListMsg;
import net.data.recvMsg.map.BuildUsersUpdateMsg;
import net.data.recvMsg.map.LocateSmallMapMsg;
import net.data.recvMsg.map.TransportMapMsg;
import net.data.recvMsg.map.TransportUpdateMsg;
import net.data.sendCmd.map.LocateSmallMapCmd;
import net.data.sendCmd.map.TransportMapCmd;
import net.data.structs.map.NpcInfoStruct;
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.observer.Notification;
import com.game.common.mvc.BaseProxy;

import utils.ArrayUtil;

public class MapService extends BaseProxy implements IProxy {
    public static const NAME:String = "MapService";
    private static const REFRESH_CD:int = 1000;

    private var connection:SocketConnectionProxy;
    private var _mapModel:MapModel;
    private var datasTemp:Array;
    private var refreshEnable:Boolean;

    var irole:UserProxy;
    public var deliverData:Array;
    public var buildvo:BuildBaseInfoVO;
    public var map_init:Boolean;

    public function MapService() {
        super(NAME);
        _mapModel=new MapModel();
        _mapModel.init();
        datasTemp=[];
        deliverData=[];
        buildvo=new BuildBaseInfoVO();

        connection = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;
        irole = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function setInterval(func, timer) {

    }


    public function sampleUserListUpdate(event:Object):void {
        var buildusermsg:BuildUsersUpdateMsg = event as BuildUsersUpdateMsg;
        var list:Array = buildusermsg.getUserDatas().concat();
        sortUserList(list);
        list = list.slice(0, MapConstConfig.MAX_USER);
        _mapModel.userlist = list;

        var evt:MapServiceEvent = new MapServiceEvent(MapServiceEvent.USER_LIST_UPDATE,list);


        if (refreshEnable)
            return;
        Laya.timer.loop(REFRESH_CD, this, resetDispatch);
        refreshEnable = true;
        dispatch(evt);
    }

    private function resetDispatch():void {
        Laya.timer.clear(this, resetDispatch);
        refreshEnable = false;
    }

    public function sampleUserListData(event:Object):void {
        var builduserMsg:BuildUsersListMsg = event as BuildUsersListMsg;
        var list:Array = builduserMsg.getUserDatas().concat();
        //处理 数据
        sortUserList(list);
        list = list.slice(0, MapConstConfig.MAX_USER);
        _mapModel.userlist = list;

        var evt:MapServiceEvent = new MapServiceEvent(MapServiceEvent.USER_LIST_UPDATE,list);

        dispatch(evt);
    }

    private function sortUserList(list:Array):void {
         //暂不排
    }

    public function mapNpcUpdate(event:Object):void {
        var msg:TransportUpdateMsg = event as TransportUpdateMsg;

        var datas:Array = _mapModel.mapNpcBaseInfoVOList;

        if (!datas)
            return;
        var len:int = datas.length;
        var obj:Object;
        var npcbaseinfo:NpcBaseInfoVO;
        var i:int;
        switch (msg.type) {
            case 1:
                for (i = 0; i < len; i++) {
                    obj = datas[i];
                    if (obj.locID == msg.locID) {
                        var npcArray:Array = obj.npcdata as Array;
                        for (var j:int = 0; j < npcArray.length; j++) {
                            npcbaseinfo = npcArray[j] as NpcBaseInfoVO;
                            if (npcbaseinfo.id == msg.npcID) {
                                npcArray.splice(j, 1);
                                _mapModel.mapNpclength--;
                                break;
                            }
                        }
                    }
                }
                _mapModel.mapNpcBaseInfoVOList = datas;
                break;
            case 2:
                npcbaseinfo = new NpcBaseInfoVO();
                npcbaseinfo.id = msg.npcID;
                npcbaseinfo.buildID = msg.locID;
                npcbaseinfo.status = msg.actionType;
                npcbaseinfo.type = msg.flag;

                setNpcInfo(npcbaseinfo);

                var isdo:Boolean = false;

                for (i = 0; i < len; i++) {
                    obj = datas[i];
                    if (obj.locID == msg.locID) {
                        (obj.npcdata as Array).push(npcbaseinfo);
                        isdo = true;
                        break;
                    }
                }

                if (!isdo) {
                    obj = new Object();
                    obj.npcdata = new Array();
                    (obj.npcdata as Array).push(npcbaseinfo);
                    obj.locID = msg.locID;
                    datas.push(obj);
                }

                _mapModel.mapNpclength++;
                //需要加载 这张NPC图片

                datasTemp = datas;
                _mapModel.mapNpcBaseInfoVOList = datasTemp;
                break;
        }
    }


    public function cityInsideUpdate(event:Object):void {
        trace("@cityInsideUpdate");
        var locateSMsg:LocateSmallMapMsg = event as LocateSmallMapMsg;
        //比较  查看   据点坐标是不是在当前地图上,如果不在切换地图，并设置人物起始点
        var mapvo:MapVO = new MapVO(_mapModel, locateSMsg.getLocID()>> 8, 1);

        var evt:MapServiceEvent;

        if (!mapvo)
            return;

        mapvo.nodeId =  (locateSMsg.getLocID());
        irole.mapVO = mapvo;
        return;
        if (!irole.mapVO || mapvo.cityId != irole.mapVO.cityId || mapvo.type != irole.mapVO.type) {
            //已存取
            irole.mapVO = mapvo;
            // 1表示 需要重新 加载 地图   0表示  不需要 重新加载地图
            evt = new MapServiceEvent(MapServiceEvent.MAP_ARRIVED_BUILD,[mapvo, 1]);

            dispatch(evt);
        } else {
            //已存取
            irole.mapVO = mapvo;
            evt = new MapServiceEvent(MapServiceEvent.MAP_ARRIVED_BUILD,[mapvo, 0]);

            dispatch(evt);
        }
        var  userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        if (userProxy.userVO.level >= 40 && userProxy.userVO.country == 2) {

            dispatch(new MapOperatorEvent(MapOperatorEvent.STOP_AUTO_RUN));
            dispatch(new NotiEvent(NotiEvent.POPUP_DEMO, [MenuWinType.CAMP_SELECT_VIEW, 1]));
        }

    }

    public function mapNpcData(event:Object):void {

        var npcMsg:TransportMapMsg = event as TransportMapMsg;
        var npcArray:Array = npcMsg.getNpcData();
        var lng:int = npcArray.length;

        var datas:Array = new Array();

        var idflag:Boolean = false;

        for (var i:int = 0; i < lng; i++) {
            var temp:NpcInfoStruct = npcArray[i] as NpcInfoStruct;
            var obj:Object;

            var npcbaseinfo:NpcBaseInfoVO = new NpcBaseInfoVO();
            var id:int = temp.npcId;
            npcbaseinfo.id = id;
            trace("temp.npcId = " + temp.npcId);
            npcbaseinfo.status = temp.flag;
            npcbaseinfo.buildID = temp.locId;
            npcbaseinfo.type = temp.type;

          //  try {
                setNpcInfo(npcbaseinfo);

                for (var j:int = 0; j < datas.length; j++) {
                    if (datas[j].locID == temp.locId) {
                        (datas[j].npcdata as Array).push(npcbaseinfo);
                        idflag = true;
                        break;
                    }
                }

                if (idflag != true) {
                    obj = new Object();
                    obj.locID = temp.locId;
                    obj.npcdata = new Array();
                    (obj.npcdata as Array).push(npcbaseinfo);
                    datas.push(obj);
                }
                idflag = false;
           // } catch (e:Error) {
           //     trace("Error:cannot find NPC by NPCID = " + temp.npcId);
           // }
        }
        _mapModel.mapNpclength = lng;
        _mapModel.mapNpcBaseInfoVOList = datas;
    }

    public function setNpcInfo(npcbaseinfo:NpcBaseInfoVO):void {
        var id:uint = npcbaseinfo.id;
        if (npcbaseinfo.id > 0x1000) {
            var monster:config.userInfo.monster.IMonster_item = ArrayUtil.find(ConfigManager.instance.userInfo_monster.item, function (m:config.userInfo.monster.IMonster_item) {
                return m.id == id;
            });
            if (monster) {
                //怪物
                npcbaseinfo.name = monster.name;
                npcbaseinfo.info = monster.dialog;
                npcbaseinfo.level = monster.level;
                //todo
                /*
                 npcbaseinfo.propId = monster.propId;
                 npcbaseinfo.skillId = monster.skillId;
                 npcbaseinfo.title = monster.title;
                 */
                npcbaseinfo.imgID = monster.headImg;
                npcbaseinfo.roleID = monster.model.toString();
                npcbaseinfo.functionId = monster.functionId;
                npcbaseinfo.footHoldId = monster.footHoldId;
                npcbaseinfo.npcType = 2;
            } else {
                //对话NPC
                var npcinfo:config.userInfo.npc.INpc_item = ArrayUtil.find(ConfigManager.instance.userInfo_npc.item, function (n:config.userInfo.npc.INpc_item) {
                    return n.id == id;
                });


                if (!npcinfo) {
                    trace("Error:NpcBaseInfoVO:" + id);
                    return;
                }
                //todo
                npcbaseinfo.name = npcinfo.name;
                npcbaseinfo.info = npcinfo.dialog;
                npcbaseinfo.level = npcinfo.level;
                // npcbaseinfo.propId = npcinfo.propId;
                //  npcbaseinfo.skillId = npcinfo.skillId;
                npcbaseinfo.title = npcinfo.title;
                npcbaseinfo.imgID = npcinfo.headImg;
                // npcbaseinfo.roleID = npcinfo.model;
                npcbaseinfo.functionId = npcinfo.functionId;
                npcbaseinfo.footHoldId = npcinfo.footHoldId;
                npcbaseinfo.half = npcinfo.half;
                npcbaseinfo.npcType = 4;
            }
        } else {
            //名将NPC
//				var generalvo:HeroVO = _xmlLocator.GernalHeros[id];
//				npcbaseinfo.imgID = generalvo.imgId;
//				npcbaseinfo.name = generalvo.name;
//				npcbaseinfo.info = generalvo.info;
//				npcbaseinfo.level = generalvo.level;
//				npcbaseinfo.npcType = 6;
        }

    }

    public function sendBuildPointMapCmd(nodeID:int):void {
        var cmd:LocateSmallMapCmd = new LocateSmallMapCmd();
        cmd.locID = nodeID;
        connection.send(cmd);
    }

    public function sendTransportMapCmd(flag:int = 0, cityId:int = 0x03):void {
        var cmd:TransportMapCmd = new TransportMapCmd();
        cmd.locID = cityId;
        cmd.flag = flag;
        connection.send(cmd);
    }

    public function get mapModel():MapModel {
        return _mapModel;
    }
}
}