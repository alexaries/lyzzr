package com.game.utils {
import com.game.common.vo.AcConfigRequest;
import com.game.module.share.proxy.ShareProxy;
import com.game.module.user.proxy.UserProxy;

import config.ConfigManager;
import config.mission.openfunc.IOpenfuncCfg;

import globals.PlatformSDK;

import org.puremvc.as3.patterns.facade.Facade;

import utils.ArrayUtil;

public class FuncUtil {
    private static var userProxy:UserProxy = Facade.getInstance().retrieveProxy(UserProxy.NAME) as UserProxy;
//    private static var activity:ActivityService = Facade.getInstance().retrieveProxy(ActivityService.NAME) as ActivityService;
    private static var shareProxy:ShareProxy = Facade.getInstance().retrieveProxy(ShareProxy.NAME) as ShareProxy;
//    private static var onlinePrizeProxy:OnlinePrizeProxy = Facade.getInstance().retrieveProxy(OnlinePrizeProxy.NAME) as OnlinePrizeProxy;
//    private static var guideProxy:GuideService = Facade.getInstance().retrieveProxy(GuideService.NAME) as GuideService;

    public function FuncUtil() {
    }

    /* arg: id,arg1,arg2,... */
    public static function check(arg:String):Boolean {
        if (!arg) {
            return false;
        }
        var argsArr:Array = (arg + "").split("|");
        var id:int = parseInt(argsArr.shift());
        var result:Boolean = false;
        switch (id) {
            case 1:
                //时间判断 19:00,21:00
                if (argsArr.length != 2) {
                    result = false;//参数不对
                } else {
                    result = isInTime(argsArr[0], argsArr[1]);
                }
                break;
            case 2:
                //首充
                if (userProxy.userData.xsgift == 0 || userProxy.userData.xsgift == 1) {
                    result = true;
                }
                break;
            case 3:
                //橙装
//                if(userProxy.userData.xsgift == 2 || userProxy.userData.xsgift == 3 || userProxy.userData.xsgift == 4){
//                    result = true;
//                }
                result = false;//不显示橙装礼包了
                break;
            case 4:
                //七日狂欢
//                result = activity.isInSevenday;
                break;
            case 5:
                //七日登录
//                result = activity.isInSign;
                break;
            case 6:
                //精彩活动
//                result = activity.isInDan || activity.isInLei || activity.isInLimit || activity.activityOpenArr.length > 0;
                break;
            case 7:
                result = PlatformSDK.getInstance().canShowShare();//分享图标持续显示
                break;
            case 8:
                result = PlatformSDK.getInstance().canShowShare() && shareProxy.info.concerntime != -1;//关注的奖励领取了之后 就不显示了
                break;
            case 9:
//                result = onlinePrizeProxy.curreward < 6;
                break;
            case 10:
//                var len:int = ConfigManager.instance.activity_onlineLevel.rewards.levelRewards.skipper.length;
//                var cfg:IOnlineLevel_rewards_levelRewards_skipper = ConfigManager.instance.activity_onlineLevel.rewards.levelRewards.skipper[len - 1];
//                result = guideProxy.upgrageRewardVo.gettedLv < cfg.level;

                result = true;
                break;
            case 11:
                //由李亚楠 运营那边控制配置
                if (argsArr.length != 1) {
                    result = false;//参数不对
                } else {
                    result = AcConfigRequest.getInstance().checkActivity(parseInt(argsArr[0]));
                }
                break;
        }

        return result;
    }

    /* 19:00,20:00 */
    public static function isInTime(start:String, end:String):Boolean {
        var arr1:Array = start.split(":");
        var arr2:Array = end.split(":");
        var startH:int = parseInt(arr1[0]);
        var startM:int = parseInt(arr1[1]);
        var endH:int = parseInt(arr2[0]);
        var endM:int = parseInt(arr2[1]);
        var nowDate:Date = new Date();
        var startDate:Date = new Date();
        startDate.setHours(startH);
        startDate.setMinutes(startM);
        var endDate:Date = new Date();
        endDate.setHours(endH);
        endDate.setMinutes(endM);
        var now:Number = nowDate.getTime();
        var __start:Number = startDate.getTime();
        var __end:Number = endDate.getTime();
        return __start <= now && now < __end;
    }

    /* 到达开启等级 */
    public static function isOpen(id:int) {
        var cfg:IOpenfuncCfg = ArrayUtil.find(ConfigManager.instance.mission_openfunc.openfuncCfg, function (item:IOpenfuncCfg) {
            return item.id == id;
        });
        if (cfg)return userProxy.userVO.level >= cfg.level;
        return false;
    }
}
}
