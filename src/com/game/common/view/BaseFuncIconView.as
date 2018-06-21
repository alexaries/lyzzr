/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.common.view {
import com.game.vo.FuncOpenVO;
import com.signal.SignalDispatcher;

import laya.events.Event;

import laya.ui.Box;

import ui.main.icons.BaseFuncIconViewUI;

public class BaseFuncIconView extends Box {
    public var ui:BaseFuncIconViewUI;
    public var _vo:FuncOpenVO;
    public var isLocked:Boolean = true;  //是否锁住了
    private var signal:SignalDispatcher;

    public function BaseFuncIconView() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new BaseFuncIconViewUI();
        addChild(ui);

        this.ui.on(Event.CLICK, this, onClick);
    }

    private function onClick():void {
        if (signal)signal.dispatch([_vo]);
    }

    public function init(vo:FuncOpenVO, level:int, signal:SignalDispatcher):void {
        this._vo = vo;
        this.signal = signal;
        ui.nameLabel.text = _vo.name;
//        ui.icon.skin = _vo.imgUrl;
    }

    public function reset():void {
    }

    public function update(level:int):void {

    }

    public function updateIcon(url:String):void {
        ui.icon.skin = url;
    }

    public function updateBg(url:String):void {
        ui.bg.skin = url;
    }

    public function setBgSize(width:int, height:int):void {
        ui.bg.size(width, height);
    }

    public function setIconSize(width:int, height:int):void {
        ui.icon.size(width, height);
    }

    public function setBgPos(x:Number, y:Number):void {
        ui.bg.pos(x, y);
    }

    public function setIconPos(x:Number, y:Number):void {
        ui.icon.pos(x, y);
    }

    override public function destroy(b:Boolean = true):void {
        super.destroy(b);
        this.ui.off(Event.CLICK, this, onClick);
    }
}
}
