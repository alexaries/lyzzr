package net.data.sendCmd.babel {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S)消息协议 0x58 <br>
 * 进入/离开副本
 * @author RyanCao
 *
 */
public class BabelJoinCmd extends BaseCmd {
    public function BabelJoinCmd() {
        super();
        msgType = MsgConst.BABEL_JOIN;
    }

    private var _flag:int;
    private var _type:int;	//可以 暂时使用
//		private var _mode:int ;
    /**
     *    副本级别<br>
     *    1 - 普通难度<br>
     *    2 - 修罗难度
     * @param value
     *
     */
//		public function set mode(value:int):void
//		{
//			_mode = value;
//		}
    /**
     *    副本类别<br>
     *        1 - 40级副本<br>
     *        2 - 50级副本<br>
     *        3 - 60级副本<br>
     *        4 - 70级副本<br>
     *        5 - 80级副本
     * @param value
     *
     */
    public function set type(value:int):void {
        _type = value;
    }

    /**
     * 0-进入
     * 1-离开
     * 2-继续
     * @param value
     *
     */
    public function set flag(value:int):void {
        _flag = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_flag);
            bodyBytes.writeByte(_type);
            //bodyBytes.writeByte(_mode);
        } catch (e:*) {

        }
    }
}
}