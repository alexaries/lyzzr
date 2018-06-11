package com.game.vo {


import com.game.module.clan.vo.ClanSelfVO;
import com.game.module.guide.vo.EqStrongGuideVo;
import com.game.module.guide.vo.SkillGuideVo;
import com.game.module.heroic.vo.HeroVO;
import com.game.module.map.vo.MapVO;
import com.game.module.pack.vo.PackVO;
import com.game.module.prayTree.vo.PrayTreeMyVO;

import config.ConfigManager;

import globals.ServiceTime;


import lang.LangArrayTxt;

import laya.utils.Dictionary;

import net.data.structs.SimpleStruct;

import com.game.common.mvc.BaseProxy;

import utils.TimerUtil;

/**
 * 玩家数据
 */

public class UserData  {

    public var isLogined:Boolean = false;
    // 是否已经登陆进了游戏,在收到玩家信息后代表已经登陆进了
    public var isSoundOn:Boolean = false;
    public var hookCount:Number;
    public var isOpenSecretary:Boolean;
    public var isPK:int;
    public var openExplore:Boolean;
    public var autoNpc:int;
    public var isHumanRun:Boolean;
    // 音乐开关是否关闭  true关 false 开
    //
    public var dailyTimeActs:Array;
    public var guideInfo:Array = [];
    public var cycTask4:int;
    public var cycTask5:int;
    public var isTrack:Boolean = false;
    public var isInHook:Boolean = false;
    public var isInFight:Boolean = false;//是否在战斗
    public var isInCopy:Boolean = false;
    public var isInFormation:Boolean = false;
    public var isInBabel:Boolean = false;
    public var isInCountry:Boolean = false;
    public var inInGroupLobby:Boolean = false;
    public var isInPetDungeon:Boolean = false;
    public var isInFightdemon:Boolean = false;
    public var isInJiutianXZ:Boolean;//是否在九天仙阵中
    public var isInFightdemonclick:Boolean = false;
    public var isInHotel:Boolean = false;
    //当前战斗是否是跨服战
    public var isCrossFight:Boolean = false;
    public var enterBuildTime:int;
    public var eqStrongGuideVo:EqStrongGuideVo =new EqStrongGuideVo();
    public var skillGuideVo:SkillGuideVo  =new SkillGuideVo();
    public var taskGuideAuto:Boolean;
    public var isInChapter:Boolean;
    public var isInAutoTaskGuide:Boolean;
    public var isInCyc:Boolean;

    public function get isInPetDungeon2():Boolean {
        return mapVO.nodeId == 0x130a;
    }

    public var buildId:uint;
    public var accTaskList:Array = [];
    public var taskGuideArgs:String = null;
    public var guideStep:int = 0;
    public var autoFightIds:Array;
    public var guideIds:Array;

    /**解决：其它模块要求发邮件，而邮件面版没有初始化过的问题*/
    public var simpleStruct:SimpleStruct;
    // 黑名单
    public var blackList:Array = [];
    // 好友
    public var friendList:Array = [];
    // 密友
    public var g_friendList:Array = [];
    public var clanList:Array = [];
    public var g_nums:Array = [];

    public var mailViewCreated:Boolean = false;
    public var mailWriteFlag:Boolean = false;
    public var tradeViewCreated:Boolean = false;
    public var tradeLaunchFlag:Boolean = false;
    public var hasActiveTimeAward:Boolean = false;
    public var arenaBuff:uint = 3 * 60;
    public var arenaCurr:uint = 0;
    public var todaySoul:uint = 0;
//    public var athlPhy:uint = 0;
//    public var maxPhy:uint = 0;
    public var currRank:uint = 0;
    public var towerLevel:uint = 0;
    public var isTaskHookAdd:uint = 0;
    public var taskHookState:uint = 0;
    public var isAutoHook:uint = 0
    //组队跳大厅...
    public var auto_group_join:Array;
    // VIP
    public var viplevel:int = 0;

    // vip等级默认为0
    // 当前vip配置数据
    public var vipCfgs:Array = [
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0,
        0, 0, 0, 0, 0
    ];

    // 将领
    public var heros:Array = [];
    // 帮派
    private var _clanvo:ClanSelfVO;
    /** 玩家已习会阵型列表 */
    public var battleList:Array = [];
    public var packIndex:uint;
    public var skillIndex:uint;
    public var shopIndex:uint;
    public var daliyIndex:int;
    public var eqUpgradeIndex:uint;
    public var skillHeartIndex:uint;
    public var practiceRobResult:Boolean;
    public var practiceArea:Boolean;
    public var eqToStrongSelect:int;
    public var eqToStrongItem:PackVO;
    public var trumpToStongSelect:int;
    public var trumpToStongItem:PackVO;
    public var rankIndex:int;
    public var userPosIndex:int;
    public var packOptVO:PackVO;
    public var packOptVO1:PackVO;
    public var pop_alert_flag:Boolean = false;
    public var skillHeroVo:GernalHeroVO;
    public var userIndex:uint;
    public var guide15flag:Boolean = false;
    public var onlineReward:Array = [];
    public var onlineTime:int = 0;
    /**
     * 玩家当前所处地图 据点位置数据 [locID,x,y]
     */
    public var mapNodeList:Array;

    /** weekday 1:星期一 2:星期二... 0:错误 */
    public var activeToday:uint;
    /** 活动ID */
    public var activeInfo:uint;

    public var cSkillAddProp:Array;

    public var activeValue:uint = 0;
    public var activebackValue:uint = 0;

    public var activityBackTime:uint = 0;

    public var isPlayCopyOver:Boolean = false;
    //星辰数量
    public var stars_num:Number = 0;
    public var stars_dic:Dictionary = new Dictionary();
    public var stars_gem:Dictionary = new Dictionary();
    public var stars_rank:Dictionary = new Dictionary();
    /**
     * 是否已创建保护锁
     */
    public var isPswdCreate:int = 0;
    /**
     * 是否锁定
     */
    public var isPswdLock:int = 1;
    /*酒馆刷新次数*/
    public var heroRefreshNum:int = 0
    public var loveStrings:Array = [];
    /**
     * 称号ID
     */
    public var titleID:uint = 0;
    public var clanTitleID:uint = 0;
    private var _titleArr:Array = [];
    private var _clanTitleArr:Array = [];

    public var stoneArr:Array;

    public var activeArr:Array = [];

    public var g_flags:Array;


    /**
     * 七日充值
     */
    public var sevenIncome:uint;
    /**
     * 登陆奖励  0-可领取，1-已领取<br>
     * 连续登陆天数(奖励物品)<br>
     * 连续登陆是否领取标志 0-可领取，1-已领取 <br>
     * 连续登陆3天奖励  0-不可领取，1-可领取，2-已领取<br>
     * 所选择的愿望索引0-未选择<br>
     * [登陆奖励,连续登陆天数(奖励物品),是否领取标志,连续登陆3天奖励,愿望]
     */
    public var sevenStatus:Array = [1, 0, 0, 0, 0];
    public var sevenDot:int;
    public var seven_maxcts:uint;

    public var sevenbackIncome:uint;
    public var sevenbackStatus:Array = [1, 0, 0, 0, 0];
    public var sevenbackDot:int;
    public var sevenback_maxcts:uint;

    //黄钻buff是否领取
    public var qqYbuff:uint;
    //蓝钻buff是否领取
    public var qqBbuff:uint;
    //QQVIPbuff是否领取
    public var qqVipBuff:uint;
    //QQ心悦buff是否领取
    public var qqXinYueBuff:uint;
    /**
     * 525活动
     */
    public var n525Info:Array;
    public var n525Data:Array;


    /**
     *  充值领奖 标记<br>
     *  -1 未收到服务器消息（按钮等都不显示）<br>
     *  0,1 可以显示首冲礼包，橙装礼包样式 <br>
     *  2,3,4 不显示首冲礼包,可以显示橙装礼包样式 <br>
     *  >5 不可以显示首冲礼包与橙装礼包样式 <br>
     */
    public var xsgift:int = -1;
    //3366领取 标记
    public var gift3366:uint;


    /**
     *帮主映射的唯一ID ，用来绑定QQ群
     * PHP返回 8亿以下的数字ID
     */
    public var qid:int = -1;
    /**
     *是否加入了绑定QQ群
     */
    public var bindQQ:Boolean;
    // qq群openid
    public var qqGroupId:String = "";
    /**
     * 跨服戰是否開啟<br>
     * 0 - 未開啟 <br>
     * 1 - 仙界第一開啟<br>
     * 2 - 跨服组队战开启<br>
     * 3 - 服战开启<br>
     */
    public var isSwarOpen:uint;
    /**
     * 职业之冠是否開啟<br>
     * 0 - 未開啟 <br>
     * 1 - 開啟<br>
     */
    public var isCarrerWarOpen:uint = 0;

    public var limit_char_lv:uint = 20;
    //分享id
    public var shareId:uint;
    //
    public var fund_show:Boolean = false;

    public var gearHookAdd:Number = 0;//机关库挂机加成

    public var guide_flag:Boolean = false;





    // 根据用户名判断是否本人
    public  function isSelfByName(name:String):Boolean {
        return name == userVO.name;
    }


    // 用戶基礎數據
    private var _userVO:UserInfoVO = new UserInfoVO();

    public function set userVO(value:UserInfoVO):void {
        _userVO = value;
        isLogined = Boolean(value);
    }

    public function get userVO():UserInfoVO {
        return _userVO;
    }

    private var _appendVo:UserAppendVO = new UserAppendVO();

    public function get appendVo():UserAppendVO {
        return _appendVo;
    }

    public function set appendVo(v:UserAppendVO):void {
        _appendVo = v;
    }

    private var _userNeedExp:int;

    // 升级需要的经验
    public function set userNeedExp(exp:int):void {
        this._userNeedExp = exp;
    }

    public function get userNeedExp():int {
        return this._userNeedExp;
    }

    // 存放当前节点的详细信息
    private var _mapVO:MapVO  ;
    public var curMapBuildsIcon:Array = [];
    public var isInWar:Boolean = false;


    public function get mapVO():MapVO {
        /* 			if(_mapVO == null){
         var nodeId:int = int(userVO.country.toString() + "101");
         _mapVO = new MapVO(nodeId);
         } */
        return _mapVO;
    }

    public function set mapVO(value:MapVO):void {
        _mapVO = value;
    }

    public function getCareerName(career:uint):String {
        var str:String = "";
        switch (career) {
            case 1:
                str = LangArrayTxt.HERO_CAREERS[0];
                break;
            case 3:
                str = LangArrayTxt.HERO_CAREERS[1];
                break;
            case 5:
                str = LangArrayTxt.HERO_CAREERS[2];
                break;
        }
        return str;
    }

    public function get clanvo():ClanSelfVO {
        return _clanvo;
    }

    public function set clanvo(clanvo:ClanSelfVO):void {
        _clanvo = clanvo;
        if (_clanvo == null)
            userVO.corpsName = "";
        else
            userVO.corpsName = _clanvo.name;
    }

    /**
     * 玩家所有称号
     */
    public function get titleArr():Array {
        return _titleArr;
    }

    /**
     * @private
     */

    /**
     * 圣诞奖励是否领取过
     * */
    public var christmasState:uint;
    //服务器发来的客户端版本比对号
    public var version:String;
    //服务器是否已更新 0更新前 1更新后
    public var curServ:int;

    //服务器是否弹公告
    public var popSysup:int;
    //是否强弹公告
    public var forcePpopSysup:Boolean;
    /**
     * 是否捕鱼用户
     * */
    public var isBuyu:Boolean = false;

    public var qqclanOpen:Boolean = false;
    /**
     * 是否已崇拜
     * */
    public var supported:Boolean = false;
    public var isLimitQQRequest:Boolean = false;
    /*帮派称号*/
    public var clanTitleArr:Array = [];
    /**
     * 是否隐藏VIP
     */
    public var isHideVIP:Boolean = false;

    /** 是否隐藏称号 */
    public var isHideTitle:Boolean = false;

    //4个阵元封魂的等级（左上至左下）
    public var zhenyuanSoul:Vector.<uint> = new Vector.<uint>(4);
    //4个阵元封魂经验
    public var zhenyuanSoulExp:Vector.<uint> = new Vector.<uint>(4);
    //替补的将id
    public var benchFighterID:uint = 0;
    //是否通过妖的引导
    public var isYaoGuide:Boolean = false;
    //是否领取了妖
    public var isGetYao:Boolean = false;

    public function set titleArr(value:Array):void {
        _titleArr = value;

    }

    public function get isBachelorLoginReward():Boolean {
        var flag:Boolean = false;
        var bachelorLoginRewardTime:String = ConfigManager.instance.activity_bachelorLoginRewardcfg.root.info;
        if (userVO.level >= 40 && timeAble(bachelorLoginRewardTime)) {
            flag = true;
        }
        return flag;
    }

    public function get isCarnival():Boolean {
        var flag:Boolean = false;
        if (userVO.level >= 30 && timeAble("2012.11.16-2012.11.22")) {
            flag = true;
        }
        return flag;
    }


    public function get isSosoOpen():Boolean {
        return timeAble("2012.11.25-2012.12.25");
    }

    /**
     * 判斷是否在時間段內
     * */
    public function timeAble(timeStr:String):Boolean {
        if (!timeStr)
            return false;
        var flag:Boolean = false;
        var startTime:uint = new Date(parseInt(timeStr.split("-")[0].split(".")[0]), parseInt(timeStr.split("-")[0].split(".")[1]) - 1, parseInt(timeStr.split("-")[0].split(".")[2])).getTime() / 1000;
        var endTime:uint = new Date(parseInt(timeStr.split("-")[1].split(".")[0]), parseInt(timeStr.split("-")[1].split(".")[1]) - 1, parseInt(timeStr.split("-")[1].split(".")[2]) + 1).getTime() / 1000;
        if (startTime < ServiceTime.getInstance().nowTime && ServiceTime.getInstance().nowTime < endTime) {
            flag = true;
        }
        return flag;
    }

    /**/
    public function timeIsOpen(timeStr:String):Boolean {
        var flag:Boolean = false;
        var time:uint = ServiceTime.getInstance().nowTime;
        var sd:Date = new Date(parseInt(timeStr.split(".")[0]), parseInt(timeStr.split(".")[1]) - 1, parseInt(timeStr.split(".")[2]));
        if (time > sd.getTime() / 1000) {
            flag = true;
        }
        return flag;
    }

    /**
     * 判斷是否在時間段內
     * */
    public function tmAble(timeStr:String):Boolean {
        if (!timeStr)
            return false;
        var flag:Boolean = false;
        var time:uint =ServiceTime.getInstance().nowTime;
        var sd:Date = new Date(time);
        var ed:Date = new Date(time);
        var args:Array = timeStr.split("-");
        sd.setHours(args[0].split(":")[0]);
        sd.setMinutes(args[0].split(":")[1]);
        ed.setHours(args[1].split(":")[0]);
        ed.setMinutes(args[0].split(":")[1]);
        if (time > sd.getTime() && time < ed.getTime()) {
            flag = true;
        }
        return flag;
    }

    /**
     * 判斷是否在時間段状态
     * 0:未开始
     * 1:结束
     * 2:进行
     * */
    public function timeState(timeStr:String):uint {
        var n:uint = 0;
        var startTime:uint = new Date(parseInt(timeStr.split("-")[0].split(".")[0]), parseInt(timeStr.split("-")[0].split(".")[1]) - 1, parseInt(timeStr.split("-")[0].split(".")[2])).getTime() / 1000;
        var endTime:uint = new Date(parseInt(timeStr.split("-")[1].split(".")[0]), parseInt(timeStr.split("-")[1].split(".")[1]) - 1, parseInt(timeStr.split("-")[1].split(".")[2]) + 1).getTime() / 1000;
        if (ServiceTime.getInstance().nowTime <= startTime) {
            n = 0;
        } else if (ServiceTime.getInstance().nowTime >= endTime) {
            n = 1;
        } else {
            n = 2;
        }
        return n;
    }

    /**
     * 限时称号倒计时
     * @param title
     */
    /*
     private function TimeDown(title:TitleVo):void
     {
     if(--title.timeLimit <= 0)
     {
     title.timeLimit = 0;
     }
     }
     */
    /**
     * 是否是新手御剑
     * @return
     *
     */
    //	public static function get isNoviceVIP():Boolean
    //{
    //	return NoviceVIPProxy.instance.isOpenVIP;
    //	}

    /**
     * 仙蕴晶石
     */
    //public var clanStoneVo:ClanStoneVO;

    /**
     * 许愿树信息
     */
    public var prayTreeVo:PrayTreeMyVO;
    /**
     * 推薦好友信息
     * */
    public var refers:Array;
    /***
     * QQBox标志
     * */
    public var qqBoxFlag:uint;
    /*福羊出现据点缓存*/
    public var activityTempLocation:int;
    public var activityTempLoactionName:String;

    public function hasYao():Boolean {
        for each (var heroVo:GernalHeroVO in heros) {
            if (heroVo.careerId == 8) {
                return true;
            }
        }
        return false;
    }
    public  function getMainHeroInfo():HeroVO {
        if (!heros)
            return null;
        var returnHerovo:HeroVO;
        var len:int = heros.length;

        for (var i:int = 0; i < len; i++) {
            if ((heros[i] as HeroVO).isUserSelf) {
                returnHerovo = heros[i];
                break;
            }
        }
        return returnHerovo;
    }
    public function getBattleHeros():Array{
        var arr:Array = [];
        if(!heros)return arr;
        for(var i:int = 0; i < heros.length; i ++){
            var vo:HeroVO = heros[i] as HeroVO;
            if(vo && vo.isInBattle){
                arr.push(vo)
            }
        }
        return arr;
    }
}
}
