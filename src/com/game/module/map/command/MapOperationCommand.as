/**
 * Created by huangcb on 2017/8/22.
 */
package com.game.module.map.command {

import com.game.common.events.WindowEvent;
import com.game.events.NotiEvent;
import com.game.module.user.proxy.UserProxy;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class MapOperationCommand extends BaseCommand implements ICommand {

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }
    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {



            case   NotiEvent.PLAYER_MOVE_START:
                doPlayerMoveStart();
                break;
        }
    }
    private function doPlayerMoveStart() : void {
        //    dispatch(new NotiEvent(NotiEvent.POPUP_DLG, [""]));
        userProxy.userData.buildId = -1;
        dispatch(new WindowEvent(WindowEvent.MENU_CLOSE_ALL_WIN));

        return;
    }


}
}
