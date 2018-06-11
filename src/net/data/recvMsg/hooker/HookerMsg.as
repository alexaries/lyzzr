/**
 * Created by dingcj on 2017/12/15.
 */
package net.data.recvMsg.hooker {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

public class HookerMsg extends BaseMsg {
    private var _type:int;
    private var _exp:int;
    private var _pexp:int;
    private var _eLeftTime:int;
    private var _pLeftTime:int;
    private var _cnt:int;
    private var _players:Array = [];
    private var _pos:int;
    private var _fgtId:int;

    public function HookerMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            switch (_type) {
                case 0:
                    _exp = bytes.readUnsignedInt();
                    _pexp = bytes.readUnsignedInt();
                    break;
                case 1:
                    _exp = bytes.readUnsignedInt();
                    _pexp = bytes.readUnsignedInt();
                    _eLeftTime = BytesUtil.readByte1(bytes);
                    _pLeftTime = BytesUtil.readByte1(bytes);
                    _cnt = BytesUtil.readByte1(bytes);
                    _players = [];
                    for (var i = 0; i < _cnt; i++) {
                        var id:uint = bytes.readUnsignedInt();
                        _players.push(id);
                    }
                    break;
                case 2:
                    _pos = BytesUtil.readByte1(bytes);
                    _fgtId = bytes.readUnsignedInt();
                    break;
                case 3:
                    _eLeftTime = BytesUtil.readByte1(bytes);
                    _pLeftTime = BytesUtil.readByte1(bytes);
                    break;
            }
        } catch (e:*) {

        }
    }

    public function get type():uint {
        return _type;
    }

    public function get exp():uint {
        return _exp;
    }

    public function get pexp():uint {
        return _pexp;
    }

    public function get eLeftTime():int {
        return _eLeftTime;
    }

    public function get pLeftTime():int {
        return _pLeftTime;
    }

    public function get players():Array {
        return _players;
    }

    public function get pos():int {
        return _pos;
    }

    public function get fgtId():int {
        return _fgtId;
    }
}
}
