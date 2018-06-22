/**
 * Created by dingcj on 2018/6/22.
 */
package com.game.module.roll.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.operation.FunctionOper;
import com.game.common.operation.Queue;
import com.game.common.operation.TimeoutOper;
import com.game.common.operation.TweenOper;
import com.game.common.view.BaseView;
import com.game.module.roll.mediator.RollScreenMediator;

import laya.utils.Pool;

import net.consts.AppConst;

import ui.roll.MiddleRollTextUI;

import ui.roll.RollScreenViewUI;

import ui.roll.RollTextViewUI;

import utils.ArrayUtil;
import utils.CSSStyleCfg;

public class RollScreenView extends BaseView {
    private static const ROLL_PADDING:uint = 5;
    private static const FRONT_SIZE:uint = 24;
    private static const WIDTH:uint = 700;
    private static const HEIGHT:uint = 50;
    private var rollInfoArr:Array = [];
    private var middleRollArr:Array = [];
    const MIDDLE_ROLL_HEIGHT:int = 60;
    private var alertBox:RollScreenViewUI;
    var que:Queue;

    public function RollScreenView() {
        super();

    }

    override public function dispose():void {
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new RollScreenMediator(this);

    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {
        alertBox = new RollScreenViewUI();
        alertBox.x = (AppConst.width - alertBox.width) / 2;
        alertBox.y = 250;
        addChild(alertBox);

        this.mouseEnabled = false;
        alertBox.alpha = 0;

        frameLoop(1, this, loop)
    }

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

    /**
     * 部份警告提示信息
     */
    public function rollAlert(str:String):void {
        alertBox.visible = true;
        alertBox.alpha = 1;
        alertBox.alertTxt.text = str;
        if (que) {
            que.halt();

        }
        var list:Array = [
            new TimeoutOper(2000),
            new TweenOper(alertBox, 500, {alpha: 0}),
            new FunctionOper(this, hideAlert)
        ]
        que = new Queue(list);
        que.execute();

    }

    public function hideAlert():void {
        alertBox.visible = false;
    }

    public function loop():void {
        var tmp:Array = [];
        for (var i:int = 0; i < rollInfoArr.length; i++) {
            var roll:RollTextViewUI = rollInfoArr[i];
            roll.y -= 10;
            if (roll.y < 450) {
                tmp.push(roll);
            }
            else if (roll.y > 650) {
                roll.visible = false;
            } else {
                roll.visible = true;
            }
        }
        for (var i:int = 0; i < tmp.length; i++) {
            var object_roll:RollTextViewUI = tmp[i];
            hideRollText(object_roll);
            ArrayUtil.remove(rollInfoArr, object_roll);
        }
        middleLoop();
    }

    public function rollText(str:String, size:int = 30):void {
        var roll:RollTextViewUI = Pool.getItemByClass("RollTextViewUI", RollTextViewUI);
        var yy:int = 600;
        var xx:int = (AppConst.width - roll.width) / 2;
        if (rollInfoArr.length >= 1) {
            yy = rollInfoArr[rollInfoArr.length - 1].y + 30;
        }
        rollInfoArr.push(roll);
        roll.rollText.style.fontSize = size
        roll.rollText.style.color = "#ffffff";
        roll.rollText.style.width = 710;
        roll.rollText.style.height = 40;
        roll.rollText.style.align = "center";
        roll.rollText.pos(6, 12);
        addChild(roll);
        roll.rollText.innerHTML = str;
        roll.y = yy + (HEIGHT + ROLL_PADDING);
        roll.x = xx;
        roll.visible = false;
        trace("roll-X:" + roll.x + "roll-width:" + roll.rollText.width);
    }

    public function hideRollText(roll:RollTextViewUI):void {
        roll.removeSelf();
        Pool.recover("RollTextViewUI", roll);
    }

    /*居中弹框，结果反馈*/
    public function rollMiddleText(str:String, size:int = 32):void {
        var roll:MiddleRollTextUI = Pool.getItemByClass("MiddleRollTextUI", MiddleRollTextUI);
        var yy:int = 900;
        var xx:int = (AppConst.width - roll.width) / 2;
        if (middleRollArr.length >= 1) {
            yy = middleRollArr[middleRollArr.length - 1].y + 30;
        }
        middleRollArr.push(roll);
        if (roll.rollText.style.fontSize != size) {
            roll.rollText.style.fontSize = size
            roll.rollText.style.color = "#ffffff"
            roll.rollText.style.align = "center"
            roll.rollText.style.font = CSSStyleCfg.defaultFontName
        }

        roll.rollText.innerHTML = str;
        roll.rollText.pos(11, 6)
        addChild(roll);
        roll.y = yy + (MIDDLE_ROLL_HEIGHT + ROLL_PADDING);
        roll.x = xx;
        roll.visible = false;
    }

    public function middleLoop():void {
        var tmp:Array = [];
        for (var i:int = 0; i < middleRollArr.length; i++) {
            var roll:MiddleRollTextUI = middleRollArr[i];
            roll.y -= 5;
            if (roll.y < 850) {
                tmp.push(roll);
            }
            if (i > 3) {
                roll.visible = false;
            } else {
                roll.visible = true;
            }
        }
        for (var i:int = 0; i < tmp.length; i++) {
            var object_roll:MiddleRollTextUI = tmp[i];
            hideMiddleRollText(object_roll);
            ArrayUtil.remove(middleRollArr, object_roll);
        }
    }

    public function hideMiddleRollText(roll:MiddleRollTextUI):void {
        roll.removeSelf();
        Pool.recover("MiddleRollTextUI", roll);
    }
}
}