/**
 * Created by guanll on 2018/1/16.
 */
package com.game.module.share.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.module.gift.view.GoodsIcon;
import com.game.module.share.mediator.FocusMediator;
import com.signal.SignalDispatcher;

import globals.PlatformSDK;

import laya.events.Event;
import laya.net.Loader;
import laya.utils.Handler;

import net.consts.AppConst;
import net.consts.StaticConfig;

import ui.share.FocusViewUI;

public class FocusView extends BaseWindow {
    public var ui:FocusViewUI;
    private var _status:int;//0:未关注,时间戳:已关注,UInt32(-1):已经领奖
    public var clickBtnSignal:SignalDispatcher;

    public function FocusView() {
        clickBtnSignal = new SignalDispatcher();
        super(["关注素材",{url:"module/share/bg1.png",type:Loader.IMAGE}]);
    }

    override public function dispose():void {
        clickBtnSignal.dispose();
        clickBtnSignal = null;
        ui.goodsList.renderHandler.clear();
        ui.goodsList.renderHandler = null;
        ui.goodsList.destroy(true);
        ui.btnClose.off(Event.CLICK,this,dispose);
        ui.btnPrize.off(Event.CLICK,this,btnPrizeClickHandler);
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new FocusMediator(this);
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
        ui = new FocusViewUI();
        addChild(ui);

        ui.goodsList.itemRender = GoodsIcon;
        ui.goodsList.renderHandler = Handler.create(this, goodsRenderHandler,null,false);
//        道具ID	道具数量
//        799	100
//        503	5
//        400	5

        var giftArr:Array = [];
        giftArr.push({itemid: 799, itemNum: 100});
        giftArr.push({itemid: 503, itemNum: 5});
        giftArr.push({itemid: 400, itemNum: 5});
        ui.goodsList.array = giftArr;

        ui.btnClose.on(Event.CLICK,this,dispose);
        ui.btnPrize.on(Event.CLICK,this,btnPrizeClickHandler);

        this.x = AppConst.padX;
    }

    private function btnPrizeClickHandler():void {
        clickBtnSignal.dispatch(null);
    }

    private function goodsRenderHandler(cell:GoodsIcon,index:int):void {
        cell.setData(ui.goodsList.array[index]);
        cell.visible = true;
    }

    public function get status():int {
        return _status;
    }

    public function set status(value:int):void {
        _status = value;

        ui.btnPrize.gray = false;
        if(StaticConfig.platform == PlatformSDK.AWY){
            ui.txtTitile.text = "关注有礼";
            ui.txtTips.text = "";
        }else if(StaticConfig.platform == PlatformSDK.QZONE || StaticConfig.platform == PlatformSDK.QZONE_IOS){
            ui.txtTitile.text = "收藏有礼";
            ui.txtTips.text = "点击浮动按钮发送到桌面！注：IOS及某些安卓机型不支持！";
        }
        if(_status == 0){
            if(StaticConfig.platform == PlatformSDK.AWY){
                ui.btnPrize.label = "扫码关注";
            }else if(StaticConfig.platform == PlatformSDK.QZONE || StaticConfig.platform == PlatformSDK.QZONE_IOS){
                ui.btnPrize.label = "收藏到桌面";
            }
        }else if(_status == -1){
            ui.btnPrize.label = "已领取";
            ui.btnPrize.gray = true;
        }else{
            ui.btnPrize.label = "领取奖励";
        }
    }
}
}