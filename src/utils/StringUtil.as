/**
 * Created by huangcb on 2017/8/22.
 */
package utils {
/**
 * 	Class that contains static utility methods for manipulating Strings.
 *
 * 	@langversion ActionScript 3.0
 *	@playerversion Flash 9.0
 *	@tiptext
 */
public class StringUtil
{
    /**
     * 转换成整数 如果非数字字符串 就转成0
     * @param s
     * @param radix
     * @return
     */
    public static function parseToInt(s:String="NaN", radix:int=0):int
    {
        var n:Number = parseInt(s,radix);
        if(n >= 0 || n < 0){
            return n;
        }
        return 0;
    }

    public static function substitute(str:String,  rest:Array):String
    {
        if (str == null) return '';

        // Replace all of the parameters in the msg string.
        var len:uint = rest.length;
        var args:Array  = rest;
        for (var i:int = 0; i < len; i++)
        {
            str = str.replace(new RegExp("\\{"+i+"\\}", "g"), args[i]);
        }

        return str;
    }
    public static function stringsAreEqual(s1:String, s2:String,
                                           caseSensitive:Boolean):Boolean
    {
        if(caseSensitive)
        {
            return (s1 == s2);
        }
        else
        {
            return (s1.toUpperCase() == s2.toUpperCase());
        }
    }

    public static function trim(input:String):String
    {
        return StringUtil.ltrim(StringUtil.rtrim(input));
    }

    public static function ltrim(input:String):String
    {
        var size:Number = input.length;
        for(var i:Number = 0; i < size; i++)
        {
            if(input.charCodeAt(i) > 32)
            {
                return input.substring(i);
            }
        }
        return "";
    }

    public static function rtrim(input:String):String
    {
        var size:Number = input.length;
        for(var i:Number = size; i > 0; i--)
        {
            if(input.charCodeAt(i - 1) > 32)
            {
                return input.substring(0, i);
            }
        }

        return "";
    }

    public static function beginsWith(input:String, prefix:String):Boolean
    {
        return (prefix == input.substring(0, prefix.length));
    }


    public static function endsWith(input:String, suffix:String):Boolean
    {
        return (suffix == input.substring(input.length - suffix.length));
    }

    public static function remove(input:String, remove:String):String
    {
        return StringUtil.replace(input, remove, "");
    }

    public static function replace(input:String, replace:String, replaceWith:String):String
    {
        return input.split(replace).join(replaceWith);
    }

    public static function stringHasValue(s:String):Boolean
    {
        //todo: this needs a unit test
        return (s != null && s.length > 0);
    }
    public static function trimNumber(n:Number):String{
        if(n >=1000000){
            n = Math.ceil(n /10000)
            return n + "万"
        }
        return n + "";

    }

    /**
     * param 将要转为URL参数字符串的对象
     * key URL参数字符串的前缀
     * encode true/false 是否进行URL编码,默认为true
     *
     * return URL参数字符串
     */
    public static function urlEncode(param:*, key=null, encode=null):String {
        if(param==null) return '';
        var paramStr = '';
        var t = typeof (param);
        if (t == 'string' || t == 'number' || t == 'boolean') {
            paramStr += '&' + key + '=' + ((encode==null||encode) ? encodeURIComponent(param) : param);
        } else {
            for (var i in param) {
                var k = key == null ? i : key + (param instanceof Array ? '[' + i + ']' : '.' + i);
                paramStr += urlEncode(param[i], k, encode);
            }
        }
        return paramStr;
    }
}
}
