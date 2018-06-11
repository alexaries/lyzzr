package com.preset.loading.view {
import laya.display.Sprite;
import laya.events.Event;
import laya.net.Loader;
import laya.utils.Handler;

import net.consts.AppConst;

import ui.loading.StartLoadingUI;

public class LoadingView extends Sprite {
    private var ui:StartLoadingUI;
    public var resArray:Array = [
        {url: "module/login/LOGO.png", type: Loader.IMAGE},
        {url: "module/loading/loading_progress_bg.png", type: Loader.IMAGE},
        {url: "module/login/loginbg.jpg", type: Loader.IMAGE},
        {url: "map/101.png", type: Loader.IMAGE},
        {url: AppConst.atlasPath + "module/loading.json", type: Loader.ATLAS}
    ];
    public var loadingTips:Array = [
        "角色等级每提高10级，就可以多招募一名散仙出战，很快到了40级就可以带满4个散仙出战！",
        "提升等级、修为，获得更高品质的散仙、装备，强化装备和法宝都可以提高角色的战力。",
        "主动攻击和受到伤害都可以增加自己的灵气，灵气值达到100就可以释放法宝的无双技能。",
        "身法决定出手顺序，最好让慈航先出手，可以为队友回血回灵气还能清除异常状态。",
        "越高级的心法升级消耗的修为值就越多，合理地搭配心法非常重要。",
        "心法和法宝的区别是，心法提供主动技能和属性的加成，而法宝提供无双技能和被动技能。",
        "有一种强大的法宝，可造成毒属性的伤害，无视角色的物理和法术防御。",
        "品质越高的散仙潜力越高，升级带来的属性提升就越大。",
        "游戏不管在线还是离线都在不停地获得挂机经验和修为，非常丰厚哦，没时间玩游戏也不用怕落下！",
        "每天查看一下日常很重要，完成每日目标，游戏事半功倍。"
    ];

    public function LoadingView() {

    }

    public function startLoad():void {
        loadRes(resArray);
    }

    protected function loadRes(res:Array):void {

        Laya.loader.load(res, Handler.create(this, $onComplete), null)
    }


    public function $onComplete():void {
        __onComplete();


    }

    public function center() {
        ui.x = AppConst.width / 2 - ui.width / 2;
        ui.y = AppConst.height / 2 - ui.height / 2;
    }

    private function __onComplete():void {
        ui = new StartLoadingUI();
        addChild(ui);
        center();
        init();
    }

    private function init():void {
        ui.btnRefresh.on(Event.CLICK, this, onReloadHandler);
    }

    private function onReloadHandler():void {
        Laya.Browser.window.location.reload();
    }

    public function update(max:int, left:int, curName:String):void {
        if (left >= 1 && ui) {
            isShow(true);

            if (max > 1) {
                ui.progressBar2.visible = true;
                ui.progressBarBg2.visible = true;
                ui.progressBar2.value = (max - left) / max;
            } else {
                ui.progressBar2.visible = false;
                ui.progressBarBg2.visible = false;
            }
            ui.txtTips2.text = curName;
        } else {
            isShow(false);
        }
    }

    public function isShow(b:Boolean):void {
        if (visible == b) {
            Laya.stage.addChild(this);
            return;
        }
        visible = b;
    }

    public function getRandomTips():String {
        return loadingTips[Math.floor(Math.random() * loadingTips.length)];
    }

    public function set randomTips(s:String):void {
        if (visible && ui) {
            ui.txtTips.text = s;
        }
    }

    public function set progress(v:Number):void {
        if (visible && ui) {
            ui.progressBar.value = v;
        }
    }
}
}