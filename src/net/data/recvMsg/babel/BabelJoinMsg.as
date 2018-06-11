package net.data.recvMsg.babel {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class BabelJoinMsg extends BaseMsg {
    public function BabelJoinMsg() {
        super();
    }

    private var _flag:int;
    private var _result:int;
    private var _type:int;
    private var _mode:int;
    /**
     *    副本级别<br>1 - 普通难度<br>2 - 修罗难度
     * @return
     *
     */
//		public function get mode():int
//		{
//			return _mode;
//		}
    /**
     *副本类别<br>1 - 40级副本<br>2 - 50级副本<br>3 - 60级副本<br>4 - 70级副本<br>5 - 80级副本
     * @return
     *
     */
    public function get type():int {
        return _type;
    }

    /**
     * 0-成功<br>1-等级不够<br>2-次数已满<br>3-其他原因失败
     * @return
     *
     */
    public function get result():int {
        return _result;
    }

    /**
     *    0-进入<br>1-离开 <br>2-继续
     * @return
     *
     */
    public function get flag():int {
        return _flag;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _flag = BytesUtil.readByte1(bytes);
        _result = BytesUtil.readByte1(bytes);
        _type = BytesUtil.readByte1(bytes);
        //_mode = BytesUtil.readByte1(bytes);

        return true;
    }
}
}