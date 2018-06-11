/**
 * Created by guanll on 2017/10/20.
 */
package com.game.common.view {
import com.preset.loading.events.LoadingEvent;
import com.preset.loading.vo.LoadResDefine;
import com.signal.SignalDispatcher;

import laya.ui.Button;

import laya.ui.Dialog;
import laya.ui.View;
import laya.utils.Handler;

import org.puremvc.as3.patterns.facade.Facade;
import com.game.common.mvc.BaseMediator;

import utils.ArrayUtil;

public class BaseDialog extends Dialog{
    private var _content:View;

    public var onCloseSignal:SignalDispatcher;
    public var onCompleteSignal:SignalDispatcher;

    var isInit:Boolean = false;
    protected var isComplete:Boolean=false;
    var mediator:BaseMediator;

    var tryShow:Boolean;
    var tryPopup:Boolean;
    var $closeOther:Boolean;
    protected var isDispose:Boolean = false;
    public function BaseDialog(resArray:Array = null) {
        super();
        onCloseSignal = new SignalDispatcher();
        onCompleteSignal = new SignalDispatcher();
        if (resArray == null || resArray.length == 0) {
            callLater(     $onComplete);
        }
        else {
          callLater(    loadRes,[resArray]);
        }
    }

    protected function loadRes(res:Array):void {
        var resName:String = res.shift()+"正在加载中……";
        var resDefine:LoadResDefine = new LoadResDefine(res, resName, Handler.create(this, $onComplete));
        Facade.getInstance().notifyObservers(new LoadingEvent(LoadingEvent.LOADING_START, resDefine));
    }

    /* 非模式窗口 不显示遮罩 */
    override public function show(closeOther:Boolean = false ):void {
        tryShow = true;
        $closeOther = closeOther;
        if(isComplete){
            super.show(closeOther);
        }
    }

    /* 模式窗口 显示遮罩 */
    override public function popup(closeOther:Boolean = false):void {
        tryPopup = true;
        $closeOther = closeOther;
        if(isComplete){
            super.popup(closeOther);
        }
    }

    public function getView() {
        return mediator.getViewComponent();
    }

    public function getMediator():BaseMediator {
        return null;
    }

    public function $onComplete():void {
        if (isInit) return;
        isInit = true;
        setContent();
        initMediator();
        isComplete=true;
        onComplete();
    }

    public function setContent():void{
        //setUI(null);
        setButtons();
        refresh();
    }

    protected function onComplete():void{
        if(tryShow){
            show($closeOther);
        }
        if(tryPopup){
            popup($closeOther);
        }
    }

    public function setUI(view:*):void{
        _content = view;
        addChild(_content);
    }

    public function dispose():void{

    }

    public var closeBtn:Button;
    public var sureBtn:Button;
    public var cancelBtn:Button;
    public var noBtn:Button;
    public var okBtn:Button;
    public var yesBtn:Button;
    protected function setButtons():void{
        if(!_content){
            return;
        }
        closeBtn = _content.removeChildByName(Dialog.CANCEL) as Button;
        sureBtn = _content.removeChildByName(Dialog.SURE) as Button;
        cancelBtn = _content.removeChildByName(Dialog.CANCEL) as Button;
        noBtn = _content.removeChildByName(Dialog.NO) as Button;
        okBtn = _content.removeChildByName(Dialog.OK) as Button;
        yesBtn = _content.removeChildByName(Dialog.YES) as Button;

        if(closeBtn){
            addChild(closeBtn);
        }
        if(sureBtn){
            addChild(sureBtn);
        }
        if(cancelBtn){
            addChild(cancelBtn);
        }
        if(noBtn){
            addChild(noBtn);
        }
        if(okBtn){
            addChild(okBtn);
        }
        if(yesBtn){
            addChild(yesBtn);
        }
    }

    public function initMediator():void {
        mediator = getMediator();
        Facade.getInstance().registerMediator(mediator);
        if (onCompleteSignal)onCompleteSignal.dispatch(getView());
    }

    override public function onClosed(type:String = null):void{
        if(isDispose)return;
        isDispose=true;
        //closeHandler已经处理完了
        if (mediator != null){
            Facade.getInstance().removeMediator(mediator.getMediatorName());
        }
        onCloseSignal.dispose();
        onCloseSignal = null;
        onCompleteSignal.dispose();
        onCompleteSignal = null;
        mediator = null;


        dispose();
        if(_content){
            _content.destroy();
            _content=null;
        }
    }

    public function refresh():void{

    }
}
}
