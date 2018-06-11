package com.game.common.operation {
import com.tween.KTJob;
import com.tween.KTween;
import com.tween.easing.Linear;

import laya.utils.Handler;

public class TweenOper extends Oper {
    public var target:Object;
    public var params:Object;
    public var time:int;
    var tween:KTJob;
    var tween_ease:Function

    public function TweenOper(_target:Object, _time:int, _param3:Object, _ease:Function = null) {
        target = _target;
        params = _param3;
        time = _time;
        tween_ease = _ease;
        if (tween_ease == null) {
            tween_ease = Linear.easeInOut;
        }
    }

    override public function do_execute():void {
        super.do_execute();
        var delay:Number = time / FfConstant.TIME_SCALE / 1000;
        tween = KTween.to(target, delay, params, tween_ease, Handler.create(this, end));
    }

    override protected function do_end():void {
        if (tween)
            tween.abort();
        if (target) {
            for (var attr in params) {
                target[attr] = params[attr];
            }
        }

        super.do_end();
        target = null;
    }

    override protected function do_halt():void {
        if (tween)
            tween.abort();
        //  Laya.timer.clear(this, end)
        if (target) {
            for (var attr in params) {
                target[attr] = params[attr];
            }
        }

        super.do_halt();
        target = null;
    }
}
}
