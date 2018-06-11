/**
 * Created by huangcb on 2017/8/28.
 */
package com.game.common.operation {
public class Queue extends Oper {

    protected var index:int;
    public var listQueue:Array = [];
    public function Queue(_list:Array) {
        super();
        listQueue = _list;
        index = 0;
    }


    override public function do_execute():void {

        index = 0;
        for (var i:int = 0; i < listQueue.length; i++) {
            var item:Oper = listQueue[i];
            item.onCompleteSignal.getSignal(this).listen(loop);
        }
        loop();
        //丢给 框架
    }

    protected function loop() {
        if (step == END ||step==NONE) return;
        if (this.index < this.listQueue.length) {

            var item:Oper = this.listQueue[this.index];
            this.index += 1;
            item.execute();

            //  trace("@loop",this.index,item);

        } else {
            end();
        }
    }


    override protected function do_halt():void {
        if(listQueue){
            for (var i:int = 0; i < listQueue.length; i++) {
                var object__:Oper = listQueue[i];
                object__.halt();
            }
        }

        super.do_halt();
        listQueue = null;
    }

    override protected function do_end():void {
        listQueue = null;
        super.do_end();
    }
}
}
