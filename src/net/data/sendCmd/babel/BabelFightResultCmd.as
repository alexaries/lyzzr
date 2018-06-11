package net.data.sendCmd.babel {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S)消息类型:0x5A <br>
 * 消息说明：开始副本战斗
 * @author RyanCao
 *
 */
public class BabelFightResultCmd extends BaseCmd {
    private var _type:int;
    //private var _mode:int ;
    private var _level:int;

    public function BabelFightResultCmd() {
        super();
        msgType = MsgConst.BABEL_START;
    }

    public function set level(value:int):void {
        _level = value;
    }

//		public function set mode(value:int):void
//		{
//			_mode = value;
//		}

    public function set type(value:int):void {
        _type = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            //bodyBytes.writeByte(_mode);
            bodyBytes.writeByte(_level);
        } catch (e:*) {

        }
    }

}
}