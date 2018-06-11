package com.game.common.view {
import com.game.vo.ActivityVO;
import com.signal.SignalDispatcher;

import globals.ConfigLocator;

import laya.display.Sprite;
import laya.ui.Box;

import net.consts.AppConst;

import ui.main.HomeMapUI;

public class HomeMap extends Box {
    public var ui:HomeMapUI;
    public var builds:Vector.<BuildButtonView>;
    public var len:int = 2;
    public var gotoActivitySignal:SignalDispatcher;

    public function HomeMap() {
        super();
        gotoActivitySignal = new SignalDispatcher();
    }

    override protected function createChildren():void {
        ui = new HomeMapUI();
        addChild(ui);
        this.width = ui.width = ui.map.width = AppConst.width;
        Laya.timer.callLater(this, scrollMapToCenter);

        //设置底图上建筑信息
        builds = new <BuildButtonView>[];
        for (var i:int = 0; i < len; i++) {
            var b:BuildButtonView = new BuildButtonView();
            b.gotoActivitySignal.getSignal(this).listen(goHandler);
            builds.push(b);

            var con:Sprite = ui.map.getChildByName("item" + i) as Sprite;
            con.addChild(b);
            con.width = b.width;
            con.height = b.height;
        }
    }

    private function goHandler(data:ActivityVO):void {
        gotoActivitySignal.dispatch([data]);
    }

    private function scrollMapToCenter():void {
        //ui.map.scrollTo(1080);
        //ui.map.hScrollBar.visible = false;
    }

    private var _level:int = 0;

    public function refresh(level:int = 1):void {
        _level = level;
        var icons:Array = ConfigLocator.getInstance().getOpenfuncByPosition(3);
        var iconVo:ActivityVO;
        for (var i:int = 0; i < len; i++) {
            iconVo = icons[i];
            if (iconVo) {
                builds[i].init(iconVo, _level);
            }
        }
    }
}
}
