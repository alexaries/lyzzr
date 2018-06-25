/**
 * Created by dingcj on 2018/6/23.
 */
package com.game.module.copy.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.operation.Oper;
import com.game.common.operation.TweenOper;
import com.game.common.view.BaseFrame;
import com.game.module.copy.mediator.CopyMopMediator;
import com.game.module.copy.view.items.CopyMopItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Image;

import ui.copy.CopyMopViewUI;

public class CopyMopView extends BaseFrame {

    private var ui:CopyMopViewUI;
    private var _count:int;
    private var _copyId:int;

    public var clickSignal:SignalDispatcher;
    private var copyArr:Array = [];//扫荡的数据
    private var itemArr:Array = [];//扫荡现在items

    private var oper:Oper;
    private var intervalTime:int = 800;

    private var _isFinished:Boolean = false;
    private var index:int = 0;
    private var itemHeight:int = 360;

    public function CopyMopView() {
        super([]);
        clickSignal = new SignalDispatcher();

        _isFinished = false;
        index = 0;
    }

    override public function getMediator():BaseMediator {
        return new CopyMopMediator(this);
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

        ui = new CopyMopViewUI();
        this.addChild(ui);
        init();

        if (_data == null)return;
        this._count = _data[0];
        this._copyId = _data[1];

        adapt();
    }

    private function adapt():void {
        setContent(ui);
    }

    private function init():void {
        this.ui.bg.on(Event.CLICK, this, onClick);
    }

    private function onClick():void {
        if (clickSignal)clickSignal.dispatch(null);
    }

    public function mopUp(arr:Array):void {
        this.copyArr = arr;

        //做测试
        this.copyArr = [];
        var len:int = count;
        for (var i = 0; i < len; i++) {
            copyArr.push("。。" + i);
        }

        mop();
    }

    private function mop():void {
        if (copyArr == null || copyArr.length == 0) {
            if (!isFinished) {
                finish();
                _isFinished = true;
            }
            return;
        }
        var info:Object = copyArr[0];

        var item:CopyMopItem = new CopyMopItem();
        ui.panel.addChild(item);
        item.initInfo(index);
        item.pos(0, index * itemHeight);

        copyArr.shift();

        var toValue:int = index >= 2 ? 2000 : 0;
        scrollTo(toValue);
        index++;
    }

    public function finishImmediatly():void {
        intervalTime = 100;
    }

    private function scrollTo(toValue:int):void {
        if (oper) {
            oper.halt();
            oper = null;
        }
        oper = new TweenOper(ui.panel.vScrollBar, intervalTime, {value: toValue}, null);
        oper.onCompleteSignal.getSignal(this).listen(mop);//结束了 就再来一次
        oper.do_execute();
    }

    private function finish():void {
        var img:Image = new Image("surface/iconditiao2.png");
        img.size(1080, 360);
        img.pos(0, index * itemHeight);
        ui.panel.addChild(img);
        scrollTo(2000);
    }

    public function get count():int {
        return _count;
    }

    public function get copyId():int {
        return _copyId;
    }

    public function get isFinished():Boolean {
        return _isFinished;
    }

    override public function dispose():void {
        super.dispose();
        if (clickSignal)clickSignal.dispose();
        if (oper) {
            oper.halt();
            oper = null;
        }

        itemArr.forEach(function (item:CopyMopItem) {
            item.destroy();
        });
        itemArr = [];
        copyArr = [];

        this.ui.bg.off(Event.CLICK, this, onClick);
    }
}
}