package com.game.common.view {
import com.game.utils.FuncUtil;
import com.game.vo.FuncOpenVO;
import com.signal.SignalDispatcher;

import globals.ConfigLocator;

import laya.display.Sprite;
import laya.ui.Box;

import net.consts.AppConst;

import ui.main.HomeMapUI;

public class HomeMap extends Box {
    public var ui:HomeMapUI;
    public var builds:Vector.<BuildButtonView>;
    public var len:int = 4;
    private var _level:int = 0;
    private var signal:SignalDispatcher;

    public function HomeMap() {
        super();
    }

    override protected function createChildren():void {
        ui = new HomeMapUI();
        addChild(ui);
        this.width = ui.width = ui.map.width = AppConst.width;
    }

    public function initInfo(signal:SignalDispatcher):void {
        this.signal = signal;
        //设置底图上建筑信息
        builds = new <BuildButtonView>[];
        for (var i:int = 0; i < len; i++) {
            var b:BuildButtonView = new BuildButtonView();

            builds.push(b);

            var con:Sprite = ui.map.getChildByName("item" + i) as Sprite;
            con.addChild(b);
            con.width = b.width;
            con.height = b.height;
        }

        refresh();
    }

    public function refresh(level:int = 1):void {
        _level = level;
        var icons:Array = ConfigLocator.getInstance().getOpenfuncByPosition(FuncUtil.BUILD_INDEX);
        var iconVo:FuncOpenVO;
        for (var i:int = 0; i < len; i++) {
            iconVo = icons[i];
            if (iconVo) {
                builds[i].init(iconVo, _level, signal);
            }
        }
    }
}
}
