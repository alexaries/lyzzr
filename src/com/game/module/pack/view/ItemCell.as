/**
 * Created by dingcj on 2018/5/24.
 */
package com.game.module.pack.view {
import com.component.MovieClipCustom;
import com.game.module.pack.util.PackUtil;
import com.game.module.pack.vo.PackVO;
import com.game.vo.GoodsVO;
import com.signal.SignalDispatcher;

import laya.events.Event;

import laya.ui.Box;
import laya.ui.Clip;
import laya.ui.Image;
import laya.ui.Label;

import utils.CSSStyleCfg;

public class ItemCell extends Box{
    public var nameLab:Label;
    public var numLabel:Label;
    public var img:Image;
    public var bg:Image;
    public var selectBG:Clip;
    public var packvo:PackVO;
    public var mc:MovieClipCustom;
    public function ItemCell() {
        super();
    }
    override protected  function createChildren():void{
        nameLab = new Label();
        nameLab.wordWrap =  true;
        nameLab.size(156,60);
        nameLab.text = ""
        nameLab.pos(0,160);
        nameLab.fontSize = 30;
        nameLab.color = "#f8c440";
        nameLab.align = "center";
        nameLab.font = CSSStyleCfg.defaultFontName;
        addChild(nameLab);

        bg = new Image();
        bg.skin = "common/surface/frame_blue.png";
        bg.sizeGrid = "8,8,8,8"
        addChild(bg);

        img = new Image()
        addChild(img)
        img.pos(8,8);
        img.size(140,140);

        selectBG = new Clip("common/surface/frame_sanxian_selected.png",1,2);
        addChild(selectBG);
        selectBG.pos(-10,-13);
        selectBG.index = 1;
        selectBG.visible = false;

        numLabel = new Label();
        numLabel.text = ""
        numLabel.size(132,60)
        numLabel.pos(0,110)
        numLabel.fontSize = 30;
        numLabel.align = "right"
        numLabel.color = "#FFFFFF";
        numLabel.font = CSSStyleCfg.defaultFontName;
        addChild(numLabel);

        img.on(Event.CLICK,this,tip);
    }

    public function tip():void {
        if(_showTip && packvo){
            PackUtil.showTip(packvo,tipType);
        }
    }
    private var tipType:int;
    public function setData(value:Object,type:int = PackUtil.noTipBtnType):void{
        tipType = type;
        if(!value){
            packvo = null;
            img.visible = numLabel.visible = nameLab.visible =  bg.visible = false;
            return;
        }
        packvo = (value.item == null || !value.item is PackVO) ? createPackVO(value.itemid) : value.item;
        if(packvo == null)
            return;

        img.visible = numLabel.visible = nameLab.visible = bg.visible= true;
        if(value.itemNum != undefined){
            packvo.pileNums = value.itemNum ;
        }
        if (packvo.pileNums > 1){
            numLabel.visible =  true
        }else{
            numLabel.visible = false ;
        }
        if(value.binding != undefined){
            packvo.binding = value.binding;
        }
        nameLab.color = GoodsVO.TEXTCOLOR[packvo.color - 1];
        nameLab.text = packvo.name;
        numLabel.text = packvo.pileNums + "";
        bg.skin = GoodsVO.bgSkinArr[packvo.color - 1];
        img.skin = packvo.imgURL;
    }
    public function addEffect():void {
        if (mc) {
            mc.removeSelf();
            mc.dispose();
            mc = null;
        }
        if(packvo && packvo.color >= 5){
            mc = new MovieClipCustom();
            mc.loadAtlas("clip/", "effect", true);
            mc.gotoAndPlay("liuguang", true);
            addChild(mc);
            mc.pos(80,81);
        }
    }
    public var redPointDispatch:SignalDispatcher;
    public function setDisPatch(_redPointDispatch:SignalDispatcher,userLv:int):void{
        redPointDispatch = _redPointDispatch;
        if(packvo && packvo.useable && userLv >= packvo.level){
            redPointDispatch.dispatch([img,true,img.x + 120,img.y-30])
        }
        if(packvo && !packvo.useable){
            redPointDispatch.dispatch([img,false,img.x + 120,img.y-30])
        }
    }
    protected function createPackVO(itemID:int) : PackVO {
        var packvo : PackVO = PackUtil.createPackVO(itemID);
        if(!packvo)
            return null ;
        packvo.binding = 0;
        return packvo;
    }
    public function selectHander(value:Boolean):void{
        selectBG.visible = value;
    }
    private var _showTip:Boolean = false;
    public function set showTip(value:Boolean):void{
        _showTip = value
    }
    public function setSize(width : Number, height : Number) : void {
        super.size(width, height);

        if(bg){
            bg.width = width;
            bg.height = height
        }
        if (img) {
            img.width = width - 8 * 2;
            img.height = height - 8 * 2;
        }
        if(selectBG){
            selectBG.scaleX = img.width/140;
            selectBG.scaleY = img.height/140
        }
        if (numLabel) {
            numLabel.size(width, 20);
            numLabel.y = height - 20 ;
        }
    }
    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
        if (mc) {
            mc.removeSelf();
            mc.dispose();
            mc = null;
        }
    }
}
}
