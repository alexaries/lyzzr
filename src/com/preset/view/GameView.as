package com.preset.view {
import com.component.MovieClipStage;
import com.game.common.view.GameMain;
import com.game.module.battle.view.FfView;
import com.preset.createRole.view.CreateRoleView;
import com.preset.login.view.LoginView;
import com.tween.KTween;

import laya.display.Sprite;
import laya.renders.RenderContext;

import laya.utils.Stat;

import net.consts.AppConst;

public class GameView  extends  Sprite{
    public var loginView:LoginView;
    public var createRoleView:CreateRoleView;
    public var gameMainView:GameMain;
    var ffView:FfView;
    public function GameView() {


        super();

        frameLoop(1,this,loop);
    }
    public function createBattle():void {
        if (ffView == null) {
            ffView = new FfView();


        }
    }
    public function startBattle():void {

        addChild(ffView)
        removeChild(gameMainView);
    }

    public function endBattle():void {
        addChild(gameMainView)
        removeChild(ffView);
    }
    public function loop():void {
        MovieClipStage.getInstance().nextFrame();
        KTween.manager.enterFrameHandler();
    }


    override public function render(context:RenderContext, x:Number, y:Number):void {
        super.render(context, x, y);
    }

    public function loginDispose():void {
        if (loginView != null) {
            loginView.dispose();
            loginView = null;
        }

    }

    public function createGameMain() {
        gameMainView = new GameMain();
        addChild(gameMainView)

    }

    private function FPS():void {
        if (AppConst.isFPS)Stat.show(0, 0);
    }


//    1、默认60 FPS/S
//    2、设置Laya.stage.frameRate = “mouse”，在设置后，引擎默认会以30帧运行，只有鼠标活动后才会自动提速到60帧，这样既能保证鼠标操作的流畅性，又能减少不操作的性能消耗；
//    3、设置Laya.stage.frameRate = “slow”，默认以30帧运行，来降低性能消耗，30帧的帧率已经能保证大多数游戏友好的体验；
    private function FrameRate():void {
        Laya.stage.frameRate = "slow";
        //设置APK下的帧频需要用以下方法：
//        if (Laya.Browser.window.conchConfig && Laya.Browser.window.conchConfig.setSlowFrame) {
//            Laya.Browser.window.conchConfig.setSlowFrame(true);//设置30帧
//        }
    }

    public function createRole():void {

        createRoleView = new CreateRoleView();
    }


    public function createRoleDispose():void {
        if (createRoleView != null) {
            createRoleView.dispose();
            createRoleView = null;
        }
    }

    public function login():void {
        loginView = new LoginView();
        FPS();
        FrameRate();
    }


}
}
