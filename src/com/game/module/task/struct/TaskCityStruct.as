package com.game.module.task.struct {
import utils.StringUtil;

/**
 * @author john
 */
public class TaskCityStruct {
    public var id:int;
    public var name:String = "";

    public function get colorName():String {
        return StringUtil.substitute("<font color='#00eeee'>{0}</font>", [name]);
    }

    // public var status : int = 0;
    // public var type : int = 0;
    // public var info : String = "";
    // public var map : String = "";
    // public var defaultID : int = 1 ;
}
}
