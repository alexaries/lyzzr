/**
 * Created by huangcb on 2017/8/21.
 */
package com.game.module.map.view {
import com.game.common.view.BaseView;
import com.game.module.map.mediator.MapOperatorMediator;
import com.game.module.map.vo.NodeData;
import com.signal.SignalDispatcher;

import laya.maths.Point;

import com.game.common.mvc.BaseMediator;

public class MapOperation  extends  BaseView{

    public  var setPlayerPointDispatcher:SignalDispatcher;
    public  var playerAutoLocIDDispatcher:SignalDispatcher;
    private var _nodeData : NodeData;
    public var goNodeSignal:SignalDispatcher;
    public function MapOperation() {
        setPlayerPointDispatcher=new SignalDispatcher();
        playerAutoLocIDDispatcher=new SignalDispatcher();
        goNodeSignal=new SignalDispatcher();
        super ([]);

    }

    override public function getMediator():BaseMediator {
        return new MapOperatorMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
    }





    public function showLoading(b:Boolean):void {

    }

    public function setPlayerPoint(nodeId:int):void {
        setPlayerPointDispatcher.dispatch(nodeId);
    }



    public function get nodeData():NodeData {
        return _nodeData;
    }

    public function set nodeData(value:NodeData):void {
        _nodeData = value;
    }

    public function playerAutoLocID(nodeID:int):void {
        playerAutoLocIDDispatcher.dispatch(nodeID);
    }

    public function goNode(body:Object):void {
        trace("@MapOperation goNode")
        goNodeSignal.dispatch(body);
    }
}
}
