/**
 * Created by huangcb on 2017/8/19.
 */
package com.game.module.user.command {

import com.game.events.NotiEvent;
import com.game.module.heroic.vo.HeroVO;
import com.game.module.user.proxy.UserProxy;

import net.events.MsgConst;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

import com.game.common.mvc.BaseCommand;

import utils.ByteArray;

public class UserCommand extends BaseCommand implements ICommand {

    public function UserCommand() {
    }

    override public function execute(notification:INotification):void {
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (notification.getName()) {
            case NotiEvent.USER_REQUEST_STARS:
                userProxy.requestStars.apply(userProxy, body as Array);
                break;
            case NotiEvent.USER_STARS_INIT:
                var arr:Array = userProxy.userData.heros;
                var hvo:HeroVO;
                for (var i:uint = 0; i < arr.length; i++) {
                    hvo = arr[i];
                    if (hvo.stars_val == 0) {
                        userProxy.requestStars(0, hvo.id, 0, 0, 0, []);
                    }
                }
                break;
            case NotiEvent.QQ_IM_REQUEST_INFO:
                userProxy.sendSevenCmd(body[0], body[1]);
                break;


            case MsgEvent.SYS_ALERT_MSG:
                userProxy.sysAlertHandle(body as Object);
                break;
            case MsgEvent.ALERT_MSG:
                userProxy.globalAlert(body);
                break;
            case MsgEvent.BE_DISCONNECT:
                userProxy.beDisconnected();
                break;


            case MsgEvent.WALLOW_VERIFY:
                userProxy.wallowInfoHandler(body);
                break;
            case MsgEvent.FIGHTER_ACCEPT:
                userProxy.onFighterAcceptHandle(body);
                break;

            case MsgEvent.RANK_SETTING:
                userProxy.rankSettingHandle(body);
                break;
            case MsgEvent.RANK_DATA:
                userProxy.rankDataHandle(body);
                break;
            case MsgEvent.FIGHTER_DISMISS:
                userProxy.onFireHeroReturn(body);
                break;
            case MsgEvent.CARNIVAL:
                userProxy.onCarnivalReturn(body);
                break;

            case MsgEvent.SEVEN_BACK_ACTIVITY:
                userProxy.onSevenBackReturn(body);
                break;
            case MsgEvent.QQ_BUFF:
                userProxy.onQqBuffReturn(body);
                break;
            case MsgEvent.N525_INFO:
                userProxy.onN525InfoReturn(body);
                break;
            case MsgEvent.USER_STARS:
                userProxy.onUserStars(body);
                break;
            case MsgEvent.EXTENSION:
                userProxy.onBaojuPurificationReturn(body as ByteArray);
                break;

            case MsgEvent.SEVEN_ACTIVITY:
                //userProxy.onSevenReturn(body);
                break;
            case MsgEvent.RIDE_INFO:
                // userProxy.onRideInfoReturn();
                break;
            case MsgEvent.GET_USERNAME:
                //userProxy.getUserInfoHandle(body);
                break;
            case MsgEvent.GET_FIGHTER_NAME:
                // userProxy.getFighterHandle();
                break;
            case MsgEvent.CHANGE_EQUIPMENT:
                trace("CHANGE_EQUIPMENT==")
                // userProxy.updateHeroInfo();
                break;
            case MsgEvent.USER_INFO:
                //userProxy.updateUserInfo();
                break;
            case MsgConst.BATTLE_CHECK:
                //var arr:Array = body as Array
                break
            case MsgEvent.POTENCIAL:
                userProxy.doResponsePotencial(body)
                break

        }
    }

}
}
