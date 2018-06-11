/**
 * Created by guanll on 2017/10/18.
 */
package com.game.common.view {
import com.game.common.vo.BaseMenuVO;

import config.ConfigManager;

import config.mission.openfunc.IOpenfuncCfg;

import laya.ui.Box;
import laya.ui.Clip;
import laya.ui.View;

import ui.base.BaseMenuUI;

import utils.ArrayUtil;

public class BaseMenu extends Box{
    public var ui:BaseMenuUI;
    public var vo:BaseMenuVO;
    var select:Clip
    public function BaseMenu() {
    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new BaseMenuUI();
        addChild(ui);

        select = ui.removeChildByName("selectBox") as Clip;
        select.name = "selectBox";
        this.addChild(select);

        this.addChild(ui.txtName);
        this.addChild(ui.icon);
    }

    override public function destroy(destroyChild:Boolean = true):void {
        super.destroy(destroyChild);
    }

    public function init(vo:BaseMenuVO,index:int,userLevel:int):void{

        this.vo=vo;
        ui.txtName.text=vo.name;
        this.name = "menulist_"+(index+1).toString();//引导时需要用名字
        if(vo.openfunc!=null){
            ui.icon.skin="ui/func_icon/"+vo.openfunc.icon+".png";
            if(userLevel<vo.openfunc.level){
                //灰态
                select.name = "selectBox__";
                ui.icon.gray = true;
            }else
            {
                select.name = "selectBox";
                ui.icon.gray = false;
            }
        }
    }

    public function setSelectedState(b:Boolean):void{
        if(b){
            ui.txtName.color = "#fffe95";
        }else{
            ui.txtName.color = "#88a1c9";
        }
    }
}
}
