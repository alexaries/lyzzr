package com.game.common.view {
import com.game.common.mvc.BaseMediator;
import com.signal.SignalDispatcher;

import laya.display.Sprite;
import laya.events.Event;
import laya.ui.Button;
import laya.ui.ViewStack;
import laya.utils.HitArea;

import net.consts.AppConst;

public class BaseFrame extends BaseWindow {
    var $ui:Sprite;
    var views:Array = []

    private var _backbtn:Button = null;
    private var _clickBackSignal:SignalDispatcher = null;

    public function get clickBackSignal():SignalDispatcher {
        if (_clickBackSignal == null)
            _clickBackSignal = new SignalDispatcher();
        return _clickBackSignal;
    }

    public function BaseFrame(resArray:Array = null) {
        super(resArray);
    }

    override public function dispose():void {
        if (_backbtn) {
            _backbtn.off(Event.CLICK, this, clickback);
            _backbtn.removeSelf();
			_backbtn = null;
        }
        if (_clickBackSignal)_clickBackSignal.dispose();
        super.dispose();
    }

    public function addback(posX:Number = 38, posY:Number = 15):void {
        if (_backbtn == null) {

            _backbtn = new Button("button/btn_fanhui.png");
            _backbtn.stateNum = 1;

            _backbtn.pos(posX, posY);
            this.addChild(_backbtn);

            _backbtn.on(Event.CLICK, this, clickback);
        }
    }

    private function clickback():void {
        clickBackSignal.dispatch(null);
    }

    override public function base_init():void {
        $base_init();
    }

    override protected function $$dispose():void {
        if (isComplete) {
            for (var i:int = 0; i < views.length; i++) {
                var object__ = views[i];
                if (object__ instanceof  BaseWindow || object__ instanceof  BaseView) {
                    object__.tryDispose();
                }
            }
            views = null;
            if ($ui instanceof  BaseWindow || $ui instanceof  BaseView) {
                var $ui__ = $ui;
                $ui__.tryDispose();
                $ui = null;
            }
            else {
                $ui.destroy();
                $ui = null;
            }
        }

        super.$$dispose();
    }

    override public function getMediator():BaseMediator {
        return super.getMediator();
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        //设置基础框架
        super.onComplete();
    }

    public function setContent(ui:Sprite):void {
        $ui = ui;
        layout();
    }

    public function getContent():Sprite {
        return $ui;
    }

    public function layout():void {
        if (!$ui) {
            return;
        }
        $ui.width = AppConst.fullScreenWidth;
        $ui.height = AppConst.height - AppConst.topBannerHeight;
        $ui.x = (AppConst.width - AppConst.fullScreenWidth) / 2;
        $ui.y = 0;//AppConst.topBannerHeight;
    }

    override protected function $$$$onComplete():void {
        super.$$$$onComplete();
    }

    override public function $$$onComplete():void {
        setContent(new ViewStack());
        this.width = AppConst.width;
        this.height = AppConst.height;
        var hitArea:HitArea = new HitArea();
        this.hitArea = hitArea;
        hitArea.hit.drawRect(0, 0, AppConst.width, AppConst.height, "#000000");
    }

    public function tryClose():void {
        tryDispose();
    }

    public function getOpenfunc(index:int):* {
        return null;
//        return ConfigLocator.getInstance().getOpenfunc(menuWinTypeName, index);
    }

    public function checkOpenfunc(index:int, isRoll:Boolean = true):Boolean {
        return true;
//        var openfuncCfg:IOpenfuncCfg = getOpenfunc(index);
//        if (openfuncCfg && userlevel < openfuncCfg.level) {
//            if (isRoll) {
//                Alert.roll(" 等级达到" + openfuncCfg.level + "可以开启" + openfuncCfg.name);
//            }
//            return false;
//        }
//        return true
    }
}
}