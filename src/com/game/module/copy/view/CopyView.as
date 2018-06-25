/**
 * Created by dingcj on 2018/5/21.
 */
package com.game.module.copy.view {
import com.component.MemoryManager;
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseView;
import com.game.module.copy.mediator.CopyMediator;
import com.game.module.copy.view.items.ComboBoxItem;
import com.game.module.copy.view.items.CopyItem;
import com.signal.SignalDispatcher;

import config.ConfigManager;
import config.chapter.IchapterCfg;
import config.stage.IstageCfg;

import laya.events.Event;
import laya.ui.List;
import laya.utils.Handler;

import ui.copy.CopyViewUI;

import utils.ArrayUtil;

public class CopyView extends BaseView {

    private var ui:CopyViewUI;
    public var closeSignal:SignalDispatcher;
    public var itemSignal:SignalDispatcher;

    private var chapterCfg:Array = [];

    public function CopyView() {
        super();

        closeSignal = new SignalDispatcher();
        itemSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new CopyMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        ui = new CopyViewUI();
        addChild(ui);
        initConfig();
        init();
        adapt();
    }

    private function adapt():void {
        ui.x = (Laya.stage.width - ui.width) / 2;
    }

    private function initConfig():void {
        chapterCfg = ArrayUtil.filter(ConfigManager.instance.chapter.chapterCfg, function (item:IchapterCfg) {
            return item.functionID == 1;
        });
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);

        ui.combox.selectHandler = Handler.create(this, onComboxChange, null, false);
        ui.combox.itemSize = 55;
        ui.combox.itemRender = ComboBoxItem;
        var comList:List = new List();
        comList.itemRender = ComboBoxItem;
        ui.combox.list = comList;

        ui.list.itemRender = CopyItem;
        ui.list.renderHandler = Handler.create(this, onRenderCopyItem, null, false);

        refreshCombox();
    }

    private function refreshCombox():void {
        var strs:String = "";
        for (var i = 0; i < chapterCfg.length; i++) {
            strs += "第" + chapterCfg[i].chapterSign + "章";
            if (i < chapterCfg.length - 1)strs += ",";
        }
        ui.combox.visibleNum = chapterCfg.length;
        ui.combox.labels = strs;
        onComboxChange(0);
    }

    private function onComboxChange(index:int):void {
        var chapter:IchapterCfg = chapterCfg[index];
        loadBg(chapter.bgPic + "");
        ui.chapterLabel.text = chapter.chapterName;
        var stageArr:Array = ArrayUtil.filter(ConfigManager.instance.stage.stageCfg, function (item:IstageCfg) {
            return item.functionID == 1 && (item.stageSign.split('-')[0] == chapter.chapterSign);
        });
        var posArr:Array = chapter.stagePos.split('|');

//        if (posArr.length != stageArr.length) {
//            trace("副本关卡数量与关卡坐标数量不一致 配置有问题");
//            return;
//        }
        var arr:Array = [];
        for (var i = 0; i < stageArr.length; i++) {
//            arr.push({x: posArr[i].split('_')[0], y: posArr[i].split('_')[1], cfg: stageArr[i]});
            arr.push({posx: 0, posy: 0, cfg: stageArr[i]});
        }
        ui.list.array = arr;

        ui.list.repeatX = 3;
        ui.list.repeatY = 10;

        ui.list.spaceX = 250;
        ui.list.spaceY = 250;
    }

    private function onRenderCopyItem(cell:CopyItem, index:int):void {
        cell.initInfo(index, itemSignal, ui.list.array[index]);
    }

    private function loadBg(bgName:String):void {
        var url:String = "ui/bg/back_investigate_1.png/back_investigate_1.png";
        MemoryManager.getBundle(MemoryManager.IMAGE).addLabel(ui.bg.skin);
        MemoryManager.getBundle(MemoryManager.IMAGE).removeLabel(ui.bg.skin);

        ui.bg.skin = "";
        ui.bg.skin = url;
    }

    private function onClickCloseBtn(e:Event):void {
        closeSignal.dispatch(null);
    }

    override public function dispose():void {
        super.dispose();
        closeSignal.dispose();
        itemSignal.dispose();
        ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
        if (ui.combox.selectHandler) ui.combox.selectHandler.clear();
        if (ui.list.renderHandler)ui.list.renderHandler.clear();

        chapterCfg = [];
    }
}
}