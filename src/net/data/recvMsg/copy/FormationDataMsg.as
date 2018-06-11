package net.data.recvMsg.copy {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class FormationDataMsg extends BaseMsg {
    private var _type:uint;
    private var _formationID:uint;
    private var _leftTime:uint;
    private var _debryData:Array;
    private var _result:uint;
    private var _flag:uint;
    private var _num:uint;
    private var _isUseHook:Boolean;

    public function FormationDataMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            var len:int;
            var i:int;
            switch (_type) {
                case 0:
                    _formationID = BytesUtil.readByte1(bytes);
                    _leftTime = BytesUtil.readByte1(bytes);
                    _isUseHook = bytes.readBoolean();
                    //_isUseHook = bytes.readUnsignedInt() == 1;//因为当时后台搞错 所以要发版本 这里改成32位
                    len = BytesUtil.readByte1(bytes);
                    _debryData = [];
                    for (i = 0; i < len; i++) {
                        _debryData.push({"flag": BytesUtil.readByte1(bytes), "num": BytesUtil.readByte1(bytes)});
                    }
                    break;
                case 1:
                    _formationID = BytesUtil.readByte1(bytes);
                    len = BytesUtil.readByte1(bytes);
                    if (len > 0) {
                        _debryData = [];
                        for (i = 0; i < len; i++) {
                            _debryData.push({"flag": BytesUtil.readByte1(bytes), "num": BytesUtil.readByte1(bytes)});
                        }
                    } else {
                        _debryData = null;
                    }
                    break;
                case 2:
                    _formationID = BytesUtil.readByte1(bytes);
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 3:
                    _leftTime = BytesUtil.readByte1(bytes);
                    break;
                case 4:
                    _formationID = BytesUtil.readByte1(bytes);
                    break;
                case 5:
                    _formationID = BytesUtil.readByte1(bytes);
                    _flag = BytesUtil.readByte1(bytes);
                    _num = BytesUtil.readByte1(bytes);
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

    public function get formationID():uint {
        return _formationID;
    }

    public function get leftTime():uint {
        return _leftTime;
    }

    public function get debryData():Array {
        return _debryData;
    }

    public function get result():uint {
        return _result;
    }

    public function get flag():uint {
        return _flag;
    }

    public function get num():uint {
        return _num;
    }

    public function get isUseHook():Boolean {
        return _isUseHook;
    }

}
}
