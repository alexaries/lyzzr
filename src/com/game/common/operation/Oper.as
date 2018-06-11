package com.game.common.operation {
import com.signal.SignalDispatcher;

public class Oper {

    public static const END:int = 3;
    public static const NONE:int = 0;
    public static const RUN:int = 2;
    public static const WAIT:int = 1;
    protected var _step:int = 0;
    public var immediately:Boolean;
    public var onCompleteSignal:SignalDispatcher;
    public var list:Array = [];

    public function Oper() {

        onCompleteSignal = new SignalDispatcher();
        step = WAIT;
    }

    public function add(que:Oper):void {
        list.push(que);
    }

    protected function do_halt():void {

        onCompleteSignal.dispose();
        step = NONE;
        for (var i:int = 0; i < list.length; i++) {
            var object__:Oper = list[i];
            object__.halt();
        }

        list = null;
    }

    public function halt():void {
        if (step == NONE)  return;
        do_halt();
    }

    public function end():void {
        if (step == END || step == NONE) return;
        do_end()
    }

    protected function do_end():void {

        step = END;
        // trace("end",OperationEvent.OPERATION_COMPLETE);
        onCompleteSignal.dispose();
    }

    public function execute():void {
        //OperationEvent.OPERATION_START;
        if (step == END || step == NONE) return;
        if (step == RUN) {
            trace("OperationEvent.OPERATION_START;");
            return;
        }

        do_execute();
    }

    public function do_execute():void {
        //OperationEvent.OPERATION_START;
        if (step == END || step == NONE) return;
        step = RUN;
        if (this.immediately) {
            end();
            //OperationEvent.OPERATION_COMPLETE;
        }
    }


    public function get step():int {
        return _step;
    }

    public function set step(value:int):void {
        _step = value;
        if (_step == END) {
            onCompleteSignal.dispatch(null);
        }
    }
}
}
