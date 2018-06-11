package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 帮派驻地返回<br>
 * (S->C) 0x9B
 * @author ryan
 */
public class CBuildMsg extends BaseMsg {
    // 消息类型
    private var _type:uint;
    // 副本信息是否开启
    private var _isopen:uint;
    private var _grid_max:uint;
    private var _grid_curr:uint;
    private var _up_money:uint;
    private var _fee1:uint;
    private var _fee2:uint;
    private var _got_money1:uint;
    private var _got_money2:uint;
    private var _lose_num:uint;
    private var _win_num:uint;
    private var _stationID:int;
    private var _updateArr:Array;

    public function CBuildMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            var len:int;
            var i:int = 0;
            if (_type == 0) {
                _grid_max = BytesUtil.readByte1(bytes);
                _grid_curr = BytesUtil.readByte1(bytes);
                _up_money = BytesUtil.readByte2(bytes);
                _fee1 = BytesUtil.readByte1(bytes);
                _fee2 = BytesUtil.readByte1(bytes);
                _got_money1 = bytes.readUnsignedInt();
                _got_money2 = bytes.readUnsignedInt();
                _win_num = BytesUtil.readByte2(bytes);
                _lose_num = BytesUtil.readByte2(bytes);
            } else if (_type > 0) {
                _updateArr = [];
                for (i = 0; i < _type; i++) {
                    var obj:Object = readUpdatePack(bytes);
                    _updateArr.push(obj);
                }
            }
        } catch (e:*) {
        }
        return true;
    }

    public function readUpdatePack(bytes:ByteArray):Object {
        var obj:Object = new Object();
        var flag:int = BytesUtil.readByte1(bytes);
        obj.flag = flag;
        switch (flag) {
            case 1:
                obj.num1 = BytesUtil.readByte1(bytes);
                obj.num2 = bytes.readUnsignedInt();
                break;
            case 2:
                obj.num1 = BytesUtil.readByte1(bytes);
                break;
            case 3:
                obj.num1 = bytes.readUnsignedInt();
                break;
            case 4:
                obj.num1 = bytes.readUnsignedInt();
                break;
            case 5:
                obj.num1 = BytesUtil.readByte2(bytes);
                break;
            case 6:
                obj.num1 = BytesUtil.readByte2(bytes);
                break;
            case 7:
                obj.num1 = BytesUtil.readByte1(bytes);
                break;
            case 8:
                obj.num1 = BytesUtil.readByte1(bytes);
                break;
            case 9:
                obj.num1 = BytesUtil.readByte1(bytes);
                break;
        }
        return obj;
    }

    public function get type():uint {
        return _type;
    }

    public function get got_money1():uint {
        return _got_money1;
    }

    public function get isopen():uint {
        return _isopen;
    }

    public function get grid_max():uint {
        return _grid_max;
    }

    public function get grid_curr():uint {
        return _grid_curr;
    }

    public function get up_money():uint {
        return _up_money;
    }

    public function get fee1():uint {
        return _fee1;
    }

    public function get fee2():uint {
        return _fee2;
    }

    public function get got_money2():uint {
        return _got_money2;
    }

    public function get lose_num():uint {
        return _lose_num;
    }

    public function get win_num():uint {
        return _win_num;
    }

//		public function get stationID() : int {
//			return _stationID;
//		}

    public function get updateArr():Array {
        return _updateArr;
    }
}
}
