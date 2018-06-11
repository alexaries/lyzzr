/**
 * Created with IntelliJ IDEA.
 * User: xuwenjun
 * Date: 14-3-27
 * Time: 下午3:10
 * To change this template use File | Settings | File Templates.
 */
package lang {
import utils.StringHelper;
public class Lang {
    //注释符号
    private static const ANNOTATION:String = "#";
    //分隔符号
    private static const DELIMITER:String = "=";
    private var messages:Object;
    private var messagesArray:Object;
    private static var instance:Lang;
    private static var strHelper:StringHelper = new StringHelper();

    public function Lang() {
        messages ={};
        messagesArray = {};
    }

    public static function getInstance():Lang {
        if (instance == null) instance = new Lang();
        return instance;
    }

    /**
     * 初始化语言包
     * @param content
     */
    public function init(content:String):void {
        var lines:Array = content.split(/\n\r|\n/);
        var line:String, value:String;
        var index:int, key:int;
        for (var i:int = 0, lineNum:int = lines.length; i < lineNum; i++) {
            line = lines[i];
            var emptyStr:String = " ";
            line = strHelper.trim(line, emptyStr);
            if (line.charAt(0) == ANNOTATION)continue;
            if (line == "")continue;
            index = line.indexOf(DELIMITER);
            if (index > 0) {
                key = parseInt(line.substring(0, index));
                value = line.substring(index + 1);
                messages[key] = value;
            }
        }
    }

    /**
     * 获取语言包中的信息
     * @param key
     * @param argsArray 替换站位符的参数
     */
    public function parse(key:int, argsArray:Array = null):String {
        var value:String = messages[key];
        if (value) {
            return getValue(value, argsArray);
        }
        return "key not find" + key;
    }

    private function getValue(value:String, args:Array):String {
        var pattern:RegExp = /{(\d+)}/g;
        value = value.replace(pattern, function ():String {
            return args[arguments[1]];
        });
        return value;
    }

    /**
     * 根据key获取数组信息
     * @param key
     * @return
     */
    public function parseArray(key:int):Array {
        var array:Array = messagesArray[key];
        if (array)return array;
        var value:String = messages[key];
        if (value) {
            array = getArrayValue(value);
            messagesArray[key] = array;
            return array;
        }
        return [];
    }

    /**
     * 将信息转化为数组形式
     * @param message
     * @return
     */
    private function getArrayValue(message:String):Array {
        var value:Array = [];
        var regExp:RegExp = new RegExp("\\s*\\[(.*)\\]");
        var obj:Object = regExp.exec(message);
        if (obj && obj[1]) {
            var str:String = obj[1];
            var arr:Array = str.split(",");
            for each (var itemStr:String in arr) {
                regExp = new RegExp("\\s*'(.*)'\\s*");
                var item:Object = regExp.exec(itemStr);
                if (item && item[1]) {
                    value.push(item[1]);
                }
            }
        }
        return value;
    }
}
}
