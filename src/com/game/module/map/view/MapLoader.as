package com.game.module.map.view {
import com.component.EffectPlayer;
import com.component.MemoryManager;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.citywar.view.CityWarNodeItem;
import com.game.module.citywar.vo.CityWarCityVo;
import com.game.module.citywar.vo.CityWarNodeVo;
import com.game.module.citywar.vo.CityWarVo;
import com.game.module.map.events.MapEvent;
import com.game.module.map.events.MapLoaderEvent;
import com.game.module.map.mediator.MapLoaderMediator;
import com.game.module.map.vo.NodeData;
import com.signal.SignalDispatcher;

import config.ConfigManager;
import config.scene.build.IBuild_config_normal_build;
import config.scene.buildLang.IBuildLang_lang;

import laya.display.Sprite;
import laya.ui.Button;
import laya.ui.Image;
import laya.ui.View;
import laya.utils.Dictionary;
import laya.utils.Handler;

import net.consts.AppConst;

import utils.ArrayUtil;

public class MapLoader  extends  BaseView{

    // 允许出错次数
    public static const errorTime : int = 3;
    // 当前出错次数
    public var  curErrorTime : int = 0;
    private var map : View ;
    private var iconUICom : Sprite ;
    private var mapUICom : Sprite ;
    public var palyerUICom : Sprite ;
    private var castleUICom : Sprite ;
    // 该地图下的所有数据列表
    private var _nodeList : Vector.<NodeData>;
    private var _flag : String;  //这个走配置文件吧
    private var mapDic : Dictionary ;
    private var heroIslandCom : Sprite;
    public var goNodeSignal:SignalDispatcher;
    public var onEventSignal:SignalDispatcher;
    public var getMoneyByNodeSignal:SignalDispatcher;
    public var getNodeInfoSignal:SignalDispatcher;
    private var nodes : Vector.<Button>;

    public function MapLoader() {
        super ([]);
        onEventSignal=new SignalDispatcher();
        goNodeSignal=new SignalDispatcher();
        getMoneyByNodeSignal = new SignalDispatcher();
        getNodeInfoSignal = new SignalDispatcher();
        nodes =new  Vector.<Button>();
        _nodeList=new Vector.<NodeData>();

        mapDic = new Dictionary();

//        mapDic.set("map/BYCun.swf",BYCunUI);
//        mapDic.set("map/CDJWai.swf" ,CDJWaiUI);
//        mapDic.set("map/CDu.swf" ,CDuUI);
//        mapDic.set("map/CYSi.swf" ,CYSiUI);
//        mapDic.set("map/WJChang.swf",WJChangUI);
//        mapDic.set("map/GHShan.swf" ,GHShanUI);
//        mapDic.set("map/CSJWai.swf",CSJWaiUI);
//        mapDic.set("map/CSha.swf" ,CShaUI);
//        mapDic.set("map/QLShan.swf" ,QLShanUI);
//        mapDic.set("map/SHFLMZhen.swf" ,SHFLMZhenUI);
//        mapDic.set("map/GPLing.swf" ,GPLingUI);
//        mapDic.set("map/HShan.swf" ,HshanUI);
//        mapDic.set("map/BMShan.swf" ,BMShanUI);
//        mapDic.set("map/MCShan.swf",MCShanUI);
//        mapDic.set("map/EMShan.swf" ,EMShanUI);
//        mapDic.set("map/DTLHZhen.swf",DTLHZhenUI);
//        mapDic.set("map/JHShan.swf",JHShanUI);
//        mapDic.set("map/LShan.swf" ,LshanUI);
//        mapDic.set("map/HUShan.swf" ,HUShanUI);
//        mapDic.set("map/YDShan.swf" ,YDShanUI);
//        mapDic.set("map/DHai.swf" ,DhaiUI);
//        mapDic.set("map/ZYGong.swf" ,ZYGongUI);
//        mapDic.set("map/QLHSZhen.swf" ,QLHSZhenUI);
//        mapDic.set("map/LFShan.swf" ,LFShanUI);
//        mapDic.set("map/WDShan.swf" ,WDShanUI);
//        mapDic.set("map/QCShan.swf"  ,QCShanUI);
//        mapDic.set("map/SZhou.swf" ,SZhouUI);
//        mapDic.set("map/NJiang.swf" ,NJiangUI);
//        mapDic.set("map/KLShan.swf",KLShanUI);
//        mapDic.set("map/XMLYShan.swf" ,XMLYShanUI);
//        mapDic.set("map/HBChi.swf" ,HBChiUI);
//        mapDic.set("map/YEDao.swf" ,YEDaoUI);
//        mapDic.set("map/XKDao.swf" ,XKDaoUI);
//        mapDic.set("map/NJZChan.swf" ,NJZChanUI);
//        mapDic.set("map/EMPai.swf" ,EMPaiUI);
//        mapDic.set("map/KLPai.swf" ,KLPaiUI);
//        mapDic.set("map/XJie.swf" ,XJieUI);
//        mapDic.set("map/YXDao.swf",YXDaoUI);

    }
    override public function onComplete():void {
        super.onComplete();
        x=(AppConst.width-AppConst.width_max)/2;
        initUI();
    }
    public function loadMapRes(mapUrl:String):void {
        loadOver = false;
        trace("loadMapRes "+mapUrl);
        if(map!=null)
        {
            nodeRemoveEvent(nodes);

            if(map["map"]){
                var mapp:Image=map["map"];
                if(mapp&&mapp.skin){
                    MemoryManager.getBundle(MemoryManager.IMAGE).removeLabel(mapp.skin)
                }
            }
            if(map["s_map"]){
                var s_mapp:Image=map["s_map"];
                if(s_mapp&&s_mapp.skin){
                    MemoryManager.getBundle(MemoryManager.IMAGE).removeLabel(s_mapp.skin);
                }
            }

            map.destroy(true);
            if(myEffMc)
            {
                removeFangLiuguangEffFromNode();
            }
        }
        var cls:Class=mapDic.get(mapUrl);
        var city = new cls();
        map = city;
        var mapp2:Image=map["map"];
        MemoryManager.getBundle(MemoryManager.IMAGE).addLabel(mapp2.skin)

        var s_mapp2:Image=map["s_map"];
        MemoryManager.getBundle(MemoryManager.IMAGE).addLabel(s_mapp2.skin);

        mapUICom.addChild(city);

        nodes = getNodes(city);

        nodeListHandler(nodes);
        onEventSignal.dispatch(new MapLoaderEvent(MapLoaderEvent.MAP_INIT));

    }





    /**通知据点战斗信息 返回*/
    public function showNodeFightResult(arr:Array):void
    {
        if(arr[2] == 1)
        {

        }
    }

    private var myEffMc:EffectPlayer;
    private var cityVo:CityWarCityVo;
    /**页面node数据*/
    public function setNodesData(_cVo:CityWarVo):void
    {
        cityVo = _cVo.selectCity;
        if(loadOver == false)
           Laya.timer.once(2000,this,layoutShowNodeData,[_cVo]);
        else
            Laya.timer.once(500,this,layoutShowNodeData,[_cVo]);

        var nodes : Vector.<Button> = getNodes(map);
        for each(var btn:Button in nodes)
        {
            var buildId:int=parseInt(btn.name);
            if(buildId == _cVo.nodeId)
            {
               if(myEffMc == null)
                   myEffMc = createEffOnNode();
               if(myEffMc){
                   myEffMc.width = btn.width+20;
                   myEffMc.height = btn.height+20;
                   myEffMc.x =myEffMc.y = -6;
                   btn.addChild(myEffMc);
                  myEffMc.play(0,true,"fang_liuguang");
                }
                break;
            }
        }
    }

    private function layoutShowNodeData(_cVo:CityWarVo):void
    {
        var node:CityWarNodeItem;
        var nodeVo:CityWarNodeVo;
        for(var i:int=0;i<_cVo.selectCity.nodeNum;i++)
        {
            nodeVo = _cVo.selectCity.nodes[i];
            if(nodeVo.isCastellan)
                nodeVo.leftTime = _cVo.selectCity.bemastertime_down;
            node = nodeInfoDic.get(nodeVo.nodeId);
            if(!node)
            {
                trace("error --- " + nodeVo.nodeId + "未找到");
                continue;
            }
            if(!node.parent)
            {
                trace("error --- " + nodeVo.nodeId + "未找到parent");
                continue;
            }
            trace("nodeVo.nodeId :" + nodeVo.nodeId);
            node.setCityNodeData(nodeVo,_cVo,getMoneyByNodeSignal);
        }
    }


    //---------------------------------------------------------------------------//
    private function initUI() : void {
        mapUICom=new Sprite();
        iconUICom = new Sprite();
        castleUICom = new Sprite();
        heroIslandCom = new Sprite();
        palyerUICom=new Sprite();

        addChild(mapUICom)
        addChild(iconUICom)
        addChild(castleUICom)
        addChild(heroIslandCom)
        addChild(palyerUICom)
    }
    private function nodeListHandler(nodes : Vector.<Button>) : void{

        if (_flag != MapEvent.CITY) {
            while (iconUICom.numChildren > 0) {
                iconUICom.removeChildAt(0);
            }
        }
        if (_flag != MapEvent.CASTLE) {
            while (castleUICom.numChildren > 0) {
                castleUICom.removeChildAt(0);
            }
        }
        if (_flag != MapEvent.HEROISLAND) {
            while (heroIslandCom.numChildren > 0) {
                heroIslandCom.removeChildAt(0);
            }
        }
        nodeAddEvent(nodes);
    }
    private function nodeRemoveEvent(nodes : Vector.<Button>) : void {
        for (var i : int=0;i < nodes.length;i++) {
            var node : Button = nodes[i];
            if(node.clickHandler)
            {
                node.clickHandler.clear();
                node.clickHandler=null;
            }
        }

        _nodeList=new Vector.<NodeData>();
    }

    private function nodeAddEvent(nodes : Vector.<Button>) : void {
        for(var i:int=0;i<nodes.length;i++){
            updateNode(nodes[i]);
        }

        loadOver = true;
    }

    private var nodeInfoDic:Dictionary = new Dictionary();

    function  updateNode(node:Button){

        var buildId:int=parseInt(node.name);
        var tmp:String="";
        var nodeVo= ArrayUtil.find(ConfigManager.instance.scene_build.config.normal.build,function(s:IBuild_config_normal_build){
            return s.id==buildId});

        var  buildLang:IBuildLang_lang= ArrayUtil.find(ConfigManager.instance.scene_buildLang.lang,function(s:IBuildLang_lang){
            return s.id==parseInt(nodeVo.name)});
        node.label=buildLang.txt+tmp ;
        if(  node.clickHandler){
            node.clickHandler.clear();
            node.clickHandler=null;
        }

        if(node.getChildByName("CityWarNodeItem") == null)
        {
            var nodeInfo:CityWarNodeItem = new CityWarNodeItem();
            nodeInfo.name = "CityWarNodeItem";
            node.addChild(nodeInfo);
            nodeInfo.y = - nodeInfo.height;
            nodeInfo.x = - 50;
            nodeInfoDic.set(buildId,nodeInfo);
        }


//        nodeInfo.ui.mainBox.on(Event.CLICK,this,node_clickHandler,[buildId,node]);
        node.clickHandler=Handler.create(this,node_clickHandler,[buildId,node],false);
        nodeList.push(new NodeData(buildId,node.x+node.width/2,node.y));
//        node.hitArea=new Rectangle(0,-100,node.width,node.height+100)
//        node.hitArea=new Rectangle(0,0,206,50);


    }

    private var loadOver:Boolean;
    private  function  node_clickHandler(buildId:int,node:Button){

        var nodeInfo:CityWarNodeItem = node.getChildByName("CityWarNodeItem") as CityWarNodeItem;
        if(nodeInfo && nodeInfo.nodeVo.fightStatus == 1)
        {
            trace("已击败----");
            return;
        }

        trace(buildId);
        var type : String = MapLoaderEvent.ACCESS_SCENE;
        if (_flag == MapEvent.COUNTRY) {
            type = MapLoaderEvent.ACCESS_SCENE;
        } else if (_flag == MapEvent.CITY) {
            type =  MapLoaderEvent.ACCESS_BUILD;
        } else if (_flag == MapEvent.CASTLE) {
            type =  MapLoaderEvent.ACCESS_CASTLE;
        } else if (_flag == MapEvent.HEROISLAND) {
            type =  MapLoaderEvent.ACCESS_HEROISLAND;
        }

        getNodeInfoSignal.dispatch([buildId]);
        //丢信号
        onEventSignal.dispatch(new MapLoaderEvent(type,getDataByTarget(buildId)))
    }
    private function getDataByTarget(buildId:int) : NodeData {
        for(var i:int=0;i<nodeList.length;i++){
            var node:NodeData=nodeList[i];
            if ( node.id== buildId) {
                return node;
            }
        }
        return null;
    }
    function  getNodes(city:View):Vector.<Button>{
        var temp:Vector.<Button>=new Vector.<Button>();
        for(var i:int=0;i<city._childs.length;i++){
            var node=city._childs[i];
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
    override public function getMediator():BaseMediator {
        return new MapLoaderMediator(this);
    }

    public function setTaskData(value:Array):void {
        
    }

    public function get nodeList():Vector.<NodeData> {
        return _nodeList;
    }
    public function set nodeList(__nodeList:Vector.<NodeData>):void {
        _nodeList = __nodeList;
    }
    public function goNode(body:Object):void {
        goNodeSignal.dispatch(body);
    }

    public function get flag():String {
        return _flag;
    }

    public function set flag(value:String):void {
        _flag = value;
    }



    override public function dispose():void {
        super.dispose();

        if(myEffMc)
        {
            removeFangLiuguangEffFromNode();
        }

    }


    //--------------------------------------------------------------------------------//
    private function createEffOnNode():EffectPlayer{
//        var mc:EffectPlayer = Pool.getItemByClass("mapNodeEff", EffectPlayer);
        var mc:EffectPlayer = new EffectPlayer();
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
        return mc;
    }

    /**  */
    private function removeFangLiuguangEffFromNode():void{
        if(myEffMc){
            myEffMc.stop();
            myEffMc.removeSelf();
//            Pool.recover("mapNodeEff",mc);
            myEffMc = null;
        }
    }


}
}
