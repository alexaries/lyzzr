/**
 * Created by dingcj on 2018/6/25.
 */
package net.data {
public class BaseMsg {
    private var _errorCode:int = 0;

    public function BaseMsg() {

    }

    public function get errorCode():int {
        return _errorCode;
    }

    public function jsonToMsg(json:JSON):Boolean {
        return true;
    }

}
}