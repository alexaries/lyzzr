/**
 * Created by huangcb on 2017/9/30.
 */
package com.game.module.worldMap.view {
import com.component.EffectPlayer;
import com.component.MemoryManager;
import com.game.common.view.BaseWindow;
import com.game.module.citywar.view.WorldMapCityItem;
import com.game.module.citywar.view.item.CityWarCityPlayerItem;
import com.game.module.citywar.vo.CityWarCityVo;
import com.game.module.map.util.MapUtil;
import com.game.module.worldMap.mediator.WorldMapMediator;
import com.signal.SignalDispatcher;

import config.ConfigManager;
import config.scene.worldmap.IWorldmap_item;

import laya.display.Sprite;

import laya.events.Event;

import laya.net.Loader;
import laya.ui.Box;

import laya.ui.Button;
import laya.ui.Image;
import laya.ui.Label;
import laya.ui.Panel;
import laya.utils.Dictionary;

import laya.utils.Handler;
import laya.utils.Pool;

import net.consts.AppConst;

import com.game.common.mvc.BaseMediator;

import tools.DisplayTools;

import ui.worldMap.worldMapUI;

import utils.ArrayUtil;

public class WorldMapView extends BaseWindow {

    public var ui:worldMapUI;
    public var toBuildSignal:SignalDispatcher;
    public var returnSignal:SignalDispatcher;
    public function WorldMapView() {
        super(["世界地图素材",{url:AppConst.atlasPath+"module/worldmap.json",type:Loader.ATLAS},
                {url: "ui/world_map/world.jpg", type: Loader.IMAGE},
//            {url: "ui/world_map/tips.png", type: Loader.IMAGE}
        ]);
        toBuildSignal=new SignalDispatcher();
        returnSignal = new SignalDispatcher();
    }

    public function set vo(value:Object):void {

    }
    public function get data():Object
    {
        if(_data == null)
          return 0;

        return _data;
    }

    override public function dispose():void {
        super.dispose();

        if(effMc)
        {
            effMc.stop();
            effMc.visible = false;
        }
        if(myEff)
        {
            myEff.stop();
            myEff.visible = false;
        }


    }

    override public function getMediator():BaseMediator {
        return new WorldMapMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {

        ui=new worldMapUI();
        addChild(ui);
        ui.world.width=ui.width=width=AppConst.width;
        ui.closeBtn.clickHandler=Handler.create(this,returnMyHome);
        var nodes:Vector.<Button> = getNodes( ui.world);
        nodeAddEvent(nodes);
        ui.world.hScrollBar.visible=false;


        if(myEff == null)
            myEff = addFangLiuguangEffOnNode(ui.myEff);
        if(myEff){
            myEff.play(0,true,"fang_liuguang");
        }

        MemoryManager.getBundle(MemoryManager.IMAGE).addLabel(ui.map.skin)
        MemoryManager.getBundle(MemoryManager.IMAGE).removeLabel(ui.map.skin)
    }
    private function nodeAddEvent(nodes : Vector.<Button>) : void {
        for(var i:int=0;i<nodes.length;i++){
            updateNode(nodes[i]);
        }

    }

    private var myEff:EffectPlayer;
    private var effMc:EffectPlayer;
    private var nodeStatusDic:Dictionary = new Dictionary();

    function  updateNode(node:Button){
        var buildId:int=parseInt(node.name);

        var nodeVo:IWorldmap_item= ArrayUtil.find(ConfigManager.instance.scene_worldmap.item,function(s:IWorldmap_item){
            return s.tobuildID==buildId});



        if(node.getChildByName("WorldMapCityItem") == null)
        {
            var nodeStatus:WorldMapCityItem = new WorldMapCityItem();
            nodeStatus.name = "WorldMapCityItem";
            node.addChild(nodeStatus);
            nodeStatus.y = node.height+5;
            var cityId:uint = MapUtil.getCityIdByBuildID(buildId);
            nodeStatusDic.set(cityId,nodeStatus);
        }


//        node.name="shijieditu_diming";
        node.clickHandler=Handler.create(this,node_clickHandler,[nodeVo.tobuildID],false);

    }

    public function addEff(cityId:int):void
    {
        var nodes:Vector.<Button> = getNodes(ui.world);
        for each( var node:Button in nodes)
        {
            var nodeId:int=parseInt(node.name);
            var cID:int = MapUtil.getCityIdByBuildID(nodeId);
            if(cID == cityId)
            {
                if(effMc == null)
                    effMc = addFangLiuguangEffOnNode(node);
                if(effMc){
                    effMc.play(0,true,"fang_liuguang");
                }
                break;
            }
        }
    }

    private function returnMyHome():void
    {
        returnSignal.dispatch([]);
    }

    private function node_clickHandler(tobuildID:int):void {

        var cityId:uint = MapUtil.getCityIdByBuildID(tobuildID);
        var nodeStatus:WorldMapCityItem = nodeStatusDic.get(cityId);

        toBuildSignal.dispatch([tobuildID ,nodeStatus]);
    }


    /**添加   状态 */
    public function addFlagOnNode(arr:Array):void
    {
        var _vo:CityWarCityVo;
        for(var i:int=0;i<arr.length;i++)
        {
            _vo = arr[i];
            var nodeStatus:WorldMapCityItem = nodeStatusDic.get(_vo.cityId);
            if(nodeStatus)
               nodeStatus.setCityData(_vo);
        }
    }

    /**删除 状态 */
    public function stopNodeStatus():void
    {
        for each(var nodeStatus:WorldMapCityItem in nodeStatusDic.values)
        {
            nodeStatus.stopTimeDown();
        }
    }





    function  getNodes(city:Panel):Vector.<Button>{
        var temp:Vector.<Button>=new Vector.<Button>();
        for(var i:int=0;i<city.numChildren;i++){
            var node=city.getChildAt(i);
            if(node is Button)
            {
                if((node as Button).name.indexOf("0x")!=-1)
                {
                    temp.push((node as Button));
                }
            }
        }
        return temp;
    }


















    //--------------------------------------------------------------------------------//
    private function addFangLiuguangEffOnNode(owner:Sprite):EffectPlayer{
        var mc:EffectPlayer = Pool.getItemByClass("worldCityEff", EffectPlayer);
        mc.loadImages(["clip/fang_liuguang/1.png","clip/fang_liuguang/2.png",
            "clip/fang_liuguang/3.png","clip/fang_liuguang/4.png",
            "clip/fang_liuguang/5.png","clip/fang_liuguang/6.png",
            "clip/fang_liuguang/7.png","clip/fang_liuguang/8.png",
             "clip/fang_liuguang/9.png","clip/fang_liuguang/10.png",
             "clip/fang_liuguang/11.png","clip/fang_liuguang/12.png",
             "clip/fang_liuguang/13.png","clip/fang_liuguang/14.png"
        ],"fang_liuguang");
        mc.sizeGrid = "18,18,18,18";
        mc.interval = 160;
        mc.width = owner.width;
        mc.height = owner.height;
        owner.addChild(mc);
        return mc;
    }

    /**  不用*/
    private function removeFangLiuguangEffFromNode(mc:EffectPlayer):void{
        if(mc){
            mc.visible = true;//恢复到默认属性
            mc.stop();
            mc.removeSelf();
            Pool.recover("worldCityEff",mc);
        }
    }



}
}