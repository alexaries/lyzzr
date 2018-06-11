package net.data.sendCmd.task {
import net.data.BaseCmd;
import net.events.MsgConst;

public class TaskCycFreshCmd extends BaseCmd {
    public var cyc:uint;
    public var type:uint;
    public var color:uint;
    public var count:uint;
//		private var _loopTaskId:uint;
//		private var _freshType:Number;
//		private var _freshGold:uint;
//		private var _taskColor:Number;

    public function TaskCycFreshCmd() {
        this.msgType = MsgConst.TASK_CYC_REFRESH;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(cyc);
            bodyBytes.writeByte(type);
            bodyBytes.writeByte(color);
            bodyBytes.writeUnsignedInt(count);
//				bodyBytes.writeUnsignedInt(loopTaskId);
//				this.bodyBytes.writeByte(freshType);
//				bodyBytes.writeUnsignedInt(freshGold);
//				this.bodyBytes.writeByte(taskColor);
        }
        catch (e:*) {

        }
    }

//		public function set loopTaskId(n:uint):void
//		{
//			_loopTaskId = n;
//			return; 
//		}
//		public function get loopTaskId():uint
//		{
//			return _loopTaskId;
//		}
//		public function set freshType(n:Number):void
//		{
//			_freshType = n;
//			return;
//		}
//		public function get freshType():Number
//		{
//			return _freshType;
//		}
//		public function set freshGold(n:uint):void
//		{
//			_freshGold = n;
//			return;
//		}
//		public function get freshGold():uint
//		{
//			return _freshGold;
//		}
//		public function set taskColor(n:Number):void
//		{
//			_taskColor = n;
//			return;
//		}
//		public function get taskColor():Number
//		{
//			return _taskColor;
//		}
}
}