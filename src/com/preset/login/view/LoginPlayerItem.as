/**
 * Created by dingcj on 2018/1/22.
 */
package com.preset.login.view {
import com.component.DownTime;
import com.signal.SignalDispatcher;

import laya.ui.Box;
import laya.utils.Handler;

import ui.login.LoginPlayerItemUI;

import utils.HtmlUtil;

public class LoginPlayerItem extends Box {

    private var ui:LoginPlayerItemUI;

    private var moveDownTime:DownTime;
    private var index:int = 0;
    private var signal:SignalDispatcher;

    private var bottomY = 167;
    private var interval = 40;
    private var center = 0;

    public function LoginPlayerItem() {

    }

    override protected function createChildren():void {
        super.createChildren();

        ui = new LoginPlayerItemUI();
        addChild(ui);
    }

    public function setData(data:Object, signal:SignalDispatcher, index:int):void {
        var occu:int = data["occuIndex"];
        var name:String = data["playerName"];
        var color:String = data["playerColor"];
        this.signal = signal;
        this.index = index;
        ui.occuImage.skin = "";
        var str:String = occu == 0 ? "ru" : (occu == 1 ? "shi" : "dao");
        ui.occuImage.skin = "module/login/" + str + ".png";

        ui.nameHtml.innerHTML = HtmlUtil.fontSizeAndColor(name, color, 24) + "&nbsp;&nbsp;" + HtmlUtil.fontSizeAndColor("已进入游戏", "#ffffff", 24);

        if (moveDownTime) {
            moveDownTime.stop();
            moveDownTime = null;
        }

        moveDownTime = new DownTime(10000, Handler.create(this, doMove, null, false));
        moveDownTime.loopTime = 20;
        moveDownTime.start();

        center = (bottomY - interval) / 2;
    }

    private function doMove():void {
        if (this.y == 0 && index == 1) {
            oneRoundOver();
        }
        else {
            this.y -= 1;
            updateAlpha();
        }
    }

    private function updateAlpha():void {
        this.alpha = (1 - (Math.abs(this.y - center) / center));
    }

    private function oneRoundOver():void {
        signal.dispatch(null);
    }

    override public function destroy(destroyChild:Boolean = true):void {
        if (moveDownTime) {
            moveDownTime.stop();
            moveDownTime = null;
        }

        super.destroy(destroyChild);
    }
}
}
