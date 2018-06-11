package com.game.command {
import com.game.common.command.GameInitDataCommand;
import com.game.common.mvc.BaseCommand;
import com.game.events.NotiEvent;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class GameStartupCommand extends BaseCommand implements ICommand {
    override public function execute(notification:INotification):void {
        trace("GameStartupCommand");


//        facade.registerProxy(new ActivityService());
//        facade.registerProxy(new UserProxy());
//        facade.registerProxy(new GroupService());
//        facade.registerProxy(new FfProxy());
//        facade.registerProxy(new DailyService());
//        //暂时放这里
//        facade.registerProxy(new HIslandService());
//        facade.registerProxy(new JixueService());
//        facade.registerProxy(new ClanService());
//        facade.registerProxy(new PowerProxy());
//        facade.registerProxy(new BattleDispositionService());
//        facade.registerProxy(new SkillStageService());
//        facade.registerProxy(new PetService());
//        facade.registerProxy(new ChaosFightProxy());
//        facade.registerProxy(new EndWarProxy());
//        facade.registerProxy(new DefWarProxy());
//        facade.registerProxy(new DarkDragonService());
//        facade.registerProxy(new FriendlyProxy());
//        facade.registerProxy(new JiutianXZProxy());
//        facade.registerProxy(new LumberProxy());
//        facade.registerProxy(new QQBackProxy());
//        facade.registerProxy(new ReturnPlayerProxy());
//        facade.registerProxy(new RuneProxy());
//        facade.registerProxy(new SoulService());

        //todo

        facade.registerCommand(MsgEvent.RE_CONNECT, ReConnectCommand);
        facade.registerCommand(NotiEvent.INIT_COMMAND, GameInitCommand);
        facade.registerCommand(NotiEvent.MUSIC_EFFECT, SoundCommand);
        facade.registerCommand(NotiEvent.MUSIC_CHANGE, SoundCommand);
        facade.registerCommand(NotiEvent.SOUND_VOLUME_SET, SoundCommand);
        facade.registerCommand(NotiEvent.MUSIC_FIGHT_CLOSE, SoundCommand);
        facade.registerCommand(NotiEvent.MUSIC_SET,SoundCommand);




        //facade.registerMediator(new CreateRoleMediator(notification.getBody()));
        //facade.registerCommand(GameNotification.CREATE_ROLE_STARTUP, CreateRoleStartupCommand);

        facade.registerCommand(NotiEvent.INIT_DATACOMMAND, GameInitDataCommand);
        facade.registerCommand(NotiEvent.INIT_DATACOMMAND, GameInitRequestCommand);

        this.sendNotification(NotiEvent.INIT_COMMAND);


    }
}
}
