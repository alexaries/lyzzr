/**
 * Created by huangcb on 2017/8/17.
 */
package com.signal {
public class SignalDispatcher {
    var signal:Signal;
    public function SignalDispatcher() {
        signal=new Signal();
    }
    public   function getSignal(ower):Signal {
        signal.ower=ower;
        return signal;
    }
    public   function dispatch(data ) {

        signal.dispatch(data);
    }
    public function dispose(){
        clear()

    }
    public function clear(){
        signal.clear();
    }
    public function hasEventListener():Boolean {
        return  signal&& signal.signals.length>0;
    }
}
}
