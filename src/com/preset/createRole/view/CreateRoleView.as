/**
 * Created by huangcb on 2017/8/17.
 */
package com.preset.createRole.view {
import com.game.utils.LabelUtil;
import com.preset.createRole.mediator.CreateRoleMediator;
import com.preset.createRole.vo.RandomName;
import com.preset.view.PresetBaseView;
import com.signal.*;
import com.talkingdata.TDItem;
import com.talkingdata.TDManager;
import com.tween.KTween;

import laya.ani.swf.MovieClip;

import laya.events.Event;
import laya.net.Loader;
import laya.utils.Handler;

import net.consts.AppConst;

import org.puremvc.as3.patterns.mediator.Mediator;

import ui.createrole.CreateRoleUI;

public class CreateRoleView extends PresetBaseView {
    //界面表现
    public var ui:CreateRoleUI = null;
    public var createClick:SignalDispatcher;

    public var _index:int = 0;
    public var _name:String = "";
    private var error_exist = "角色名称已存在!!!";
    private var error_illegal = "角色名称不合法!!!";

    private const roleEff:Array =
            [
                [["module/createrole/effect/body__00000.png",
                    "module/createrole/effect/body__00001.png",
                    "module/createrole/effect/body__00002.png",
                    "module/createrole/effect/body__00003.png",
                    "module/createrole/effect/body__00004.png",
                    "module/createrole/effect/body__00005.png",
                    "module/createrole/effect/body__00006.png",
                    "module/createrole/effect/body__00007.png"],

                    ["module/createrole/effect/foot__00000.png",
                    "module/createrole/effect/foot__00001.png",
                    "module/createrole/effect/foot__00002.png",
                    "module/createrole/effect/foot__00003.png",
                    "module/createrole/effect/foot__00004.png",
                    "module/createrole/effect/foot__00005.png",
                    "module/createrole/effect/foot__00006.png",
                    "module/createrole/effect/foot__00007.png"]],

                [["module/createrole/effect/05__00000.png",
                    "module/createrole/effect/05__00001.png",
                    "module/createrole/effect/05__00002.png",
                    "module/createrole/effect/05__00003.png",
                    "module/createrole/effect/05__00004.png",
                    "module/createrole/effect/05__00005.png",
                    "module/createrole/effect/05__00006.png",
                    "module/createrole/effect/05__00007.png"],

                    ["module/createrole/effect/06__00000.png",
                        "module/createrole/effect/06__00001.png",
                        "module/createrole/effect/06__00002.png",
                        "module/createrole/effect/06__00003.png",
                        "module/createrole/effect/06__00004.png",
                        "module/createrole/effect/06__00005.png",
                        "module/createrole/effect/06__00006.png",
                        "module/createrole/effect/06__00007.png",
                        "module/createrole/effect/06__00008.png",
                        "module/createrole/effect/06__00009.png",
                        "module/createrole/effect/06__00010.png",
                        "module/createrole/effect/06__00011.png",
                        "module/createrole/effect/06__00012.png"]],

                [["module/createrole/effect/03__00000.png",
                    "module/createrole/effect/03__00001.png",
                    "module/createrole/effect/03__00002.png",
                    "module/createrole/effect/03__00003.png",
                    "module/createrole/effect/03__00004.png",
                    "module/createrole/effect/03__00005.png",
                    "module/createrole/effect/03__00006.png",
                    "module/createrole/effect/03__00007.png"],

                    ["module/createrole/effect/04__00000.png",
                        "module/createrole/effect/04__00001.png",
                        "module/createrole/effect/04__00002.png",
                        "module/createrole/effect/04__00003.png",
                        "module/createrole/effect/04__00004.png",
                        "module/createrole/effect/04__00005.png",
                        "module/createrole/effect/04__00006.png",
                        "module/createrole/effect/04__00007.png"]]
            ];
    private const selectEff:Array =
            [
                "module/createrole/effect/circleEff_0.png",
                "module/createrole/effect/circleEff_1.png",
                "module/createrole/effect/circleEff_2.png",
                "module/createrole/effect/circleEff_3.png",
                "module/createrole/effect/circleEff_4.png",
                "module/createrole/effect/circleEff_5.png",
                "module/createrole/effect/circleEff_6.png"
            ];
    private const roleEffPos:Array = [[[138,178,4],[266,1069,4]],[[138,178,4],[142,0,4]],[[13,108,4],[340,1000,4]]];

    private var resArray:Array =
            [
                "创角素材",
                {url: roleEff[0][0][0], type: Loader.IMAGE},
                {url: roleEff[0][0][1], type: Loader.IMAGE},
                {url: roleEff[0][0][2], type: Loader.IMAGE},
                {url: roleEff[0][0][3], type: Loader.IMAGE},
                {url: roleEff[0][0][4], type: Loader.IMAGE},
                {url: roleEff[0][0][5], type: Loader.IMAGE},
                {url: roleEff[0][0][6], type: Loader.IMAGE},
                {url: roleEff[0][0][7], type: Loader.IMAGE},

                {url: roleEff[0][1][0], type: Loader.IMAGE},
                {url: roleEff[0][1][1], type: Loader.IMAGE},
                {url: roleEff[0][1][2], type: Loader.IMAGE},
                {url: roleEff[0][1][3], type: Loader.IMAGE},
                {url: roleEff[0][1][4], type: Loader.IMAGE},
                {url: roleEff[0][1][5], type: Loader.IMAGE},
                {url: roleEff[0][1][6], type: Loader.IMAGE},
                {url: roleEff[0][1][7], type: Loader.IMAGE},

                {url: roleEff[1][0][0], type: Loader.IMAGE},
                {url: roleEff[1][0][1], type: Loader.IMAGE},
                {url: roleEff[1][0][2], type: Loader.IMAGE},
                {url: roleEff[1][0][3], type: Loader.IMAGE},
                {url: roleEff[1][0][4], type: Loader.IMAGE},
                {url: roleEff[1][0][5], type: Loader.IMAGE},
                {url: roleEff[1][0][6], type: Loader.IMAGE},
                {url: roleEff[1][0][7], type: Loader.IMAGE},

                {url: roleEff[1][1][0], type: Loader.IMAGE},
                {url: roleEff[1][1][1], type: Loader.IMAGE},
                {url: roleEff[1][1][2], type: Loader.IMAGE},
                {url: roleEff[1][1][3], type: Loader.IMAGE},
                {url: roleEff[1][1][4], type: Loader.IMAGE},
                {url: roleEff[1][1][5], type: Loader.IMAGE},
                {url: roleEff[1][1][6], type: Loader.IMAGE},
                {url: roleEff[1][1][7], type: Loader.IMAGE},
                {url: roleEff[1][1][8], type: Loader.IMAGE},
                {url: roleEff[1][1][9], type: Loader.IMAGE},
                {url: roleEff[1][1][10], type: Loader.IMAGE},
                {url: roleEff[1][1][11], type: Loader.IMAGE},
                {url: roleEff[1][1][12], type: Loader.IMAGE},

                {url: roleEff[2][0][0], type: Loader.IMAGE},
                {url: roleEff[2][0][1], type: Loader.IMAGE},
                {url: roleEff[2][0][2], type: Loader.IMAGE},
                {url: roleEff[2][0][3], type: Loader.IMAGE},
                {url: roleEff[2][0][4], type: Loader.IMAGE},
                {url: roleEff[2][0][5], type: Loader.IMAGE},
                {url: roleEff[2][0][6], type: Loader.IMAGE},
                {url: roleEff[2][0][7], type: Loader.IMAGE},

                {url: roleEff[2][1][0], type: Loader.IMAGE},
                {url: roleEff[2][1][1], type: Loader.IMAGE},
                {url: roleEff[2][1][2], type: Loader.IMAGE},
                {url: roleEff[2][1][3], type: Loader.IMAGE},
                {url: roleEff[2][1][4], type: Loader.IMAGE},
                {url: roleEff[2][1][5], type: Loader.IMAGE},
                {url: roleEff[2][1][6], type: Loader.IMAGE},
                {url: roleEff[2][1][7], type: Loader.IMAGE},

                {url: selectEff[0], type: Loader.IMAGE},
                {url: selectEff[1], type: Loader.IMAGE},
                {url: selectEff[2], type: Loader.IMAGE},
                {url: selectEff[3], type: Loader.IMAGE},
                {url: selectEff[4], type: Loader.IMAGE},
                {url: selectEff[5], type: Loader.IMAGE},
                {url: selectEff[6], type: Loader.IMAGE},

                {url: "module/createrole/0.png", type: Loader.IMAGE},
                {url: "module/createrole/1.png", type: Loader.IMAGE},
                {url: "module/createrole/2.png", type: Loader.IMAGE},
                {url: "module/createrole/3.png", type: Loader.IMAGE},
                {url: "module/createrole/4.png", type: Loader.IMAGE},
                {url: "module/createrole/5.png", type: Loader.IMAGE},
                {url: "module/createrole/icon1.png", type: Loader.IMAGE},
                {url: "module/createrole/icon2.png", type: Loader.IMAGE},
                {url: "module/createrole/icon3.png", type: Loader.IMAGE},
                {url: "module/createrole/shaizi.png", type: Loader.IMAGE},
                {url: "module/createrole/bg1.jpg", type: Loader.IMAGE},
                {url: "module/createrole/bg2.jpg", type: Loader.IMAGE},
                {url: "module/createrole/bg3.jpg", type: Loader.IMAGE}
            ];
    public function CreateRoleView() {
        createClick = new SignalDispatcher();
        super(resArray);
    }

    override public function getMediator():Mediator {
        return new CreateRoleMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        resComplete();
    }

    private function resComplete():void {
        ui = new CreateRoleUI();
        Laya.stage.addChild(this);
        addChild(ui)
        init();
        layout();

        TDManager.addEvent(TDItem.shoucijinruchuangjue);
    }

    public function layout():void {

        width = AppConst.fullScreenWidth;
        height = AppConst.height - AppConst.topBannerHeight;
        x = (AppConst.width - AppConst.fullScreenWidth) / 2;
        y = 0;//AppConst.topBannerHeight;
    }

    private function init():void {
        ui.randBtn.clickHandler = Handler.create(this, onClickRandBtn, [], false);
        ui.createBtn.clickHandler = Handler.create(this, onClickCreateBtn, [], false);

        ui.selectTab.selectHandler = Handler.create(this, onSelect, null, false);
        ui.selectTab.selectedIndex = 0;
        ui.inputName.text = RandomName.rand(1);

        ui.inputName.on(Event.FOCUS, this, onFocus, null);

        ui.notice.visible = false;

        ui.roleEffBeh.interval = 160;
        ui.roleEffPre.interval = 160;
        ui.selectImg.interval = 160;
        ui.selectImg.scaleX = ui.selectImg.scaleY = 4;

        ui.selectImg.loadImages(selectEff).play();
    }

    private function onFocus():void {
        if (ui.inputName.text == error_exist || ui.inputName.text == error_illegal) {
            ui.inputName.text = "";
        }
        ui.inputName.color = LabelUtil.commonColor;
    }

    private function onClickRandBtn():void {
        ui.inputName.color = LabelUtil.commonColor;
        var parm:int = ui.selectTab.selectedIndex % 2 == 0 ? 1 : 0;
        ui.inputName.text = RandomName.rand(parm);
    }

    private function onClickCreateBtn():void {
        if (!isNamelegal) {
            notice("名字不能为空... ...");
            return;
        }
        if(roleMc){
            roleMc.stop();
        }
        ui.selectImg.stop();
        ui.roleEffBeh.stop();
        ui.roleEffPre.stop();

        _name = ui.inputName.text;
        createClick.dispatch([_name, _index]);

        notice("正在努力创角,请稍候... ...");
        ui.createBtn.disabled = true;
    }

    public function notice(str:String):void {
        ui.notice.visible = true;
        ui.noticeLabel.text = str;

        timer.once(1000, this, delay, null, true);
    }

    private function delay():void {
        ui.createBtn.disabled = false;
        ui.notice.visible = false;
    }

    private function onSelect(index:int):void {
        _index = index;
        ui.selectImg.x = ui.selectTab._childs[index].x - 31;
        ui.selectImg.y = ui.selectTab._childs[index].y - 32;
        switchTexture(_index);
        switchCareer(index);

        onClickRandBtn();//随机名字
    }

    private var roleMc:MovieClip;
    private function switchTexture(index:int):void {
        if(!roleMc){
            roleMc = new MovieClip();
            roleMc.scale(1.5,1.5,true);
            roleMc.y = 190;
            roleMc.x = -34;
            ui.roleImage.addChild(roleMc);
        }

        //有一个角色站姿不太多 要做下偏移
//        if(index == 1){
//            roleMc.x = -134;
//        }else{
//            roleMc.x = -34;
//        }
        roleMc.load("module/createrole/roleSwf/" + index + ".swf",true);

    }

    private function switchCareer(index:int):void {
        var flag:int = Math.floor(index / 2);
        ui.bg.skin = "module/createrole/bg"+(flag + 1).toString()+".jpg";
        ui.ziImage.skin = "module/createrole/icon"+(flag + 1).toString()+".png";
        ui.bg.alpha = 0;
        KTween.to(ui.bg, 0.7, {alpha: 1});

        ui.roleEffBeh.x = roleEffPos[flag][0][0];
        ui.roleEffBeh.y = roleEffPos[flag][0][1];
        ui.roleEffBeh.scaleX = ui.roleEffBeh.scaleY = roleEffPos[flag][0][2];

        ui.roleEffPre.x = roleEffPos[flag][1][0];
        ui.roleEffPre.y = roleEffPos[flag][1][1];
        ui.roleEffPre.scaleX = ui.roleEffPre.scaleY = roleEffPos[flag][1][2];

        ui.roleEffBeh.clear();
        ui.roleEffPre.clear();

        ui.roleEffBeh.loadImages(roleEff[flag][0]).play();
        ui.roleEffPre.loadImages(roleEff[flag][1]).play();
    }

    private function get isNamelegal():Boolean {
        return ui.inputName.text != "";
    }

    public function charaterExist():void {
        notice(error_exist);
    }

    public function illegalName():void {
        notice(error_illegal);
    }

    override public function dispose():void {
        if (isDispose)return;
        if(roleMc){
            roleMc.stop();
            roleMc.removeSelf();
        }
        roleMc = null;
        ui.selectImg.clear();
        ui.roleEffBeh.clear();
        ui.roleEffPre.clear();
        ui.randBtn.clickHandler.clear();
        ui.createBtn.clickHandler.clear();
        ui.selectTab.selectHandler.clear();
        ui.selectTab.selectHandler = null;
        ui.randBtn.clickHandler = null;
        ui.createBtn.clickHandler = null;
        ui.selectTab.selectHandler = null;
        timer.clear(this, delay);
        createClick.dispose();
        super.dispose();
    }
}
}


