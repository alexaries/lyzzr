package net.data.recvMsg.active {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class ActivityXmasMsg extends BaseMsg {
    private var _type:uint = 0;

    /** 七夕活动的类型*/
    private var _snowType:uint = 0;
    private var _sltype:uint = 0;
    private var _sllover:String = "";
    private var _slbind:uint = 0;
    private var _slpos:uint = 0;
    private var _slevent:uint = 0;

    private var _slplace:uint = 0;
    private var _slcount:uint = 0;
    private var _slLoverArr:Array;
    private var _slSetLover:uint = 0;
    private var _slrankNum:int = 0;


    public var score:int;
    /**
     * 充值 还是 消费
     */
    public var rankType:uint = 0;
    /**
     * 0全部排行
     * 1排行更新
     * 2我的排行
     */
    public var rankOptType:uint;
    /**
     *排行数据
     */
    public var rankData:Array;
    /**
     * 排行更新数据
     */
    public var rankChangeItem:Array;
    /**
     * 自身排行等级
     */
    public var rankOwnerInfo:Array;
    public var flag:uint;

    public function ActivityXmasMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        _snowType = BytesUtil.readByte1(bytes);
        if (_snowType == 0x01) {
            _sltype = BytesUtil.readByte1(bytes);
            if (_sltype == 1) {
                _sllover = BytesUtil.readUserName(bytes);
                score = bytes.readUnsignedInt();
                _slbind = BytesUtil.readByte1(bytes);
                _slpos = BytesUtil.readByte4(bytes);


            } else if (_sltype == 2) {
                _slplace = bytes.readUnsignedInt();
                score = bytes.readUnsignedInt();
                _slcount = BytesUtil.readByte1(bytes);
                _slLoverArr = [];
                for (var i:int = 0; i < _slcount; i++) {
                    var loverObj:Object = new Object();
                    loverObj.lN1 = BytesUtil.readUserName(bytes);
                    loverObj.lN12 = BytesUtil.readUserName(bytes);
                    loverObj.Score = bytes.readUnsignedInt();
                    _slLoverArr.push([loverObj.lN1, loverObj.lN12, loverObj.Score]);
                }
            }

        } else if (_snowType == 0x02) {
            _slSetLover = BytesUtil.readByte1(bytes);
        } else if (_snowType == 0x03) {
            flag = BytesUtil.readByte1(bytes);
        } else if (_snowType == 0x04) {
            flag = BytesUtil.readByte1(bytes);

        }


        return true;
    }

    public function get type():uint {
        return _type;
    }

    public function get snowType():uint {
        return _snowType;
    }

    public function get slLoverArr():Array {
        return _slLoverArr;

    }

    public function get sltype():uint {
        return _sltype;
    }

    public function get sllover():String {
        return _sllover;
    }

    public function get slbind():uint {
        return _slbind;
    }

    public function get slpos():uint {
        return _slpos;
    }

    public function get slevent():uint {
        return _slevent;
    }


    public function get slplace():uint {
        return _slplace;
    }

    public function get slcount():uint {
        return _slcount;
    }

    public function get slSetLover():uint {
        return _slSetLover;
    }

    public function get slrankNum():int {
        return _slrankNum;
    }


}
}