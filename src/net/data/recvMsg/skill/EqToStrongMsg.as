
package net.data.recvMsg.skill
{
import net.utils.BytesUtil;
import net.data.BaseMsg;

import utils.ByteArray;

/**
 * 装备强化消息<br>
 * (S->C)0x40
 * @author RyanCao
 *
 */
public class EqToStrongMsg extends BaseMsg
{
    public function EqToStrongMsg()
    {
        super();
    }

    private var _fighterId:int ;
    private var _result:int ;
    private var _itemID:Number ;
    public var success:uint;
    public var failed:uint;
    public var bless:uint = 0;//祝福值

    public function get itemID():Number
    {
        return _itemID;
    }

    public function get fighterId():uint
    {
        return _fighterId;
    }

    public function get result():int
    {
        return _result;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean{
        try{
            _result = BytesUtil.readByte1(bytes);
            _fighterId = BytesUtil.readByte2(bytes);
            _itemID = BytesUtil.readBigInt(bytes);
            bless = bytes.readUnsignedShort();
            success =  BytesUtil.readByte2(bytes);
            failed =  BytesUtil.readByte2(bytes);
        }catch(e:*){

        }
        return true;
    }
}
}

