package utils {
import com.game.module.pack.util.PackUtil;
import com.game.module.pack.vo.PackVO;
import com.game.vo.CittaVO;
import com.game.vo.GoodsPropsVO;
import com.hurlant.math.BigInteger;

import globals.ConfigLocator;

import mx.core.ByteArrayAsset;

import utils.ByteArray;

import net.consts.StaticConfig;
import net.utils.BytesUtil;

/**
 *
 * @author Luna
 *
 */
public class LunaUtil {
    //----------------------------------------------
    //		Variables
    //----------------------------------------------

    //----------------------------------------------
    //		Constructor
    //----------------------------------------------
    public function LunaUtil() {
    }

    public static function writeBitVec(bitVec:Vector.<Boolean>, value:uint):void {
        var length:uint = bitVec.length;
        for (var i:int = 0; i < length; i++) {
            bitVec[i] = readBit(value, i);
        }
    }

    /**
     * 读位
     * @param value
     * @param bit
     * @return
     *
     */
    public static function readBit(value:uint, bit:uint):Boolean {
        return Boolean(value & Math.pow(2, bit));
    }


    public static function getTimeByDay(day:uint):uint {
        return day * 86400;
    }

    public static function getDayByTime(time:uint):uint {
        return time / 86400;
    }

    public static var bgSkinArr:Array = ["common/surface/frame_blue.png", "common/surface/frame_green.png", "common/surface/frame_blue.png", "common/surface/frame_purple.png", "common/surface/frame_yellow.png", "", "common/surface/frame_red.png"];

    /**月卡图标*/
    public static var vipSkinArr:Array = ["", "common/surface/frame_blue.png", "common/surface/frame_green.png", "common/surface/frame_green.png"];


    /**
     * 获得 有加减符号的数字
     * @param number
     * @return
     *
     */
    public static function getSignNumber(number:Number):String {
        return number >= 0 ? "+" + number.toString() : number.toString();
    }

    /**
     * 根据玩家等级获得可以装备的最高等级
     * @return
     *
     最强等级为玩家当前可使用的最高装备等级，
     玩家等级<60最高装备等级为45
     玩家等级<70最高装备等级为60
     玩家等级<80最高装备等级为70
     玩家等级<90最高装备等级为80
     玩家等级<100最高装备等级为90
     玩家等级<110最高装备等级为100
     */
    public static function getEquipMaxLevelByPlayerLV(playerLV:uint):uint {
        const maxLv:uint = 256;
        if (playerLV < 60)
            return 45;
        else if (playerLV < 70)
            return 60;
        else if (playerLV < 80)
            return 70;
        else if (playerLV < 90)
            return 80;
        else if (playerLV < 100)
            return 90;
        else if (playerLV < 110)
            return 100;
        else if (playerLV < maxLv)
            return 110;
        return 0;
    }

    private static const TWEEN_LENGTH:uint = 60;


    public static function vectorToArray(vector:Object):Array {
        var length:uint = vector["length"];
        var arr:Array = new Array(length);
        for (var i:int = 0; i < length; i++) {
            arr[i] = vector[i];
        }
        return arr;
    }

    /**
     * @param arr1  数值
     * @param arr2  长度
     * @param num 当前进度值
     * @return 进度条长度(int)
     *
     */
    public static function schedule(arr1:Array, arr2:Array, num:int):int {
        var length:int = 0;
        var floor:int = 0
        for (var i:int = 0; i < arr1.length; i++) {
            if (arr1[i] < num)
                floor = i + 1;
        }
        for (i = 0; i < floor; i++) {
            length += arr2[i];
        }
        if (floor != 0 && floor < arr1.length)
            length += ((num - arr1[floor - 1]) / (arr1[floor] - arr1[floor - 1])) * arr2[floor];
        if (floor == 0 && num > 0)
            length += (num / arr1[0]) * arr2[0];
        return length;
    }

    public static function getHeadURL(headID:uint):String {
        var version:String = "";
        if (StaticConfig.skinVersion > 0) {
            version = "_v" + (StaticConfig.skinVersion + 1);
        }
        var url:String = StaticConfig.httpServer + "avatars/user/";
        url += headID + version + ".png";
        return url;
    }

    public static function getHeadID(career:uint, sex:uint):uint {
        if (career == 9)
            return 161;
        return (career - 1) * 2 + sex + 1;
    }

    //var str:String = "2013.9.8-2013.9.15";
    // trace(	getTwoDateFromString(str)	);
    public static function getTwoDateFromString(str:String):Vector.<Date> {
        var result:Array = new Array(2);
        var arr:Array = str.split("-");
        for (var i:int = 0; i < 2; i++) {
            var dateStr:String = arr[i];
            var dateArr:Array = dateStr.split(".");

            if (i == 0)
                result[i] = new Date(dateArr[0], dateArr[1] - 1, dateArr[2]);
            else
                result[i] = new Date(dateArr[0], dateArr[1] - 1, dateArr[2], 23, 59, 59);
        }
        return Vector.<Date>(result);
    }

    /**
     * 复制属性（一般用于创建vo的时候复制一些基础属性）
     * @param to
     * @param from
     *
     */
    public static function copyProperties(to:Object, from:Object):void {
        for (var propertyName:String in from) {
            if (to.hasOwnProperty(propertyName))
                to[propertyName] = from[propertyName];
        }
    }

    public static function readUint64(bytes:ByteArray):BigInteger {
        var idBytes:ByteArray = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        return BytesUtil.readUint64(idBytes);
    }

    private static const morphTrump_cn:Vector.<uint> = Vector.<uint>([1732, 1733, 1734, 1735, 1726, 1729, 1727, 1741, 1742, 1746, 1747, 1682, 1683, 1686, 1687, 1690, 1691, 1850, 1851]);
    private static const morphTrump_tw:Vector.<uint> = Vector.<uint>([1737, 1736, 1738, 1739, 1731, 1725, 1740, 1743, 1744, 1748, 1749, 1684, 1685, 1688, 1689, 1692, 1693, 1852, 1853]);

    public static function transformTWMorpTrumpID(cnID:uint):uint {
        var index:int = morphTrump_cn.indexOf(cnID);
        if (index != -1) {
            return morphTrump_tw[index];
        }
        return cnID;
    }

    public static function transformTWMorpTrumpIDArray(array:Object):void {
        if (array.hasOwnProperty("length")) {
            var len:uint = array.length;
            for (var i:int = 0; i < len; i++) {
                array[i] = transformTWMorpTrumpID(array[i]);
            }
        }
    }

    //按比例取进度条长度
    public static function getScaleLength(valueArr:Array, lengthArr:Array, score:uint):Number {
        var len:uint = valueArr.length;
        for (var i:int = 0; i < len; i++) {
            var nowValue:Number = valueArr[i];
            if (score < nowValue) {
                var prevValue:Number = i == 0 ? 0 : valueArr[i - 1];
                var prevWidth:Number = i == 0 ? 0 : lengthArr[i - 1];
                var nowWidth:Number = lengthArr[i];

                var scale:Number = (score - prevValue) / (nowValue - prevValue);
                var result:Number = prevWidth + (nowWidth - prevWidth) * scale;
                break;
            }
        }
        if (isNaN(result))
            result = lengthArr[lengthArr.length - 1];
        return result;
    }


    /**
     * 返回itemObject itemid itemNum
     * data 格式：499,20;56,2;57,2
     * @return
     *
     */
    public static function getItemObjectVecByString(data:String, type:uint = 0):Vector.<Object> {
        if (data == "" || data == "0")
            return new Vector.<Object>();
        while (data.indexOf('"') != -1)
            data = data.replace('"', "");


        var itemArr:Array = data.split(";");
        var i:int = 0;
        var itemObjectVec:Vector.<Object> = new Vector.<Object>(itemArr.length);

        for each(var item:String in itemArr) {
            var single:Array = item.split(",");
            var obj:Object = {};
            obj.itemid = single[0];
            obj.itemNum = single[1];
            switch (type) {
                //幸运星
                case 1:
                    if (single.length > 2)
                        obj.old = single[2];
                    if (single.length > 3)
                        obj.now = single[3];
                    break;
                //ChaosFightVO
                case 2:
                    obj.id = obj.itemid;
                    obj.nums = obj.itemNum;
                    break;
            }
            if (obj.itemid > 0)
                itemObjectVec[i] = obj;
            else
                itemObjectVec[i] = null;
            i++;
        }
        return itemObjectVec;
    }

    /**
     *
     * @param _idN 道具id、技能id
     * @param _bl true(根据道具id推技能id) false(根据技能id推出道具id)
     * @return 技能id、道具id
     *
     */
    public static function getUiltId(_idN:int, _bl:Boolean = true):int {
        if (_bl) {
            if (_idN > 21000)
                return (_idN - 21000 + 210) * 100;
            return (_idN - 1200 + 1) * 100;
        }
        else {
            if (_idN > 21000)
                return Math.floor(_idN * 0.01) - 210 + 21000;
            return Math.floor(_idN * 0.01) - 1 + 1200;
        }
    }

    //----------------------------------------------心法冲突相关-------------------------------------------------------------//
    public static function checkCittaID(cittaid:int, selectCitta:int):Boolean {
        var cittavo:CittaVO;
        var index:int = -1;
        if (selectCitta == cittaid) {
            return true;
        } else {
            var cittadiff:Array = getCittaDiffArray(Math.floor(cittaid / 100));
            if (cittadiff) {
                var nn:int = Math.floor(selectCitta / 100);
                index = cittadiff.indexOf(nn);
                if (index > -1) {
//                cittavo = ConfigLocator.getInstance().cittaDatas.get(nn);
//                dispatch(new NotiEvent(NotiEvent.ROLL_ALERT, '当前已装备心法[' + cittavo.name + '],与你要装备的心法冲突'));
                    return true;
                }
            }
        }
        return false;
    }

    public static function getCittaDiffArray(cittaid:int):Array {
        return null;
    }

    //----------------------------------------------------------------------------------------------------------------//

    /**通过id 创建 物品 [[id,num],[id,num],[id,num]]*/
    public static function getPackById(arr:Array):Array {
        var a:Array;
        var p:PackVO;
        var packList:Array = [];
        for (var j:int = 0; j < arr.length; j++) {
            a = arr[j];
            p = PackUtil.createPackVO(a[0]);
            p.pileNums = a[1];
            packList.push(p);
        }
        return packList;
    }

}

}
