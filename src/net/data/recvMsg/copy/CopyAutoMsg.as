package net.data.recvMsg.copy {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.copy.CopyRewardStruct;
import net.utils.BytesUtil;

/**
 * 自动通天塔战斗返回
 * @author ryan
 */
public class CopyAutoMsg extends BaseMsg {
    private var _type:int;
    private var _copyID:uint;
    private var _floorID:uint;
    private var _npcID:uint;
    private var _itemData:Array;
    private var _flag:uint;
    private var _gold:uint;
    private var _coupon:uint;
    public var exp:Number;

    public function CopyAutoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            _copyID = BytesUtil.readByte1(bytes);
            _floorID = BytesUtil.readByte1(bytes);
            _npcID = BytesUtil.readByte1(bytes);

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

    public function get copyID():uint {
        return _copyID;
    }

    public function get type():int {
        return _type;
    }

    public function get npcID():uint {
        return _npcID;
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

    public function get floorID():uint {
        return _floorID;
    }
}
}
