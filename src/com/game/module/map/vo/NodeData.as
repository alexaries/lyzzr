/**
 * Created by huangcb on 2017/8/24.
 */
package com.game.module.map.vo {
public class NodeData {
    public  var x:Number;
    public  var y:Number;
    public var id:int;
    public function NodeData(buildId:int, x:Number, y:Number) {
        this.id=buildId
        this.x=x;
        this.y=y;

    }
}
}
