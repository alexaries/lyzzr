package globals {

import com.game.module.map.vo.MapConstConfig;
import com.game.module.map.vo.NpcBaseInfoVO;
import com.game.module.redPoint.vo.RedPointStruct;
import com.game.vo.ActivityVO;
import com.game.vo.BaojuRefineConfigVO;
import com.game.vo.BloodbitVo;
import com.game.vo.CareerGrowVO;
import com.game.vo.CittaVO;
import com.game.vo.EqSuitVO;
import com.game.vo.GernalHeroVO;
import com.game.vo.GoodsPropsVO;
import com.game.vo.GoodsVO;
import com.game.vo.MonsterVO;
import com.game.vo.RideVO;
import com.game.vo.RolePropVO;
import com.game.vo.SkillVO;
import com.game.vo.TaskCfg;
import com.game.vo.XianRefineConfigVO;

import config.ConfigManager;
import config.activity.onlineLevel.IOnlineLevel_rewards_levelRewards_skipper;
import config.activity.onlineLevel.IOnlineLevel_rewards_onlineRewards_online;
import config.activity.qqgifts.IQqgifts_item;
import config.activity.vipFunInfo.IVipFunInfo_item;
import config.activity.vipTitle.IVipTitle_item;
import config.arena.arenaDiff.IArenaDiff_item;
import config.arena.arenaFighterType.IArenaFighterType_items_item;
import config.arena.arenaType.IArenaType_item;
import config.disaster.disaster.IDisaster_level;
import config.disaster.disaster.IDisaster_level_event;
import config.faction.clanFightBetGift.IClanFightBetGift_item;
import config.faction.cskillprop.ICskillpropCfg;
import config.item.baojuRefineConfig.IBaojuRefineConfigCfg;
import config.item.baojuSkillConfig.IBaojuSkillConfig_item;
import config.item.eqAttriColor.IEqAttriColor_item;
import config.item.eqSoul.IEqSoul_item;
import config.item.equipInherit.IEquipInherit_item;
import config.item.equipSuit.IEquipSuit_item;
import config.item.hpToStrong.IHpToStrong_item;
import config.item.item.IItemCfg;
import config.item.itemGetPath.IItemGetPath_item;
import config.item.itemProp.IItemPropCfg;
import config.item.pathConfig.IPathConfig_item;
import config.item.trumpAttriColor.ITrumpAttriColor_item;
import config.item.trumpExp.ITrumpExp_item;
import config.item.trumpMelt.ITrumpMelt_item;
import config.item.trumpProp.ITrumpProp_item;
import config.item.xianRefineConfig.IXianRefineConfigCfg;
import config.message.titleShowName.ITitleShowName_item;
import config.mission.configmodule.IConfigmodule_module_item;
import config.mission.endLessTrumpCfg.IEndLessTrumpCfgCfg;
import config.mission.newTask.INewTaskCfg;
import config.mission.openfunc.IOpenfuncCfg;
import config.mission.redPoint.IRedPointCfg;
import config.mission.task.ITask_tasks_item;
import config.mission.tip.ITip_item;
import config.mission.vipFunctions.IVipFunctionsCfg;
import config.skills.bloodbitsData.IBloodbitsData_bloodbit;
import config.skills.bloodbitsData.IBloodbitsData_bloodbit_item;
import config.skills.bloodbitsDataLang.IBloodbitsDataLang_lang;
import config.skills.cittaData.ICittaData_citta;
import config.skills.cittaLevel.ICittaLevel_item;
import config.skills.cittaProp.ICittaPropCfg;
import config.skills.skillData.ISkillData_skill;
import config.skills.skillLevel.ISkillLevel_item;
import config.userInfo.careeridCfg.ICareeridCfg_config_careerid_item;
import config.userInfo.exp.IExpCfg;
import config.userInfo.factor.IFactor_config;
import config.userInfo.general.IGeneral_item;
import config.userInfo.monster.IMonster_item;
import config.userInfo.npc.INpc_item;
import config.userInfo.parameter.IParameterCfg;
import config.userInfo.ride.IRide_item;
import config.userInfo.roleProp.IRoleProp_item;
import config.userInfo.tripod.ITripod_item;

import laya.utils.Dictionary;

import utils.ArrayUtil;
import utils.StringUtil;

public class ConfigLocator {
    /**
     * 经济系统
     */
    public var economics:Dictionary;
    /**
     * 宝具随机属性上限值配置
     */
    public var baojuAttrCfg:Array;
    public var goodsList:Dictionary;
    public var itemGetPathDic:Dictionary;
    public var pathConfigDic:Dictionary;
    public var strongSoulArr:Array;
    public var filterWords:String;

    //所有属性配置文件
    public var goodsPropList:Dictionary;
    static var __instance:ConfigLocator;
    public var retreatExpDic:Dictionary;
    public var taskDic:Dictionary;
    public var talkNpcs:Dictionary;
    public var monsters:Dictionary;
    public var autoFightDic:Dictionary;
    public var npcFunctionDic:Dictionary;
    public var moduleDic:Dictionary;
    public var roleProps:Dictionary;
    public var careerCfgs:Array;
    public var gernalHeros:Dictionary;
    public var skillDatas:Dictionary;
    public var skilldiffDic:Dictionary;
    public var cittadiffDic:Array;
    public var cittaDatas:Dictionary;
    public var cittaPropDic:Dictionary;
    public var bloodBitsDatas:Dictionary;
    public var tripodDic:Dictionary;
    public var skillTripodDic:Dictionary;
    public var eqDiffDic:Dictionary;


    public   var strongDic :Dictionary;
    public var trumpExpDic:Dictionary;
    /**配置数据*/
    public var charmDataList:Array = [];
    /**属性配置数据*/
    public var charmProList:Array = [];
    public var titleNameDic:Dictionary;
    //经验表 人物升级所需要的经验
    public var exps:Array;
    public var rideDic:Dictionary;
    public var formula:FormulaConfig;
    public var trumpExpProp:Dictionary;
    public var hpMaxDic:Dictionary;
    public var eqsuits:Dictionary;

    /**
     * 宝具技能配置
     */
    public var baojuSkillCfg:Dictionary;
    public var rankDatas:Dictionary;
    public var rankDatasArr:Array;
    public var rankPropDic:Dictionary;
    public var trumpMelt:Dictionary;
    public var attriColorDic:Dictionary;


    //帮派配置
    public var clanUpgradeDic:Dictionary;
    public var clanSkills:Dictionary;
    public var cskillPropDic:Dictionary;
    public var clanSciences:Dictionary;
    public var clanShopDic:Dictionary;
    public var cfSkillDic:Array;
    public var ccSkillDic:Dictionary;
    public var ccShenTanDic:Dictionary;
    public var clanFightBetDic:Dictionary;


    public var starsDic:Dictionary = new Dictionary;

    public var stonePrice:Dictionary;


    public var eqSoulDic:Dictionary;

    /**
     * 斗剑 配置
     */
    public var ARENA_DIFF:Dictionary;
    public var ARENA_TYPE:Dictionary;
    public var ARENA_FIGHTER_TYPE:Dictionary;

    /**
     * 锁妖塔配置
     */
    public var sealDatas:Dictionary;
    public var DISASTER_EVENT:Dictionary;

    //todo
    public var guideDic:Dictionary;
    public var tipDic:Dictionary;
    public var guideIds:Array;
    public var guideLangDic:Dictionary;
    public var achievDic:Dictionary;
    public var achievArr:Array
    public var inheritDic:Dictionary;
    public var vipFunctionsDic:Dictionary;
    public var redPointDic:Dictionary;
    public var disasterTrumpCfg:Array;

    public var onlineRewards:Dictionary;
    public var levelRewards:Dictionary;

    public static function getInstance():ConfigLocator {
        if (__instance == null) {
            __instance = new ConfigLocator();
        }
        return __instance;
    }

    public function  get config():ConfigManager {
        return ConfigManager.instance;

    }

    public function initOnlineLevel():void{
        var onlines:Vector.<IOnlineLevel_rewards_onlineRewards_online> = ConfigManager.instance.activity_onlineLevel.rewards.onlineRewards.online;
        var levels:Vector.<IOnlineLevel_rewards_levelRewards_skipper> = ConfigManager.instance.activity_onlineLevel.rewards.levelRewards.skipper;

        onlineRewards = new Dictionary();
        for each(var online:IOnlineLevel_rewards_onlineRewards_online in onlines){
            onlineRewards.set(online.id,online);
        }

        levelRewards = new Dictionary();
        for each(var level:IOnlineLevel_rewards_levelRewards_skipper in levels){
            levelRewards.set(level.id,level);
        }
    }

    public function ConfigLocator() {
    }
//    private function parseWonderfulActivity():void{
//        var dic:Dictionary = new Dictionary()
//        for each (var item:IEquipInherit_item in ConfigManager.instance..item) {
//
//            var obj:Object = {};
//            obj.eqType = item.equipType;
//            obj.level = item.level;
//            obj.costType = item.costType;//1仙 2礼券 3银币
//            obj.cost = item.cost;
//            dic.set(obj.level +"_" +item.equipType,obj);
//        }
//        inheritDic = dic;
//    }
    private function strongSoulHandler():void {
//        strongSoulArr=[];
//        var dic:Dictionary = new Dictionary;
//        for (var j:uint = 0; j < 2; j++) {
//            var page_xml:IStrongSoul_group = ConfigManager.instance.userInfo_strongSoul.group[j];
//            var arr:Array = [];
//            for (var i:uint = 0; i < page_xml.item.length; i++) {
//                var itemVo:StrongItemVo = new StrongItemVo();
//                var strong_xml:IStrongSoul_group_item = page_xml.item[i];
//                itemVo.id = strong_xml.id;
//                itemVo.tid = strong_xml.tid;
//                itemVo.name = strong_xml.name;
//                itemVo.star = strong_xml.star;
//                itemVo.score = strong_xml.score;
//                itemVo.desc = strong_xml.desc;
//                itemVo.str = strong_xml.str;
//                itemVo.reward = strong_xml.reward;
//                itemVo.btnStr = strong_xml.btn;
//                itemVo.levelLimit = strong_xml.levelLimit;
//                itemVo.type=i;
//                itemVo.funcid=strong_xml.funcid;
//
//                var tip:IStrongTip_word =  ArrayUtil.find( ConfigManager.instance.userInfo_strongTip.word,function(word__:IStrongTip_word){
//                     return itemVo.tid==word__.id;
//                })
//                if(tip){
//                    itemVo.tips = tip.content;
//                }
//
//
//                arr.push(itemVo);
//                dic.set(itemVo.tid,itemVo);
//
//            }
//            strongSoulArr=strongSoulArr.concat(arr);
//        }
//
//
//       strongDic = dic;

    }
    private function parseEqInherit():void {
        var dic:Dictionary = new Dictionary()
        for each (var item:IEquipInherit_item in ConfigManager.instance.item_equipInherit.item) {

            var obj:Object = {};
            obj.eqType = item.equipType;
            obj.level = item.level;
            obj.costType = item.costType;//1仙 2礼券 3银币
            obj.cost = item.cost;
            dic.set(obj.level +"_" +item.equipType,obj);
        }
        inheritDic = dic;
    }
    private function achievementHandler():void {
//        achievArr = []
//       var langs:Vector.<IAchievementLang_lang> =  ConfigManager.instance.userInfo_achievementLang.lang
//        var dic:Dictionary = new Dictionary();
//        for each (var item:IAchievement_item in ConfigManager.instance.userInfo_achievement.item) {
//            var vo:AchievVo = new AchievVo();
//            vo.id = item.id
//            vo.title = item.title;
//            vo.titleColor =item.titleColor;
//            vo.imgUrl = item.img;
//            vo.desc = item.desc;
//            vo.tips = item.tips.toString();
//            vo.max = item.max;
//            vo.rewardStr = item.reward;
//            vo.openLv = item.lv;
//            dic.set(vo.id,vo);
//            achievArr.push(vo);
//        }
//        achievDic = dic;
    }
    public function getOpenfunc(menuWinTypeName:String,index:int):IOpenfuncCfg{
        var menuWin:IOpenfuncCfg=  ArrayUtil.find(ConfigManager.instance.mission_openfunc.openfuncCfg,function(cfg:IOpenfuncCfg){
            return cfg.win==menuWinTypeName&&cfg.tab==index;
        });
        if(menuWin==null){
            menuWin=  ArrayUtil.find(ConfigManager.instance.mission_openfunc.openfuncCfg,function(cfg:IOpenfuncCfg){
                return cfg.win==menuWinTypeName;
            });
        }
        return menuWin;
    }


    public var activityDic:Dictionary=new Dictionary();

    public function getOpenfuncByPosition(pos:int):Array{
        if(activityDic.get(pos)) return activityDic.get(pos);
        var arr:Array = ArrayUtil.filter(ConfigManager.instance.mission_openfunc.openfuncCfg,function(cfg:IOpenfuncCfg){
            return parseInt(cfg.position+"")==pos;
        });
        ArrayUtil.sortOn(arr,["priority"], ArrayUtil.SORT_NUMERIC);//按照优先级 升序
        var tmp:Array=[];
        for (var i:int = 0; i < arr.length; i++) {
            var cfg:IOpenfuncCfg = arr[i];
            var iconVo:ActivityVO = new ActivityVO();
            iconVo.name = cfg.name;
            iconVo.imgUrl = "main/icons/" + cfg.main_icon + ".png";
            iconVo.type = cfg.win;
            iconVo.openfunc = cfg;
            tmp.push(iconVo)
        }

        activityDic.set(pos,tmp);

        return tmp;
    }

    public var qqgiftsDic:Dictionary = new Dictionary();
    public function qqgiftsHandle():void{
        for each (var gift:IQqgifts_item in   ConfigManager.instance.activity_qqgifts.item) {
            qqgiftsDic.set(gift.id,gift);
        }
    }

    private function guideHandle():void {
//        var langDic:Dictionary = new Dictionary();
//
//
//        for each (var langobj:IGuidelang_lang in   ConfigManager.instance.mission_guidelang.lang) {
//            langDic.set(langobj.id, langobj.txt);
//        }
//        var welcome:String = langDic.get(ConfigManager.instance.mission_guide1.root.welcome);
//
//        var dic:Dictionary = new Dictionary();
//
//        var guide:GuideStruct;
//        var step:GuideStepStruct;
//        var args:Array;
//        var index:uint = 0;
//        guideIds = (ConfigManager.instance.mission_guide1.root.ids).split(",");
//        GuideVo.WELCOME_STR = welcome;
//
//        for each (var task:IGuide1_root_task in ConfigManager.instance.mission_guide1.root.task) {
//            guide = new GuideStruct();
//            guide.id = task.id;
//            guide.index = index;
//            guide.state = 0;
//
//            guide.step = 0;
//            guide.steps = [];
//            var tmp=[];
//            if(task.item is Array){
//                tmp=task.item;
//            }else
//            {
//                tmp=[task.item];
//            }
//
//            for each (var item:IGuide1_root_task_item in tmp) {
//                step = new GuideStepStruct();
//                step.cfg=item;
//                step.lock = false;
//                step.win = item.win;
//                step.name = item.name;
//                if (item.lock && item.lock == 1) {
//                    step.lock = true;
//                }
//                args = (item.box).split(",");
//                step.box_x = parseInt(args[0]);
//                step.box_y = parseInt(args[1]);
//                step.box_w = parseInt(args[2]);
//                step.box_h = parseInt(args[3]);
//                args = (item.arraw).split(",");
//                step.arraw_x = AppConst.padX+parseInt(args[0]);
//                step.arraw_y = parseInt(args[1]);
//                step.arraw_r = parseInt(args[2]);
//                step.arraw_visible = false;
//                step.box_visible = false;
//                if(item.arraw_visible==1){
//                    step.arraw_visible = true;
//                }
//                if(item.box_visible==1){
//                    step.box_visible = true;
//                }
//                step.analysis=item.stationing;
//                if(item.tip!=0){
//                    var tips:String = langDic.get(item.tip);
//                    args = tips.split(",");
//                    step.tip_x = AppConst.padX+parseInt(args[0]);
//                    step.tip_y = parseInt(args[1]);
//                    step.tip_m = args[2];
//                }
//
//                guide.steps.push(step);
//            }
//            index++;
//            dic.set(guide.id, guide);
//        }
//        guideDic = dic;
//        guideLangDic = dic;
//        return;
    }

    private function tipHandle():void {
        var dic:Dictionary = new Dictionary();

        for each (var item:ITip_item in ConfigManager.instance.mission_tip.item) {
            dic.set(item.id, item);
        }
        dic.set("max", ConfigManager.instance.mission_tip.item.length);
        tipDic = dic;
        return;
    }

    public var parameterDic:Dictionary;
    private function parameterHandle():void{
        parameterDic = new Dictionary();
        for each(var item:IParameterCfg in ConfigManager.instance.userInfo_parameter.parameterCfg){
            parameterDic.set(item.id,item);
        }
    }

    private function arenaDiffHandle():void {
        var dic:Dictionary = new Dictionary();

        for each(var item:IArenaDiff_item in ConfigManager.instance.arena_arenaDiff.item) {
            dic.set(item.data, item);
        }
        ARENA_DIFF = dic;
    }

    private function arenaTypeHandle():void {
        var dic:Dictionary = new Dictionary();

        for each(var item:IArenaType_item in ConfigManager.instance.arena_arenaType.item) {
            dic.set(item.id, item);
        }
        ARENA_TYPE = dic;
    }

    private function arenaFighterTypeHandle():void {
        var dic:Dictionary = new Dictionary();

        for each(var item:IArenaFighterType_items_item in ConfigManager.instance.arena_arenaFighterType.items.item) {
            dic.set(item.id, item);
        }
        ARENA_FIGHTER_TYPE = dic;
    }

    private function sealHandle():void {
//        var dic:Dictionary = new Dictionary();
//
//        for each(var o:ISeal_item in ConfigManager.instance.instance_seal.item) {
//            var hivo:SealVo = new SealVo();
//            hivo.level = o.level;
//            hivo.mid = o.mid;
//            hivo.tips = o.tips;
//            hivo.goodId = o.imgId;
//            hivo.info = o.info;
//
//            dic.set(hivo.level, hivo);
//        }
//        sealDatas = dic;
    }

    private function disasterEventHandle():void {
        var dic:Dictionary = new Dictionary();
        for each(var level:IDisaster_level in ConfigManager.instance.disaster_disaster.level) {
            dic.set(level.id, level);
        }
        DISASTER_EVENT = dic;
    }

    public function getDisasterEvent(levelId:int, eventId:int):IDisaster_level_event {
        var level:IDisaster_level = DISASTER_EVENT.get(levelId);
        var dic2:Dictionary = new Dictionary();
        for each(var event:IDisaster_level_event in level.event) {
            dic2.set(event.id, event);
        }
        return dic2.get(eventId);
    }

    private function eqSoulHandle():void {
        var dic:Dictionary = new Dictionary();

        dic.set(0, [0, 0, 0, 0, 0, 0, 0, 0]);
        for each (var item:IEqSoul_item in ConfigManager.instance.item_eqSoul.item) {
            var arr:Array = [(item.attack),
                (item.defend),
                (item.critical),
                (item.pierce),
                (item.action),
                (item.tough),
                (item.criticaldmg),
                (item.hp)];

            dic.set(item.level, arr);
        }
        eqSoulDic = dic;
    }

    private function eqAttriColorHandle():void {
        var dic:Dictionary = new Dictionary();
        for each (var item:IEqAttriColor_item in  ConfigManager.instance.item_eqAttriColor.item) {
            var propArr:Array = [(item.hp),
                (item.act),
                (item.hit),
                (item.dodge),
                (item.crit),
                (item.piece),
                (item.repel),
                (item.tough),
                (item.magic_d)];
            var key:int = (item.level) * 100 + (item.color) * 10 + (item.career);
            dic.set(key, propArr);
        }
        attriColorDic = dic;
    }

    private function trumpAttriColorHandle():void {
        var dic:Dictionary = attriColorDic;
        for each (var item:ITrumpAttriColor_item in   ConfigManager.instance.item_trumpAttriColor.item) {
            var propArr:Array = [(item.hp),
                (item.act),
                (item.hit),
                (item.dodge),
                (item.crit),
                (item.piece),
                (item.repel),
                (item.tough),
                (item.magic_d)];
            var key:int = (item.level) * 100 + (item.color) * 10 + (item.career);
            dic.set(key, propArr);
        }
        attriColorDic = dic;
    }

    private function trumpMeltHandle():void {
        var dic:Dictionary = new Dictionary();
        for each (var item:ITrumpMelt_item in ConfigManager.instance.item_trumpMelt.item) {
            var meltArr:Array = [1,
                item.level1,
                item.level2,
                item.level3,
                item.level4,
                item.level5,
                item.level6,
                item.level7,
                item.level8,
                item.level9,
                item.level10];
            dic.set(item.color, meltArr);
        }
        trumpMelt = dic;
    }


    public static const BAOJU_REFINE_MAX_LEVEL:uint = 25;

    /**
     * 根据位置，等级找到配置
     * @param pos    灵悟信
     * @param level    等级
     * @return
     *
     */
    public function getBaojuRefineConfig(pos:uint, level:uint):BaojuRefineConfigVO {
        //var index:int = configIndexArr[pos] + level - 1;
        var index:int = (pos - 1) * BAOJU_REFINE_MAX_LEVEL + level;
        var cfg:IBaojuRefineConfigCfg = ConfigManager.instance.item_baojuRefineConfig.baojuRefineConfigCfg[index];
        var vo:BaojuRefineConfigVO = new BaojuRefineConfigVO();
        vo.id = cfg.id;
        vo.needitem = cfg.needitem;
        vo.itemnum = cfg.itemnum
        vo.percent = cfg.percent;
        return vo;
    }

    public function getBaojuRefinePercent(pos:uint, level:uint):Number {
        var index:int = (pos - 1) * BAOJU_REFINE_MAX_LEVEL + level;
        var cfg:IBaojuRefineConfigCfg = ConfigManager.instance.item_baojuRefineConfig.baojuRefineConfigCfg[index];
        return cfg.percent / 100;
    }

    public static const XIAN_REFINE_MAX_LEVEL:uint = 20;

    /**
     * 根据位置，等级找到配置
     * @param pos    灵悟信
     * @param level    等级
     * @return
     *
     */
    public static function getXianRefineConfig(pos:uint, level:uint):XianRefineConfigVO {
        //var index:int = configIndexArr[pos] + level - 1;
        var index:int = (pos - 1) * XIAN_REFINE_MAX_LEVEL + level;
        var cfg:IXianRefineConfigCfg = ConfigManager.instance.item_xianRefineConfig.xianRefineConfigCfg[index];
        var vo:XianRefineConfigVO = new XianRefineConfigVO();
        vo.id = cfg.id
        vo.needitem = cfg.itemID
        vo.itemnum = cfg.itemnum
        vo.percent = cfg.percent;
        return vo;
    }

    public function getXianRefinePercent(pos:uint, level:uint):Number {
        var index:int = (pos - 1) * XIAN_REFINE_MAX_LEVEL + level;
        var cfg:IXianRefineConfigCfg = ConfigManager.instance.item_xianRefineConfig.xianRefineConfigCfg[index];
        return cfg.percent / 100;
    }
    private function taskHandle():void {
        var dic:Dictionary = new Dictionary();
        for each (var item:INewTaskCfg in ConfigManager.instance.mission_newTask.newTaskCfg) {
            var vo:TaskCfg = new TaskCfg();
            vo.id = item.id;
            vo.name = item.name;
            vo.type = item.type;
            /*            vo.cycColor = 0;
             vo.cycStep = 0;
             vo.cycCount = 0;
             vo.state = 0;
             vo.plan = [0, 0, 0, 0, 0, 0, 0, 0, 0];*/

           // vo.country = item.country;
            vo.playerLevel = item.playerLevel;
            vo.preTaskId = item.preTaskId;
           // vo.groundLimit = item.groudLimit;
           // vo.timeLimit = item.timeLimit;
          //  vo.num = item.num;
          //  vo.backup = item.backup;
            vo.klass = item.klass;

            vo.step = [item.step];//item.step.toString().split(",");

           // vo.npcFinishID = item.npcFinish;
           // vo.npcPublishID = item.npcPublish;
            vo.describe = item.describe;
            vo.toolsPublish = item.toolsPublish;
           // vo.finishCondition = item.finishCondition;
         //   vo.finishDesc = item.finishDesc;
         //   vo.awardExp = item.awardEXp;
            vo.awardTael = item.awardTael;
           // vo.awardCoin = item.awardCoin;
           // vo.awardGiftCard = item.awardGiftCard;
          //  vo.awardFriend = item.awardFriend;
            vo.awardDesc = item.describe;
         //   vo.awardOthers = item.awardOthers;
            vo.awardTools =[];
           // if(StringUtil.trim(item.awardTools)!=""){
             //   vo.awardTools = StringUtil.trim(item.awardTools).split(",");
           // }
          //  vo.typePublish = vo.npcPublishID > 10000 ? 0 : 1;
            // vo.addrFinish = MapUtil.getBuildBaseInfoVObyId(vo.npcFinishID);
            // vo.addrPublish = MapUtil.getBuildBaseInfoVObyId(vo.npcPublishID);
            dic.set(vo.id, vo);
        }


        taskDic = dic;
    }
    private function taskHandle2():void {
        var dic:Dictionary = new Dictionary();
        for each (var item:ITask_tasks_item in ConfigManager.instance.mission_task.tasks.item) {
            var vo:TaskCfg = new TaskCfg();
            vo.id = item.id;
            vo.name = item.name;
            vo.type = item.type;
            /*            vo.cycColor = 0;
             vo.cycStep = 0;
             vo.cycCount = 0;
             vo.state = 0;
             vo.plan = [0, 0, 0, 0, 0, 0, 0, 0, 0];*/

            vo.country = item.country;
            vo.playerLevel = item.playerLevel;
            vo.preTaskId = item.preTaskId;
            vo.groundLimit = item.groudLimit;
            vo.timeLimit = item.timeLimit;
            vo.num = item.num;
            vo.backup = item.backup;
            vo.klass = item.klass;

            vo.step = item.step.toString().split(",");

            vo.npcFinishID = item.npcFinish;
            vo.npcPublishID = item.npcPublish;
            vo.describe = item.describe;
            vo.toolsPublish = item.toolsPublish;
            vo.finishCondition = item.finishCondition;
            vo.finishDesc = item.finishDesc;
            vo.awardExp = item.awardEXp;
            vo.awardTael = item.awardTael;
            vo.awardCoin = item.awardCoin;
            vo.awardGiftCard = item.awardGiftCard;
            vo.awardFriend = item.awardFriend;
            vo.awardDesc = item.describe;
            vo.awardOthers = item.awardOthers;
            vo.awardTools =[];
            if(StringUtil.trim(item.awardTools)!=""){
                vo.awardTools = StringUtil.trim(item.awardTools).split(",");
            }
            vo.typePublish = vo.npcPublishID > 10000 ? 0 : 1;
            // vo.addrFinish = MapUtil.getBuildBaseInfoVObyId(vo.npcFinishID);
            // vo.addrPublish = MapUtil.getBuildBaseInfoVObyId(vo.npcPublishID);
            dic.set(vo.id, vo);
        }


        taskDic = dic;
    }

    private function trumpExpHandle():void {
        var dic:Dictionary = new Dictionary();
        for each (var item:ITrumpExp_item in ConfigManager.instance.item_trumpExp.item) {
            var expArr:Array = [item.color2, item.color3, item.color4, item.color5];
            dic.set(item.level, expArr);
        }
        trumpExpDic = dic;
    }

    private function trumpPropHandle():void {
        var dic:Dictionary = new Dictionary();
        for each (var item:ITrumpProp_item in  ConfigManager.instance.item_trumpProp.item) {
            var expArr:Array = [Number(item.str), Number(item.phy), Number(item.agi), Number(item.intelligence), Number(item.will), Number(item.aura), Number(item.auraMax)];
            if (!dic.get(item.level)) {
                dic.set(item.level, new Dictionary());
            }
            dic.get(item.level).set(item.color, expArr)
        }
        trumpExpProp = dic;
    }

    private function pathConfigHandle():void{
        var dic:Dictionary = new Dictionary();
        for each(var item:IPathConfig_item in ConfigManager.instance.item_pathConfig.item){
            dic.set(item.pathId,item);
        }
        pathConfigDic = dic;
    }

    private function itemPathHandle():void{
        var dic:Dictionary = new Dictionary();
        for each(var item:IItemGetPath_item in ConfigManager.instance.item_itemGetPath.item){
            var pathArr:Array = (item.pathId + "").split(",");
            dic.set(item.goodId,pathArr);
        }
        itemGetPathDic = dic;
    }

    private function hpToStrongHandle():void {
        var dic:Dictionary = new Dictionary();
        for each (var item:IHpToStrong_item in ConfigManager.instance.item_hpToStrong.item) {
            dic.set(item.level, [item.maxhpA, item.maxhpR, item.maxhpS, item.maxhpD, item.maxhpM]);
        }
        hpMaxDic = dic;
    }

    private function eqSuitHandleFunction():void {
        var dic:Dictionary = new Dictionary();
        for each (var item:IEquipSuit_item in ConfigManager.instance.item_equipSuit.item) {
            var eqsuitvo:EqSuitVO = new EqSuitVO();
            var str:String = item.ids;
            eqsuitvo.ids = str.split(",");

            // var str2 : String = item.@adds2;
            eqsuitvo.adds2 = item.adds2;
            // var str4 : String = item.@adds4;
            eqsuitvo.adds4 = item.adds4;
            // var str6 : String = item.@adds6;
            eqsuitvo.adds6 = item.adds6;
            // var str8 : String = item.@adds8;
            eqsuitvo.adds8 = item.adds8;
            eqsuitvo.id = item.id;
            eqsuitvo.name = item.name;
            dic.set(eqsuitvo.id, eqsuitvo);
        }
        eqsuits = dic;
    }

    private function baojuSkillHandler():void {
        var dic:Dictionary = new Dictionary();

        //宝具特殊名
        for each (var item:IBaojuSkillConfig_item in ConfigManager.instance.item_baojuSkillConfig.item) {

            dic.set(item.skillId, item)
        }
        baojuSkillCfg = dic;
    }

    private function rideCfgHandle():void {
        var dic:Dictionary = new Dictionary();
        for each (var o:IRide_item in ConfigManager.instance.userInfo_ride.item) {
            var rvo:RideVO = new RideVO();
            rvo.id = o.id;
            rvo.name = o.name;
            rvo.itemID = o.itemID;
            rvo.items = o.eqs;
            rvo.propID = o.propID;
            rvo.show = o.show;
            rvo.quality = o.quality;
            dic.set(rvo.id, rvo);
        }
        rideDic = dic;
    }
    public function parseActivityControl():void{

    }
    /**
     * VIP 数值配置
     * */
    public function vipAllHandle():void {
        vipHandle();
        vipFunHandle();
        vipTitleHandle();
    }

    /**
     * VIP 数值配置
     * */
    private function vipHandle():void {
        MapConstConfig.VIPMoney = ConfigManager.instance.activity_vipData.vMoney.split(',');

        var arr:Array = [];
        var item:XML;
        ConfigManager.instance.activity_vipData.vPackInfo.content.forEach(function (item:String) {
            arr.push(item.toString());
        });
        MapConstConfig.VIPPackInfo = arr;

        arr = [];
        ConfigManager.instance.activity_vipData.vData.content.forEach(function (item:String) {
            var str:String = item.toString();
            var arr4:Array = str.split(',');
            arr.push(arr4);
        });
        MapConstConfig.VIPData = arr;

        arr = [];
        MapConstConfig.VIPData.forEach(function (arr3:Array) {
            arr.push(arr3.concat());
        });
        MapConstConfig.VIPDataConst = arr;
    }

    private function vipFunHandle():void {
        var dictemp:Dictionary = new Dictionary();
        ConfigManager.instance.activity_vipFunInfo.item.forEach(function (vitem:IVipFunInfo_item) {
            dictemp.set(vitem.id, vitem);
        });
        MapConstConfig.VIPItemDic = dictemp;
    }

    private function vipTitleHandle():void {
        var arr:Array = [];
        ConfigManager.instance.activity_vipTitle.item.forEach(function (item:IVipTitle_item) {
            arr.push(item.info);
        });
        MapConstConfig.VIPStr = arr;
    }

    public function init() {
        payPropHandle();
        filterWordsCfgHandle();
        guideHandle();
        trumpExpHandle();
        rideCfgHandle();
        vipAllHandle();
        itemCfgHandle();
        monsterHandle();
        retreatExpHandle();
        npcHandle()
        moduleHandle();
        rolePropCfgHandle();
        careeidCfgHandle();
        generalCfgHandle();
        skillDataHandle();
        skillDiffHandle();
        EqDiffHandle();
        skillLevelHandle();
        cittaDataHandle();
        cittaLevelDataHandle();
        cittaPropHandle();
        bloodBitsDataHandle();
        bloodLangDataHandle();
        tripodDataHandle();
        skillTripodDataHandle();
        charmHandle();
        titleNameHandler()
        expHandle();
        trumpPropHandle()
        factorCfgHandle();
        hpToStrongHandle();
        eqSuitHandleFunction();
        baojuSkillHandler();
        rankPropHandle()
        rankHandle();
        taskHandle();
        trumpMeltHandle();
        eqAttriColorHandle()
        trumpAttriColorHandle();
        eqSoulHandle();

        clanUpgradeHandle();
        clanSkillHandle();
        clanSkillInfoHandle();
        clanSkillPropHandle();
        clanScienceHandle();
        clanScienceInfoHandle();
        clanShopHandle();
        cfSkillHandle();
        arenaDiffHandle();
        arenaTypeHandle();
        arenaFighterTypeHandle();
        sealHandle();
        disasterEventHandle();
        tipHandle();
        qqgiftsHandle();
        pathConfigHandle();
        itemPathHandle();
        heroCfgHandle();
        strongSoulHandler();
        achievementHandler();
        parseEqInherit();
        parseVipFunction();
        redPointCfgHandle();
        clanFightBetHandle();
        endLessHandle();
        parameterHandle();
        initOnlineLevel();
        parseActivityControl()
    }
    private function  parseVipFunction():void{
        var dic:Dictionary = new Dictionary();
        for each (var item:IVipFunctionsCfg in ConfigManager.instance.mission_vipFunctions.vipFunctionsCfg) {
            var obj:Object = {};
            obj.funcid = item.funcid;
            obj.funclv = item.funclevel;
            obj.sysName = item.sysname;
            obj.userlv = item.userlevel;
            obj.viplv = item.viplevel
            dic.set(obj.funcid +"_" +obj.funclv,obj);
        }
        vipFunctionsDic = dic;
    }
    private function heroCfgHandle():void {
//        HeroVO.POTENTINAL = ConfigManager.instance.userInfo_heroCfg.district.data.split(",")//xml.district.@data.toString().split(',');
//        for (var i:int = 0; i < HeroVO.POTENTINAL.length; i++) {
//            HeroVO.POTENTINAL[i] = parseFloat(HeroVO.POTENTINAL[i]);
//        }
//        HeroVO.POTENTINALINFO = ConfigManager.instance.userInfo_heroCfg.info.data.split(",")//xml.info.@data.toString().split(',');
//
//        HeroVO.POTENTINALPERCENT = ConfigManager.instance.userInfo_heroCfg.potencialpercent.data.split(",")//xml.potencialpercent.@data.toString().split(',');
//        HeroVO.ANNEALEXP = ConfigManager.instance.userInfo_heroCfg.annealexp.data.split(",")//xml.annealexp.@data.toString().split(',');
    }
    private function payPropHandle():void {
        var dic:Dictionary = new Dictionary();
        var fields:Array = ["book", "eqStrong", "eqDecompose", "eqPurify", "eqPunch", "gemAdd", "gemRemove", "gemUp", "magicWUp", "babelA", "babelA1", "babelMS", "babelM", "babelF", "copyA", "copyA1", "copyM", "copyF", "formationA", "formationA1", "formationM", "formationF", "trans", "hotel", "division", "gov", "divisionF", "govF", "hook", "makeClan", "packEx"];
        var obj:Object;

        /**
         * payType: <br>
         *            0 银币 <br>
         *            1 仙石  <br>
         *            2 礼劵  <br>
         *            3 仙石或礼劵 <br>
         * pay: 具体经济数值 <br>
         */

        for each (var field:String in fields) {
            obj = {};
            obj.payType = parseInt(ConfigManager.instance.item_payProp[field].payType);
            obj.pay = String(ConfigManager.instance.item_payProp[field].pay);
            dic.set(field, obj);
        }

        var dicTemp:Dictionary = new Dictionary();
        for each (var item:Object in ConfigManager.instance.item_payProp.hero.item) {
            obj = {};
            obj.color = parseInt(item.color);
            obj.payType = parseInt(item.payType);
            obj.pay = parseInt(item.pay);
            dicTemp.set(obj.color, obj);
        }
        dic.set("hero", dicTemp);
        economics = dic;
    }

    private function rankHandle():void {
//        rankDatasArr = [];
//        var ranksTemp:Dictionary = new Dictionary();
//        for each (var item:IRank_up_item in ConfigManager.instance.embattle_rank.up.item) {//for each (var item:IBaojuSkillConfig_item in ConfigManager.instance.item_baojuSkillConfig.item)
//            var ranktemp:RankDataVo = new RankDataVo();
//            ranktemp.id = item.id;
//            ranktemp.name = item.name;
//            ranktemp.nums = item.nums;
//            ranktemp.info = item.effectInfo1;
//            var gridstemp:Dictionary = new Dictionary();
//            var gridItem:RankPropVo;
//            switch (ranktemp.nums) {
//                case 5:
//                    gridItem = new RankPropVo();
//                    gridItem.pos = item.grid5;
//                    gridItem.rankPos = 5;
//                    setRankItemVo(gridItem, item.grid5Prop);
//                    gridstemp.set(gridItem.pos, gridItem);
//                case 4:
//                    gridItem = new RankPropVo();
//                    gridItem.pos = (item.grid4);
//                    gridItem.rankPos = 4;
//                    setRankItemVo(gridItem, (item.grid4Prop));
//                    gridstemp.set(gridItem.pos, gridItem);
//                case 3:
//                    gridItem = new RankPropVo();
//                    gridItem.pos = (item.grid3);
//                    gridItem.rankPos = 3;
//                    setRankItemVo(gridItem, (item.grid3Prop));
//                    gridstemp.set(gridItem.pos, gridItem)
//                case 2:
//                    gridItem = new RankPropVo();
//                    gridItem.pos = (item.grid2);
//                    gridItem.rankPos = 2;
//                    setRankItemVo(gridItem, (item.grid2Prop));
//                    gridstemp.set(gridItem.pos, gridItem);
//                case 1:
//                    gridItem = new RankPropVo();
//                    gridItem.pos = (item.grid1);
//                    gridItem.rankPos = 1;
//                    setRankItemVo(gridItem, (item.grid1Prop));
//                    gridstemp.set(gridItem.pos, gridItem)
//                    break;
//                default:
//                    break;
//            }
//            ranktemp.gridsInfo = gridstemp;
//            ranksTemp.set(ranktemp.id, ranktemp);
//            rankDatasArr.push(ranktemp)
//        }
//        rankDatas = ranksTemp;
    }

//    private function setRankItemVo(rankvo:RankPropVo, propID:int):void {
//        var rankPropVO:RankPropVo = rankPropDic.get(propID);
//        if (rankPropVO) {
//            rankvo.power = rankPropVO.power;
//            rankvo.strength = rankPropVO.strength;
//            rankvo.agility = rankPropVO.agility;
//            rankvo.inelligence = rankPropVO.inelligence;
//
//            rankvo.will = rankPropVO.will;
//            rankvo.ap = rankPropVO.ap;
//            rankvo.ap_magic = rankPropVO.ap_magic;
//            rankvo.def = rankPropVO.def;
//            rankvo.def_magic = rankPropVO.def_magic;
//
//            rankvo.hp = rankPropVO.hp;
//            rankvo.tough = rankPropVO.tough;
//            rankvo.act = rankPropVO.act;
//            rankvo.hit = rankPropVO.hit;
//            rankvo.dodge = rankPropVO.dodge;
//
//            rankvo.crit = rankPropVO.crit;
//            rankvo.crit_damage = rankPropVO.crit_damage;
//            rankvo.pierce = rankPropVO.pierce;
//            rankvo.repel = rankPropVO.repel;
//            rankvo.dodge_magic = rankPropVO.dodge_magic;
//        } else {
//        }
//    }

    private function rankPropHandle():void {
//        var dic:Dictionary = new Dictionary();
//        for each (var item:IRankPropCfg in ConfigManager.instance.embattle_rankProp.rankPropCfg) {// for each (var item:IRank_up_item in ConfigManager.instance.embattle_rank.up.item)
//            var propertyvo:RankPropVo = new RankPropVo();
//
//            propertyvo.id = item.id//propData[0];
//            propertyvo.power = item.power + ""//propData[1];
//            propertyvo.strength = item.strength + ""//propData[2];
//            propertyvo.agility = item.agility + ""//propData[3];
//            propertyvo.inelligence = item.inelligence + "";//propData[4];
//
//            propertyvo.will = item.will + ""//propData[5];
//            propertyvo.ap = item.ap//propData[6];
//            propertyvo.ap_magic = item.ap_magic//propData[7];
//            propertyvo.def = item.def//propData[8];
//            propertyvo.def_magic = item.def_magic//propData[9];
//
//            propertyvo.hp = item.hp//propData[10];
//            propertyvo.tough = item.tough//propData[11];
//            propertyvo.act = item.act//propData[12];
//            propertyvo.hit = item.hit//propData[13];
//            propertyvo.dodge = item.dodge//propData[14];
//
//            propertyvo.crit = item.crit//propData[15];
//            propertyvo.crit_damage = item.crit_damage//propData[16];
//            propertyvo.pierce = item.pierce//propData[17];
//            propertyvo.repel = item.repel//propData[18];
//            propertyvo.dodge_magic = item.dodge_magic//propData[19];
//
//            dic.set(propertyvo.id, propertyvo)
//        }
//        rankPropDic = dic;
    }

    public function getHeroExpInfo(exp:Number):Array {
        var left:IExpCfg;
        var right:IExpCfg;

        for (var i:int = 0; i < exps.length; i++) {
            var object:IExpCfg = exps[i];
            if (object.exp > exp) {
                right = object;
                break;
            }
            left = object;
        }
        if (left.level == right.level) {
            return [right.level, exp - right.exp, right.exp];
        }
        return [left.level, exp - left.exp, right.exp - left.exp];
    }

    private function titleNameHandler():void {
        var dic:Dictionary = new Dictionary();

        ConfigManager.instance.message_titleShowName.item.forEach(function (item:ITitleShowName_item) {
            var id:uint = (item.id);
            dic.set(id, [item.name, item.color]);
        });
        titleNameDic = dic;
    }

    public function charmHandle():void {

//        charmDataList = [];
//
//        var v:CharmVo;
//
//        ConfigManager.instance.charm_charmConfig.items.charm.forEach(function (xmlList:ICharmConfig_items_charm) {
//            v = new CharmVo();
//            v.id = (xmlList.id);
//            v.name = (xmlList.name);
//            v.color = (xmlList.color);
//            v.modelID = (xmlList.modelID);
//            v.imgID = (xmlList.imgID);
//            v.skillId = (xmlList.cittaID);
//
//            v.skillList = [v.skillId];
//            v.skillList_hasLearn = [v.skillId];
//            charmDataList.push(v);
//        });
//
//        charmProList = [];
//
//        ConfigManager.instance.charm_charmPro.charmProCfg.forEach(function (proCfg:ICharmProCfg) {
//            var info:CharmProInfo = new CharmProInfo();
//            info.id = proCfg.id;
//            info.lv = proCfg.level;
//            info.exp = proCfg.exp;
//            info.color = proCfg.color;
//            info.ap = proCfg.physical_attack;
//            info.ma = proCfg.magic_attack;
//            info.act = proCfg.speed;
//            info.tough_value = proCfg.tenacity;
//            info.dodge_value = proCfg.dodge;
//            info.repel_value = proCfg.counter_attack;
//            info.pierce_reduce_damage = proCfg.injury_reduction;
//            charmProList.push(info);
//        });


    }

    /**获取配置数据*/
//    public function getInfoDataById(id:int):CharmVo {
//        for (var i:int = 0; i < charmDataList.length; i++) {
//            var v:CharmVo = charmDataList[i];
//            if (v.id == id)
//                return v.clone();
//        }
//        return null;
//    }

    /**技能配置*/
    private function skillDataHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.skills_skillData.skill.forEach(function (o:ISkillData_skill) {
            var vo:SkillVO = new SkillVO();
            vo.id = (o.id);
            vo.name = o.name;
            vo.apType = (o.type2);
            vo.type = (o.type1);
            vo.apTarget = (o.apTarget);
            vo.apRange = o.apType + "";
            vo.rateInfo = o.rateInfo;
            vo.mainInfo = o.mainInfo;
            vo.moreInfo = o.moreInfo;
            vo.degree = (o.degree);
            vo.buffId = (o.buff);
            vo.isMove = (o.move);
            vo.isAct = (o.act);
            vo.modelID = parseInt(o.modelID);
            if (vo.moreInfo == undefined)
                vo.moreInfo = "";
            if (vo.rateInfo == undefined)
                vo.rateInfo = "";

            dic.set(vo.id, vo);
        });
        skillDatas = dic;
    }

    private function skillLevelHandle():void {
        ConfigManager.instance.skills_skillLevel.item.forEach(function (o:ISkillLevel_item) {
            var s:String = (Math.floor(o.level / 100)).toString();
            var vo:SkillVO = skillDatas.get(s);

            if (vo) {
                var level:int = (o.level) % 100;
                var rate:String = o.rate;
                var main:String = o.main;
                var more:String = o.more;
                var cool:String = o.cool.toString();
                if (rate == "NaN")
                    rate = "";
                if (main == "NaN")
                    main = "";
                if (more == "NaN")
                    more = "";
                var a:Array = [rate, main, more, cool];
                vo.datas.set(level, a);
            }
        });

    }


    /**心法配置*/
    private function cittaDataHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.skills_cittaData.citta.forEach(function (o:ICittaData_citta) {
            var vo:CittaVO = new CittaVO();
            vo.id = (o.id);
            vo.name = o.name;
            vo.maxlevel = o.maxlevel;
            vo.rateInfo = o.rateInfo + "";
            vo.mainInfo = o.mainInfo;
            vo.moreInfo = o.moreInfo;
            vo.degree = (o.degree);
            if (vo.moreInfo == "NaN")
                vo.moreInfo = "";

            dic.set(vo.id, vo);
        });
        cittaDatas = dic;
    }

    private function cittaLevelDataHandle():void {
        ConfigManager.instance.skills_cittaLevel.item.forEach(function (o:ICittaLevel_item) {
            var s:String = Math.floor(o.level / 100).toString();
            var vo:CittaVO = cittaDatas.get(s);
            if (vo) {
                var level:int = (o.level) % 100;
                var rate:String = o.rate;
                var main:String = o.main;
                var more:String = o.more;
                var needSoul:String = o.needsoul.toString();
                var needDp:String = o.needp.toString();
                if (rate == "NaN")
                    rate = "";
                if (main == "NaN")
                    main = "";
                if (more == "NaN")
                    more = "";
                var a:Array = [rate, main, more, needSoul, needDp];
                vo.datas.set(level, a);
            }
        });
    }

    private function cittaPropHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.skills_cittaProp.cittaPropCfg.forEach(function (o:ICittaPropCfg) {
            var propertyvo:GoodsPropsVO = new GoodsPropsVO();
            propertyvo.id = o.id.toString();
            propertyvo.skills = o.skills.toString();
            propertyvo.power = o.power.toString();
            propertyvo.strength = o.strength.toString();
            propertyvo.agility = o.agility.toString();
            propertyvo.inelligence = o.inelligence.toString();
            propertyvo.will = o.will.toString();
            propertyvo.soul = o.soul.toString();
            propertyvo.aura_base = o.aura_base.toString();
            propertyvo.aura_max = o.aura_max.toString();
            propertyvo.ap = o.ap.toString();
            propertyvo.ap_magic = o.ap_magic.toString();
            propertyvo.def = o.def.toString();
            propertyvo.def_magic = o.def_magic.toString();
            propertyvo.hp = o.hp.toString();
            propertyvo.tough = o.tough.toString();
            propertyvo.act = o.act.toString();
            propertyvo.hit = o.hit.toString();
            propertyvo.dodge = o.dodge.toString();
            propertyvo.crit = o.crit.toString();
            propertyvo.crit_damage = o.crit_damage;
            propertyvo.pierce = o.pierce.toString();
            propertyvo.repel = o.repel.toString();
            propertyvo.dodge_magic = o.dodge_magic.toString();
            propertyvo.CRIT_REDUCE_DEMAGE = o.CRIT_REDUCE_DEMAGE.toString();
//            propertyvo.PIERCE_DEMAEG= o.PIERCE_DEMAEG.toString();
//            propertyvo.PIERCE_REDUCE_DEMAEG= o.PIERCE_REDUCE_DEMAEG.toString();
            dic.set(propertyvo.id, propertyvo);
        });
        cittaPropDic = dic;
    }



    /**技能冲突配置*/
    private function skillDiffHandle():void {
        var dic:Dictionary = new Dictionary();
        var vid:int = 1;
        ConfigManager.instance.skills_skilldiff.lists.forEach(function (o:String) {
            var propData:Array = o.split(',');
            dic.set(vid, propData);
            vid++;
        });
        skilldiffDic = dic;
    }
    /**技能冲突配置*/
    private function EqDiffHandle():void {
        var dic:Dictionary = new Dictionary();
        var vid:int = 1;
        ConfigManager.instance.item_eqdiff.lists.forEach(function (o:String) {
            var propData:Array = o.split(',');
            dic.set(vid, propData);
            vid++;
        });
        eqDiffDic = dic;
    }



    /**经脉配置*/
    private function bloodBitsDataHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.skills_bloodbitsData.bloodbit.forEach(function (o:IBloodbitsData_bloodbit) {
            var vo:BloodbitVo = new BloodbitVo();
            vo.id = (o.id);
            vo.name = o.name.toString();
            vo.maxlevel = o.maxlevel;
            vo.rateInfo = o.rateInfo;
            vo.mainInfo = o.mainInfo;
            vo.moreInfo = o.moreInfo.toString();
            vo.degree = (o.degree);


            vo.datas = new Dictionary();
            o.item.forEach(function (item:IBloodbitsData_bloodbit_item) {
                var a:Array = [item.rate, item.main, item.more, item.needLv, item.needp, item.rateACM];
                vo.datas.set(item.level, a);
            });
            dic.set(vo.id, vo);
        });
        bloodBitsDatas = dic;
    }

    private function bloodLangDataHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.skills_bloodbitsDataLang.lang.forEach(function (o:IBloodbitsDataLang_lang) {
            var id:String = o.id.toString();
            dic.set(id, o.txt);
        });
        var bArr:Array = bloodBitsDatas.values;
        for (var i:int = 0; i < bArr.length; i++) {
            var vo:BloodbitVo = bArr[i];
            if (vo) {
                vo.name = dic.get(vo.name);
                vo.moreInfo = dic.get(vo.moreInfo);
            }
        }
    }

    /**九疑鼎配置*/
    private function tripodDataHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.userInfo_tripod.item.forEach(function (o:ITripod_item) {
            var tripod:Object = new Object();
            tripod.id = (o.id);
            tripod.name = o.name.toString();
            tripod.color = o.color.toString();
            dic.set(tripod.id, tripod);
        });
        tripodDic = dic;
    }

    private function skillTripodDataHandle():void{
//        skillTripodDic = new Dictionary();
//        var upDic:Dictionary = new Dictionary();
//        ConfigManager.instance.skills_tripodexp.tripodexpCfg.forEach(function(o:ITripodexpCfg) {
//
//            if(o.TripodClassCost ){
//                var TripodClassCost=o.TripodClassCost;
//                if(TripodClassCost  != 0){
//                    var cost:Array = TripodClassCost.split("|");
//                    for(var i:int = 0;i < cost.length;i ++){
//                        var itemInfo:Array = cost[i].split(",");
//                        cost[i] = {itemid: itemInfo[0], itemNum: itemInfo[1]};
//                    }
//                    upDic.set(TripodClassCost, cost);
//                }
//
//            }
//        });
//
//        ConfigManager.instance.skills_tripodexp.tripodexpCfg.forEach(function(o:ITripodexpCfg) {
//            var tripodVo:SkillTripodVO = new SkillTripodVO();
//            tripodVo.cfg = o;
//            tripodVo.upgradeItems = upDic.get(o.TripodClassCost);
//            skillTripodDic.set(o.TripodLv, tripodVo);
//        });
    }

    /**
     * 职业信息配置
     * @param xml
     *
     */
    private function careeidCfgHandle():void {
        var arr:Array = new Array();
        ConfigManager.instance.userInfo_careeridCfg.config.careerid.item.forEach(function (item:ICareeridCfg_config_careerid_item) {
            var career:CareerGrowVO = new CareerGrowVO();
            career.id = (item.id);
            career.name = item.name;

            career.act_base = (item.act);
            career.attack_base = (item.attack);
            career.attack_magic_base = (item.attack_magic);
            // career.aura_base = Number(item.@aura);
            career.aura_base = 100;
            career.aura_start_base = 0;
            career.broke_base = (item.broke);
            career.crit_base = (item.crit);
            career.crit_times_base = (item.crit_times);
            career.def_base = Number(item.defence);
            career.def_magic_base = (item.def_magic);
            career.dodge_base = (item.dodge);
            career.dodge_magic_base = (item.dodge_magic);
            career.endurance_base = (item.endurance);
            career.hit_base = (item.hit);
            career.intelligence_base = (item.intelligence);
            career.p_exp_base = (item.p_exp);
            career.p_exp_max_base = (item.p_exp_max);
            career.p_s_base = (item.hp);
            career.quick_base = (item.quick);
            career.repel_base = (item.repel);
            career.status = (item.level);
            career.strength_base = (item.strength);
            career.tough_base = (item.tough);
            career.willpower_base = (item.willpower);

            career.strength_grow = (item.strength_grow);
            career.quick_grow = (item.quick_grow);
            career.intelligence_grow = (item.intelligence_grow);
            career.endurance_grow = (item.endurance_grow);
            career.willpower_grow = (item.willpower_grow);
            career.act_grow = (item.act_grow);
            career.hit_grow = (item.hit_grow);

            arr.push(career);
        });
        careerCfgs = arr;
    }

    private function rolePropCfgHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.userInfo_roleProp.item.forEach(function (item:IRoleProp_item) {
            var rolePropvo:RolePropVO = new RolePropVO();
            rolePropvo.id = (item.id);
            rolePropvo.act = (item.act);
            rolePropvo.ap = (item.attack);
            rolePropvo.ap_magic = (item.attack_magic);
            rolePropvo.aura = (item.aura);
            rolePropvo.aura = 100;
            rolePropvo.aura_start = 0;
            rolePropvo.crit_times = (item.crit_times);
            rolePropvo.def = (item.defence);
            rolePropvo.def_magic = (item.def_magic);
            rolePropvo.broke = (item.broke);
            rolePropvo.crit = (item.crit);
            rolePropvo.dodge = (item.dodge);
            rolePropvo.dodge_magic = (item.dodge_magic);
            rolePropvo.hit = (item.hit);
            rolePropvo.repel = (item.repel);
            rolePropvo.tough = (item.tough);
            rolePropvo.intelligence = (item.intelligence);
            rolePropvo.p_exp = (item.p_exp);
            rolePropvo.p_exp_max = (item.p_exp_max);
            rolePropvo.quick = (item.quick);
            rolePropvo.strength = (item.strength);
            rolePropvo.willpower = (item.willpower);
            dic.set(rolePropvo.id, rolePropvo);
        });
        roleProps = dic;
    }

    public function getCareerGrowVOByID(careerId:int, status:int):CareerGrowVO {
        var returnvo:CareerGrowVO;
        var arr:Array = careerCfgs;
        var len:int = arr.length;
        for (var i:int = 0; i < len; i++) {
            if ((arr[i] as CareerGrowVO).id == careerId) {
                returnvo = arr[i];
                break;
            }
        }
        return returnvo;
    }

    /**
     * 名将信息配置
     * @param xml
     */
    private function generalCfgHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.userInfo_general.item.forEach(function (item:IGeneral_item) {
            var herovo:GernalHeroVO = new GernalHeroVO();
            herovo.id = (item.id);
            herovo.name = item.name;
            herovo.sex = (item.gender);
            herovo.careerId = (item.career) - 1;
            herovo.level = (item.level);
            herovo.imgId = (item.id);
            herovo.type = (item.type);

            var propVO:RolePropVO = roleProps.get(item.propId) as RolePropVO;

            herovo.potential_1 = (item.potential);
            herovo.potential_1.toFixed(2);
            herovo.potential_2 = (item.wit);

            if (propVO) {
                herovo.act_base = propVO.act;
                herovo.attack_base = propVO.ap;
                herovo.attack_magic_base = propVO.ap_magic;
                herovo.aura_base = propVO.aura;
                herovo.aura_start_base = propVO.aura_start;
                // herovo.aura_base = 100;
                // herovo.aura_start_base = 0;
                herovo.broke_base = propVO.broke;
                herovo.crit_base = propVO.crit;
                herovo.crit_times_base = propVO.crit_times;
                herovo.def_base = propVO.def;
                herovo.def_magic_base = propVO.def_magic;
                herovo.dodge_base = propVO.dodge;
                herovo.dodge_magic_base = propVO.dodge_magic;
                herovo.endurance_base = propVO.endurance;
                herovo.hit_base = propVO.hit;
                herovo.intelligence_base = propVO.intelligence;
                herovo.p_exp_base = propVO.p_exp;
                herovo.p_exp_max_base = propVO.p_exp_max;
                herovo.p_s_base = propVO.p_s;
                herovo.quick_base = propVO.quick;
                herovo.repel_base = propVO.repel;
                herovo.soul_max_base = propVO.soul_max;
                herovo.strength_base = propVO.strength;
                herovo.tough_base = propVO.tough;
                herovo.willpower_base = propVO.willpower;
            } else {
                var career:CareerGrowVO = getCareerGrowVOByID(herovo.careerId, 1);
                if (career) {
                    herovo.act_base = career.act_base;
                    herovo.attack_base = career.attack_base;
                    herovo.attack_magic_base = career.attack_magic_base;
                    herovo.aura_base = career.aura_base;
                    herovo.aura_start_base = career.aura_start_base;
                    // herovo.aura_base = 100;
                    // herovo.aura_start_base = 0;
                    herovo.broke_base = career.broke_base;
                    herovo.crit_base = career.crit_base;
                    herovo.crit_times_base = career.crit_times_base;
                    herovo.def_base = career.def_base;
                    herovo.def_magic_base = career.def_magic_base;
                    herovo.dodge_base = career.dodge_base;
                    herovo.dodge_magic_base = career.dodge_magic_base;
                    herovo.endurance_base = career.endurance_base;
                    herovo.hit_base = career.hit_base;
                    herovo.intelligence_base = career.intelligence_base;
                    herovo.p_exp_base = career.p_exp_base;
                    herovo.p_exp_max_base = career.p_exp_max_base;
                    herovo.p_s_base = career.p_s_base;
                    herovo.quick_base = career.quick_base;
                    herovo.repel_base = career.repel_base;
                    herovo.soul_max_base = career.soul_max_base;
                    herovo.strength_base = career.strength_base;
                    herovo.tough_base = career.tough_base;
                    herovo.willpower_base = career.willpower_base;
                }
            }
            herovo.generalSkill = item.skillId;

            dic.set(herovo.id, herovo);
        });
        gernalHeros = dic;
    }

    private function moduleHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.mission_configmodule.module.item.forEach(function (item:IConfigmodule_module_item) {
            dic.set(item.id, item);
        })

        moduleDic = dic;
        return;
    }


    /**
     * 怪物的数据信息处理
     * @param xml
     *
     */
    private function monsterHandle():void {
        var dic:Dictionary = new Dictionary();

        ConfigManager.instance.userInfo_monster.item.forEach(function (item:IMonster_item) {
            var monster:MonsterVO = new MonsterVO();

            monster.id = item.id;
            monster.name = item.name;
            monster.level = item.level;
            monster.title = "";
            monster.imgID = item.headImg;
            monster.roleID = item.model + "";
            monster.info = item.dialog;
            monster.functionId = item.functionId;
            monster.footHoldId = item.footHoldId;
            monster.type = item.type;
            dic.set(monster.id, monster);
        });
        monsters = dic;
    }

    private function npcHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.userInfo_npc.item.forEach(function (item:INpc_item) {
            var npcTemp:NpcBaseInfoVO = new NpcBaseInfoVO();

            npcTemp.id = item.id;
            npcTemp.name = item.name;
            npcTemp.level = item.level;
            npcTemp.title = item.title ? item.title : "";
            npcTemp.imgID = item.headImg;
            npcTemp.info = item.dialog;
            npcTemp.functionId = item.functionId;
            npcTemp.footHoldId = item.footHoldId;
            npcTemp.npcType = item.type;
            npcTemp.half = (item.half);
            dic.set(npcTemp.id, npcTemp);
        });

        talkNpcs = dic;
    }

    private function retreatExpHandle():void {

        var dic:Dictionary = new Dictionary();
        var str:String = ConfigManager.instance.mission_config.retreat.exp;
        str = str.replace(/\r\n/g, "");
        var src:Array = str.split("|");
        var tar:Array = [];
        var prop:Array;
        var len:uint = src.length;
        var vo:Object;
        for (var i:uint = 0; i < len; i++) {
            prop = String(src[i]).split(",");
            dic.set(prop[0], prop[1]);
        }
        retreatExpDic = dic;
        return;
    }

    /**
     * 经验信息处理函数
     *
     */
    private function expHandle():void {
        var dic:Array = new Array();
        ConfigManager.instance.userInfo_expnew.expnewCfg.forEach(function (item) {
            // var src:Array = (item.level as String).split(",")
            // item.level = src[0]
            // item.exp = src[1];
            dic.push(item);
        })
        exps = dic
        trace(exps.length + "exps.lengath")
    }


    /**----------------------------------------帮派---------------------------------*/
    /**帮派 经验*/
    private function clanUpgradeHandle():void {
//        var dic:Dictionary = new Dictionary();
//        var maxLevel:int = 0;
//        ConfigManager.instance.faction_clanUpgradeCfg.item.forEach(function (o:IClanUpgradeCfg_item) {
//            var upObj:Object = new Object();
//            upObj.level = o.level;
//            upObj.exp = o.exp;
//            dic.set(upObj.level, upObj.exp);
//            maxLevel++;
//        });
//        clanUpgradeDic = dic;
//        ClanSelfVO.datas = clanUpgradeDic;
//        ClanSelfVO.maxLevel = maxLevel;
    }

    /**帮派 技能*/
    private function clanSkillHandle():void {
//        var dic:Dictionary = new Dictionary();
//        ConfigManager.instance.faction_clanSkillCfg.skill.forEach(function (o:IClanSkillCfg_skill) {
//            var vo:ClanSkillVO = new ClanSkillVO();
//            vo.datas = new Dictionary();
//            vo.id = (o.id);
//            var level:int;
//            var main:String;
//            var limitID:String;
//            var limitLevel:String;
//            var donateNeed:int;
//            vo.maxLevel = 0;
//
//            var itm:IClanSkillCfg_skill_item;
//            for (var i:int = 0; i < o.item.length; i++) {
//                itm = o.item[i];
//                level = (itm.level);
//                limitID = (itm.limitID).toString();
//                limitLevel = (itm.limitLevel).toString();
//                donateNeed = (itm.donateNeed);
//                main = (itm.main).toString();
//                vo.datas.set(level, [limitID, limitLevel, donateNeed, main]);
//                vo.maxLevel++;
//            }
//            dic.set(vo.id, vo);
//        });
//        clanSkills = dic;
    }

    /**帮派 技能 描述*/
    private function clanSkillInfoHandle():void {
//        ConfigManager.instance.faction_clanSkillCfgInfo.skill.forEach(function (o:IClanSkillCfgInfo_skill) {
//            var id:int = (o.id);
//            var vo:ClanSkillVO = clanSkills.get(id) as ClanSkillVO;
//            vo.name = o.name;
//            vo.mainInfo = (o.mainInfo);
//        });
    }

    /**帮派 技能 属性*/
    private function clanSkillPropHandle():void {
        var dic:Dictionary = new Dictionary();
        ConfigManager.instance.faction_cskillprop.cskillpropCfg.forEach(function (o:ICskillpropCfg) {
            var propertyvo:GoodsPropsVO = new GoodsPropsVO();
            propertyvo.id = o.id.toString();
            propertyvo.skills = o.bring_skills;
//            propertyvo.power = o.strength;
            propertyvo.strength = o.strength;
            propertyvo.agility = o.agility;
            propertyvo.inelligence = o.intelligence;
            propertyvo.will = o.will;
            propertyvo.soul = o.god;
            propertyvo.aura_base = o.aura;
            propertyvo.aura_max = o.max_aura;
            propertyvo.ap = o.physical_attack.toString();
            propertyvo.ap_magic = o.magic_attack;
            propertyvo.def = o.physical_defense;
            propertyvo.def_magic = o.magic_defense;
            propertyvo.hp = o.life;
            propertyvo.tough = o.tenacity;
            propertyvo.act = o.speed;
            propertyvo.hit = o.hit.toString();
            propertyvo.dodge = o.dodge;
            propertyvo.crit = o.crit;
            propertyvo.crit_damage = o.critical_damage;
            propertyvo.pierce = o.firstly;
            propertyvo.repel = o.counter_attack;
            propertyvo.dodge_magic = o.magic_resistance.toString();
            dic.set(propertyvo.id, propertyvo);
        });
        cskillPropDic = dic;
    }

    /**帮派 科技*/
    private function clanScienceHandle():void {
//        var dic:Dictionary = new Dictionary();
//        ConfigManager.instance.faction_clanScienceCfg.science.forEach(function (o:IClanScienceCfg_science) {
//            var vo:ClanScienceVO = new ClanScienceVO();
//            vo.datas = new Dictionary();
//            vo.id = (o.id);
//            var level:int;
//            var main:String;
//            var limitID:String;
//            var limitLevel:String;
//            var donateNeed:int;
//            vo.maxLevel = 0;
//
//            var itm:IClanScienceCfg_science_item;
//            for (var i:int = 0; i < o.item.length; i++) {
//                itm = o.item[i];
//                level = (itm.level);
//                limitID = (itm.limitID).toString();
//                limitLevel = (itm.limitLevel).toString();
//                donateNeed = (itm.donateNeed);
//                main = (itm.main).toString();
//                vo.datas.set(level, [limitID, limitLevel, donateNeed, main]);
//                vo.maxLevel++;
//
//            }
//            dic.set(vo.id, vo);
//        });
//        clanSciences = dic;
    }

    /**帮派 科技 描述*/
    private function clanScienceInfoHandle():void {
//        ConfigManager.instance.faction_clanScienceCfgInfo.science.forEach(function (o:IClanScienceCfgInfo_science) {
//            var id:int = (o.id);
//            var vo:ClanScienceVO = clanSciences.get(id) as ClanScienceVO;
//            vo.name = o.name;
//            vo.mainInfo = (o.mainInfo);
//        });
    }

    /**帮派 商店*/
    private function clanShopHandle():void {
//        var dic:Dictionary = new Dictionary();
//        ConfigManager.instance.faction_clanshop.clanshopCfg.forEach(function (o:IClanshopCfg) {
//            var vo:ClanshopItemBaseVO = new ClanshopItemBaseVO();
//            vo.id = o.num;
//            vo.itemID = o.id;
//            vo.name = parseInt(o.name);
//            vo.costProOffer = o.price;
//            vo.color = o.color;
//            vo.level = o.level;
//            dic.set(vo.id, vo);
//        });
//        clanShopDic = dic;
    }


    /** cf skill*/
    private function cfSkillHandle():void {
//        var dic:Array = [];
//        ConfigManager.instance.faction_cfskillCfg.item.forEach(function (o:ICfskillCfg_item) {
//            var cfskill:CFSkillVo = new CFSkillVo();
//            cfskill.id = (o.id);
//            cfskill.name = (o.name);
//            cfskill.imgSrc = (o.imgSrc);
//            cfskill.tips = (o.tips);
//            cfskill.payValue = (o.payValue);
//            cfskill.payType = (o.payType);
//            dic.push(cfskill);
//        });
//        cfSkillDic = dic;
    }


    //---------------------------------------------------------------------------//

    function itemCfgHandle() {
        goodsList = new Dictionary();
        goodsPropList = new Dictionary();
        config.item_itemProp.itemPropCfg.forEach(function (propData:IItemPropCfg) {
            var propertyvo:GoodsPropsVO = new GoodsPropsVO();
            propertyvo.id = propData.id + "";
            propertyvo.skills = propData.bring_skills + "";
            propertyvo.power = propData.strength + "";
            propertyvo.strength = propData.endurance + "";
            propertyvo.agility = propData.agility + "";
            propertyvo.inelligence = propData.intelligence + "";
            propertyvo.will = propData.will + "";
            propertyvo.soul = propData.god + "";
            propertyvo.aura_base = propData.aura + "";
            propertyvo.aura_max = propData.max_aura + "";
            propertyvo.ap = propData.physical_attack + "";
            propertyvo.ap_magic = propData.magic_attack + "";
            propertyvo.def = propData.physical_defense + "";
            propertyvo.def_magic = propData.magic_defense + "";
            propertyvo.hp = propData.life + "";
            propertyvo.tough = propData.tenacity + "";
            propertyvo.act = propData.speed + "";
            propertyvo.hit = propData.hit + "";
            propertyvo.dodge = propData.dodge + "";
            propertyvo.crit = propData.crit + "";
            propertyvo.crit_damage = propData.critical_damage + "";
            propertyvo.pierce = propData.firstly + "";
            propertyvo.repel = propData.counter_attack + "";
            propertyvo.dodge_magic = propData.magic_resistance + "";
            propertyvo.PIERCE_DEMAEG = propData.harm_damage;
            propertyvo.PIERCE_REDUCE_DEMAEG = propData.injury_reduction + "";
            propertyvo.CRIT_REDUCE_DEMAGE = propData.blast_injury_reduction + "";
            propertyvo.AP_STAB = propData.attack_penetration + "";
            propertyvo.DEMAGE_TAKEIN = propData.damage_absorption + "";
            propertyvo.IGNOR_CRITE_REDUCE_CEMAGE = propData.ignore_explosion_relief + "";

            goodsPropList.set(propertyvo.id, propertyvo);
        });
        config.item_item.itemCfg.forEach(function (o:IItemCfg) {
            var goodsvo:GoodsVO = new GoodsVO();
            goodsvo.id = o.id;
            // item.@id;
            goodsvo.name = o.name;
            // item.@name;
            goodsvo.type = o.type;
            // item.@type;
            goodsvo.career = o.career;
            // item.@career;
            goodsvo.level = o.level
            // item.@level;
            goodsvo.vlevel = o.vlevel
            // item.@vlevel;
            goodsvo.price = o.price
            // item.@price;
            goodsvo.color = o.color
            // item.@color;
            goodsvo.stackLimit = o.pile
            // item.@pile;
            goodsvo.binding = o.binding
            // item.@binding;
            goodsvo.energy = o.energy
            // item.@energy;
            goodsvo.trumpExp = o.trumpExp
            // item.@trumpExp;
            goodsvo.questData = o.questData
            // goodData[13] enchant
            goodsvo.propId = o.propId

            goodsvo.saleup = o.saleup
            // item.@propId;
            goodsvo.useable = o.useable
            // item.@useable;
            goodsvo.description = o.tips
            // item.@tips;
            goodsvo.imgID = o.imageId;

            goodsList.set(goodsvo.id, goodsvo);
        });
    }

    private function factorCfgHandle():void {
        formula = new FormulaConfig()

        var factor:IFactor_config = ConfigManager.instance.userInfo_factor.config
        formula.strength_attack = factor.strength_attack as Number;
        formula.strength_crit = factor.strength_crit as Number;
        formula.endurance_hp = factor.endurance_hp as Number;
        formula.quick_def = factor.quick_def as Number;
        formula.quick_dodge = factor.quick_dodge as Number;
        formula.willpower_def = factor.willpower_def as Number;
        formula.willpower_dodge = factor.willpower_dodge as Number;
        formula.intelligence_attack = factor.intelligence_attack as Number;
        formula.intelligence_broke = factor.intelligence_broke as Number;

        formula.hit_code = factor.hit_code;
        formula.dodge_code = factor.dodge_code;
        formula.crit_code = factor.crit_code;
        formula.break_code = factor.break_code;
        formula.touch_code = factor.touch_code;
        formula.magic_dodge_code = factor.magic_dodge_code;
        formula.repel_code = factor.repel_code;
        formula.def_code = factor.def_code;
        formula.magic_def_code = factor.magic_def_code;

    }
    private function filterWordsCfgHandle():void {
        filterWords = ConfigManager.instance.message_filterwords.content;
    }

    /**红点配置*/
    private function redPointCfgHandle():void
    {
        redPointDic = new Dictionary();
        config.mission_redPoint.redPointCfg.forEach(function (o:IRedPointCfg) {
            var red:RedPointStruct = new RedPointStruct();
            red.id = o.id;
            red.func = o.func;
            red.btnName = o.btnname;
            redPointDic.set(red.id,red);
        });

    }

    /** 锁妖塔奖励  ednLess*/
    private function endLessHandle():void {
        var dic:Array = [];
        ConfigManager.instance.mission_endLessTrumpCfg.endLessTrumpCfgCfg.forEach(function (o:IEndLessTrumpCfgCfg) {
            var arr:Array = [o.index,o.tlv,o.slv,o.goodid];
            dic.push(arr);
        });
        disasterTrumpCfg = dic;
    }

    /**预测奖励*/
    private function clanFightBetHandle():void
    {
        clanFightBetDic = new Dictionary();
        config.faction_clanFightBetGift.item.forEach(function (o:IClanFightBetGift_item) {
            var type:int = o.type;
            var gift:String = o.gift;
            clanFightBetDic.set(type,gift);
        });
    }


    public function getGoodsById(eqId:uint) {
        var goods = ArrayUtil.find(config.item_item.itemCfg, function (item:IItemCfg) {
            return item.id == eqId;
        })
        return goods;
    }

    public function getGoodsTypeById(eqId:uint) {
        var goods = getGoodsById(eqId);
        if (goods != null) return goods.type;
        return 0;
    }

    public function isZhenyuan(itemid:uint):Boolean {
        var vo = getGoodsById(itemid);
        if (vo == null)
            return false;
        return vo.type >= 36 && vo.type <= 39;
    }

}
}

