package net.data.recvMsg.copy {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CopyDataMsg extends BaseMsg {
    private var _type:uint;
    private var _copyID:uint;
    private var _floorID:uint;
    private var _npcID:uint;
    private var _result:uint;
    private var _useTime:uint;
    private var _maxTime:uint;
    private var _duseTime:uint;
    private var _dmaxTime:uint;
    private var _vipUseTime:uint;
    private var _vipMaxTime:uint;
    private var _isUseHook:Boolean;

    public function CopyDataMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            switch (_type) {
                case 0:
                    _copyID = BytesUtil.readByte1(bytes);
                    _floorID = BytesUtil.readByte1(bytes);
                    _npcID = BytesUtil.readByte1(bytes);
                    _useTime = BytesUtil.readByte1(bytes);
                    _maxTime = BytesUtil.readByte1(bytes);
                    _duseTime = BytesUtil.readByte1(bytes);
                    _dmaxTime = BytesUtil.readByte1(bytes);
                    _vipUseTime = BytesUtil.readByte1(bytes);
                    _vipMaxTime = BytesUtil.readByte1(bytes);
                    _isUseHook = bytes.readBoolean();
                    break;
                case 1:
                    _copyID = BytesUtil.readByte1(bytes);
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 2:
                    _copyID = BytesUtil.readByte1(bytes);
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 3:
                    _copyID = BytesUtil.readByte1(bytes);
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 4:
                    _useTime = BytesUtil.readByte1(bytes);
                    _maxTime = BytesUtil.readByte1(bytes);
                    _duseTime = BytesUtil.readByte1(bytes);
                    _dmaxTime = BytesUtil.readByte1(bytes);
                    break;
                case 5:
                    _copyID = BytesUtil.readByte1(bytes);
                    break;
                case 6:
                    _copyID = BytesUtil.readByte1(bytes);
                    _floorID = BytesUtil.readByte1(bytes);
                    _npcID = BytesUtil.readByte1(bytes);
                    break;
                default:
            }
        } catch (e:*) {
        }
        return true;
    }

    public function get type():uint {
        return _type;
    }

    public function get copyID():uint {
        return _copyID;
    }

    public function get floorID():uint {
        return _floorID;
    }

    public function get npcID():uint {
        return _npcID;
    }

    public function get result():uint {
        return _result;
    }

    public function get useTime():uint {
        return _useTime;
    }

    public function get maxTime():uint {
        return _maxTime;
    }

    public function get duseTime():uint {
        return _duseTime;
    }

    public function get dmaxTime():uint {
        return _dmaxTime;
    }

    public function get vipUseTime():uint {
        return _vipUseTime;
    }

    public function get vipMaxTime():uint {
        return _vipMaxTime;
    }

    public function get isUseHook():Boolean {
        return _isUseHook;
    }

}
}
