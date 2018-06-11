/**
 * Created by dangww on 2017/8/21.
 */
package com.game.module.pack.vo {
import com.game.vo.GoodsPropsVO;
import com.game.vo.GoodsVO;
import com.game.vo.PropertyDefine;

import config.ConfigManager;
import config.item.item.IItemCfg;
import config.item.itemProp.IItemPropCfg;

import globals.ConfigLocator;

import lang.LangArrayTxt;
import lang.LangTxt;

import laya.utils.Dictionary;

import net.consts.StaticConfig;
import net.data.structs.pack.ItemStruct;
import net.utils.ColorUtil;

import utils.ArrayUtil;

public class PackVO {
    public static var defaultBitmapSrc:String = StaticConfig.httpServer + "goods/default.jpg";
    /**
     * 0~19  装备
     * 1武器，2头 3胸，4肩，5腰，6腿，7项链，8戒指，10法宝，11坐骑， 12光环法宝
     * 16 先天法宝
     * 13~15 宝具
     * 20~30 普通 （29法宝碎片）（27宝具熔炼法宝）
     * 30~40 阵法 39
     * 40~50 心法
     * 50~60 强化
     * 60~80 宝石(60力量 61敏捷 62智力 63耐力 64意志 65生命 66攻击 67防御 68命中 69反击 70闪避 71暴击 72破击 73身法 74坚韧 75法抗 )
     * 80~90 任务
     * 110~125古籍
     * 127魂器
     * 128魁杓星石
     * 171仙兵
     * 172仙衣
     * 173仙器
     */
    public var type:int = 0;
    /**需求等级*/
    public var level:int = 0;
    /**品质颜色id ,1为白色，2为绿色，3为蓝色，4为紫色，5为橙色，6为暗金，7为灰色*/
    private var _color:int = 0;
    /**堆叠上限值*/
    public var stackLimit:int = 0;
    /**售价*/
    public var price:int = 0;
    public var energy:int = 0;
    /**是否绑定 0:不绑定,1:装备绑定,2:获取绑定*/
    public var binding:int = 0;
    /**是否可使用*/
    public var useable:int = 0;
    /**属性编号*/
    public var propId:int = 0;
    /**物品tooltips描述信息*/
    public var description:String = "";
    /**物品图片ID*/
    public var imgID:String;
    public var eqProTip:String = "";
    public var commonTip:String = ""

    /**强化附加属性 来自配置文件*/
    public static const POTENTIALIZATION:Array = [[5, 10, 16, 23, 31, 40, 51, 64, 80, 100, 125, 151, 179, 210, 243],
        [5, 10, 16, 23, 31, 40, 51, 64, 80, 100, 125, 151, 179, 210, 243],
        [1, 1.2, 1.6, 2.2, 3, 4, 5.2, 6.6, 8.2, 10, 12, 14.2, 16.6, 19.2, 22],
        [5, 10, 16, 23, 31, 40, 51, 64, 80, 100, 125, 151, 179, 210, 243],
        [5, 10, 16, 23, 31, 40, 51, 64, 80, 100, 125, 151, 179, 210, 243]];
    // XMLLocator.getInstance().eqEconomics["strongValue"] as Array;
    /**装备流水号*/
    public var flowId:Number = 0;
    private var _enhanceLevel:int = 0;
    /**装备孔数n*/
    public var boreNums:int = 0;
    private var _jewelsId:Array = [];
    /**附加属性个数n*/
    public var exNums:int = 0;
    /**装备类型,0：攻击，1：防御*/
    public var eqType:int = 0;
    /**装备攻防属性值eqType==0物理攻击属性值，eqType==1物理防御属性值*/
    public var eqPropValue:int = 0;
    /**装备攻防属性值eqType==0法术攻击属性值，eqType==1法术防御属性值*/
    public var eqMagicPropValue:int = 0;
    /**一级属性值,力:topPropValue[0]，智:topPropValue[1]，体:topPropValue[2]，敏:topPropValue[3]*/
    public var topProps:Array = [];
    private var _addedProps:Array = [];
    /**所属名将名字 */
    public var heroName:String = "";
    public var heroColorName:String = ""
    /**没有装备在名将身上的heroId*/
    public static const NO_HERO_PACK_HERO_ID:int = 9999;
    /**所有装备(背包及名将身上) 仅在炼器面板  做筛选标志用*/
    public static const ALL_EQUIP_HEROID:int = 6666;
    private var _heroId:int = NO_HERO_PACK_HERO_ID;
    /**不绑定个数*/
    public var normalNums:int = 0;
    /**绑定个数*/
    public var bindingNums:int = 0;
    private var _pileNums:int = 0;
    public var career:int = 0;
    /**当前法宝阶数*/
    public var currentLevel:int = 0;
    /**当前法宝最大阶数*/
    public var maxLevel:int = 0;
    public var currentExp:int = 0;
    public var levelExp:int = 0;
    public var trumpExp:int = 0;
    public var vlevel:int = 0;
    private var _saleup:Number = 0;//交易金额上限
    public var configSaleup:Number = 0;
    private var _soulLevel:Array = [0, 0, 0, 0];
    public var soulFormula:Array = [0, 0, 0];
    private var is_refresh:Boolean;
    public var skillid:int = 0;
    /**
     * 灵宝相关属性
     */
    public var isTongLing:int = 0;
    public var lbColor:int = 0;
    private var _lingbaoAttr:Array = [];
    public var skill1:int;
    public var factor1:Number;
    public var skill2:int;
    public var factor2:Number;

    ////////////魂器属性//////////
    public var critDef:int;   // 暴击抗性
    public var pierceDef:int;   //破击抗性
    public var repelDef:int;   //反击抗性
    public var ap:int;  //攻击穿透

    private var _lbMainPropId:uint = 0;
    private var _lbPropArr:Array = [];
    public var isHunqi:Boolean;
    public var isTrump:Boolean;
    public var power:Number;
    public var openNum:int;


    public function get id():int {
        return _id;
    }

    public function set id(id:int):void {
        _id = id;
    }


    public var diaowenNum:int;
    public var diaowenIds:Array = [];
    public var baojuChange:Boolean;
    public var jewelsPropChange:Boolean;
    public var addedPropChange:Boolean;
    public var enhanceChange:Boolean;
    public var soulLevelChange:Boolean;
//    public var _zhenyuanVO:ZhenyuanVO;
    public var _id:Number;
    public var name:String;
    public var color:int;
    public var saleup:int;
    public var isZhenyuan:Boolean;

    public function get lingbaoAttr():Array {
        return _lingbaoAttr;
    }

    public function set lingbaoAttr(value:Array):void {
        if (ArrayUtil.arraysAreEqual(_lingbaoAttr, value))
            return;
        _lingbaoAttr = value;
        baojuChange = true;
    }

    /**嵌入宝石的id*/
    public function get jewelsId():Array {
        return _jewelsId;
    }

    /**
     * @private
     */
    public function set jewelsId(value:Array):void {
        if (ArrayUtil.arraysAreEqual(_jewelsId, value))
            return;
        _jewelsId = value;
        jewelsPropChange = true;
    }

    /**名将ID*/
    public function get heroId():int {
        return _heroId;
    }

    /**
     * @private
     */
    public function set heroId(value:int):void {
        if (_heroId == value)
            return;
        _heroId = value;
        jewelsPropChange = true;
    }

    /**1:生命,2:身法,3:命中,4:闪躲,5:暴击,6:破击,7:反击,8:坚韧,9:法术抵抗,addedProps[i][type,value]*/
    public function get addedProps():Array {
        return _addedProps;
    }

    /**
     * @private
     */
    public function set addedProps(value:Array):void {
        if (ArrayUtil.arraysAreEqual(_addedProps, value))
            return;
//			var temp:Array = [] ;
//			for (var i:int = 0; i < value.length; i++)
//			{
//				var minValue:Number = EqUpgradeUtils.getAttriMin(vlevel, color, career, value[i][0], this);
//				var maxValue:Number = EqUpgradeUtils.getAttriMax(vlevel, color, career, value[i][0], this);
//				if(value[i][0]>2){
//					minValue *=10 ;
//					maxValue *=10 ;
//				}
//				var tempValue:Number = value[i][1];
//				tempValue = Math.min(tempValue,maxValue);
//				tempValue = Math.max(tempValue,minValue);
//				temp.push([value[i][0],tempValue]);
//			}
//			_addedProps = temp;
        _addedProps = value;
        addedPropChange = true;
    }

    public function get soulLevel():Array {
        return _soulLevel;
    }

    public function set soulLevel(value:Array):void {
        if (ArrayUtil.arraysAreEqual(_soulLevel, value))
            return;
        _soulLevel = value;
        soulLevelChange = true;
    }

    /**装备强化等级 */
    public function get enhanceLevel():uint {
        return _enhanceLevel;
    }

    /**
     * @private
     */
    public function set enhanceLevel(value:uint):void {
        if (_enhanceLevel == value)
            return;
        _enhanceLevel = value;
        enhanceChange = true;
    }


    public function PackVO(itemStruct:ItemStruct = null) {
        if (itemStruct) {
            var tmpId:int = 0;
            if (itemStruct.type == ItemStruct.EQ || itemStruct.type == ItemStruct.BAOJU || itemStruct.type == ItemStruct.TALISMAN || itemStruct.type == ItemStruct.HUNQI) {
                if (itemStruct.eqInfo && itemStruct.eqInfo.eqId != 0) {
                    maxLevel = itemStruct.eqInfo.maxLevel;
                    currentExp = itemStruct.eqInfo.currentExp;
                    tmpId = itemStruct.eqInfo.eqId;
                } else
                    tmpId = itemStruct.itemId;
            }
            else if (itemStruct.zhenyuanVO) {
                //建立互相引用的关系
//                _zhenyuanVO = ZhenyuanVO.parse(itemStruct.zhenyuanVO);
                _id = itemStruct.zhenyuanVO.itemID;
                tmpId = itemStruct.zhenyuanVO.itemID;
            }
            else
                tmpId = itemStruct.itemId;

            trace(tmpId + "tmpId")
            var tempStaticVO:IItemCfg = ArrayUtil.find(ConfigManager.instance.item_item.itemCfg, function (i:IItemCfg) {
                //if(i.id == 18)return true;
                return i.id == tmpId
            });
            if (!tempStaticVO) {
                trace("这个物品我没有: ", itemStruct.eqInfo.eqId, itemStruct.itemId);
            }
            var tempPropsVO:IItemPropCfg = ArrayUtil.find(ConfigManager.instance.item_itemProp.itemPropCfg, function (i:IItemPropCfg) {
                return i.id == tempStaticVO.propId
            });
            if (tempStaticVO && !tempPropsVO) {
                trace("这个属性我没有: ", tempStaticVO.propId);
            }
            name = tempStaticVO.name;
            type = tempStaticVO.type;
            level = tempStaticVO.level;
            color = tempStaticVO.color;
            stackLimit = tempStaticVO.pile;
            price = tempStaticVO.price;
            energy = tempStaticVO.energy;
            binding = itemStruct.binding;
            useable = tempStaticVO.useable;
            propId = tempStaticVO.propId;
            description = tempStaticVO.tips;
            imgID = tempStaticVO.imageId;
            career = tempStaticVO.career;
            trumpExp = tempStaticVO.trumpExp;
            vlevel = tempStaticVO.vlevel;
            saleup = tempStaticVO.saleup;
            configSaleup = tempStaticVO.saleup;
            if (itemStruct.type == ItemStruct.EQ && color == 5) {
                soulLevel = itemStruct.eqInfo.soulLevel;
                soulFormula = itemStruct.eqInfo.soulFormula;
            }

            var dic1:Dictionary = ConfigLocator.getInstance().trumpExpDic;
            var temp:int = currentExp;
            for (var j:int = 1; j < 13; j++) {
                temp -= dic1.get(j)[color - 2];
                if (temp < 0) {
                    temp += dic1.get(j)[color - 2];
                    break;
                }
            }

            levelExp = temp;
            currentLevel = j - 1;
            if (itemStruct.itemId <= 9116 && itemStruct.itemId >= 9101 || itemStruct.itemId <= 668 && itemStruct.itemId >= 664) {
                id = itemStruct.itemId;
            }
            if (type >= 13 && type <= 15) {//灵宝属性
                isTongLing = itemStruct.eqInfo.isTongLing;
                lbColor = itemStruct.eqInfo.lbColor;
                if (lbColor != 0)
                    color = lbColor;
                lingbaoAttr = itemStruct.eqInfo.lingbaoAttr;
                skill1 = itemStruct.eqInfo.skill1;
                factor1 = itemStruct.eqInfo.factor1;
                skill2 = itemStruct.eqInfo.skill2;
                factor2 = itemStruct.eqInfo.factor2;
            }
            if (binding == 0)//非绑
                normalNums = itemStruct.itemNums;
            else
                bindingNums = itemStruct.itemNums;
            switch (itemStruct.type) {
                case ItemStruct.COMM:
                case ItemStruct.JEWELS:
                case ItemStruct.TASK:
                case ItemStruct.HEART:
                case ItemStruct.SOUL:
                case ItemStruct.SOUL_2:
                case ItemStruct.BAOJU:
                case ItemStruct.LINGZHU:
                    id = itemStruct.itemId;
                    break;
                case ItemStruct.RANK:
                    break;
                case ItemStruct.TALISMAN:
                case ItemStruct.EQ:
                case ItemStruct.HUNQI:
                    if (tempPropsVO) {
                        eqType = tempPropsVO.physical_attack != 0 ? 0 : 1;
                        eqPropValue = tempPropsVO.physical_attack != 0 ? tempPropsVO.physical_attack : tempPropsVO.physical_defense;
                        eqMagicPropValue = tempPropsVO.magic_attack != 0 ? tempPropsVO.magic_attack : tempPropsVO.magic_defense;
                        topProps = [tempPropsVO.strength, tempPropsVO.agility, tempPropsVO.intelligence, tempPropsVO.will, tempPropsVO.endurance];
                        skillid = (tempPropsVO.bring_skills as int);
                    }
                    if (!itemStruct.eqInfo || (itemStruct.eqInfo && itemStruct.eqInfo.eqId == 0)) {
                        id = itemStruct.itemId;
                        return;
                    }
                    id = itemStruct.eqInfo.eqId;
                    flowId = itemStruct.itemId;
                    enhanceLevel = itemStruct.eqInfo.enhanceLevel;
                    boreNums = itemStruct.eqInfo.boreNums;
                    jewelsId = itemStruct.eqInfo.jewelIds;
                    exNums = itemStruct.eqInfo.exNums;
                    addedProps = itemStruct.eqInfo.exProps;

                    critDef = itemStruct.eqInfo.critDef;   // 暴击抗性
                    pierceDef = itemStruct.eqInfo.pierceDef;   //破击抗性
                    repelDef = itemStruct.eqInfo.repelDef;   //反击抗性
                    ap = itemStruct.eqInfo.ap;  //攻击穿透

                    diaowenNum = itemStruct.eqInfo.diaowenNum;
                    diaowenIds = itemStruct.eqInfo.diaowenIds;
                    break;
            }
        }
    }

    public function refreshEnhanceProperty():Array {
        if (!enhanceChange)
            return enhancePropertyArray;
        enhancePropertyArray = PropertyDefine.CreateZeroProperty();
        var tempPropsVO:GoodsPropsVO = ConfigLocator.getInstance().goodsPropList.get(propId)
        if (!tempPropsVO)
            return enhancePropertyArray;
        var hpMaxDic:Dictionary = ConfigLocator.getInstance().hpMaxDic
        //判断强化等级是否更改   有更改可以重新计算
        if (enhanceLevel > 0) {
            switch (type) {
                case 1:
                    enhancePropertyArray[PropertyDefine.AP_VALUE] = (tempPropsVO.apValue * PackVO.POTENTIALIZATION[0][enhanceLevel - 1] / 100) as int;
                    enhancePropertyArray[PropertyDefine.AP_MAGIC_VALUE] = (tempPropsVO.ap_magicValue * PackVO.POTENTIALIZATION[0][enhanceLevel - 1] / 100) as int;
                    break;
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                    enhancePropertyArray[PropertyDefine.DEF_VALUE] = (tempPropsVO.defValue * PackVO.POTENTIALIZATION[1][enhanceLevel - 1] / 100);
                    enhancePropertyArray[PropertyDefine.DEF_MAGIC_VALUE] = (tempPropsVO.def_magicValue * PackVO.POTENTIALIZATION[1][enhanceLevel - 1] / 100);
                    break;
                case 7:
                case 8:
                    if (hpMaxDic && hpMaxDic.get(vlevel))
                        enhancePropertyArray[PropertyDefine.HP_VALUE] = Math.floor(hpMaxDic.get(vlevel)[career] * PackVO.POTENTIALIZATION[2][enhanceLevel - 1]);
                    else
                        enhancePropertyArray[PropertyDefine.HP_VALUE] = Math.floor(hpMaxDic.get(10)[career] * PackVO.POTENTIALIZATION[2][enhanceLevel - 1]);
                    break;
                case 171:
                    enhancePropertyArray[PropertyDefine.XIAN_AP] = (tempPropsVO.ap_magicValue * PackVO.POTENTIALIZATION[0][enhanceLevel - 1] / 100);
                    enhancePropertyArray[PropertyDefine.AP_VALUE] = enhancePropertyArray[PropertyDefine.XIAN_AP] * PropertyDefine.xianTocommonFactor;
                    enhancePropertyArray[PropertyDefine.AP_MAGIC_VALUE] = enhancePropertyArray[PropertyDefine.XIAN_AP] * PropertyDefine.xianTocommonFactor;
                    break
                case 172:
                    enhancePropertyArray[PropertyDefine.XIAN_DEF] = (tempPropsVO.def_magicValue * PackVO.POTENTIALIZATION[1][enhanceLevel - 1] / 100);
                    enhancePropertyArray[PropertyDefine.DEF_VALUE] = enhancePropertyArray[PropertyDefine.XIAN_DEF] * PropertyDefine.xianTocommonFactor;
                    enhancePropertyArray[PropertyDefine.DEF_MAGIC_VALUE] = enhancePropertyArray[PropertyDefine.XIAN_DEF] * PropertyDefine.xianTocommonFactor;
                    break;
            }
        }
        enhanceChange = false;
        return enhancePropertyArray;
    }

    public function refreshAddProperty():Array {
        // 服务器附加属性 计算
        if (!addedPropChange)
            return addPropertyArray;
        addPropertyArray = PropertyDefine.CreateZeroProperty();
        for (var i:uint = 0; i < addedProps.length; i++) {
            switch (addedProps[i][0]) {
                case 1:
                    addPropertyArray[PropertyDefine.HP_VALUE] += Number(addedProps[i][1]);
                    break;
                case 2:
                    addPropertyArray[PropertyDefine.ACT_VALUE] += Number(addedProps[i][1]);
                    break;
                case 3:
                    addPropertyArray[PropertyDefine.HIT_VALUE] += Number(addedProps[i][1] / 10);
                    break;
                case 4:
                    addPropertyArray[PropertyDefine.DODGE_VALUE] += Number(addedProps[i][1] / 10);
                    break;
                case 5:
                    addPropertyArray[PropertyDefine.CRIT_VALUE] += Number(addedProps[i][1] / 10);
                    break;
                case 6:
                    addPropertyArray[PropertyDefine.PIERCE_VALUE] += Number(addedProps[i][1] / 10);
                    break;
                case 7:
                    addPropertyArray[PropertyDefine.REPEL_VALUE] += Number(addedProps[i][1] / 10);
                    break;
                case 8:
                    addPropertyArray[PropertyDefine.TOUGH_VALUE] += Number(addedProps[i][1] / 10);
                    break;
                case 9:
                    addPropertyArray[PropertyDefine.DODGE_MAGIC_VALUE] += Number(addedProps[i][1] / 10);
                    break;
            }
        }
        addedPropChange = false;
        return addPropertyArray;
    }

    /**
     * 值受 jewelsId 和 stars影响
     * */
    public function refreshJewelProperty():Array {
        // 宝石属性统计
        jewelPropertyArray = PropertyDefine.CreateZeroProperty();

        var a:Number = 0;
        var b:Number = 0;
        var c:Number = 0;
        if (!heroId == 9999) {
            trace(11111);
        }

        var num:int = jewelsId.length;
        for (var j:int = 0; j < num; j++) {
            var jewelPropID:uint;
            var jewelvo:GoodsVO = ConfigLocator.getInstance().goodsList.get(jewelsId[j])//XMLLocator.getInstance().goodsList[];
            if (jewelvo)
                jewelPropID = jewelvo.propId;
            else
                continue;
            var jewelGoodsProps:GoodsPropsVO = ConfigLocator.getInstance().goodsPropList.get(jewelPropID)//UserUtil.getGoodsPropByID(jewelPropID);
            var singlejewelPropertyArray:Array = [];
            if (jewelGoodsProps) {
                singlejewelPropertyArray = PropertyDefine.goodsPropsToArray(jewelGoodsProps);

                singlejewelPropertyArray[PropertyDefine.AP_VALUE] *= (1 + b);
                singlejewelPropertyArray[PropertyDefine.AP_MAGIC_VALUE] *= (1 + b);
                singlejewelPropertyArray[PropertyDefine.DEF_VALUE] *= (1 + b);
                singlejewelPropertyArray[PropertyDefine.DEF_MAGIC_VALUE] *= (1 + b);

                singlejewelPropertyArray[PropertyDefine.POWER_VALUE] *= (1 + a);
                singlejewelPropertyArray[PropertyDefine.INELLIGENCE_VALUE] *= (1 + a);
                singlejewelPropertyArray[PropertyDefine.STRENGTH_VALUE] *= (1 + a);
                singlejewelPropertyArray[PropertyDefine.AGILITY_VALUE] *= (1 + a);
                singlejewelPropertyArray[PropertyDefine.WILL_VALUE] *= (1 + a);
                singlejewelPropertyArray[PropertyDefine.HP_VALUE] *= (1 + a);

                singlejewelPropertyArray[PropertyDefine.ACT_VALUE] *= (1 + c);

                //如果仙界宝石 攻击加仙攻 30%转物法攻  防御一样
                if (jewelvo && jewelvo.id >= 20001 && jewelvo.id <= 20635) {
                    singlejewelPropertyArray[PropertyDefine.XIAN_AP] = singlejewelPropertyArray[PropertyDefine.AP_MAGIC_VALUE];
                    singlejewelPropertyArray[PropertyDefine.XIAN_DEF] = singlejewelPropertyArray[PropertyDefine.DEF_MAGIC_VALUE];

                    singlejewelPropertyArray[PropertyDefine.AP_MAGIC_VALUE] = singlejewelPropertyArray[PropertyDefine.XIAN_AP] * PropertyDefine.xianTocommonFactor;
                    singlejewelPropertyArray[PropertyDefine.DEF_MAGIC_VALUE] = singlejewelPropertyArray[PropertyDefine.XIAN_DEF] * PropertyDefine.xianTocommonFactor;
                    singlejewelPropertyArray[PropertyDefine.AP_VALUE] = singlejewelPropertyArray[PropertyDefine.XIAN_AP] * PropertyDefine.xianTocommonFactor;
                    singlejewelPropertyArray[PropertyDefine.DEF_VALUE] = singlejewelPropertyArray[PropertyDefine.XIAN_DEF] * PropertyDefine.xianTocommonFactor;
                }
            }
            jewelPropertyArray = PropertyDefine.addProperty(jewelPropertyArray, singlejewelPropertyArray);
        }
        jewelsPropChange = false;
        return jewelPropertyArray;
    }

    /**
     * 不能出售返回信息
     * 能出售返回价格
     */
    public function getOutString():String {
        if (price == 0) {
            return LangTxt.WARN_UNSALE_ABLE;
        } else {
            return LangTxt.PRICE_SALE + "：" + price.toString();
        }
    }

    public function get imgURL():String {
        var idStr:String = imgID;
        if (type >= 13 && type <= 15) {//宝具
            idStr += lbColor.toString();
        }

        if (isZhenyuan) {
            if (color == 1) {
                idStr = "p9566";
            }
            else {
                const arr:Array = ["a", "b", "c", "d"];
                idStr += arr[color - 2];
            }
        } else if (type >= 240 && type <= 244) {
            return StaticConfig.httpServer + "avatars/npc/" + imgID + ".jpg";
        }

        var suffix:String = ".jpg";

        if (idStr is String) {
            if (idStr.indexOf("q") != -1)
                suffix = ".png";
        }
        else {
            var exStr:String = "";
            var len:int = (idStr + "").length;
            exStr = len == 1 ? ("000" + idStr) : (len == 2 ? ("00" + idStr) : (len == 3 ? ("0" + idStr) : (idStr + "")));
            return StaticConfig.httpServer + "goods/" + exStr + ".jpg";
        }

        return StaticConfig.httpServer + "goods/" + idStr + suffix;
    }

    // 得到镶嵌的宝石数量
    public function getPatchedNum():int {
        var nums:uint = 0;
        for (var i:uint = 0; i < jewelsId.length; i++) {
            if (jewelsId[i] != 0)
                nums++;
        }
        return nums;
    }

    //得到镶嵌的雕纹数量
    public function getDiaowenIdlesNum():int {
        var nums:uint = 0;
        for (var i:uint = 0; i < diaowenIds.length; i++) {
            if (diaowenIds[i] != 0)
                nums++;
        }
        return nums;
    }

    public function get getEquipmentPos():String {
        var pos:String = "";
        switch (this.type) {
            case 1:
                pos = LangArrayTxt.EQUIPPOS_NAMES[0];
                break;
            case 2:
                pos = LangArrayTxt.EQUIPPOS_NAMES[1];
                break;
            case 3:
                pos = LangArrayTxt.EQUIPPOS_NAMES[2];
                break;
            case 4:
                pos = LangArrayTxt.EQUIPPOS_NAMES[3];
                break;
            case 5:
                pos = LangArrayTxt.EQUIPPOS_NAMES[4];
                break;
            case 6:
                pos = LangArrayTxt.EQUIPPOS_NAMES[5];
                break;
            case 7:
                pos = LangArrayTxt.EQUIPPOS_NAMES[6];
                break;
            case 8:
                pos = LangArrayTxt.EQUIPPOS_NAMES[7];
                break;
            case 10:
                pos = LangArrayTxt.EQUIPPOS_NAMES[8];
                break;
            case 11:
                pos = LangArrayTxt.EQUIPPOS_NAMES[9];
                break;
            case 12:
                pos = LangArrayTxt.EQUIPPOS_NAMES[11];
                break;
            case 13:
                pos = LangArrayTxt.BAOJU_TYPE_ARR[0];
                break;
            case 14:
                pos = LangArrayTxt.BAOJU_TYPE_ARR[1];
                break;
            case 15:
                pos = LangArrayTxt.BAOJU_TYPE_ARR[2];
                break;
            case 16:
                pos = LangArrayTxt.EQUIPPOS_NAMES[12];
                break;
            case 171:
                pos = "仙兵";
                break;
            case 172:
                pos = "仙衣";
                break;
            case 173:
                pos = "仙器";
                break;
            default:
                pos = LangArrayTxt.EQUIPPOS_NAMES[7];
                break;
        }
        return pos;
    }

    public var _toolTip:String;


    public function set pileNums(pileNums:int):void {
        _pileNums = pileNums;
    }

    public function get pileNums():int {
        return _pileNums;
    }

    /**
     * 返回Array结构<br>
     *  +value   |物理攻击|法术攻击|物理防御|法术防御|力|智|体|敏|意|体力|身法|灵力|
     *  命中|命中值|闪躲|闪躲值|法术抗性|法术抗性值|暴击|暴击值|暴击抗性|暴击抗性值|破击|破击值|反击|反击值|
     *  入场灵气|灵气上限|暴击伤害%|<br>
     * */
    private var propertyArray:Array = PropertyDefine.CreateZeroProperty();
    /**
     *
     */
    public var basepropArray:Array = PropertyDefine.CreateZeroProperty();
    /**
     * 宝石属性
     */
    public var jewelPropertyArray:Array = PropertyDefine.CreateZeroProperty();

    /**
     * 强化属性
     */
    public var enhancePropertyArray:Array = PropertyDefine.CreateZeroProperty();

    /**
     * 附加属性
     */
    public var addPropertyArray:Array = PropertyDefine.CreateZeroProperty();

    /**
     * 注灵属性
     */
    public var eqSoulPropertyArray:Array = PropertyDefine.CreateZeroProperty();

    /**
     * 宝具属性
     */
    public var baojuPropertyArray:Array = PropertyDefine.CreateZeroProperty();


    /**
     * 雕纹属性
     */
    public var diaowenPropertyArray:Array = PropertyDefine.CreateZeroProperty();

    /**
     * 返回Array结构<br>
     *  +value   |物理攻击|法术攻击|物理防御|法术防御|力|智|体|敏|意|体力|身法|灵力|
     *  命中|命中值|闪躲|闪躲值|法术抗性|法术抗性值|暴击|暴击值|暴击抗性|暴击抗性值|破击|破击值|反击|反击值|
     *  入场灵气|灵气上限|暴击伤害%|<br>
     * */
    public function getPropertyArray():Array {
        return propertyArray;
    }

    public function clone():PackVO {
        var cloneVO:PackVO = new PackVO();
        cloneVO._id = _id;
        cloneVO._toolTip = _toolTip;
        cloneVO.binding = binding;
        cloneVO.bindingNums = bindingNums;
        cloneVO.boreNums = boreNums;
        cloneVO.color = color;
        cloneVO.description = description;
        cloneVO.energy = energy;
        cloneVO.flowId = flowId;
        cloneVO.heroId = heroId;
        cloneVO.heroName = heroName;
        cloneVO.imgID = imgID;
        cloneVO.jewelsId = jewelsId;
        cloneVO.level = level;
        cloneVO.name = name;
        cloneVO.pileNums = pileNums;
        cloneVO.price = price;
        cloneVO.propertyArray = propertyArray;
        cloneVO.propId = propId;
        cloneVO.stackLimit = stackLimit;
        cloneVO.topProps = topProps;
        cloneVO.useable = useable;
        cloneVO.normalNums = normalNums;
        cloneVO.type = type;
        cloneVO.career = career;
        cloneVO.enhanceLevel = enhanceLevel;
        cloneVO.eqType = eqType;
        cloneVO.skillid = skillid;
        cloneVO.maxLevel = maxLevel;
        cloneVO.currentExp = currentExp;
        cloneVO.currentLevel = currentLevel;
        cloneVO.levelExp = levelExp;
        cloneVO.trumpExp = trumpExp;
        cloneVO.vlevel = vlevel;
        cloneVO.soulFormula = soulFormula;
        cloneVO.soulLevel = soulLevel;
        cloneVO.isTongLing = isTongLing;
        cloneVO.lbColor = lbColor;
        cloneVO.saleup = saleup;
        cloneVO.configSaleup = configSaleup;
        if (lbColor != 0)
            color = lbColor;
        cloneVO.lingbaoAttr = lingbaoAttr;
        cloneVO.skill1 = skill1;
        cloneVO.factor1 = factor1;
        cloneVO.skill2 = skill2;
        cloneVO.factor2 = factor2;
        cloneVO.exNums = exNums;
        cloneVO.addedProps = []
        for (var i:int = 0; i < addedProps.length; i++) {
            cloneVO.addedProps[i] = addedProps[i]
        }
        cloneVO.critDef = critDef;   // 暴击抗性
        cloneVO.pierceDef = pierceDef;   //破击抗性
        cloneVO.repelDef = repelDef;   //反击抗性
        cloneVO.ap = ap;  //攻击穿透

        cloneVO.diaowenNum = diaowenNum
        cloneVO.diaowenIds = diaowenIds;
        return cloneVO;
    }

    public function get totalNum():int {
        return this.bindingNums + this.normalNums;
    }


    public function get actTrumpExp():String {
        return trumpExp *  (ConfigLocator.getInstance().trumpMelt.get(color)[this.enhanceLevel]) + currentExp * 0.5;

    }

    /**
     * 获得灵宝某条属性的颜色
     * @param    attr 为一条属性记录.
     *            arr[0]:属性id，arr[1]:属性值
     * @return    属性颜色
     *
     */
    public function getLbAttrColor(attr:Array):String {
        if (!attr || !attr[0] || !attr[1])
            return "#FFFFFF";
        var maxValueArr:Array;
        var arr:Array = ConfigLocator.getInstance().baojuAttrCfg;
        var obj:Object;
        for each (obj in arr) {
            if (obj.type == this.type - 12 && obj.level == this.level) {
                maxValueArr = [
                    obj.ap_s, obj.magic_ap_s, obj.def_s, obj.magic_def_s,
                    obj.hp, obj.tough, obj.act, obj.hit,
                    obj.dodge, obj.crit, obj.pierce, obj.repel];
                break;
            }
        }
        var num1:Number = attr[1];
        var num2:Number = maxValueArr[attr[0] - 1];
        var percent:Number = 0;

        if (num2 != 0) {
            percent = num1 / num2;
            if (percent >= 0 && percent < 0.3) {
                return ColorUtil.CHAT_COLOR[1];
            } else if (percent >= 0.3 && percent < 0.6) {
                return ColorUtil.CHAT_COLOR[2];
            } else if (percent >= 0.6 && percent < 0.8) {
                return ColorUtil.CHAT_COLOR[3];
            } else if (percent >= 0.8) {
                return ColorUtil.CHAT_COLOR[4];
            } else {
                trace("Invalid percent!");
                return ColorUtil.CHAT_COLOR[0];
            }
        }
        return "#FFFFFF";

    }


    public function get lingbaoPropAttr():Array {
        return [baojuPropertyArray[PropertyDefine.AP_VALUE], baojuPropertyArray[PropertyDefine.AP_MAGIC_VALUE], baojuPropertyArray[PropertyDefine.DEF_VALUE], baojuPropertyArray[PropertyDefine.DEF_MAGIC_VALUE],
            baojuPropertyArray[PropertyDefine.HP_VALUE], baojuPropertyArray[PropertyDefine.TOUGH_VALUE], baojuPropertyArray[PropertyDefine.ACT_VALUE], baojuPropertyArray[PropertyDefine.HIT_VALUE],
            baojuPropertyArray[PropertyDefine.DODGE_VALUE], baojuPropertyArray[PropertyDefine.CRIT_VALUE], baojuPropertyArray[PropertyDefine.PIERCE_VALUE], baojuPropertyArray[PropertyDefine.REPEL_VALUE]
        ];
    }

    public function get isEq():Boolean {
        return type <= 19 || [171, 172, 173].indexOf(type) != -1
    }

    public function get isSkillBook():Boolean {
        return type == 40;
    }

    /**
     * 得到灵宝属性ID列表
     */
    public function getLbPropIdArr():Array {
        _lbPropArr = [];
        for (var i:uint = 0; i < lingbaoAttr.length; i++) {
            _lbPropArr.push(lingbaoAttr[i][0]);
        }
        return _lbPropArr;
    }
}
}