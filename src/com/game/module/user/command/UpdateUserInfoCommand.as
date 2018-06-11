/**
 * Created by huangcb on 2017/8/29.
 */
package com.game.module.user.command {

import com.game.consts.URLConfig;
import com.game.events.NotiEvent;
import com.game.module.battle.util.FfUtil;
import com.game.module.heroic.proxy.HeroProxy;
import com.game.module.heroic.vo.HeroVO;
import com.game.module.hotel.events.HotelEvent;
import com.game.module.map.events.MapServiceEvent;
import com.game.module.rune.proxy.RuneProxy;
import com.game.module.skillstage.model.SkillStageModel;
import com.game.module.skillstage.proxy.SkillStageService;
import com.game.module.user.events.HeroServiceEvent;
import com.game.module.user.proxy.UserProxy;
import com.game.module.user.vo.StatesVO;
import com.game.utils.UserUtil;
import com.game.vo.GernalHeroVO;
import com.game.vo.UserData;

import globals.ConfigLocator;

import lang.LangTxt;

import net.consts.StaticConfig;
import net.data.recvMsg.user.StateMsg;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

import com.game.common.mvc.BaseCommand;

import org.puremvc.as3.patterns.observer.Notification;

import utils.ArrayUtil;

public class UpdateUserInfoCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        var msg:StateMsg = body as StateMsg;
        var runeProxy:RuneProxy = facade.retrieveProxy(RuneProxy.NAME) as RuneProxy;
        var heroProxy:HeroProxy = facade.retrieveProxy(HeroProxy.NAME) as HeroProxy;
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        var skillStageService:SkillStageService = facade.retrieveProxy(SkillStageService.NAME) as SkillStageService;

        var _userData:UserData = userProxy.userData;
        switch (msg.field) {
            case 0x01:
                _userData.userVO.gold = msg.data;
                break;
            case 0x02:
                _userData.userVO.giftScore = msg.data;
                break;
            case 0x03:
                _userData.userVO.silver = msg.data;
                break;
            case 0x04:
                _userData.userVO.copper = msg.data;
                break;
            case 0x05:
                _userData.appendVo.killState = msg.data & 0x01;
                _userData.isPK = msg.data & 0x02;
                _userData.openExplore = (msg.data & 0x80) == 0;
                // this.sendNotification(NotificationConst.SHIFT_EXPLORE, UserData.instance.openExplore);
                break;
            case 0x06:
                _userData.titleID = msg.data;
                dispatch(new NotiEvent(NotiEvent.USER_TITLE_CHANGE_MSG));
                dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.TITLE_CHANGE_SUCCESS));
                dispatch(new NotiEvent(NotiEvent.TITLE_UPDATELB));
                break;
            case 0x07:
                _userData.userVO.donation = msg.data;
                // 消息出去  元宝数目改变
                dispatch(new NotiEvent(NotiEvent.DONATION_CHANGE));
                break;
            case 0x08:
                _userData.userVO.archivement = msg.data;
                // sendNotification(HeroPanelConstConfig.USER_DATA_CHANGE,0);
                break;
            case 0x09:
                //坐骑改变
                _userData.userVO.mounts_id = msg.data;
                dispatch(new HeroServiceEvent(HeroServiceEvent.HERO_RIDE_CHANGE));
//                var evt : MapServiceEvent = new MapServiceEvent(MapServiceEvent.PLAYER_SPEED_CHANGE);
//                evt.data = msg.data ;
//                dispatch(evt);
                break;
            case 0x0a:
                _userData.userVO.capacity = msg.data;
            case 0x0b:
                _userData.userVO.achievScore = msg.data;
                break;
            case 0x10:
                // 新手引导
                // sendNotification(NewsConstConfig.NEWS_GUIDER_RETURN , (111110+msg.data) );
                break;
            case 0x11:
                _userData.userVO.country = msg.data;
                break;
            case 0x12:
                _userData.userVO.qqLv = msg.data;
                break;
            case 0x13:
                _userData.userVO.qqYear = msg.data;
                break;
            case 0x14:
                StaticConfig.checkBit = msg.data;
                //trace("StaticConfig.checkBit---------------", StaticConfig.checkBit);
                break;
            case 0x15:
                _userData.userVO.prestige = msg.data;
                break;
            case 0x16:
                _userData.userVO.dragonsoul = msg.data;
                break;
            case 0x17:
                _userData.titleArr = msg.titleArr;
                dispatch(new NotiEvent(NotiEvent.USER_TITLE_CHANGE_MSG));
                dispatch(new NotiEvent(NotiEvent.TITLE_UPDATE));
                heroProxy.refreshHeros();
                break;
            case 0x18:
                _userData.userVO.xianyuan = msg.data;
                dispatch(new NotiEvent(NotiEvent.USER_TITLE_CHANGE_MSG));
                break;
            case 0x19:
                _userData.userVO.currentChargeGold = msg.data;
                // 关闭充值面板
                dispatch(new NotiEvent(NotiEvent.SHOW_RECHARGE, false));
                //打开弹框面板
                dispatch(new NotiEvent(NotiEvent.SHOW_CHARGEPOPUP, [true,9]));
                dispatch(new NotiEvent(NotiEvent.CHARGE_SUCESS));
                break;
            case 0x1a:
                URLConfig.skin = msg.data;
                break;
            case 0x20:
                if (msg.data == 1) {
                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, "更名卡使用成功！"));
                    StaticConfig.userName = msg.newName;
                    userProxy.userVO.name = StaticConfig.userName;
                    heroProxy.getMainHeroInfo().name = StaticConfig.userName;
                    //iservice.sendClanSelfInfoCmd();
                } else if (msg.data == 2) {
                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, "该名字已使用！"));
                } else if (msg.data == 3) {
                    dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, "改名成功后的1周时间内，不能再次改名！"));
                }
                break;
            case 0x21:
                userProxy.userVO.zhenyuan = msg.data;
                userProxy.userVO.isgetzhenyuan = msg.isGetZhenyuan;
                break;
            case 0x22:
                heroProxy.getMainHeroInfo().id = msg.data;
                //更新主将
                var gernal:GernalHeroVO = ConfigLocator.getInstance().gernalHeros.get(heroProxy.getMainHeroInfo().id);
                len = _userData.heros.length;
                for (var i:int = 0; i < len; i++) {
                    if ((_userData.heros[i] as HeroVO).isUserSelf) {
                        _userData.heros[i].sex = gernal.sex;
                        _userData.heros[i].imgId = gernal.imgId;
                        break;
                    }

                }
                dispatch(new HeroServiceEvent(HeroServiceEvent.HERO_LIST_UPDATE, 1));

                userProxy.userVO.gender = gernal.sex;
                //更新player模型
                var str:String = gernal.sex.toString() + "_" + gernal.careerId.toString();
                userProxy.userVO.humanSwfUrl = FfUtil.toMapResId(gernal.id);
                var evt:MapServiceEvent = new MapServiceEvent(MapServiceEvent.PLAYER_SOURCE_CHANGE, userProxy.userVO.humanSwfUrl);

                trace("MapServiceEvent.PLAYER_SOURCE_CHANGE")
                dispatch(evt);
                //更新装备列表
                for (var id:String in heroProxy.eqOnHeroDic) {
                    if ((id) <= 6) {
                        heroProxy.eqOnHeroDic.set(heroProxy.getMainHeroInfo().id, heroProxy.eqOnHeroDic.get(id));
                    }
                }
                //更新符文信息
                var len:int = runeProxy.runeInfos ? runeProxy.runeInfos.length : 0;
                for (i = 0; i < len; i++) {
                    if (runeProxy.runeInfos[i].heroID <= 6) {
                        runeProxy.runeInfos[i].heroID = heroProxy.getMainHeroInfo().id;
                    }
                }
                //更新技能升阶
                var model:SkillStageModel = skillStageService.model;
                for each(id in model.skillStageMap.keys) {
                    if ((id) <= 6) {
                        model.skillStageMap.set(gernal.id, model.skillStageMap.get(id))
                    }
                }
                for each(id in model.unskillStageMap.keys) {
                    if ((id) <= 6) {
                        model.unskillStageMap.set(gernal.id, model.unskillStageMap.get(id))
                    }
                }
                break;
            case 0x23:
                _userData.clanTitleArr = msg.titleArr;
                //todo ClanTotom.instance.refreshPanel();
                break;
            case 0x26:
                _userData.heroRefreshNum = msg.data;
                dispatch(new Notification(HotelEvent.HOTEL_HEROREFRESJNUM));
                break;
            case 0x27:
                //打开弹框面板
                dispatch(new NotiEvent(NotiEvent.SHOW_CHARGEPOPUP, [true,msg.data]));
                dispatch(new NotiEvent(NotiEvent.CHARGE_SUCESS));
                break
            default:
                var vo:StatesVO = UserUtil.getStateVO(msg.field, msg.data);
                if (vo) {
                    var buff = ArrayUtil.find(_userData.userVO.buffList, function (item) {
                        if (item.id == vo.id) {
                            item.remain = vo.remain;
                            return true;
                        }
                    });
                    if (buff == null)_userData.userVO.buffList.push(vo);
                    this.dispatch(new NotiEvent(NotiEvent.BUFFER_CHANGE, vo));
                }
                break;
        }
        dispatch(new NotiEvent(NotiEvent.USER_INFO_UPDATE));
    }


}
}
