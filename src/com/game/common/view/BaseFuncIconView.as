/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.common.view {
import com.game.vo.ActivityVO;

import laya.ui.Box;

import ui.main.icons.BaseFuncIconViewUI;

public class BaseFuncIconView extends Box {
    public var ui:BaseFuncIconViewUI;
    public var _vo:ActivityVO;
    public var isLocked:Boolean = true;  //是否锁住了

    public function BaseFuncIconView() {
        super();
    }

    override protected function createChildren():void {
        super.createChildren();
        ui = new BaseFuncIconViewUI();
        addChild(ui);
    }

    public function init(vo:ActivityVO, level:int):void {
        _vo = vo;
//        ui.nameLabel.text = _vo.name;
//        ui.icon.skin = _vo.imgUrl;
        update(level);

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
    }
}
}
