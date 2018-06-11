/**
 * Created by huangcb on 2017/8/29.
 */
package com.game.module.user.command {

import com.game.common.events.NoBlockEvent;
import com.game.events.NotiEvent;
import com.game.module.activity.events.ActivityServiceEvent;
import com.game.module.activity.events.ActvityEvent;
import com.game.module.daily.proxy.DailyService;
import com.game.module.qqback.proxy.QQBackProxy;
import com.game.module.returnplayer.proxy.ReturnPlayerProxy;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.NoBlockWinType;

import net.consts.StaticConfig;
import net.data.recvMsg.active.SevenActivityMsg;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;
import org.puremvc.as3.patterns.observer.Notification;

import utils.ByteArray;

public class OnSevenReturnCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        var dailyService:DailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        var returnPlayerProxy:ReturnPlayerProxy = facade.retrieveProxy(ReturnPlayerProxy.NAME) as ReturnPlayerProxy;
        var qqBackProxy:QQBackProxy = facade.retrieveProxy(QQBackProxy.NAME) as QQBackProxy;

        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var msg:SevenActivityMsg = body as SevenActivityMsg;
        switch (msg.type) {
            case 0:
                userProxy.userData.sevenIncome = msg.income;
                userProxy.userData.sevenDot = msg.dot;
                userProxy.userData.seven_maxcts = msg.cts;
                userProxy.userData.sevenStatus = [msg.online, msg.cts1, msg.cts2, msg.cts3, msg.will];
                dailyService.vo.seven_aim = msg.cts4;
                dailyService.vo.seven_day = msg.day - 1;
                dailyService.vo.seven_nday = msg.cts1 - 1;
                break;
            case 1:
                userProxy.userData.sevenStatus[0] = 1;
                break;
            case 2:
                userProxy.userData.sevenStatus[2] = 1;
                break;
            case 3:
                userProxy.userData.sevenStatus[3] = 1;
                break;
            case 4:
                userProxy.userData.sevenStatus[4] = msg.will;
                break;
            case 5:
                userProxy.userData.sevenIncome = msg.income;
                break;
            case 6:
                userProxy.userData.sevenDot = msg.dot;
                break;
            case 8:
                var byte:ByteArray = body as ByteArray;
                var cmd:uint = byte.readByte();
                if (cmd == 0) {
                    returnPlayerProxy.returnPlayerLv = byte.readByte();
                    returnPlayerProxy.isCanGet_1 = byte.readByte() == 0;
                    returnPlayerProxy.rewardDays = byte.readByte();
                    returnPlayerProxy.isCanGet_2 = byte.readByte() == 0;

                    if (returnPlayerProxy.returnPlayerLv != 0) {
                        if (StaticConfig.isReturnServer) {
                            if (returnPlayerProxy.isCanGet_1) {
                                //未领取 可弹框
                                //var view:ReturnActivityView = ViewFactory.getInstance().getView(new ViewActionVO(ReturnActivityView.NAME,ReturnActivityView)) as ReturnActivityView;
                                dispatch(new NoBlockEvent(NoBlockEvent.MENU_WIN_ADD, NoBlockWinType.RETURN_ACTIVITY));
                            }
                        } else {
                            dispatch(new NotiEvent(NotiEvent.SHOW_RETURNPLAYER_BTN));
                        }
                    }
                }
                else if (cmd == 1) {
                    returnPlayerProxy.isCanGet_1 = false;
                }
                else if (cmd == 2) {
                    returnPlayerProxy.isCanGet_2 = false;
                }
                break;
            case 9:
                userProxy.userData.isBuyu = true;
                userProxy.activityModel.buyuDay = msg.day;
                userProxy.activityModel.buyuDot = msg.dot;
                userProxy.activityModel.buyuPackDot = msg.packdot;
                dispatch(new ActivityServiceEvent(ActivityServiceEvent.BUYU_UPDATE));
                dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 10]));
                return;
                break;
            case 11:
                userProxy.activityModel.buyuDay = msg.day;
                userProxy.activityModel.buyuDot = msg.dot;
                userProxy.activityModel.buyuPackDot = msg.packdot;
                dispatch(new ActivityServiceEvent(ActivityServiceEvent.BUYU_UPDATE));
                dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 11]));
                return;
                break;
            case 12:
                userProxy.activityModel.buyuDay = msg.day;
                userProxy.activityModel.buyuDot = msg.dot;
                userProxy.activityModel.buyuPackDot = msg.packdot;
                dispatch(new ActivityServiceEvent(ActivityServiceEvent.BUYU_UPDATE));
                dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 13]));
                return;
                break;
            case 13:
                userProxy.activityModel.buyuDay = msg.day;
                userProxy.activityModel.buyuDot = msg.dot;
                userProxy.activityModel.buyuPackDot = msg.packdot;
                dispatch(new ActivityServiceEvent(ActivityServiceEvent.BUYU_UPDATE));
                dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 14]));
                return;
                break;
            case 14:
                userProxy.activityModel.buyuDay = msg.day;
                userProxy.activityModel.buyuDot = msg.dot;
                userProxy.activityModel.buyuPackDot = msg.packdot;
                dispatch(new ActivityServiceEvent(ActivityServiceEvent.BUYU_UPDATE));
                dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 15]));
                return;
                break;
            case 15:
                dailyService.vo.qq_day = msg.day;
                dailyService.vo.qq_state = msg.income;
                dispatch(new NotiEvent(NotiEvent.QQ_IM_RESPONSE_INFO, []));
                return;
                break;
            case 16:
                userProxy.activityModel.spday = msg.day;
                userProxy.activityModel.spxs = msg.dot;
                userProxy.activityModel.spvipLv = msg.will;
                userProxy.activityModel.spreward1 = msg.cts1;
                userProxy.activityModel.spreward2 = msg.cts2;
                userProxy.activityModel.spreward3 = msg.cts3;
                dispatch(new NotiEvent(NotiEvent.STRONG_INFO_CMD, 0x1));
                dispatch(new NotiEvent(NotiEvent.SPREWARD, []));
                return;
                break;
            case 17:
                qqBackProxy.type_new = msg.flag;
                qqBackProxy.isGetReward_new = Boolean(msg.award);
                dispatch(new NotiEvent(NotiEvent.QQ_BACK_UPDATED_NEW));
                if (qqBackProxy.type_new > 0 && !qqBackProxy.isGetReward_new) {
                    qqBackProxy.type_new -= 1;
                    dispatch(new NoBlockEvent(NoBlockEvent.MENU_WIN_ADD, NoBlockWinType.QQ_BACK_NEW));
                }
                return;
                break;
            case 18:
                userProxy.activityModel.inQQBack_New = true;
                userProxy.activityModel.spday_new = msg.day;
                userProxy.activityModel.spxs_new = msg.dot;
                userProxy.activityModel.spreward1_new = msg.cts1;
                userProxy.activityModel.spreward2_new = msg.cts2;
                userProxy.activityModel.spreward3_new = msg.cts3;
                dispatch(new NotiEvent(NotiEvent.STRONG_INFO_CMD, 0x1));
                dispatch(new NotiEvent(NotiEvent.SPREWARD, []));
                return;
                break;
            case 28:
                userProxy.activityModel.sprewardExperienceProgress = msg.experience;
                userProxy.activityModel.sprewardExperienceScore = msg.experienceScore;
                dispatch(new NotiEvent(NotiEvent.SPREWARD, []));
                return;
                break;
            case 19:
                userProxy.activityModel.qqGameGift2_flag1 = msg.flag;
                userProxy.activityModel.qqGameGift2_flag2 = msg.flag2;
                dispatch(new ActvityEvent(ActvityEvent.LOGINGIFT2_GET_REWARD));
                return;
                break;
            case 27:
                userProxy.activityModel.qqBrowerSignList = msg.signList;
                userProxy.activityModel.qqBrowerDayRewardGet = msg.dayGet;
                userProxy.activityModel.qqBrowerWeekRewardGet = msg.weekGet;
                userProxy.activityModel.qqBrowerMonthRewardGet = msg.monthGet;
                userProxy.activityModel.qqBrowerLoginDays = msg.day;
                //userProxy.activityModel.isFirstLogoin = msg.fistLogin;
                break;
            default:
        }
        dispatch(new ActvityEvent(ActvityEvent.SEVEN_UPDATE));
    }

}
}
