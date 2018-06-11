package com.game.common.operation {
import com.component.MovieClipCustom;
import com.game.common.operation.Oper;
import com.game.module.battle.model.FfConstant;

/**
 * @author dougluo
 */
public class MovieClipOper extends Oper {

    private var animation:MovieClipCustom;

    public function MovieClipOper(mc:MovieClipCustom) {
        super();

        animation = mc;
    }

    override public function do_execute():void {
        super.do_execute();
        animation.timeScale = FfConstant.TIME_SCALE;
        animation.onCompleteSignal.getSignal(this).listen(end);

    }
    override protected function do_end():void {

        if(animation){
            animation.dispose();
            animation = null;
        }

        super.do_end();


    }

    override protected function do_halt():void {
        super.do_halt();

        if(animation){
            animation.dispose();
            animation = null;
        }
    }
}
}