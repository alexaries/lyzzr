package globals {

import config.ConfigManager;

import laya.utils.Dictionary;

public class ConfigLocator {
    public var baojuAttrCfg:Array;
    public var goodsList:Dictionary;
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
    public var careerCfgs:Array;
    public var gernalHeros:Dictionary;
    public var skillDatas:Dictionary;
    public var skilldiffDic:Dictionary;
    public var cittadiffDic:Array;
    public var cittaDatas:Dictionary;
    public var cittaPropDic:Dictionary;

    public var trumpExpDic:Dictionary;
    public var titleNameDic:Dictionary;
    public var rideDic:Dictionary;
    public var hpMaxDic:Dictionary;

    public var trumpMelt:Dictionary;

    public var clanShopDic:Dictionary;

    public var DISASTER_EVENT:Dictionary;

    public var redPointDic:Dictionary;

    public static function getInstance():ConfigLocator {
        if (__instance == null) {
            __instance = new ConfigLocator();
        }
        return __instance;
    }

    public function  get config():ConfigManager {
        return ConfigManager.instance;

    }

    public function ConfigLocator() {
    }

    public function getOpenfuncByPosition(pos:int):Array {
        var tmp:Array = [];
        return tmp;
    }

    public function init() {
    }

    public function getGoodsById(eqId:uint) {
        var goods;
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

