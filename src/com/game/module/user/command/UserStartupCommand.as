/**
 * Created by huangcb on 2017/8/28.
 */
package com.game.module.user.command {

import com.game.events.NotiEvent;
import com.game.module.heroic.command.HeroAddProCommand;
import com.game.module.heroic.command.HeroCommand;
import com.game.module.powerpanel.command.PowerCommand;

import net.events.MsgConst;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class UserStartupCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        trace("UserStartupCommand");


        facade.registerCommand(NotiEvent.USER_REQUEST_STARS, UserCommand);
        facade.registerCommand(NotiEvent.USER_STARS_INIT, UserCommand);
        facade.registerCommand(NotiEvent.QQ_IM_REQUEST_INFO, UserCommand);


        facade.registerCommand(MsgEvent.SYS_ALERT_MSG, UserCommand);

        facade.registerCommand(MsgEvent.ALERT_MSG, UserCommand);

        facade.registerCommand(MsgEvent.BE_DISCONNECT, UserCommand);

        facade.registerCommand(MsgEvent.WALLOW_VERIFY, UserCommand);
        facade.registerCommand(MsgEvent.FIGHTER_ACCEPT, UserCommand);

        facade.registerCommand(MsgEvent.RANK_SETTING, UserCommand);

        facade.registerCommand(MsgEvent.RANK_DATA, UserCommand);

        facade.registerCommand(MsgEvent.FIGHTER_DISMISS, UserCommand);

        facade.registerCommand(MsgEvent.CARNIVAL, UserCommand);


        facade.registerCommand(MsgEvent.SEVEN_BACK_ACTIVITY, UserCommand);

        facade.registerCommand(MsgEvent.QQ_BUFF, UserCommand);

        facade.registerCommand(MsgEvent.N525_INFO, UserCommand);


        facade.registerCommand(MsgEvent.EXTENSION, UserCommand);

        facade.registerCommand(MsgEvent.SEVEN_ACTIVITY, OnSevenReturnCommand);
        facade.registerCommand(MsgEvent.RIDE_INFO, OnRideInfoReturnCommand)

       // facade.registerCommand(MsgEvent.GET_FIGHTER_NAME, GetFighterHandleCommand)
        facade.registerCommand(MsgEvent.CHANGE_EQUIPMENT, UpdateHeroInfoCommand)

        //facade.registerCommand(MsgEvent.POTENCIAL, UserCommand)


        facade.registerCommand(MsgEvent.GET_USERNAME, UserInfoCommand);
        facade.registerCommand(MsgEvent.USER_INFO, UpdateUserInfoCommand);

        /*   connection.addEventListener(MsgEvent.SYS_ALERT_MSG, sysAlertHandle);
         connection.addEventListener(MsgEvent.ALERT_MSG, globalAlert);
         connection.addEventListener(MsgEvent.BE_DISCONNECT, beDisconnected);

         connection.addEventListener(MsgEvent.GET_USERNAME, getUserInfoHandle);
         connection.addEventListener(MsgEvent.GET_FIGHTER_NAME, getFighterHandle);
         connection.addEventListener(MsgEvent.CHANGE_EQUIPMENT, updateHeroInfo);
         connection.addEventListener(MsgEvent.USER_INFO, updateUserInfo);
         connection.addEventListener(MsgEvent.WALLOW_VERIFY, wallowInfoHandler);
         connection.addEventListener(MsgEvent.FIGHTER_ACCEPT, onFighterAcceptHandle);

         connection.addEventListener(MsgEvent.RANK_SETTING, rankSettingHandle);
         connection.addEventListener(MsgEvent.RANK_DATA, rankDataHandle);
         connection.addEventListener(MsgEvent.FIGHTER_DISMISS, onFireHeroReturn);
         connection.addEventListener(MsgEvent.CARNIVAL, onCarnivalReturn);
         connection.addEventListener(MsgEvent.SEVEN_ACTIVITY, onSevenReturn);
         connection.addEventListener(MsgEvent.SEVEN_BACK_ACTIVITY, onSevenBackReturn);
         connection.addEventListener(MsgEvent.QQ_BUFF, onQqBuffReturn);
         connection.addEventListener(MsgEvent.N525_INFO, onN525InfoReturn);
         connection.addEventListener(MsgEvent.USER_STARS, onUserStars);
         connection.addEventListener(MsgEvent.RIDE_INFO, onRideInfoReturn);
         connection.addEventListener(MsgEvent.EXTENSION,onBaojuPurificationReturn);*/

        facade.registerCommand(MsgEvent.GET_TIME, ActivityInfoCommand)
        facade.registerCommand(NotiEvent.REFRESH_POWER,PowerCommand);//战力更新
        facade.registerCommand(NotiEvent.HERO_ADD_PRO_REFRESH,HeroAddProCommand)
        facade.registerCommand(NotiEvent.CLAN_SKILL_PRO_GET,HeroAddProCommand);

    }
}
}
