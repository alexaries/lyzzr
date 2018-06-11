package net.data.recvMsg.copy {

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.copy.CopyRewardStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class FormationAutoMsg extends BaseMsg {
    public function FormationAutoMsg() {
        super();
    }

    private var _type:int;
    private var _fID:int;
    private var _debryID:int;
    private var _itemData:Array;
    private var _flag:int;
    private var _gold:int;
    private var _coupon:int;
    public var exp:Number = 0;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            _fID = BytesUtil.readByte1(bytes);
            _debryID = BytesUtil.readByte1(bytes);

            _itemData = [];

            switch (_type) {
                case 3:
                case 4:
                    var itemCount:int = BytesUtil.readByte1(bytes);
                    var obj:CopyRewardStruct;
                    for (var i:int = 0; i < itemCount; i++) {
                        obj = new CopyRewardStruct();
                        obj.itemId = BytesUtil.readByte2(bytes);
                        obj.itemNum = BytesUtil.readByte1(bytes);

                        _itemData.push(obj);
                    }
                    exp = BytesUtil.readBytes8(bytes);
                    break;
                case 6:
                    _flag = BytesUtil.readByte1(bytes);
                    _gold = BytesUtil.readByte2(bytes);
                    _coupon = BytesUtil.readByte2(bytes);
                    break;
                default:
            }
        } catch (e:*) {
        }
        return true;
    }

    public function get formationID():uint {
        return _fID;
    }

    public function get type():int {
        return _type;
    }

    public function get debryID():uint {
        return _debryID;
    }

    public function get itemData():Array {
        return _itemData;
    }

    public function get flag():uint {
        return _flag;
    }

    public function get gold():uint {
        return _gold;
    }

    public function get coupon():uint {
        return _coupon;
    }

}
}
