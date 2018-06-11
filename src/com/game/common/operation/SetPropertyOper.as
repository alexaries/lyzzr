/**
 * Created by huangcb on 2017/8/29.
 */
package com.game.common.operation {
import com.game.common.operation.*;
 
public class SetPropertyOper extends Oper {
    public var target:Object;
    public var params:Object;

    public function SetPropertyOper(_target:Object, _param2:Object) {
        super();
        target = _target;
        params = _param2;
    }

    override public function do_execute():void {
        super.do_execute();
        for (var attr in params) {
            target[attr] = params[attr];
        }
        end();
    }

    override protected function do_end():void {
        super.do_end();
        target = null;
    }

    override protected function do_halt():void {
        super.do_halt();
        target = null;
    }
}
}
