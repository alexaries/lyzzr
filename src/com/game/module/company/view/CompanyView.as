/**
 * Created by dingcj on 2018/6/15.
 */
package com.game.module.company.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.module.company.mediator.CompanyMediator;

public class CompanyView extends BaseWindow {

    public function CompanyView() {
        super([]);
    }

    override public function dispose():void {
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new CompanyMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {

    }

}
}