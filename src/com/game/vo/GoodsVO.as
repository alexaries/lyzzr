/**
 * Created by huangcb on 2017/8/25.
 */
package com.game.vo {
import net.consts.StaticConfig;

public class GoodsVO {
    /**
     * 类型<br>
     * 装备类: 1头,2胸,3肩,4腰,5腿,11链,12戒,21剑,22锤,23枪,24弓,25刀,26鞭,27扇<br>
     * 宝石类: 55力量,56敏捷,57智力,58体魄,59体力,60攻击,61防御,62命中,63反击,64闪避,65暴击,66破击,67闪电
     */
    public var type:uint = 0;
    /**
     * 需求等级
     */
    public var level:uint = 0;
    /**
     * 品质颜色id ,1为白色，2为绿色，3为蓝色，4为紫色，5为橙色，6为暗金，7为灰色
     */
    private var _color:uint = 0;
    /**
     * 堆叠上限值
     */
    public var stackLimit:uint = 0;
    /**
     * 售价
     */
    public var price:uint = 0;
    /**
     * 是否绑定 0:不绑定,1:装备绑定,2:获取绑定
     */
    public var binding:uint = 0;
    /**
     * 是否可使用
     */
    public var useable:uint = 0;
    /**
     * 属性编号
     */
    public var propId:uint = 0;
    /**
     * 物品tooltips描述信息
     */
    public var description:String = "";
    /*九疑鼎**/
    public var energy:uint = 0;
    /*职业**/
    public var career:uint = 0;

    /*职业**/
    public var vlevel:uint = 0;

    public var trumpExp:uint = 0;

    public var saleup:Number = 0;//交易金额上限
    //灵侍模型id
    public var questData:uint;

    /**
     * 物品图片ID
     */
    public var imgID:String;

    public var goodsPropsVo:GoodsPropsVO;
    public static const TEXTCOLOR:Array = ["#FFFFFF", "#2CC345", "#2593EF", "#9154E5", "#FFCC33", "#996600", "#ff0000"];
    public static const TEXTCOLOROX:Array = [0xFFFFFF, 0x2CC345, 0x2593EF, 0x9154E5, 0xFFCC33, 0x996600, 0xff0000];
    public static const bgSkinArr:Array = ["common/surface/frame_blue.png","common/surface/frame_green.png","common/surface/frame_blue.png","common/surface/frame_purple.png","common/surface/frame_yellow.png","","common/surface/frame_red.png"];
    public var id:int;
    public var name:String;

    public function GoodsVO() {
    }

    public function get imgURL():String {
        var idStr:String = imgID;
        if (type >= 13 && type <= 15) {//宝具
            idStr += color.toString();
        }

        if (type >= 36 && type <= 39) {
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
        } else {
            var exStr:String = "";
            var len:int = (idStr + "").length;
            exStr = len == 1 ? ("000" + idStr) : (len == 2 ? ("00" + idStr) : (len == 3 ? ("0" + idStr) : (idStr + "")));
            return StaticConfig.httpServer + "goods/" + exStr + ".jpg";
        }
        return StaticConfig.httpServer + "goods/" + idStr + suffix;
    }
    public function get typeValue():Number {
        var num:Number = 0;
        //60力量,61敏捷,62智力,63耐力,64意志,65生命,66攻击,67:防御,68命中,69反击,70闪避,71暴击,72破击,73身法,74坚韧 75法抗
        //174力量 175敏捷 176智力 177耐力 178意志,179生命,180攻击,181:防御,182命中,183反击,184闪避,185暴击,186破击,187身法,188坚韧 189法抗
        switch (type) {
            case 10:
                break;
            case 60:
            case 174:
                num = goodsPropsVo.powerValue;
                break;
            case 61:
            case 175:
                num = goodsPropsVo.agilityValue;
                break;
            case 62:
            case 176:
                num = goodsPropsVo.inelligenceValue;
                break;
            case 63:
            case 177:
                num = goodsPropsVo.strengthValue;
                break;
            case 64:
            case 178:
                num = goodsPropsVo.willValue;
                break;
            case 65:
            case 179:
                num = goodsPropsVo.hpValue;
                break;
            case 66:
            case 180:
                num = goodsPropsVo.apValue;
                break;
            case 67:
            case 181:
                num = goodsPropsVo.defValue;
                break;
            case 68:
            case 182:
                num = goodsPropsVo.hitValue;
                break;
            case 69:
            case 183:
                num = goodsPropsVo.repelValue;
                break;
            case 70:
            case 184:
                num = goodsPropsVo.dodgeValue;
                break;
            case 71:
            case 185:
                num = goodsPropsVo.critValue;
                break;
            case 72:
            case 186:
                num = goodsPropsVo.pierceValue;
                break;
            case 73:
            case 187:
                num = goodsPropsVo.actValue;
                break;
            case 74:
            case 188:
                num = goodsPropsVo.toughValue;
                break;
            default:
                break;
        }
        return num;
    }

    /**
     * 品质颜色id ,1为白色，2为绿色，3为蓝色，4为紫色，5为橙色，6为暗金，7为灰色
     */
    public function get color():uint {
        return _color;
    }

    /**
     * @private
     */
    public function set color(value:uint):void {
        _color = value;
    }
}
}
