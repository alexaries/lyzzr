/**
 * Created by guanll on 2018/1/16.
 */
package com.game.module.share.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.share.event.ShareEvent;
import com.game.module.share.view.ShareView;
import com.game.module.share.vo.ShareVO;

import globals.PlatformSDK;

import laya.utils.Handler;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class ShareMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "ShareMediator";

    private function get view():ShareView {
        return getViewComponent() as ShareView;
    }

    public function ShareMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
    }

    private function instanceCompleteHander():void {
        view.clickBtnSignal.getSignal(this).listen(clickBtnHandler);
        Laya.timer.callLater(this,genInfo);
    }

    private function genInfo():void{
        dispatch(new ShareEvent(ShareEvent.GET_INFO));
    }

    private function clickBtnHandler():void {
        if(view.status == 0){
            //分享
            PlatformSDK.getInstance().startShare(Handler.create(this,shareSuccHandler));
        }else if(view.status > 0){
            //领奖
            dispatch(new ShareEvent(ShareEvent.SHARE_GET_PRIZE));
        }
    }

    private function shareSuccHandler():void {
        dispatch(new ShareEvent(ShareEvent.SHARE_SUCCESS));
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [ShareEvent.GET_MSG_FROM_SERVER];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var vo:ShareVO;
        switch (name) {
            case ShareEvent.GET_MSG_FROM_SERVER:
                vo = body as ShareVO;
                view.status = vo.sharetime;
                break;
        }
    }
}
}