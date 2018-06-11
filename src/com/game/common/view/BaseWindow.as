package com.game.common.view {
import com.game.common.mvc.BaseMediator;
import com.game.consts.BaseLayer;
import com.preset.loading.events.LoadingEvent;
import com.preset.loading.vo.LoadResDefine;
import com.signal.SignalDispatcher;

import laya.ui.Component;
import laya.utils.Handler;

import net.consts.AppConst;

import org.puremvc.as3.patterns.facade.Facade;

public class BaseWindow extends Component {
    public var menuWinTypeName:String;
    public var userlevel:int;
    public var onCompleteSignal:SignalDispatcher;
    public var onDisposeSignal:SignalDispatcher;
    public var onVisibleSignal:SignalDispatcher;
    public var onShowSignal:SignalDispatcher;
    public var onHideSignal:SignalDispatcher;
    protected var _data:Object;
    var resDefine:LoadResDefine;
    var mediator:BaseMediator;
    private var _layer:int;
    var isTryDispose:Boolean;
    var isDispose:Boolean = false;
    var isInit:Boolean = false;
    protected var isComplete:Boolean = false;
    protected var onlyHide:Boolean = false;
    private var _toolBarSelectedIndex:int;
    public function get toolBarSelectedIndex():int {
        return _toolBarSelectedIndex;
    }

    public function set toolBarSelectedIndex(value:int):void {
        _toolBarSelectedIndex = value;
    }

    public var $resArray:Array;

    public function BaseWindow(resArray:Array = null) {
        super();
        $resArray = resArray;
        base_init();
    }

    public function base_init():void {

        $base_init();
        startLoad();
    }

    public function $base_init():void {

        _toolBarSelectedIndex = 0;
        onCompleteSignal = new SignalDispatcher();
        onDisposeSignal = new SignalDispatcher();
        onVisibleSignal = new SignalDispatcher();
        onShowSignal = new SignalDispatcher();
        onHideSignal = new SignalDispatcher();


        layer = BaseLayer.WINDOW;
    }

    public function startLoad():void {
        if ($resArray == null || $resArray.length == 0) {
            callLater($onComplete);
        }
        else {
            callLater(loadRes, [$resArray]);
        }

    }

    public function removeRes():void {
        if (resDefine != null)
            Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_REMOVE, resDefine));
        resDefine = null;
    }

    /* 子类重写该方法 默认加载需要加载条 否则使用laya自带的load直接加载 不会显示加载条 */
    protected function loadRes(res:Array):void {
        var resName:String = res.shift() + "正在加载中……";
        resDefine = new LoadResDefine(res, resName, Handler.create(this, $onComplete), 2, Handler.create(this, $onResError));
        Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_START, resDefine));
    }

    private function $onResError():void {
        tryDispose();
    }

    public function show():void {
        if (isDispose) {
            return;
        }
        visible = true;

        onShowSignal.dispatch(null)
    }

    override public function set visible(value:Boolean):void {
        super.visible = value;
        onVisibleSignal.dispatch(value);
    }

    public function relive():void {
        if (isTryDispose)
            isTryDispose = false;
    }

    public function hide():void {
        if (isTryDispose) {
            if (onlyHide) {
                isTryDispose = false;
            }
        }
        if (isDispose) {
            return;
        }
        visible = false;
        onHideSignal.dispatch(null)
    }

    public function getView() {
        return mediator.getViewComponent();
    }

    public function getMediator():BaseMediator {
        return null;
    }

    public function center() {
        x = AppConst.width / 2 - width / 2;
        y = AppConst.height / 2 - height / 2;
    }

    public function $$$onComplete():void {

    }

    public function $onComplete():void {
        if (isInit) return;
        isInit = true;

        $$$onComplete();
        onComplete();

        $$$$onComplete();
        isComplete = true;
        if (isTryDispose) {
            if (onlyHide) {
                hide();
                return;
            }
            $$dispose();
            return;
        }
    }

    protected function $$$$onComplete():void {

    }

    public function onComplete():void {
        mediator = getMediator();
        Facade.getInstance().registerMediator(mediator);

        onCompleteSignal.dispatch(getView());
    }

    public function tryDispose():void {
        if (isTryDispose)return;
        isTryDispose = true;
        removeSelf();
        if (isInit == false)return;
        if (onlyHide) {
            hide();
            return;
        }
        dispose();
    }

    public function dispose():void {

        $$dispose();

    }

    protected function $$dispose():void {
        if (onlyHide) {
            hide();
            return;
        }
        if (isDispose)return;
        isDispose = true;
        if (mediator != null)
            Facade.getInstance().removeMediator(mediator.getMediatorName());

        removeRes();
        onDisposeSignal.dispatch(menuWinTypeName);
        onCompleteSignal.dispose();
        onDisposeSignal.dispose();
        onVisibleSignal.dispose();
        onShowSignal.dispose();
        onHideSignal.dispose();
        onCompleteSignal = null;
        onDisposeSignal = null;
        onVisibleSignal = null;
        onShowSignal = null;
        onHideSignal = null;
        mediator = null;

        destroy(true);
    }

    public function setData(value:Object):void {
        _data = value;
    }

    public function set layer(value:int):void {
        zOrder = _layer = value;

    }

    public function get layer():int {
        return _layer;
    }
}
}
