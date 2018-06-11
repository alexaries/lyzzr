/**
 * Created by guanll on 2018/1/16.
 */
package com.game.module.share.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.share.event.ShareEvent;
import com.game.module.share.view.FocusView;
import com.game.module.share.vo.ShareVO;

import globals.PlatformSDK;

import laya.utils.Handler;

import net.consts.StaticConfig;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class FocusMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "FocusMediator";

    private function get view():FocusView {
        return getViewComponent() as FocusView;
    }

    public function FocusMediator(__viewComponent:Object = null) {
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
            if(StaticConfig.platform == PlatformSDK.AWY){
                //关注
                PlatformSDK.getInstance().showQRCode();
                view.dispose();
            }else if(StaticConfig.platform == PlatformSDK.QZONE || StaticConfig.platform == PlatformSDK.QZONE_IOS){
                PlatformSDK.getInstance().startSaveShortcut(Handler.create(this,saveSuccHandler));
            }
        }else if(view.status > 0){
            //领奖
            dispatch(new ShareEvent(ShareEvent.CONCERN_GET_PRIZE));
        }
    }

    private function saveSuccHandler():void {
        dispatch(new ShareEvent(ShareEvent.CONCERN_SUCCESS));//成功收藏到桌面
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
                view.status = vo.concerntime;
                break;
        }
    }
}
}