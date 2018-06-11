package com.game.module.user.proxy {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseProxy;
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.map.vo.MapVO;
import com.game.module.menu.events.MenuEvent;
import com.game.module.user.vo.StatesVO;
import com.game.vo.MenuWinType;
import com.game.vo.UserData;
import com.game.vo.UserInfoVO;

import config.ConfigManager;
import config.message.alertMsg.IAlertMsg_item;

import globals.ServiceTime;

import lang.LangTxt;
import lang.SystemInfo;

import net.data.recvMsg.active.CarnivalMsg;
import net.data.recvMsg.active.N525Msg;
import net.data.recvMsg.active.SevenBackActivityMsg;
import net.data.recvMsg.friend.GFriendRewardMsg;
import net.data.recvMsg.potencial.PotencialMsg;
import net.data.recvMsg.rank.BattleCheckMsg;
import net.data.recvMsg.rank.ReadBattleMsg;
import net.data.recvMsg.user.AntiAddictionMsg;
import net.data.recvMsg.user.FireHeroMsg;
import net.data.recvMsg.user.GlobalAlertMsg;
import net.data.recvMsg.user.SysAlertMsg;
import net.data.sendCmd.DynamicCmd;
import net.data.sendCmd.active.CarnivalCmd;
import net.data.sendCmd.active.N525Cmd;
import net.data.sendCmd.active.SevenActivityCmd;
import net.data.sendCmd.active.SevenBackActivityCmd;
import net.data.sendCmd.friend.GFriendRewardCmd;
import net.data.sendCmd.heropanel.RideCmd;
import net.data.sendCmd.rank.ReadBattleCmd;
import net.data.sendCmd.user.AddHpCmd;
import net.data.sendCmd.user.ChangeEQCmd;
import net.data.sendCmd.user.FireHeroCmd;
import net.data.sendCmd.user.QQBuffCmd;
import net.data.sendCmd.user.StarsCmd;
import net.data.sendCmd.user.StateCmd;
import net.data.sendCmd.user.UserInfoCmd;
import net.data.structs.rank.BattleHeroStruct;
import net.events.MsgConst;
import net.proxy.SocketConnectionProxy;
import net.utils.BytesUtil;

import utils.ArrayUtil;
import utils.ByteArray;

public class UserProxy extends BaseProxy {
    public static const NAME:String = "UserProxy";
    var connection:SocketConnectionProxy;
    public var toDelayUint:uint;
    public var userData:UserData;
    public var toUpdateHeros:Array = [];

    public function UserProxy() {
        super(NAME);

        userData = new UserData();
        connection = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;
        //proxy拿代理  老代码原因
    }

    //是否在战斗CD中
    public function get isInBattleCD():Boolean {
        var stateVo:StatesVO = ArrayUtil.find(userVO.buffList, function (vo:StatesVO) {
            return vo.id == 0x10;
        });
        return stateVo != null;
    }

    public function useGold(n:uint):Boolean {
        var flag:Boolean = true;
        if (userVO.gold < n) {
            flag = false;
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.MOREINGOT));
        }
        return flag;
    }

    public function useGoldOrGift(n:uint):Boolean {
        var flag:Boolean = true;
        if (userVO.gold + userVO.giftScore < n) {
            flag = false;
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, LangTxt.MOREINGOT1));
        }
        return flag;
    }


    public function refreshRideProp():void {

    }

    public function delayUpdateHero():void {
        var fid:uint;
        for (var i:int = 0; i < toUpdateHeros.length; i++) {
            fid = toUpdateHeros[i];
            dispatch(new NotiEvent(NotiEvent.HERO_INFO_UPDATE, fid));
        }
        //clearTimeout(toDelayUint);
        toUpdateHeros = [];
    }

    public function get userVO():UserInfoVO {
        return userData.userVO;
    }

    public function get mapVO():MapVO {
        return userData.mapVO;
    }

    public function set mapVO(value:MapVO):void {
        userData.mapVO = value;
    }

    public function sendUserinfoCmd():void {
        var cmd:UserInfoCmd = new UserInfoCmd();
        connection.send(cmd);
    }

    /*宝具炼化*/
    public function onBaojuPurificationReturn(bytes:ByteArray):void {
        bytes.position = 0;
        var type:uint = BytesUtil.readByte1(bytes);
        if (type != 0x16)return;
        type = BytesUtil.readByte1(bytes);
        var result:uint = 0;
        if (type == 0x01) { //洗练成功与否
            result = BytesUtil.readByte1(bytes);
            if (result == 1) {
                dispatch(new NotiEvent(NotiEvent.BAOJU_PURIFICATION_RETURN));
            }
        } else if (type == 0x02) {
            result = BytesUtil.readByte1(bytes);
            if (result == 1) {
                dispatch(new NotiEvent(NotiEvent.BAOJU_PURIFICATION_OPEN_SKILL_RETURN))
            }
        }
    }

    /**
     * 525活动 返回
     */
    public function onN525InfoReturn(event:Object):void {
        var msg:N525Msg = event as N525Msg;
        userData.n525Info = [msg.times, msg.rank];
        userData.n525Data = msg.nData;
//        dispatch(new ActvityEvent(ActvityEvent.N525_INFO));
    }

    public function onUserStars(event:Object):void {
        return;
    }

    /**
     * QQBUFF 返回
     */
    public function onQqBuffReturn(event:Object):void {
    }


    public function onSevenBackReturn(event:Object):void {
        var msg:SevenBackActivityMsg = event as SevenBackActivityMsg;
    }

    public function onCarnivalReturn(event:Object):void {
        var msg:CarnivalMsg = event as CarnivalMsg;
    }

    private function onGFriendRewardReturn(event:Object):void {
        var msg:GFriendRewardMsg = event as GFriendRewardMsg;
        if (msg.type == 1) {
            userData.g_flags = msg.statusArr;
            for (var i:int = 0; i < msg.statusArr.length; i++) {
                //  if (XMLLocator.getInstance().fpackData.length > i) (XMLLocator.getInstance().fpackData[i] as FriendPackVO).status = msg.statusArr[i];
            }
        } else if (msg.type == 0) {
            if (userData.g_flags) {
                if (userData.g_flags.length >= msg.idx)
                    userData.g_flags[msg.idx - 1] = msg.status;
                // if (XMLLocator.getInstance().fpackData.length >= msg.idx)   (XMLLocator.getInstance().fpackData[msg.idx - 1] as FriendPackVO).status = msg.status;
            }
        }
        //  dispatch(new RelationEvent(RelationEvent.GET_FRIEND_REWRAD_FROM_S));
    }


    public function onFireHeroReturn(event:Object):void {
        var msg:FireHeroMsg = event as FireHeroMsg;

        dispatch(new NotiEvent(NotiEvent.HERO_DATA_UPDATE));
        dispatch(new NotiEvent(NotiEvent.GUIDE_RESPONSE_FIRE_HERO, [msg.heroID, msg.result]));
    }

    public function rankDataHandle(event:Object):void {
        var msg:ReadBattleMsg = event as ReadBattleMsg;

    }

    public function rankSettingHandle(event:Object):void {
        var msg:BattleCheckMsg = event as BattleCheckMsg;
        var fighterdata:Array = msg.fighterData;
    }

    public function wallowInfoHandler(event:Object):void {
        var msg:AntiAddictionMsg = event as AntiAddictionMsg;
        dispatch(new NotiEvent(NotiEvent.ANTI_ADDICTION, msg));
    }


    public function doResponsePotencial(evt:Object):void {
        var msg:PotencialMsg = evt as PotencialMsg;
        dispatch(new NotiEvent(NotiEvent.HEROIC_RESPONSE_POTENCIAL, [msg.result, msg.type]));
        return;
    }

    public function sendFighterChangeCmd():void {
        var cmd:ChangeEQCmd = new ChangeEQCmd();
        connection.send(cmd);
    }

    /**
     * 穿卸装备
     * @param charId 英雄id
     * @param equipFlag 装备标志
     * @param equipId 装备流水号
     */
    public function sendReqChangeHeroEqCmd(charId:uint, equipFlag:int, equipId:Number):void {
        var cmd:ChangeEQCmd = new ChangeEQCmd();
        cmd.equipFlag = equipFlag;
        cmd.charId = charId;
        cmd.equipId = equipId;
        connection.send(cmd);
        this.dispatch(new NotiEvent(NotiEvent.GUIDE_REQUEST_HERO_EQ_CHANGE, [charId, equipFlag, equipId]));
    }

    public function sendReqChangeUserInfoCmd(charId:uint, data:uint):void {
        var cmd:StateCmd = new StateCmd();
        cmd.field = charId;
        cmd.data = data;
        connection.send(cmd);
    }

    public function sendReqChangeUserNameCmd(id:uint, bind:uint, name:String):void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(0x20);
        byte.writeUnsignedInt(id);
        byte.writeByte(bind);
        byte.writeUTF(name);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.STATE, byte);
        connection.send(cmd);
    }

    public function sendFireHeroCmd(heroID:int):void {
        var cmd:FireHeroCmd = new FireHeroCmd();
        cmd.heroID = heroID;
        connection.send(cmd);
        this.dispatch(new NotiEvent(NotiEvent.GUIDE_REQUEST_FIRE_HERO, [heroID]));
    }

    public function sendAddHp(fighterId:uint):void {
        var cmd:AddHpCmd = new AddHpCmd();
        cmd.fighterId = fighterId;
        connection.send(cmd);
        this.dispatch(new NotiEvent(NotiEvent.GUIDE_REQUEST_HERO_ADD_HP, [fighterId]));
    }

    public function globalAlert(evt:Object):void {
        var msg:GlobalAlertMsg = evt as GlobalAlertMsg;

        //找不到???
        //var str:IAlertMsg_item = ArrayUtil.find(ConfigManager.instance.message_alertMsg.item, function (m:IAlertMsg_item) {
        //    m.id == msg.msgCode
        //});

        var str:IAlertMsg_item;
        var v:Vector.<IAlertMsg_item> = ConfigManager.instance.message_alertMsg.item;
        for (var i = 0; i < v.length; i++) {
            if (v[i].id == msg.msgCode) {
                str = v[i];
            }
        }
        if (str == null)return;
        var msgStr:String = msgDataStr(msg.msgCode, str.msg, msg.msgData);
        if (msg.msgCode < 5000)
            dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, msgStr));
        else if (msg.msgCode > 8000) {
            Alert.show(msgStr, " ", [SystemInfo.OK]);
        }
        else
            Alert.show(msgStr, " ", [SystemInfo.OK, SystemInfo.CANCEL]);
    }

    public function sysAlertHandle(evt:Object):void {

        //这期先不上
        //dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.SYS_ALERT_VIEW, MenuWindowVO.OPEN)));
        return;

        var msg:SysAlertMsg = evt as SysAlertMsg;

        userData.curServ = msg.curServ;
        userData.popSysup = msg.popSysup;
        userData.version = msg.version;

//        收到即显示按钮
        dispatch(new NotiEvent(NotiEvent.MENU_STATE_CHANGE, [1, 9]));

        if (msg.type == 0) {
            //说明是系统弹窗
            dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.SYS_ALERT_VIEW, MenuWindowVO.OPEN)));
            return;
        }

        //更新公告
        if (userData.popSysup == 1 && userData.userVO.level >= 40) {
            userData.forcePpopSysup = true
            if (userData.forcePpopSysup) {
                //dispatch(new NotiEvent(NotiEvent.POPUPSYS));

                //打开公告
                dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.SYS_ALERT_VIEW, MenuWindowVO.OPEN)));
            }
        } else {
        }
    }

    private function msgDataStr(id:uint, str:String, data:uint):String {
        if (str == null) return "数据尚未配置 Error Code:" + id;
        switch (id) {
            case 1092:
            case 1093:
            case 1096:
            case 2007:
                str = str.split("msgData").join(data);
                break;
            case 1009:
            case 1407:
                var min:uint = data / 60 > 0 ? Math.floor(data / 60) : 0;
                var sec:uint = data % 60;
                str = str.replace("min", min);
                str = str.replace("sec", sec);
                break;
            case 2010:
                str = str.replace("msgData", 70);
                break;
        }
        return str;
    }

    public function beDisconnected():void {
        var socketConnectionProxy:SocketConnectionProxy = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;
        socketConnectionProxy.kickOff = true;
        Alert.show(SystemInfo.BE_DISCONNECTED, " ", [SystemInfo.OK]);
    }

    // 得到某个状态的剩余时间(单位:秒)
    public function getStateTime(type:int):int {
        for each (var vo:StatesVO in userData.userVO.statesArr) {
            if (type == vo.id && vo.remain > 0) {
                return vo.remain;
            }
        }
        return 0;
    }

    public function sendCarnivalRandomCmd(type:int):void {
        var cmd:CarnivalCmd = new CarnivalCmd();
        cmd.type = type;
        connection.send(cmd);
    }

    /**
     * 领取七日活动奖励
     */
    public function sendSevenCmd(type:int, will:int = 0):void {
        var cmd:SevenActivityCmd = new SevenActivityCmd();
        cmd.type = type;
        cmd.will = will;
        connection.send(cmd);
    }

    /**
     * 领取七日活动奖励
     */
    public function sendSevenBackCmd(type:int, will:int = 0):void {
        var cmd:SevenBackActivityCmd = new SevenBackActivityCmd();
        cmd.type = type;
        cmd.will = will;
        connection.send(cmd);
    }

    /**
     * 领取0x0B蜀山奇遇奖励
     */
    public function sendGetSpGiftCmd(type:int, id:int = 0):void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(23);
        byte.writeByte(type);
        byte.writeByte(id);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.SEVEN_ACTIVITY, byte);
        connection.send(cmd);
    }

    /**
     * 领取0x0B蜀山奇遇奖励
     */
    public function sendGetSpGiftCmd2(type:int, id:int = 0):void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(24);
        byte.writeByte(type);
        byte.writeByte(id);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.SEVEN_ACTIVITY, byte);
        connection.send(cmd);
    }

    /**
     * 领取0x0B QQ面板登录在线奖励
     */
    public function sendGetQGameGiftCmd(type:int, id:int = 0):void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(25);
        byte.writeByte(type);
        byte.writeByte(id);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.SEVEN_ACTIVITY, byte);
        connection.send(cmd);
    }

    /**
     * 领取0x0B QQBrower
     */
    public function sendGetQQBrowerGiftCmd(type:int, id:int = 0):void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(27);
        byte.writeByte(type);
        byte.writeByte(id);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.SEVEN_ACTIVITY, byte);
        connection.send(cmd);
    }

    /**
     * 领取黄蓝钻，会员奖励
     */
    public function sendQQBuffCmd(type:int):void {
        var cmd:QQBuffCmd = new QQBuffCmd();
        cmd.type = type;
        connection.send(cmd);
    }

    /**
     * 蜀山大寻宝排行
     */
    public function sendN525Cmd():void {
        var cmd:N525Cmd = new N525Cmd();
        connection.send(cmd);
    }

    private function inviteSendHandle(num:uint = 0):void {
        var cmd:GFriendRewardCmd = new GFriendRewardCmd();
        cmd.type = 1;
        cmd.idx = num;
        connection.send(cmd);
//        dailyService.vo.isNewUserLuckFlag = true;
        dispatch(new NotiEvent(NotiEvent.JS_FRIEND_INVITE));
        trace(["好友邀请次数", num].join(" || "), true);
    }

    public function requestStars(type:uint, heroId:uint, gemId:uint, gem_bind:uint, pos:uint, rank_list:Array):void {
        var cmd:StarsCmd = new StarsCmd;
        cmd.type = type;
        cmd.heroId = heroId;
        cmd.gemId = gemId;
        cmd.gem_bind = gem_bind;
        cmd.pos = pos;
        cmd.rank_list = rank_list;
        connection.send(cmd);
        return;
    }

    public function sendReqzhenyuanCmd():void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(0x21);
        byte.writeUnsignedInt(0);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.STATE, byte);
        connection.send(cmd);
    }

    public function sendReqRideCmd(type:uint):void {
        var cmd:RideCmd = new RideCmd();
        cmd.flag = type;
        connection.send(cmd);
    }

    public function sendChangeSexCmd():void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(0x22);
        byte.writeUnsignedInt(0);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.STATE, byte);
        connection.send(cmd);
    }

    /*请求服务端改变称号*/
    public function sendChangeClanTilte(titleID:int):void {

        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(0x23);
        byte.writeUnsignedInt(titleID);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.STATE, byte);
        connection.send(cmd);
    }

    public function sendReqHideVIP(value:uint):void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(0x24);
        byte.writeUnsignedInt(value);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.STATE, byte);
        connection.send(cmd);
    }

    /*开启
     * ushort	fighterId	武将ID 0表示在背包中
     uint	itemId	宝具流水ID
     uint8	type	0属性 1技能
     uint8	protecdValue	保护值 每位代表是否保护某条 1为保护 0不保护
     */
    public function sendReqOpenBaojuSkill(arr:Array):void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(0x16);
        byte.writeByte(0x02);
        byte.writeShort(arr[0]);
        BytesUtil.writeBigInt(arr[1], byte);
        byte.writeByte(arr[2]);
        byte.writeByte(arr[3]);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.EXTENSION, byte);
        connection.send(cmd);
    }

    /*洗炼
     *
     ushort	fighterId	武将ID 0表示在背包中
     uint	itemId	宝具流水ID
     uint8	type	1开启第一条 2开启第2条*/
    public function sendReqPurificationBaoju(arr:Array):void {
        var byte:ByteArray = BytesUtil.creatByteArray();
        byte.writeByte(0x16);
        byte.writeByte(0x01);
        byte.writeShort(arr[0]);
        BytesUtil.writeBigInt(arr[1], byte);
        byte.writeByte(arr[2]);
        byte.writeByte(arr[3]);
        var cmd:DynamicCmd = new DynamicCmd(MsgConst.EXTENSION, byte);
        connection.send(cmd);
    }

    public function requestHeroEqList(id:int):void {
        var heroID:int = id;
    }


    public function sendRankSettingHeroCmd(rankId:int, fightdatas:Array):void {
        var tmp:Array = [];
        for (var i:int = 0; i < fightdatas.length; i++) {
            var object:BattleHeroStruct = fightdatas[i];
            tmp.push(object);
        }
        sendRankSettingCmd(rankId, tmp);

    }

    public function sendRankSettingCmd(rankId:int, fightdatas:Array):void {
        //判断将要设置的阵型是否和当前的一样
    }

    public function sendRankDataCmd(flag:int, rankId:int):void {
        var cmd:ReadBattleCmd = new ReadBattleCmd();
        cmd.flag = flag;
        cmd.formationID = rankId;
        connection.send(cmd);
    }

    /**
     * 判斷是否在時間段內
     **/
    public function timeAble(timeStr:String):Boolean {
        if (!timeStr)
            return false;
        var flag:Boolean = false;
        var startTime:uint = new Date(parseInt(timeStr.split("-")[0].split(".")[0]), parseInt(timeStr.split("-")[0].split(".")[1]) - 1, parseInt(timeStr.split("-")[0].split(".")[2])).getTime() / 1000;
        var endTime:uint = new Date(parseInt(timeStr.split("-")[1].split(".")[0]), parseInt(timeStr.split("-")[1].split(".")[1]) - 1, parseInt(timeStr.split("-")[1].split(".")[2]) + 1).getTime() / 1000;
        if (startTime < nowTime && nowTime < endTime) {
            flag = true;
        }
        return flag;
    }

    public function get nowTime():uint {
        return ServiceTime.getInstance().getServiceTime();
    }

//    public function getMainHero():HeroVO {
//
//        var returnHerovo:HeroVO;
//
//        var heros:Array = userData.heros;
//        var len:int = heros.length;
//
//        for (var i:int; i < len; i++) {
//            if ((heros[i] as HeroVO).isUserSelf) {
//                returnHerovo = heros[i];
//                break;
//            }
//        }
//        return returnHerovo;
//    }
//
//    public function getHerovoByID(id:int):HeroVO {
//        var returnHerovo:HeroVO;
//
//        var heros:Array = userData.heros;
//        var len:int = heros.length;
//
//        for (var i:int = 0; i < len; i++) {
//            if ((heros[i] as HeroVO).id == id) {
//                returnHerovo = heros[i];
//                break;
//            }
//        }
//        return returnHerovo;
//    }
}
}
