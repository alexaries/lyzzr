package com.game.module.map.view {

/**
 * @author ryan
 */
public class MapPlayer extends Player {

    //Player行走方向   0表示正向  1表示 负方向
    private var _direction:int;
    //所要到达的节点ID
    private var _nodeId:int = -1;



    public function get direction():int {
        return _direction;
    }

    public function set direction(value:int):void {
        _direction = value;
    }

    public function get nodeId():int {
        return _nodeId;
    }

    public function set nodeId(value:int):void {
        _nodeId = value;
    }

    //移动到某个节点,id:节点ID;points:移动的点  单个节点
    public function goNode(id:int , points:Object = null):void {

        if (_nodeId == id) {
            //到达
            if (!running) {
                //todo
                moveOverDispatcher.dispatch(null);
            }
            return;
        }
        _nodeId = id;
        state = STATE_DEFAULT;
        go(points);
    }

    public function MapPlayer() {
        super();
    }
}
}
