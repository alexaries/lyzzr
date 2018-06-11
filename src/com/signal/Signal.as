/**
 * Created by huangcb on 2017/8/17.
 */
package com.signal {
public class Signal {
    public var signals:Array;
    public var ower;
    public function Signal() {
        signals=[];
    }
    public   function listen(listener ) {
        signals.push([ower,listener]);
    }

    public   function dispatch(data ) 
    {
        for (var i=0;i<signals.length;i++)
        {
            var listener=signals[i];
            var fun:Function= listener[1]; 
            if(data is Array||data == null){
                fun.apply(listener[0],data);
            }
            else{
                fun.apply(listener[0],[data]);
            }

        }
    }
    public  function  clear(){
        signals=null;
        signals=[];
        ower=null;
    }

    public function dispose():void {
        signals=null;
        ower=null;
    }
}
}
