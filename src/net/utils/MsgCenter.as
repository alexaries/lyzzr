package net.utils {
import utils.ByteArray;

import net.data.BaseMsg;

public class MsgCenter {
    public function MsgCenter() {
    }

    public static function getMsg(cls:Class, bytes:ByteArray):BaseMsg {
        var baseMsg:BaseMsg = new cls() as BaseMsg;
        if(baseMsg==null ||baseMsg.byteArrayToMsg==null){
            trace("getMsg error")
        }
        baseMsg.byteArrayToMsg(bytes);
      //  trace("MsgCenter==getMsg=="+JSON.stringify(baseMsg));
        return baseMsg;
    }
}
}