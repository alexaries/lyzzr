/**
 * Created by huangcb on 2017/8/21.
 */
package net.data.recvMsg.heartghost {
import net.data.BaseMsg;

import utils.ByteArray;
//心魔
public class HeartGhostMsg  extends  BaseMsg{
    public var heart:int;
    public var fighterID:int;
    public var totalExp:int;
    public var type:uint;
    public var times:int;
    public var herosExp:ByteArray;
    public function HeartGhostMsg() {
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type= bytes.readUnsignedByte();
        //扩展协议
        switch(type)
        {
            case 0:
                heart = bytes.readUnsignedInt();
                herosExp =bytes;
                break;
            case 1:
                fighterID = bytes.readUnsignedShort();

                 totalExp = bytes.readUnsignedInt();

                break;
            case 2:
                fighterID = bytes.readUnsignedShort();
                times = bytes.readUnsignedByte();

               totalExp = bytes.readUnsignedInt();

                break;
            case 3:
                fighterID = bytes.readUnsignedShort();
               totalExp = bytes.readUnsignedInt();
                break;
            case 4:
                heart = bytes.readUnsignedInt();
                break;
        }

        return super.byteArrayToMsg(bytes);
    }
}
}
