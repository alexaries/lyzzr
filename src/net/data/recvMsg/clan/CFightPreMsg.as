package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CFightPreMsg extends BaseMsg {
    private var _type:uint;
    private var _score:uint;
    private var _rank:uint;
    private var _status:uint;
    private var _time:uint;
    private var _isIn:uint;
    public var signNum:uint;
    public var atkName:String;
    private var _result:uint;
    private var _itemList:Array;
    public var clanIn:uint;
    private var _honour:uint;
    private var _lastrank:uint;
    public var caller:String;

    public var betObj:Object;

    public function CFightPreMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            var len:int;
            var i:int;
            switch (_type) {
                case 0:
                    _score = bytes.readUnsignedInt();
                    _honour = bytes.readUnsignedInt();
                    _lastrank = BytesUtil.readByte2(bytes);
                    _rank = BytesUtil.readByte2(bytes);
                    _status = BytesUtil.readByte1(bytes);
                    _time = bytes.readUnsignedInt();
                    _isIn = BytesUtil.readByte1(bytes);
                    signNum = BytesUtil.readByte1(bytes);
                    clanIn = BytesUtil.readByte1(bytes);
                    atkName = BytesUtil.readUserName(bytes);
                    break;
                case 1:
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 2:
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 3:
                    len = BytesUtil.readByte2(bytes);
                    _itemList = [];
                    for (i = 0; i < len; i++) {
                        var goodData:Object = new Object();
                        goodData.id = BytesUtil.readByte2(bytes);
                        goodData.nums = BytesUtil.readByte2(bytes);
                        _itemList.push(goodData);
                    }
                    break;
                case 4:
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 5:
                    _status = BytesUtil.readByte1(bytes);
                    _time = bytes.readUnsignedInt();
                    clanIn = BytesUtil.readByte1(bytes);
                    break;
                case 6:
                    _score = bytes.readUnsignedInt();
                    _honour = bytes.readUnsignedInt();
                    signNum = BytesUtil.readByte1(bytes);
                    break;
                case 8:
                    caller = BytesUtil.readUserName(bytes);
                    break;
                case 9:
                    redbetInfo(bytes);
                    break;
                default:
            }
        } catch (e:*) {

        }
        return true;
    }


    /**string clanName 帮派名
     short lastRank 上次排名
     short guessRank 预测排名
     byte awardType 奖励状态
     0 - 没有奖励
     1 - 猜对
     2 - 猜错
     byte awardStatus 奖励状态
     0 - 未领取
     1 - 已领取
     */
    private function  redbetInfo(bytes:ByteArray):void
    {
        if(betObj == null)
            betObj = new Object();
        var op:int = BytesUtil.readByte1(bytes);
        betObj.op = op;
        if(op == 0)
        {
//            betObj.clanName = bytes.readUTF();
            betObj.lastRank = BytesUtil.readByte2(bytes);
            betObj.guessRank = BytesUtil.readByte2(bytes);
            betObj.awardType = BytesUtil.readByte1(bytes);
            betObj.awardStatus = BytesUtil.readByte1(bytes);
        }else if(op == 1)
        {
            betObj.guessRank = BytesUtil.readByte2(bytes);
        }else if(op == 2)
        {
            betObj.awardStatus = BytesUtil.readByte1(bytes);
        }
    }

    public function get score():uint {
        return _score;
    }

    public function get type():uint {
        return _type;
    }

    public function get rank():uint {
        return _rank;
    }

    public function get status():uint {
        return _status;
    }

    public function get time():uint {
        return _time;
    }

    public function get isIn():uint {
        return _isIn;
    }

    public function get result():uint {
        return _result;
    }

    public function get itemList():Array {
        return _itemList;
    }

    public function get honour():uint {
        return _honour;
    }

    public function get lastrank():uint {
        return _lastrank;
    }
}
}
