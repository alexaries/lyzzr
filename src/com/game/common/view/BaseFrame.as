package com.game.common.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.vo.BaseMenuVO;

import config.mission.openfunc.IOpenfuncCfg;

import globals.ConfigLocator;

import laya.display.Sprite;
import laya.events.Event;
import laya.ui.List;
import laya.ui.ViewStack;
import laya.utils.Handler;
import laya.utils.HitArea;

import net.consts.AppConst;

import ui.base.BaseFrameUI;

public class BaseFrame extends BaseWindow {
    protected var frame:BaseFrameUI;
    var $ui:Sprite;
    var views:Array = []

    public function BaseFrame(resArray:Array = null) {
        super(resArray);
    }

    override public function base_init():void {
        $base_init();
    }

    override protected function $$dispose():void {
        if (isComplete) {
            for (var i:int = 0; i < views.length; i++) {
                var object__ = views[i];
                if (object__ instanceof  BaseWindow || object__ instanceof  BaseView) {
                    object__.tryDispose();
                }
            }
            views = null;
            if ($ui instanceof  BaseWindow || $ui instanceof  BaseView) {
                var $ui__ = $ui;
                $ui__.tryDispose();
                $ui = null;
            }
            else {
                $ui.destroy();
                $ui = null;
            }
            if (frame.menuList.renderHandler) frame.menuList.renderHandler.clear();
            frame.menuList.renderHandler = null;
            if (frame.menuList.selectHandler) frame.menuList.selectHandler.clear();
            frame.menuList.selectHandler = null;

            frame.btnClose.off(Event.CLICK, this, tryDispose);
            frame.btnReturn.off(Event.CLICK, this, tryDispose);

            frame.destroy();
            frame = null;

        }

        super.$$dispose();
    }

    override public function getMediator():BaseMediator {
        return super.getMediator();
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        //设置基础框架

        super.onComplete();
    }

    public function getToolBar():List {
        return frame.menuList;
    }

    public function setContent(ui:Sprite):void {

        $ui = ui;
        frame.addChildAt($ui, 3);
        layout();
    }

    public function setMsg(msg:String):void {
        if (msg != "") {
            frame.msgSp.visible = true;
            frame.txtMsg.text = msg;
        } else {
            frame.msgSp.visible = false;
        }
    }

    public function getContent():Sprite {
        return $ui;
    }

    public function layout():void {
        if (!$ui) {
            return;
        }
        $ui.width = AppConst.fullScreenWidth;
        $ui.height = AppConst.height - AppConst.topBannerHeight;
        $ui.x = (AppConst.width - AppConst.fullScreenWidth) / 2;
        $ui.y = 0;//AppConst.topBannerHeight;
    }

    public function setTitle(name:String):void {
        frame.txtTitle.text = name;
    }

    public function setBgType(type:uint):void {
        frame.topBg.visible = false;
        switch (type) {
            case 0:
                frame.bg.skin = "common/surface/common_bg_4.png";//默认黑底
                break;
            case 1:
                frame.bg.skin = "common/surface/common_bg_2.png";//蓝色底
                break;
            case 2:
                frame.topBg.visible = true;
                frame.bg.skin = "main/common_bg.png";//蓝色 光晕 + topBg
        }
    }

    override protected function $$$$onComplete():void {
        super.$$$$onComplete();
        setToolBarSelect(toolBarSelectedIndex);
    }

    override public function $$$onComplete():void {
        frame = new BaseFrameUI();
        addChild(frame);
        frame.msgSp.visible = false;
        setContent(new ViewStack());
        width = frame.width = AppConst.width;

        frame.bg.width = AppConst.width;
        frame.banner.width = AppConst.width;
        frame.bottomBg.width = AppConst.width;
        frame.menuList.width = AppConst.width - 220;
        frame.btnClose.x = AppConst.width - frame.btnClose.width;
        frame.topBg.width = AppConst.width;
        setBgType(0);

        frame.menuList.selectEnable = true;
        frame.menuList.array = [];
        frame.menuList.itemRender = BaseMenu;
        frame.menuList.renderHandler = Handler.create(this, renderMenuHandler, null, false);
        frame.menuList.selectHandler = Handler.create(this, $$toolBarSelectHandler, null, false);

        frame.btnClose.on(Event.CLICK, this, tryClose);
        frame.btnReturn.on(Event.CLICK, this, tryClose);

        this.width = AppConst.width;
        this.height = AppConst.height;
        var hitArea:HitArea = new HitArea();
        this.hitArea = hitArea;
        hitArea.hit.drawRect(0, 0, AppConst.width, AppConst.height, "#000000");
    }

    public function tryClose():void {
        tryDispose();
    }

    //视图
    public function setViewStackItems(views:Array):void {
        this.views = views;
        if ($ui instanceof ViewStack) {
            ($ui as ViewStack).setItems(views);
        }
    }


    public function setToolBarItems(menuVOs:Array):void {
        var arr:Array = [];
        for (var i:int = 0; i < menuVOs.length; i++) {
            if (checkOpenfunc(i, false)) {
                var baseMenuVO:BaseMenuVO = menuVOs[i];
                var cfg:IOpenfuncCfg = getOpenfunc(i);
                if (!cfg)continue;
                baseMenuVO.openfunc = getOpenfunc(i);
                arr.push(baseMenuVO);
            }
        }
        if (frame && frame.menuList)
            frame.menuList.array = arr;
    }

    public function setToolBarSelect(index:int):void {
        if (frame && frame.menuList)
            frame.menuList.selectedIndex = index;
    }

    public function getOpenfunc(index:int):IOpenfuncCfg {
        return null;
        return ConfigLocator.getInstance().getOpenfunc(menuWinTypeName, index);
    }

    public function checkOpenfunc(index:int, isRoll:Boolean = true):Boolean {
        return true;
        var openfuncCfg:IOpenfuncCfg = getOpenfunc(index);
        if (openfuncCfg && userlevel < openfuncCfg.level) {
            if (isRoll) {
                Alert.roll(" 等级达到" + openfuncCfg.level + "可以开启" + openfuncCfg.name);
            }
            return false;
        }
        return true
    }

    function $$toolBarSelectHandler(index:int):void {
        if (checkOpenfunc(index)) {
            toolBarSelectHandler(index);
        }
    }


    public function getPageBtn(idx:int):* {
        if (frame && frame.menuList)
            return frame.menuList.getCell(idx);
        return null;
    }


    public function toolBarSelectHandler(index:int):void {


        if ($ui instanceof ViewStack) {
            ($ui as ViewStack).selectedIndex = index;

        }
        if (frame && frame.menuList && frame.menuList.array.length > index) {
            setTitle(frame.menuList.array[index].name);
        }
        toolBarSelectedIndex = index;
    }

    public function renderMenuHandler(cell:BaseMenu, index:int):void {
        if (frame && frame.menuList) {
            cell.init(frame.menuList.array[index], index, userlevel);
            cell.setSelectedState(frame.menuList.selectedIndex == index);
        }

    }

}
}