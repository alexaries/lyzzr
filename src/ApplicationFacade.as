package {
import com.preset.loading.mediator.LoadingMediator;
import com.preset.command.PresetStartupCommand;
import com.preset.login.command.LoginRequestCommand;
import com.preset.mediator.GameMediator;
import com.preset.view.GameView;

import globals.PreLoadRes;

import net.command.StartupCommand;
import net.events.MsgEvent;

import org.puremvc.as3.patterns.facade.Facade;
import org.puremvc.as3.patterns.observer.Notification;

public class ApplicationFacade extends Facade {
    public static const NAME:String = 'SocketFacade';
    public static const STARTUP:String = NAME + 'StartUp';
    public static const GAME_STARTUP:String = NAME + 'GameStartUp';
    public static const PRESET_STARTUP:String = NAME + ' PresetStartUp';
    public function ApplicationFacade() {
        super();
    }

    override protected function initializeController():void {
        super.initializeController();


        registerCommand(MsgEvent.LOGIN_REQUEST, LoginRequestCommand);
        registerCommand(STARTUP, StartupCommand);
        registerCommand(STARTUP, PresetStartupCommand);

    }


    override protected function initializeModel():void {
        super.initializeModel();
    }

    public function startup():void {
        sendNotification(STARTUP, Laya.stage);
        PreLoadRes.getInstance().initLoadingView();
        registerMediator(new LoadingMediator(PreLoadRes.getInstance().loadingView));
        var gameView:GameView=new GameView();
        Laya.stage.addChild(gameView)
        registerMediator(new GameMediator(gameView));
    }

    override public function sendNotification(notificationName:String, body:Object = null, type:String = null):void {
        notifyObservers(new Notification(notificationName, body, type));
    }
}
}
