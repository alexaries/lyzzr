/**
 * Created by dingcj on 2017/8/21.
 */
package com.game.common.view {
import com.game.common.mediator.CalculatorMediator;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.ui.Dialog;
import laya.utils.Handler;

import com.game.common.mvc.BaseMediator;

import ui.hotel.CalculatorUI;

public class CalculatorView extends BaseDialog {
    private var ui:CalculatorUI;
    //最大位数
    private var max:int = 6;

    public var sureClick:SignalDispatcher;

    public function CalculatorView() {
        sureClick = new SignalDispatcher();
        super();
    }

    override public function getMediator():BaseMediator {
        return new CalculatorMediator(this);
    }

    override public function dispose():void {
        closeHandler.clear();
        closeHandler = null;

        sureClick.dispose();
        sureClick = null;

        removeEventHandler();
    }

    override public function setContent():void {
        ui = new CalculatorUI();
        setUI(ui);
        super.setContent();

        addEventHandler();
    }

    private function addEventHandler():void {
        closeHandler = Handler.create(this, doCloseHandler);
        ui.list.mouseHandler = new Handler(this, onMouseItem);
    }

    private function removeEventHandler():void {
        if(ui.list.mouseHandler){
            ui.list.mouseHandler.clear();
        }
        ui.list.mouseHandler = null;
    }

    override public function refresh():void{
        ui.numLabel.text = "" + 0;
        ui.list.repeatX = 4;
        ui.list.repeatY = 3;
        var arr:Array = [];
        for (var i:int = 0; i < 9; i++) {
            arr.push({btn: "" + (i + 1)});
        }
        arr.push({btn: "0"});
        arr.push({btn: "←"});
        arr.push({btn: "确定"});
        ui.list.array = arr;
        ui.list.selectEnable = true;
    }

    private function doCloseHandler(type:String):void {
        if (type == Dialog.SURE) {
            sure();
        }
    }

    private function onMouseItem(e:Event, index:int):void {
        if (e.type == Event.CLICK) {
            if (index == 11) {
                //确定
                close(Dialog.SURE);
            }
            else if (index == 10) {
                //回退一步
                remove();
            }
            else if (index == 9) {
                //加个0
                add(0);
            }
            else {
                //index+1
                add(index + 1);
            }
        }
    }

    private function add(index):void {
        var str:String = ui.numLabel.text;
        if (str.length >= max)return;
        if (str == '0') {
            ui.numLabel.text = "" + index;
        }
        else {
            ui.numLabel.text = str + index;
        }
    }

    private function remove():void {
        var str:String = ui.numLabel.text;
        if (str.length == 1) {
            ui.numLabel.text = "0";
        }
        else {
            ui.numLabel.text = str.substring(0, str.length - 1);
        }
    }

    private function sure():void {
        var num:Number = Number(ui.numLabel.text);
        sureClick.dispatch(num);
    }
}
}