/**
 * Created by huangcb on 2017/10/19.
 */
package com.game.common.vo {
import config.mission.openfunc.IOpenfuncCfg;


public class BaseMenuVO {
    public  var name:String;
    public var openfunc:IOpenfuncCfg;
    public function BaseMenuVO(name:String  ) {

        super ();
        this.name=name;
    }
}
}
