package com.game.common.operation {
import com.game.common.operation.*;
import com.game.module.battle.model.FfConstant;
import com.tween.KTween;

/**
 * @author dougluo
 */
public class TimeoutOper extends Oper {
    private var timeout:int;

    public function TimeoutOper(timeout:int = 0) {
        super();
        if (timeout < 0)
            timeout = 0;
        this.timeout = timeout;
    }

    override public function do_execute():void {
        super.do_execute();

        if (timeout < 0)
            return;
        var delay:Number=timeout / FfConstant.TIME_SCALE;
        //  timeoutId = setTimeout(result, timeout);

        Laya.timer.once(delay, this, end)
    }

    override protected function do_end():void {
        super.do_end();
        //    clearTimeout(timeoutId);
    }

    override protected function do_halt():void {
        Laya.timer.clear(this, end)
        super.do_halt();
    }
}
}