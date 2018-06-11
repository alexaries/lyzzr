package net.data {
import utils.ByteArray;

public class BaseMsg {
    private var _errorCode:int = 0;

    public function BaseMsg() {

    }

    public function get errorCode():int {
        return _errorCode;
    }

    /**
     * 解析接收到的数据，该数据的内容包括不包含消息头的消息体
     * @param bytes
     * @return
     *
     */
    public function byteArrayToMsg(bytes:ByteArray):Boolean {
        return true;
    }

}
}