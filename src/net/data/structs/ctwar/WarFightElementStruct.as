package net.data.structs.ctwar {

public class WarFightElementStruct {
    public function WarFightElementStruct() {
    }

    //玩家名
    private var _name:String;
    //玩家杀戮值
    private var _slaughterVal:int;
    //玩家PK开关是否开启
    private var _ispkable:int;
    private var _isrestable:int;

    /**
     * 玩家是否可以被国战轮询
     *   1 - 可以<br>
     *   0 - 不可以 玩家在交战或者是休息时间内
     * @return
     *
     */
    public function get isrestable():int {
        return _isrestable;
    }

    public function set isrestable(value:int):void {
        _isrestable = value;
    }

    public function get ispkable():int {
        return _ispkable;
    }

    public function set ispkable(value:int):void {
        _ispkable = value;
    }

    public function get slaughterVal():int {
        return _slaughterVal;
    }

    public function set slaughterVal(value:int):void {
        _slaughterVal = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }

}
}