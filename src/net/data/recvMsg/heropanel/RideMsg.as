/**
 * Created by huangcb on 2017/8/29.
 */
package net.data.recvMsg.heropanel {

import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

public class RideMsg extends BaseMsg {
    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------

    public var flag:uint = 0 ;
    public var lv:uint = 0 ;
    public var process:uint = 0 ;
    public var rideDatas:Array = [] ;
    public var swordFreeTime:int;
    public var rewards:Array;
    public function RideMsg() {
        super();
    }

    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    override public function byteArrayToMsg(bytes:ByteArray) : Boolean
    {
        try
        {
            flag = BytesUtil.readByte1(bytes);
            switch (flag){
                case 0:
                    lv = BytesUtil.readByte2(bytes);
                    process = bytes.readUnsignedInt();
                    var len:uint = BytesUtil.readByte1(bytes);
                    rideDatas = [] ;
                    for (var i:int = 0; i < len; i++) {
//                        rideDatas.push([BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes)]);
                        rideDatas.push([BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes),BytesUtil.readByte2(bytes)]);
                    }
                    break;
                case 1:
                    lv = BytesUtil.readByte2(bytes);
                    process = bytes.readUnsignedInt();
                    break;
                case 2:
                    rideDatas = [] ;
//                    rideData = [BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes)];
                    rideDatas = [BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes),BytesUtil.readByte1(bytes),BytesUtil.readByte2(bytes)];
                    break;
                case 3:
                    swordFreeTime=BytesUtil.readByte1(bytes);
                    break;
                case 4:
                    var count:uint = BytesUtil.readByte1(bytes);
                    rewards = [];
                    for(i = 0;i<count;i++)
                    {
                        var id:uint = bytes.readUnsignedInt();
                        var num:uint = bytes.readUnsignedShort();
                        rewards.push({itemid:id,itemNum:num,state:0});
                    }
                    break;
                default :
                    break;
            }

        }   catch(e:*){
        }
        return false ;
    }
}
}
