package net.proxy {
import net.data.recvMsg.CheckIDMsg;
import net.data.recvMsg.LoginMsg;
import net.data.recvMsg.ReConnectionMsg;
import net.data.recvMsg.achievement.AchievementMsg;
import net.data.recvMsg.active.ActiveTimeMsg;
import net.data.recvMsg.active.ActivityAllMsg;
import net.data.recvMsg.active.ServerTimeMsg;
import net.data.recvMsg.arena.ArenaExsUpdateMsg;
import net.data.recvMsg.arena.ArenaInfoMsg;
import net.data.recvMsg.arena.ArenaUpdateMsg;
import net.data.recvMsg.babel.BabelAutoFightMsg;
import net.data.recvMsg.babel.BabelEndFightMsg;
import net.data.recvMsg.bookShop.BookBuyMsg;
import net.data.recvMsg.bookShop.BookListMsg;
import net.data.recvMsg.chat.ChatMsg;
import net.data.recvMsg.chat.ChatSystemMsg;
import net.data.recvMsg.chat.CheckUserMsg;
import net.data.recvMsg.clan.CBuildMsg;
import net.data.recvMsg.clan.CDepotMsg;
import net.data.recvMsg.clan.CDepotRecordMsg;
import net.data.recvMsg.clan.CFightListMsg;
import net.data.recvMsg.clan.CFightMsg;
import net.data.recvMsg.clan.CFightPreMsg;
import net.data.recvMsg.clan.CSkillMsg;
import net.data.recvMsg.clan.ClanApplyMsg;
import net.data.recvMsg.clan.ClanCopyMsg;
import net.data.recvMsg.clan.ClanCreateMsg;
import net.data.recvMsg.clan.ClanDataUpdateMsg;
import net.data.recvMsg.clan.ClanHasAbleMsg;
import net.data.recvMsg.clan.ClanInfoChangeMsg;
import net.data.recvMsg.clan.ClanOperateMsg;
import net.data.recvMsg.clan.ClanQQMsg;
import net.data.recvMsg.clan.ClanReqItemMsg;
import net.data.recvMsg.clan.ClanReqListMsg;
import net.data.recvMsg.clan.ClanReqSelfListMsg;
import net.data.recvMsg.copy.CopyAutoMsg;
import net.data.recvMsg.copy.CopyDataMsg;
import net.data.recvMsg.copy.FormationAutoMsg;
import net.data.recvMsg.copy.FormationDataMsg;
import net.data.recvMsg.daily.DailyDataMsg;
import net.data.recvMsg.endlessTower.EndlessTowerMsg;
import net.data.recvMsg.equpgrade.EqBatchDecomposeMsg;
import net.data.recvMsg.equpgrade.EqEmbedMsg;
import net.data.recvMsg.equpgrade.EqPurifyMsg;
import net.data.recvMsg.equpgrade.EqToPunchMsg;
import net.data.recvMsg.equpgrade.EqToStrongMsg;
import net.data.recvMsg.equpgrade.EqUnEmbedMsg;
import net.data.recvMsg.equpgrade.EqUnsealMsg;
import net.data.recvMsg.equpgrade.GemBatchUpgradeMsg;
import net.data.recvMsg.fight.FightActionMsg;
import net.data.recvMsg.fight.FightOverMsg;
import net.data.recvMsg.fight.FightReportTypeMsg;
import net.data.recvMsg.flaunt.FlauntMsg;
import net.data.recvMsg.friend.FriendActionMsg;
import net.data.recvMsg.friend.FriendListMsg;
import net.data.recvMsg.guide.AwardInfoMsg;
import net.data.recvMsg.guide.FourDetectiveMsg;
import net.data.recvMsg.guide.GuideCampSelectMsg;
import net.data.recvMsg.guide.LeaveExpGetMsg;
import net.data.recvMsg.heartghost.HeartGhostMsg;
import net.data.recvMsg.hooker.HookerMsg;
import net.data.recvMsg.login.NewCharacterMsg;
import net.data.recvMsg.mail.MailContentMsg;
import net.data.recvMsg.mail.MailDeleteMsg;
import net.data.recvMsg.mail.MailIdListMsg;
import net.data.recvMsg.mail.MailListMsg;
import net.data.recvMsg.mail.MailNewMsg;
import net.data.recvMsg.mail.MainChangeMsg;
import net.data.recvMsg.mail.MainSendMsg;
import net.data.recvMsg.map.BuildUsersListMsg;
import net.data.recvMsg.map.BuildUsersUpdateMsg;
import net.data.recvMsg.map.LocateSmallMapMsg;
import net.data.recvMsg.map.TransportMapMsg;
import net.data.recvMsg.map.TransportUpdateMsg;
import net.data.recvMsg.pack.PackExtendMsg;
import net.data.recvMsg.pack.PackInfoMsg;
import net.data.recvMsg.pack.PackUseMsg;
import net.data.recvMsg.potencial.PotencialMsg;
import net.data.recvMsg.potencial.RetreatMsg;
import net.data.recvMsg.practice.PageChangeMsg;
import net.data.recvMsg.practice.PlaceInfoMsg;
import net.data.recvMsg.practice.PlaceOccupyMsg;
import net.data.recvMsg.practice.PlaceRobMsg;
import net.data.recvMsg.practice.PracticeAccMsg;
import net.data.recvMsg.practice.PracticeStartMsg;
import net.data.recvMsg.practice.PracticeStopMsg;
import net.data.recvMsg.rank.BattleCheckMsg;
import net.data.recvMsg.rank.ReadBattleMsg;
import net.data.recvMsg.reward.RewardDrawMsg;
import net.data.recvMsg.setting.SettingGetPswdInfoMsg;
import net.data.recvMsg.setting.SettingLockAlertMsg;
import net.data.recvMsg.setting.SettingOperatePswdMsg;
import net.data.recvMsg.setting.SettingUnlockMsg;
import net.data.recvMsg.shop.BuyGoodsMsg;
import net.data.recvMsg.shop.LimitBuyMsg;
import net.data.recvMsg.shop.ShopListMsg;
import net.data.recvMsg.sort.PersonalSortMsg;
import net.data.recvMsg.sort.SortListMsg;
import net.data.recvMsg.soul.SoulnewMsg;
import net.data.recvMsg.strongRoad.StrongInfoMsg;
import net.data.recvMsg.task.CurrAvailableTaskMsg;
import net.data.recvMsg.task.CurrTaskListMsg;
import net.data.recvMsg.task.DialogStartMsg;
import net.data.recvMsg.task.NewTaskMsg;
import net.data.recvMsg.task.NpcInteractMsg;
import net.data.recvMsg.task.TaskActionMsg;
import net.data.recvMsg.task.TaskCycFreshMsg;
import net.data.recvMsg.task.TaskUpdateMsg;
import net.data.recvMsg.tavern.TavernHireMsg;
import net.data.recvMsg.tavern.TavernInfoMsg;
import net.data.recvMsg.tripod.TripodInfoMsg;
import net.data.recvMsg.user.ChangeEQMsg;
import net.data.recvMsg.user.FireHeroMsg;
import net.data.recvMsg.user.GlobalAlertMsg;
import net.data.recvMsg.user.NewsPlayerProcessMsg;
import net.data.recvMsg.user.StateMsg;
import net.data.recvMsg.user.SysAlertMsg;
import net.data.recvMsg.user.UserHerosInfoMsg;
import net.data.recvMsg.user.UserInfoMsg;
import net.data.recvMsg.xsgift.XsGiftMsg;
import net.data.sendCmd.user.FireHeroCmd;
import net.events.MsgConst;
import net.events.MsgEvent;
import net.utils.BytesUtil;
import net.utils.MsgCenter;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.proxy.Proxy;

import utils.ByteArray;

public class ReMapProxy extends Proxy implements IProxy {
    public static const NAME:String = "ReMapProxy";

    public var reMapList = {};
    public var extensionList = {}; //扩展协议
    public var byteArrayList:Array = [];

    public function ReMapProxy() {
        super(NAME);


        addByteArray(MsgEvent.BE_DISCONNECT);
        add(MsgEvent.ACTIVE_TIME, ActiveTimeMsg);
        add(MsgEvent.STRONG_INFO, StrongInfoMsg);
        add(MsgEvent.ANNIVERSARY, XsGiftMsg);
        add(MsgEvent.GET_TIME, ServerTimeMsg);
        addByteArray(MsgEvent.STORE_LIST);
        add(MsgEvent.BOOK_SHOP_BUY, BookBuyMsg);
        add(MsgEvent.BOOK_SHOP_LIST, BookListMsg);
        //这两要不要搞错了
        add(MsgEvent.GET_USERNAME, UserInfoMsg);
        add(MsgEvent.USER_INFO, StateMsg);


        add(MsgEvent.SHOP_LIST, ShopListMsg);
        add(MsgEvent.STORE_BUY, BuyGoodsMsg);
        add(MsgEvent.LIMIT_BUY, LimitBuyMsg);

        add(MsgEvent.RE_CONNECT, ReConnectionMsg);
        add(MsgEvent.LOGIN_REQUEST, LoginMsg);
        add(MsgEvent.CHECK_ID_RETURN, CheckIDMsg);
        add(MsgEvent.NEW_CHARACTER, NewCharacterMsg);
        add(MsgEvent.FIGHT_START, FightActionMsg);


        add(MsgEvent.AWARD_INFO, AwardInfoMsg);
        add(MsgEvent.GET_FIGHTER_NAME, UserHerosInfoMsg);
        add(MsgEvent.CHANGE_EQUIPMENT, ChangeEQMsg);//直接丢字节
        addByteArray(MsgEvent.EXTENSION);
        addByteArray(MsgEvent.RUNE_SYSTEM)
        add(MsgEvent.RANK_SETTING, BattleCheckMsg);
        add(MsgEvent.RANK_DATA, ReadBattleMsg)
        add(MsgEvent.RANK_DATA, FireHeroCmd)
        add(MsgEvent.HEART_GHOST, HeartGhostMsg);//心魔 扩展协议

        add(MsgEvent.MAIL_NEW, MailNewMsg);

        //SettingUnlockMsg
        add(MsgEvent.SETTING_LOCK, SettingUnlockMsg)
        add(MsgEvent.SETTING_PSWD, SettingOperatePswdMsg)
        add(MsgEvent.SETTING_PSWD_INFO, SettingGetPswdInfoMsg);
        add(MsgEvent.GUIDE_RESPONSE_STEP, NewsPlayerProcessMsg);
        add(MsgEvent.SOUL_SYSTEM, SoulnewMsg);

        add(MsgEvent.PACK_INFO, PackInfoMsg);
        add(MsgEvent.ATTACK_NPC, FightOverMsg);
        add(MsgEvent.CHAT, ChatMsg);
        add(MsgEvent.FIND_USER, CheckUserMsg);
        add(MsgEvent.FIGHT_REPORT_TYPE, FightReportTypeMsg);

        add(MsgEvent.DAILY_DATA, DailyDataMsg);
        //add(MsgEvent.COPY_DATA_UPDATE, BabelDataNewMsg);
        add(MsgEvent.HOTEL_PUB_LIST, TavernInfoMsg);
        add(MsgEvent.HOTEL_PUB_HIRE, TavernHireMsg);
        add(MsgEvent.COPY_INFO, CopyDataMsg);
        add(MsgEvent.COPY_AUTO_DATA, CopyAutoMsg);
        add(MsgEvent.FORMATTON_INFO, FormationDataMsg);
        add(MsgEvent.FORMATTON_AUTO_DATA, FormationAutoMsg);
        add(MsgEvent.COPY_AUTO_FIGHT, BabelAutoFightMsg);
        add(MsgEvent.COPY_END_FIGHT, BabelEndFightMsg);

        addByteArray(MsgEvent.XUANJI_INFO);

        add(MsgEvent.FRIEND_LIST, FriendListMsg);
        add(MsgEvent.FRIEND_ACTION, FriendActionMsg);
        add(MsgEvent.ALERT_MSG, GlobalAlertMsg);
        add(MsgEvent.LEAVE_EXP, LeaveExpGetMsg);
        add(MsgEvent.CAMP_SELECT, GuideCampSelectMsg);
        add(MsgEvent.GUIDE_RESPONSE_STEP, NewsPlayerProcessMsg);
        addByteArray(MsgEvent.AWARD_INFO);
        add(MsgEvent.FOUR_DETECTIVE, FourDetectiveMsg);
        add(MsgEvent.PRACTICE_ACC, PracticeAccMsg);
        add(MsgEvent.PRACTICE_OCCUPY, PlaceOccupyMsg);
        add(MsgEvent.PRACTICE_PAGE, PageChangeMsg);
        add(MsgEvent.PRACTICE_PLACE_IFNO, PlaceInfoMsg);
        add(MsgEvent.PRACTICE_ROB, PlaceRobMsg);
        add(MsgEvent.PRACTICE_START, PracticeStartMsg);
        add(MsgEvent.PRACTICE_STOP, PracticeStopMsg);

        add(MsgEvent.ACTIVITY_SEVEN, ActivityAllMsg);

        addByteArray(MsgEvent.BOSS_INFO);
        addByteArray(MsgEvent.GROUP_INFO);
        addByteArray(MsgConst.SWORDFIGHT.toString(16));

        //邮件
        add(MsgEvent.MAIL_ID_LIST, MailIdListMsg);
        add(MsgEvent.MAIL_LIST, MailListMsg);
        add(MsgEvent.MAIL_CONTENTS, MailContentMsg);
        add(MsgEvent.MAIL_DELETE, MailDeleteMsg);
        add(MsgEvent.MAIL_SEND, MainSendMsg);
        add(MsgEvent.MAIL_NEW, MailNewMsg);
        add(MsgEvent.MAIL_CHANGE, MainChangeMsg);

        add(MsgEvent.POTENCIAL, PotencialMsg)

        add(MsgEvent.GET_TASK_LIST, CurrTaskListMsg);
        add(MsgEvent.GET_USABLE_TASK, CurrAvailableTaskMsg);

        add(MsgEvent.PLAYER_ABANDON_TASK, TaskActionMsg);
        add(MsgEvent.DIALOG_START, DialogStartMsg);
        add(MsgEvent.DIALOG_INTERACTION, NpcInteractMsg);

        add(MsgEvent.UPDATE_TASK_PROCESS, TaskUpdateMsg);
        add(MsgEvent.NEW_TASK, NewTaskMsg);

        add(MsgEvent.TASK_CYC_FRESH, TaskCycFreshMsg);

        //add(MsgEvent.TASK_RESPONSE_HOOK, TaskHookMsg);
        add(MsgEvent.TASK_RESPONSE_HOOK, HookerMsg);

        add(MsgEvent.EQ_TO_STRONG, EqToStrongMsg);
        add(MsgEvent.EQ_TO_PUNCH, EqToPunchMsg);
        add(MsgEvent.EQ_EMBED, EqEmbedMsg);
        add(MsgEvent.EQ_UN_EMBED, EqUnEmbedMsg);
        add(MsgEvent.EQ_PURIFY, EqPurifyMsg);
        add(MsgEvent.EQ_BATCH_DECOMPOSE, EqBatchDecomposeMsg);
        add(MsgEvent.EQ_UNSEAL, EqUnsealMsg)
        add(MsgEvent.GEM_BATCH_UPGRADE, GemBatchUpgradeMsg)


        //九疑鼎
        add(MsgEvent.TRIPOD_INFO, TripodInfoMsg);
        add(MsgEvent.REWARD_DRAW, RewardDrawMsg);

        // 帮派
        add(MsgEvent.CLAN_REQ_LIST, ClanReqListMsg);
        add(MsgEvent.CLAN_REQ_USER, ClanHasAbleMsg);
        add(MsgEvent.CLAN_CREATE, ClanCreateMsg);
        add(MsgEvent.CLAN_JOIN_IN, ClanApplyMsg);
        add(MsgEvent.CLAN_REQ_ITEM, ClanReqItemMsg);
        add(MsgEvent.CLAN_INFO_CHANGE, ClanInfoChangeMsg);
        add(MsgEvent.CLAN_MEMBER_LIST, ClanReqSelfListMsg);
        add(MsgEvent.CLAN_MEMBER_OPERATE, ClanOperateMsg);
        add(MsgEvent.CLAN_INFO_UPDATE, ClanDataUpdateMsg);
        add(MsgEvent.CLAN_SKILL, CSkillMsg);
        add(MsgEvent.CLAN_BUILD, CBuildMsg);
        add(MsgEvent.CLAN_DEPOT, CDepotMsg);
        add(MsgEvent.CLAN_DEPOT_RECORD, CDepotRecordMsg);
        add(MsgEvent.CLAN_COPY, ClanCopyMsg);
        add(MsgEvent.CLAN_QQ, ClanQQMsg);
        add(MsgEvent.CFIGHT, CFightMsg);
        add(MsgEvent.CFIGHT_LIST, CFightListMsg);
        add(MsgEvent.CFIGHT_PRE, CFightPreMsg);
        add(MsgEvent.SYSTEM_INFO, ChatSystemMsg);
        add(MsgEvent.FLAUNT_GOOD, FlauntMsg);



        //斗剑
        add(MsgEvent.ARENA_IFNO, ArenaInfoMsg);
        add(MsgEvent.ARENA_UPDATE, ArenaUpdateMsg);
        add(MsgEvent.ARENA_EXS_UPDATE, ArenaExsUpdateMsg);

        //锁妖塔
        add(MsgEvent.ENDLESS_TOWER, EndlessTowerMsg);

        //地图
        add(MsgEvent.MAP_TRANSPORT_UPDATE, TransportUpdateMsg);
        add(MsgEvent.CITY_INSIDE_MOVE, LocateSmallMapMsg);
        add(MsgEvent.MAP_TRANSPORT, TransportMapMsg);
        add(MsgEvent.MAP_SAMPLEUSER, BuildUsersListMsg);
        add(MsgEvent.MAP_POINT_JOIN, BuildUsersUpdateMsg);

        add(MsgEvent.PACK_EXTEND, PackExtendMsg);
        add(MsgEvent.FIGHTER_DISMISS, FireHeroMsg)
        add(MsgEvent.PACK_USE, PackUseMsg)
        add(MsgEvent.RETREAT, RetreatMsg)
        add(MsgEvent.SETTING_ALERT, SettingLockAlertMsg)//
        add(MsgEvent.ACHIEVEMENT, AchievementMsg)
        addByteArray(MsgEvent.EQ_EXTEND);
        add(MsgEvent.SORT_LIST, SortListMsg);
        add(MsgEvent.SORT_PERSONAL, PersonalSortMsg);
        add(MsgEvent.SORT_PERSONAL, PersonalSortMsg);

        //系统弹窗公告
        add(MsgEvent.SYS_ALERT_MSG, SysAlertMsg);
    }

    public function addByteArray(name:String) {
        byteArrayList.push(name);
    }

    public function addExt(name:String, subType:int, newType:String, cls:Class) {
        if (extensionList[name] == null)
            extensionList[name] = [];
        extensionList[name][subType] = [newType, cls];

    }

    public function add(name:String, cls:Class) {
        reMapList[name] = cls;
    }

    public function parse(name:String, msgData:ByteArray):void {
        if (byteArrayList.indexOf(name) != -1) {
            sendNotification(name, msgData);
        }
        else if (reMapList[name] != null) {
            sendNotification(name, MsgCenter.getMsg(reMapList[name], msgData));
        } else if (extensionList[name] != null) {
            //扩展协议
            var subType:int = BytesUtil.readByte1(msgData);
            var extensions:Array = extensionList[name];
            if (extensions[subType] != null) {
                var ext = extensions[subType];
                sendNotification(ext[0], MsgCenter.getMsg(ext[1], msgData));
            }
            else {
                trace("没有处理的ext " + name + "_" + subType);
            }

        }
        else {
            trace("没有处理的 " + name);
        }
    }

    override public function sendNotification(notificationName:String, body:Object = null, type:String = null):void {
        //   trace("sendNotification " + notificationName + "_" );
        super.sendNotification(notificationName, body, type);
    }
}
}
