package net.data.recvMsg.babel {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C)消息类型:0x5A <br>
 * 消息说明：副本战斗结果
 * @author RyanCao
 *
 */
public class BabelFightResultMsg extends BaseMsg {
    public function BabelFightResultMsg() {
        super();
    }

    private var _type:int;
    //private var _mode:int ;
    private var _level:int;
    private var _result:int;
    /**
     * 战斗结果
     * 0 - 胜
     * 1 - 败
     * @return
     *
     */
    public function get result():int {
        return _result;
    }

    /**
     *  当前战斗层数
     * @return
     *
     */
    public function get level():int {
        return _level;
    }

    /**
     * 副本级别<br>
     * 1 - 普通难度<br>
     * 2 - 修罗难度
     * @return
     *
     */
//		public function get mode():int
//		{
//			return _mode;
//		}
    /**
     *  副本类别<br>
     *    1 - 40级副本<br>
     *    2 - 50级副本<br>
     *    3 - 60级副本<br>
     *    4 - 70级副本<br>
     *    5 - 80级副本
     * @return
     *
     */
    public function get type():int {
        return _type;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _type = BytesUtil.readByte1(bytes);
        //_mode = BytesUtil.readByte1(bytes);
        _level = BytesUtil.readByte1(bytes);
        _result = BytesUtil.readByte1(bytes);

        return true;
    }
}
}