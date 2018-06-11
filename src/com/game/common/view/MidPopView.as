/**
 * Created by guanll on 2017/9/12.
 */
package com.game.common.view {
import com.game.common.mediator.MidPopMediator;
import com.game.common.mvc.BaseMediator;
import com.game.module.chargePopup.view.ChargePopupView;
import com.game.module.gold.view.CdKeyPresent;
import com.game.module.gold.view.CdKeyPresent2;
import com.game.module.gold.view.ShortcutBuyView;
import com.game.module.gold.view.ShortcutUseView;
import com.game.module.gold.vo.ShortcutBuyVO;

import laya.display.Sprite;

import net.consts.AppConst;

public class MidPopView extends BaseView {
    private var _mediator:MidPopMediator;

    public function MidPopView() {
        super();
    }

    override public function getMediator():BaseMediator {
        if (_mediator == null) {
            _mediator = new MidPopMediator(this);
        }
        return _mediator;
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        init();
    }

    override public function dispose():void {
        super.dispose();
    }

    private function init():void {
    }

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    public var shortCutView:ShortcutBuyView;

    public function showShortcutBuyView(arr:Array):void {
        var isShow:Boolean = arr[0];
        if (shortCutView && shortCutView.parent && !isShow) {
            shortCutView.close(null);
            return;
        }
        if (!isShow) {
            return;
        }
        shortCutView = new ShortcutBuyView();
        var shortcutData:ShortcutBuyVO = new ShortcutBuyVO();
        shortcutData.itemId = arr[1];
        if (arr[2] > 0) {//指定购买类型
            shortcutData.type = arr[2];
        }
        shortCutView.vo = shortcutData;
        shortCutView.popup(true);
    }

    public var shortCutUseView:ShortcutUseView;

    public function showShortcutUseView(arr:Array):void {
        var isShow:Boolean = arr[0];
        if (shortCutUseView && shortCutUseView.parent && !isShow) {
            shortCutUseView.close(null);
            return;
        }
        if (!isShow)return;
        shortCutUseView = new ShortcutUseView();
        shortCutUseView.itemid = arr[1];
        shortCutUseView.popup(true);
    }

    private var cdkeyView2:CdKeyPresent2;

    public function showGoldAd(isShow:Boolean):void {
        if (isShow && shortCutView == null) {
            cdkeyView2 = new CdKeyPresent2();
        }
        if (!cdkeyView2 && !isShow)
            return;
        showView(cdkeyView2, isShow);
    }

    private var cdkeyView:CdKeyPresent;

    public function showCdKeyView(isShow:Boolean):void {
        if (isShow && shortCutView == null) {
            cdkeyView = new CdKeyPresent();
        }
        if (!cdkeyView && !isShow)
            return;
        showView(cdkeyView, isShow);
    }

    private function showView(view:Sprite, isShow:Boolean):void {
        if (isShow && view) {
            if (!contains(view)) {
//                removeChildren();
                addChild(view);

                view.x = (AppConst.width - view.width) / 2;
                view.y = (AppConst.height - view.height) / 2;
//                if(view is ChargePopupView){
//                    view.x = int((RedSparkManager.STAGE_WIDTH-358)/2);
//                    view.y = int((RedSparkManager.STAGE_HEIGHT-288)/2);
//                }
                if ((view is ShortcutBuyView) && shortCutView.pos) {
                   // shortCutView.x = shortCutView.pos.x;
                  //  shortCutView.y = shortCutView.pos.y;
                }
//                if ((view is ShortcutBuyNewView) && shortCutNewView.pos) {
//                    shortCutNewView.x = shortCutNewView.pos.x;
//                    shortCutNewView.y = shortCutNewView.pos.y;
//                }
            }
        } else if (view) {
            if (view && contains(view)) {
                removeChild(view);
            }
        }
    }

    public var chargePop:ChargePopupView;

    /**
     *弹出充值成功面板
     *
     */
    public function showChargeSucessView(isShow:Boolean,data=9):void {
        if (chargePop && chargePop.parent && !isShow) {
            chargePop.close(null);
            return;
        }
        chargePop = new ChargePopupView();
        chargePop.type = data;
        chargePop.popup(true);
    }
}
}