/**
 * Created by huangcb on 2017/10/14.
 */
package com.game.utils {
import com.game.common.view.BaseFrame;

import laya.display.Node;

public class GuideUtil {
    public function GuideUtil() {
    }
    public static function getOwerChildByName(owerName:String,owerChildName:String):Node {

        var ower:Node=getChildByName(owerName);
        if(ower!=Laya.stage){
            if(owerChildName.indexOf("frame_")!=-1 ||owerChildName.indexOf("menulist_")!=-1){
                while(ower!=Laya.stage&&!(ower is BaseFrame) ){
                    ower=ower.parent;
                }

            }
        }

        if(ower){
            var selectList:Array=[]
            addNodeByName(ower,owerChildName,selectList);
            if(selectList.length==0){
                return Laya.stage;
            }
            return selectList[0];
        }
        return  Laya.stage;
    }
    public static function getChildByName(owerName:String):Node {
        var selectList:Array=[]
        addNodeByName(Laya.stage,owerName,selectList);
        if(selectList.length==0){
            return Laya.stage;
        }
        return selectList[0];
    }
    //尽量少用
    public static function addNodeByName(node:Node,owerName:String,selectList:Array):void {
        for (var i:int = 0; i < node._childs.length; i++) {
            var object_node:Node = node._childs[i];
            if(object_node.name==owerName){
                selectList.push( object_node);
                break;
            }
            if(object_node.name=="noguide"){
                continue;
            }
            addNodeByName(object_node,owerName,selectList);
        }
    }
}
}
