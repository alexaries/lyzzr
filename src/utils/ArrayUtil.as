/**
 * Created by huangcb on 2017/8/17.
 */
package utils {
public class ArrayUtil {
    public static var SORT_CASEINSENSITIVE:int = 1;
    public static var SORT_DESCENDING:int = 2;
    public static var SORT_UNIQUESORT:int = 4; //SORT_RETURNINDEXEDARRAY 不支持
    public static var SORT_RETURNINDEXEDARRAY:int = 8;  //SORT_RETURNINDEXEDARRAY 不支持
    public static var SORT_NUMERIC:int = 16;


    private static function strcmp(s0:String, s1:String):Number {
        var r:Number = s0.length - s1.length;
        var len:int = Math.min(s0.length, s1.length);
        for (var i:int = 0; i < len; i++) {
            if (s0.charAt(i) != s1.charAt(i)) {
                r = s0.charCodeAt(i) - s1.charCodeAt(i);
                break;
            }
        }
        return r;
    }

    private static function getSortingNumberFunction(oDescending:Boolean, fieldNames:Array):Function {
        return function (a, b):int {
            var r = 0;
            for (var i:int = 0; i < fieldNames.length; i++) {
                var f:String = fieldNames[i];
                var af:Number = a[f];
                var bf:Number = b[f];
                if (af != bf) {
                    if (!oDescending) {
                        r = af > bf ? 1 : -1;
                    }
                    else {
                        r = af < bf ? 1 : -1;
                    }
                    break;
                }
            }
            return r;
        }
    }

    private static function getSortingStringFunction(oDescending:Boolean, oCaseinsensitive:Boolean, fieldNames:Array):Function {
        return function (a, b):int {
            var r = 0;
            for (var i:int = 0; i < fieldNames.length; i++) {
                var f:String = fieldNames[i];

                var af:String = a[f];
                var bf:String = b[f];


                if (oCaseinsensitive) {
                    if (af instanceof  String) {
                        af = af.toLowerCase();
                    }
                    if (bf instanceof  String) {
                        bf = bf.toLowerCase();
                    }
                }

                if (af != bf) {
                    if (!oDescending) {

                        r = strcmp(af.toString(), bf.toString()) > 0 ? 1 : -1;

                    }
                    else {

                        r = strcmp(af.toString(), bf.toString()) < 0 ? 1 : -1;

                    }
                    break;
                }
            }
            return r;
        }
    }

    private static function getSortingFunction(oNumeric:Boolean, oDescending:Boolean, oCaseinsensitive:Boolean, fieldNames:Array):Function {
        if (oNumeric) return getSortingNumberFunction(oDescending, fieldNames);
        return getSortingStringFunction(oDescending, oCaseinsensitive, fieldNames);
    }

    /**

     Options are:
     ArrayUtil.SORT_CASEINSENSITIVE
     ArrayUtil.SORT_DESCENDING
     ArrayUtil.SORT_UNIQUESORT
     ArrayUtil.SORT_NUMERIC

     */
    public static function sortOn(inArray:*, fieldNames:Array, options:int = 0):* {
        var result:Array = [];
        if (inArray.length != 0) {
            var oNumeric = options >> 4 & 1 == 1;
            var oUniquesort = options >> 2 & 1 == 1;
            var oDescending = options >> 1 & 1 == 1;
            var oCaseinsensitive = options & 1 == 1;


            inArray.sort(getSortingFunction(oNumeric, oDescending, oCaseinsensitive, fieldNames));

            result = inArray;
        }

        return result;

    }


    public static function indexOf(inArray:Array, match:Object, fromIndex:int = 0):int {
        var i:int = fromIndex - 1;
        while (++i < inArray.length) {
            if (inArray[i] == match) return i;
        }
        return -1;
    }

    /*比较数组是否相同*/
    public static function equals(arr1:Array, arr2:Array):Boolean {
        if (arr1.length != arr2.length) {
            return false;
        }
        for (var i:int = 0, len:int = arr1.length; i < len; i++) {
            if (arr1[i] != arr2[i]) {
                return false;
            }
        }
        return true;
    }

    static public function find(list, cond:Function) {
        for (var i:int = 0; i < list.length; i++) {
            if (cond(list[i]))return list[i];
        }
        return null;
    }

    static public function filter(list, cond:Function) {
        var temp:Array = [];
        for (var i:int = 0; i < list.length; i++) {
            if (cond(list[i])) {
                temp.push(list[i]);
            }
        }
        return temp;
    }

    static public function insertAt(list, pos, x) {
        list.splice(pos, 0, x);
    }

    static public function removeAt(list, pos) {
        list.splice(pos, 1);
    }

    static public function remove(list, obj) {
        removeAt(list,list.indexOf(obj));
    }
    public static function arraysAreEqual(_lingbaoAttr:Array, value:Array):Boolean {
        //todo

        return false;

    }
}
}
