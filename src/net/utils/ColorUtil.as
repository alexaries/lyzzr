package net.utils {
public class ColorUtil {
    public static const CHAT_COLOR:Array = ["#FEFFEC", "#2CC345", "#2593EF", "#9154E5", "#FFCC33", "#996600", "#ff0000", "#FF99FF", "#996600", "#ff6600"];
    public static const CHAT_COLOR_1:Array = ["#FEFFEC", "#2CC345", "#2593EF", "#9154E5", "#FFCC33", "#996600", "#ffd542", "#FF99FF", "#996600", "#ff6600"];
    public static const CHAT_COLOR_OX:Array = [0xFFFFFF, 0x2CC345, 0x2593EF, 0x9154E5, 0xFFCC33, 0x996600, 0xff0000, 0xFF99FF, 0x996600, 0xff6600];//0xFF3300
    public static const TEXTCOLOR:Array = ["#c4c4c4", "#00FF00", "#00ADFE", "#F000FF", "#ff6600"];
    //道具装备颜色
    public static const COLOR:Array = [0xc4c4c4, 0x00FF00, 0x00ADFE, 0xF000FF, 0xE9967A];

    //任务相关元素的颜色 NPC,地点,战报
    public static const TASKCOLOR:Array = ["#009900", "#0066FF", "#CC0000"];
    public static const COMONCOLOR:String = "#869bec";
    public static const DEFAULTCOLOR:String = "#feffec"
    public function ColorUtil() {
    }

    /**
     * 得到国家颜色
     * @param countryId
     * @return
     * 天族：蓝色
     * 魔族：紫色
     */
    public static function getCountryColor(countryId:int):int {
        var color:uint = 0xffffff;
        switch (countryId) {
            case 0:
                color = 0x00FCFF;
                break;
            case 1:
                color = 0xFF58FD;
                break;
        }
        return color;
    }

    public static function getHtmlCountryColor(countryId:int):String {
        var color:String = "#FFFFFF";
        switch (countryId) {
            case 0:
                color = "#00FCFF";
                break;
            case 1:
                color = "#FF58FD";
                break;
        }
        return color;
    }

    public static function getCountryColorStr(countryId:int):String {
        return getHtmlCountryColor(countryId);
    }

    //把颜色从数字型转成字符型,即#000000;
    public static function getColorStr(color:int):String {
        var result:String = "#";
        result += color.toString(16);

        return result;
    }

    public static function getColorInt(color:String):int {
        return Number("0x" + color.substr(1, color.length));
    }
}
}