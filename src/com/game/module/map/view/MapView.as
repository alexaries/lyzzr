package com.game.module.map.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.map.mediator.MapMediator;
import com.game.module.map.vo.MapVO;
import com.game.module.map.vo.NodeData;

import laya.maths.Point;
import laya.net.Loader;

import net.consts.AppConst;

public class MapView extends BaseView {
    private var _mapVO:MapVO;
    public var mapOperation:MapOperation;
    public var mapLoader:MapLoader;
//    public var mapPlayer:MapPlayer;
    private var resArray:Array =
            ["争霸天下素材",
                {url: AppConst.atlasPath + "module/citywar.json", type: Loader.ATLAS},
                {url: AppConst.atlasPath + "module/worldmap.json", type: Loader.ATLAS}
            ];

    public function MapView() {
        mapOperation = new MapOperation();
        mapLoader = new MapLoader();
//        mapPlayer=new MapPlayer();
        super(resArray);
    }

    override public function getMediator():BaseMediator {
        return new MapMediator(this);
    }

    override public function onComplete():void {

        mapOperation.setPlayerPointDispatcher.getSignal(this).listen(setPlayerPoint);
        mapOperation.goNodeSignal.getSignal(this).listen(goNode);

        mapLoader.goNodeSignal.getSignal(this).listen(goNode);

        addChild(mapLoader);
        mapLoader.onComplete();
//        mapLoader.palyerUICom.addChild(mapPlayer);
        addChild(mapOperation);
        mapOperation.onComplete();
        super.onComplete();
    }

    public function goNode(data:NodeData):void {
        trace("MapView goNode")
        var point:Point = getGuidePointBy(data);
//        mapPlayer.goNode(data.id, point);
    }

    private function getGuidePointBy(data:NodeData):Point {
        // 直接 将 数据 传到 Player
        var point:Point = new Point();
        point.x = data.x;
        point.y = data.y;
        return point;
    }

    public function setPlayerMovDis(dis:uint):void {
        if (dis > 40) {
            dis = 40;
        }
        if (dis < 6) {
            dis = 6;
        }
//        mapPlayer.moveDis = dis ;
    }


    public function setPlayerPoint(id:int):void {
        if (!mapLoader.nodeList) return;
        var lng:int = mapLoader.nodeList.length;
        for (var i:int = 0; i < lng; i++) {
            if (mapLoader.nodeList[i].id == id) {
                var point:Point = new Point();
                point.x = mapLoader.nodeList[i].x;
                point.y = mapLoader.nodeList[i].y;
//                mapPlayer.trunPoint(point);
//                mapPlayer.nodeId = id;

                mapVO.nodeId = id;
                break;
            }
        }
    }

    public function getGuidePointFromId(locID:int):Point {
        // 直接 将 数据 传到 Player
        var point:Point = new Point();
        for (var i:int = 0; i < mapLoader.nodeList.length; i++) {
            var data:Object = mapLoader.nodeList[i];
            if (locID == (data.id)) {
                point.x = data.x;
                point.y = data.y;
                break;
            }
        }
        return point;
    }

    public function setMapPlayerSrc(url:String):void {
//        mapPlayer.setHumanSource(url);
    }

    public function setMapPlayerRideSrc(rideModelUrl:String):void {

    }

    public function setMapPlayerCharmSrc(fightVoSrcRide:String):void {

    }

    public function setMapUserData(arr:Array):void {

    }

    public function vipClick():void {

    }

    public function forthOpenClick():void {

    }

    public function forthGiftClick():void {

    }

    public function setTaskData(value:Array):void {
        mapLoader.setTaskData(value);
    }

    public function playerAutoLocID(nodeID:int):void {
        mapOperation.playerAutoLocID(nodeID);
    }

    public function mapEnabled(b:Boolean):void {

    }

    public function setVisible(b:Boolean):void {

    }

    public function setHeroIslandData(mapNumDatas:Array, expNumDatas:Array):void {

    }

    public function changeMapSkin(__mapVo:MapVO):void {
        //换地图
        // showMapToolTip(false);
        mapEnabled(false);

        mapVO = __mapVo;
        mapLoader.flag = mapVO.flag;
//        mapPlayer.nodeId = mapVO.nodeId;
        // 判断 一下要不要   加载 NPC数据
        if (mapVO.type == 1) {
            loadAllNpcHeadRes();
        }
        loadMapRes(mapVO.mapUrl);
    }

    private function loadMapRes(mapUrl:String):void {
        mapLoader.loadMapRes(mapUrl);
    }

    private function loadAllNpcHeadRes():void {

    }


    public function get mapVO():MapVO {
        return _mapVO;
    }

    public function set mapVO(value:MapVO):void {
        _mapVO = value;
    }
}
}
