/**
 * Created by huangcb on 2017/8/19.
 */
package com.game.module.user.command {

import com.game.events.NotiEvent;
import com.game.module.map.vo.MapConstConfig;
import com.game.module.pack.view.PackView;
import com.game.module.user.events.RoleServiceEvent;
import com.game.module.user.proxy.UserProxy;
import com.game.module.user.vo.StatesVO;
import com.game.utils.UserUtil;

import net.consts.StaticConfig;
import net.data.recvMsg.user.UserInfoMsg;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class UserInfoCommand extends BaseCommand implements ICommand {
    public function UserInfoCommand() {
    }

    override public function execute(notification:INotification):void {
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        var usermsg:UserInfoMsg = notification.getBody() as UserInfoMsg;

        trace("UserInfoCommand")
        StaticConfig.bigUserId = usermsg._playerId;
        StaticConfig.userId10 = usermsg._playerId10;
        userProxy.userVO.playerId16 = usermsg._playerId.toString(16);
        userProxy.userVO.playerId10 = usermsg._playerId10;
        userProxy.userVO.country = usermsg.getCountry();
        userProxy.userVO.gold = usermsg.getGold();
        userProxy.userVO.giftScore = usermsg.getCoupon();
        userProxy.userVO.silver = usermsg.getTael();
        userProxy.userVO.copper = usermsg.getCoin();
        userProxy.userVO.prestige = usermsg.getPrestige();
        userProxy.userVO.achievScore = usermsg.archievScore;
        userProxy.userVO.corpsName = usermsg.clanName();
        userProxy.userVO.mounts_id = usermsg.mounts_id;
        userProxy.userVO.name = StaticConfig.userName;
        userProxy.userVO.dragonsoul = usermsg.dragonsoul;
        //userProxy.userVO.titleId=usermsg.titleId;
        /**
         * 是否打开小秘书面板
         */
        if ((usermsg.getStatus() & 0x08) == 8) {
            userProxy.userData.isOpenSecretary = false;
        } else {
            userProxy.userData.isOpenSecretary = true;
        }
        userProxy.userData.appendVo.killState = usermsg.getStatus() & 0x01;
        userProxy.userData.isPK = usermsg.getStatus() & 0x02;
        userProxy.userData.openExplore = (usermsg.getStatus() & 0x80) == 0;
        userProxy.userData.appendVo.killValue = usermsg.getKill_value();
        userProxy.userVO.donation = usermsg.getDonation();
        userProxy.userVO.qqLv = usermsg.qqvipLv;
        userProxy.userVO.qqYear = usermsg.qqvipYear;
        // userProxy.protocol = ((usermsg.mounts_id2<<2)-5)<<5 ;
        // StaticConfig.checkBit = usermsg.mounts_id3 ;
        var getviplevel:int = UserUtil.getVIPLevel(usermsg.getDonation());
        var viplevel:int = userProxy.userData.viplevel;
        userProxy.userData.vipCfgs = MapConstConfig.VIPData[getviplevel];


        userProxy.userData.clanTitleID = usermsg.clanTitleID;
        userProxy.userData.titleID = usermsg.titleId;
        userProxy.userVO.archivement = usermsg.getArchivement();
        userProxy.userVO.capacity = (usermsg.capacity == 0) ? PackView.BASE_PACK_NUM : usermsg.capacity;
        userProxy.userVO.soul_capacity = (usermsg.soul_capacity == 0) ? PackView.SOUL_BASEPACK_NUM : usermsg.soul_capacity;
        userProxy.userVO.jewel_capacity = (usermsg.jewel_capacity == 0) ? PackView.JEWEL_BASEPACK_NUM : usermsg.jewel_capacity;
        userProxy.userVO.formation_capacity = (usermsg.formation_capacity == 0) ? PackView.FORMATION_BASEPACK_NUM : usermsg.formation_capacity;
        userProxy.userVO.sprite_capacity = (usermsg.sprite_capacity == 0) ? PackView.SPRITE_BASEPACK_NUM : usermsg.sprite_capacity;
        userProxy.userVO.lingzhu_capacity = (usermsg.lingzhu_capacity == 0) ? PackView.LINGZHU_BASE_NUM : usermsg.lingzhu_capacity;

        var buffDatas:Array = usermsg.getBuffDatas();
        for (var j:uint = 0; j < buffDatas.length; j++) {
            var vo:StatesVO = UserUtil.getStateVO(buffDatas[j].buffId, buffDatas[j].timeLeft);
            if (vo)
                userProxy.userVO.buffList.push(vo);
        }

        userProxy.userData.titleArr = usermsg.getTitleDatas();
        userProxy.userData.clanTitleArr = usermsg.getclanTitleData();
        userProxy.userData.isHideVIP = usermsg.isHideVIP;
        userProxy.userData.isHideTitle = usermsg.isHideTitle;

        userProxy.userData.zhenyuanSoul = usermsg.zhenyuanSoul;
        userProxy.userData.zhenyuanSoulExp = usermsg.zhenyuanSoulExp;

        userProxy.userData.benchFighterID = usermsg.benchID;

        userProxy.userData.isYaoGuide = usermsg.isYaoGuide;
        userProxy.userData.isGetYao = usermsg.isGetYao;
        userProxy.userData.heroRefreshNum = usermsg.heroRefreshNum;

        facade.notifyObservers(new NotiEvent(NotiEvent.BUFFER_SHOW, userProxy.userVO.buffList));

        facade.notifyObservers(new RoleServiceEvent(RoleServiceEvent.USER_INFO));
        facade.notifyObservers(new NotiEvent(NotiEvent.PACK_DEAL_REQUEST));
        //修为
        facade.notifyObservers(new NotiEvent(NotiEvent.PRACTICE_PLACE_INFO_CMD));
        if (viplevel != getviplevel) {
            userProxy.userData.viplevel = getviplevel;
            facade.notifyObservers(new NotiEvent(NotiEvent.VIP_LEVEL, getviplevel));
        }

        facade.notifyObservers(new NotiEvent(NotiEvent.CLAN_SKILL_PRO));
        facade.notifyObservers(new NotiEvent(NotiEvent.NEWVIP_INFO_SEND));   //登录后请求vip信息


    }
}
}
