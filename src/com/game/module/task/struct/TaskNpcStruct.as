package com.game.module.task.struct {
import com.game.module.map.vo.MapModel;

import com.game.utils.ShellUtils;
import utils.StringUtil;

/**
 * @author john
 */
public class TaskNpcStruct {
    public var id:uint;
    public var name:String;
    private var _title:String="";
    public var level:uint;
    public var type:uint;
    public var info:String;
    public var headId:uint;
    public var halfId:uint;
    public var buildId:uint;
    public var model:uint;


    public function get colorName():String {
        return StringUtil.substitute("<font color='#ff6600'>{0}</font>", [name]);
    }

    public function getCity(__mapmodel:MapModel):TaskCityStruct {
        return ShellUtils.cityById(__mapmodel, buildId);
    }

    public function getCityId(__mapmodel:MapModel):uint {
        return getCity(__mapmodel).id;
    }

    public function get title():String {
        if(_title==null) return "";
        return _title;
    }

    public function set title(value:String):void {
        _title = value;
    }
}
}
