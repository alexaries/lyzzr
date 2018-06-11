package net.data.sendCmd.babel {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 *(C->S)消息类型 0x59 <br>
 * 请求副本信息
 * @author RyanCao
 *
 */
public class BabelDataUpdateCmd extends BaseCmd {
    public function BabelDataUpdateCmd() {
        super();
        msgType = MsgConst.BABEL_UPDATE;
    }

    private var _flag:int;
    private var _type:int;
    //private var _mode:int ;
    /**
     *    副本级别<br>
     1 - 普通难度<br>
     2 - 修罗难度
     * @param value
     *
     */
//		public function set mode(value:int):void
//		{
//			_mode = value;
//		}
    /**
     *byte    type    <br>副本类别<br>
     1 - 40级副本<br>
     2 - 50级副本<br>
     3 - 60级副本<br>
     4 - 70级副本<br>
     5 - 80级副本
     * @param value
     *
     */
    public function set type(value:int):void {
        _type = value;
    }

    /**
     *    请求副本信息的内容<br>
     0-当前副本玩家的信息(当前次数,累计通关次数,首次通关时间,当前副本次数当前副本难度)<br>
     1-今日记录信息<br>
     2-我的收获记录

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