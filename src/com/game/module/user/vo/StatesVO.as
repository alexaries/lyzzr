/**
 * Created by huangcb on 2017/8/19.
 */
package com.game.module.user.vo {
import config.ConfigManager;
import config.userInfo.states.IStates_states_state;

import net.consts.StaticConfig;

import utils.ArrayUtil;

public class StatesVO {
    protected var _id:int = -1;	//状态类型
    public var remain:int;	//状态剩余时间
    public var nameStr:String;
    public var imgStr:String;
    public var desc:String = "";
    public var isFighterBuff:Boolean = false;

    public function StatesVO() {

    }

    public function set id(value:int):void {
        _id = value;
        var stateXmlList = ConfigManager.instance.userInfo_states.states.state;
        var stateXml:IStates_states_state = ArrayUtil.find(stateXmlList, function (vo:IStates_states_state) {
            return vo.id == value;
        })
        if (stateXml != null) {
            imgStr = StaticConfig.httpServer + stateXml.imgsrc;
            nameStr = stateXml.name;
            desc = stateXml.desc;
        }
    }

    public function get id():int {
        return _id;
    }
}
}
