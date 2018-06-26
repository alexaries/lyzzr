package net.utils {
import net.data.BaseMsg;

public class MsgCenter {
    public function MsgCenter() {
    }

    public static function toMsg(cls:Class, json:JSON):BaseMsg {
        var baseMsg:BaseMsg = new cls() as BaseMsg;
        if (baseMsg == null || baseMsg.jsonToMsg == null) {
            trace("toMsg error");
        }
        baseMsg.jsonToMsg(json);
        return baseMsg;
    }
}
}