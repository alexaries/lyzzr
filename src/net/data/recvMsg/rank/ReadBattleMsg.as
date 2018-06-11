package net.data.recvMsg.rank {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class ReadBattleMsg extends BaseMsg {
    private var _flag:uint;
    private var _formatData:Array;
    private var _result:uint;
    private var _formatID:uint;

    public function ReadBattleMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _flag = BytesUtil.readByte1(bytes);
            var i:int;
            switch (_flag) {
                case 0:
                    var len:int = BytesUtil.readByte1(bytes);
                    _formatData = [];
                    for (i = 0; i < len; i++) {
                        _formatData.push(BytesUtil.readByte2(bytes));
                    }
                    break;
                case 1:
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 2:
                    _formatID = BytesUtil.readByte2(bytes);
                    break;
                default:
            }

        } catch (e:*) {

        }
        return true;
    }

    public function get formatID():uint {
        return _formatID;
    }

    public function get result():uint {
        return _result;
    }

    public function get formatData():Array {
        return _formatData;
    }

    public function get flag():uint {
        return _flag;
    }
}
}
