/**
 * Created by huangcb on 2017/8/29.
 */
package com.game.module.user.command {

import com.game.common.events.PopManagerEvent;
import com.game.consts.URLConfig;
import com.game.module.heroic.proxy.HeroProxy;
import com.game.module.swordGrave.events.SwordGraveEvent;
import com.game.module.user.events.HeroServiceEvent;
import com.game.module.user.proxy.UserProxy;
import com.game.module.user.vo.UserRideVO;
import com.game.vo.PopManagerWinType;

import net.data.recvMsg.heropanel.RideMsg;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;
import org.puremvc.as3.patterns.observer.Notification;

import utils.ArrayUtil;

public class OnRideInfoReturnCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        var heroProxy:HeroProxy = facade.retrieveProxy(HeroProxy.NAME) as HeroProxy;
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var msg:RideMsg = body as RideMsg;
        switch (msg.flag) {
            case 0:
                userProxy.userVO.rideLv = msg.lv;
                userProxy.userVO.rideProcess = msg.process;
                var listData:Array = [];
                var isShowNew:Boolean = userProxy.userData.timeIsOpen(URLConfig.rideTime);
                for (var i:int = 0; i < msg.rideDatas.length; i++) {
                    var id:int = msg.rideDatas[i][0];
                    var rvo:UserRideVO = ArrayUtil.find(userProxy.userVO.rideDatas, function (v:UserRideVO) {
                        return v.id == id;

                    });
                    if (rvo == null) {
                        rvo = new UserRideVO();
                        rvo.id = id;

                    }
                    rvo.itemState = msg.rideDatas[i][1];
                    rvo.currFloor = msg.rideDatas[i][2];
                    rvo.currFloor2 = msg.rideDatas[i][3];
                    rvo.faileTimes = msg.rideDatas[i][4];
                    if (rvo.quality == URLConfig.rideQuality && !isShowNew) {
                        continue;
                    }
                    listData.push(rvo);
                }
                userProxy.userVO.rideDatas = listData;
                userProxy.refreshRideProp();
                break;
            case 1:
                userProxy.userVO.rideLv = msg.lv;
                userProxy.userVO.rideProcess = msg.process;
                userProxy.refreshRideProp();
                break;
            case 2:
                var rData:UserRideVO;
                var rideId:int = msg.rideDatas[0];
                var rTempDatas:Array = userProxy.userVO.rideDatas;
                if (!rTempDatas)
                    rTempDatas = [];
                for (var j:int = 0; j < rTempDatas.length; j++) {
                    rData = rTempDatas[j].data;
                    if (rData.id == rideId) {
                        rData.itemState =  Math.floor(msg.rideDatas[1]);
                        rData.currFloor =  Math.floor(msg.rideDatas[2]);
                        rData.currFloor2 =  Math.floor(msg.rideDatas[3]);
                        rData.faileTimes =  Math.floor(msg.rideDatas[4]);
                        break;
                    }
                }
                userProxy.userVO.rideDatas = rTempDatas;
                userProxy.refreshRideProp();
                dispatch(new SwordGraveEvent(SwordGraveEvent.SWORD_EXCHANGE_RESULT, rideId));
                break;
            case 3:
                userProxy.userVO.swordFreeTime = msg.swordFreeTime;
                dispatch(new SwordGraveEvent(SwordGraveEvent.GET_FREE_TIME_SUCCESS));
                break;
            case 4:
                if (msg.rewards.length > 0) {
                    dispatch(new PopManagerEvent(PopManagerEvent.SHOW, [PopManagerWinType.HERO_RIDE_REWARD, msg.rewards]));
                }
                break;
            default:
                break;
        }
        dispatch(new HeroServiceEvent(HeroServiceEvent.RIDE_INFO_UPDATE));
    }


}
}
