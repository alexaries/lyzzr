/**
 * Created by guanll on 2018/3/30.
 */
package com.game.module.share.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.module.share.mediator.WechatFocusMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;

import laya.net.Loader;

import net.consts.AppConst;

import ui.share.WechatFocusViewUI;

public class WeChatFocusView extends BaseWindow {

    public var ui:WechatFocusViewUI;
    public var clickBtnSignal:SignalDispatcher;

    public function WeChatFocusView() {
        clickBtnSignal = new SignalDispatcher();
        super(["微信关注素材",
            {url:"module/share/H5.jpg",type:Loader.IMAGE},
            {url:AppConst.atlasPath+"module/share.json",type:Loader.ATLAS},
            {url:"module/share/wechatqr.jpg",type:Loader.IMAGE}]);
    }

    override public function dispose():void {
        clickBtnSignal.dispose();
        clickBtnSignal = null;
        ui.btnClose.off(Event.CLICK,this,dispose);
        ui.btnInfo.off(Event.CLICK,this,btnPrizeClickHandler);
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new WechatFocusMediator(this);
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
        ui = new WechatFocusViewUI();
        addChild(ui);

        ui.btnClose.on(Event.CLICK,this,dispose);
        ui.btnInfo.on(Event.CLICK,this,btnPrizeClickHandler);

        this.x = AppConst.padX;
    }

    private function btnPrizeClickHandler():void {
        clickBtnSignal.dispatch(null);
    }
}
}