package com.game.common.view {
import com.game.utils.FuncUtil;
import com.game.vo.ActivityVO;
import com.signal.SignalDispatcher;

import config.mission.openfunc.IOpenfuncCfg;

import laya.events.Event;

import laya.ui.Box;

import ui.main.icons.BuildButtonUI;

public class BuildButtonView extends Box {
    public var ui:BuildButtonUI;
    public var gotoActivitySignal:SignalDispatcher;

    public var _vo:ActivityVO;
    public var isLocked:Boolean = false;  //是否锁住了
    private function gotoActivityHandler():void {
        if (isLocked) {
            if (_vo && _vo.openfunc.level) {
                Alert.roll("等级达到" + _vo.openfunc.level + "级开放！");
                return;
            }
            Alert.roll("该建筑暂未开放！");
            return;
        }
        gotoActivitySignal.dispatch([_vo]);
    }

    public function BuildButtonView() {
        super();
        gotoActivitySignal = new SignalDispatcher();
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BuildButtonUI();
        addChild(ui);

        this.ui.on(Event.CLICK, this, gotoActivityHandler);
    }

    override public function destroy(b:Boolean = true):void {
        super.destroy(b);
        gotoActivitySignal.dispose();
        gotoActivitySignal = null;
    }

    public function init(vo:ActivityVO, level:int):void {
        _vo = vo;
        ui.nameClose.innerHTML = "<span style='width:45px;margin: 0 auto;line-height:50px;font-size:40px;color:#373737;font-family:微软雅黑;align:center;'>" + _vo.name + "</span>";
        update(level);

        if (_vo.openfunc.guide_name) {
            this.name = _vo.openfunc.guide_name;
        } else {
            this.name = "";
        }

        ui.nameClose.innerHTML = "<span style='width:45px;margin: 0 auto;line-height:50px;font-size:40px;color:#373737;font-family:微软雅黑;align:center;'>" + "许愿树" + "</span>";
    }

    public function update(level:int):void {
        var cfg:IOpenfuncCfg = _vo.openfunc;

        if (cfg.level <= level && (!cfg.funcid || (cfg.funcid && FuncUtil.check(cfg.funcid)))) {
            //开放
            ui.close.visible = false;
            ui.btnOpen.visible = true;
            ui.btnOpen.skin = "main/icons/build_" + _vo.openfunc.priority + ".png";
            isLocked = false;
        } else {
            ui.close.visible = true;
            ui.btnOpen.visible = false;
            isLocked = true;
        }
    }
}
}
