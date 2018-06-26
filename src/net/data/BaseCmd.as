package net.data {
public class BaseCmd {
    private var _protocolID:int = 0;

    /*消息体内容*/
    public var json = null;

    public function set protocolID(value:int):void {
        _protocolID = value;
    }

    public function get protocolID():int {
        return _protocolID;
    }

    public function msgToJson():Boolean {
        return true;
    }
}
}