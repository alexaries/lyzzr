/**
 * Created by huangcb on 2017/8/28.
 */
package com.game.common.operation {
import com.game.common.operation.*;

public class FunctionOper extends Oper {
    private var ower:Object;
    private var showSkillEffect:Function
    private var showHaltSkillEffect:Function
    private var args:Array = null;

    public function FunctionOper(_ower:Object, _showSkillEffect:Function, _args:Array = null,_showhaltSkillEffect:Function=null) {
        ower = _ower;
        showSkillEffect = _showSkillEffect;
        args = _args;
        showHaltSkillEffect=_showhaltSkillEffect;
    }

    override public function do_execute():void {
        super.do_execute();
        showSkillEffect.apply(ower, args);
        end();



    }

    override protected function do_halt():void {
        super.do_halt();
        showSkillEffect = null;
        if(showHaltSkillEffect){
            showHaltSkillEffect.apply(ower, args);
            showHaltSkillEffect=null;
        }

        ower = null;
        args = null;
    }

    override protected function do_end():void {
        super.do_end();
        showHaltSkillEffect=null;
        showSkillEffect = null;
        ower = null;
        args = null;
    }
}
}
