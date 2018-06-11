package com.game.module.task.vo.item {
import com.game.module.task.struct.TaskNpcStruct;

/**
 * @author john
 */
public class TaskNpcItemVo {
    public var npc:TaskNpcStruct;
    private var _icons:Array

    public function TaskNpcItemVo() {
    }


    public function get levelStr():String {
        var str:String = "";
        switch (npc.type) {
            case 6:
                str = "??";
                break;
            default:
                str = String(npc.level);
                break;
        }
        return str;
    }

    public function get icons():Array {
        return _icons;
    }

    public function set icons(value:Array):void {
        _icons = value;
    }
}
}
