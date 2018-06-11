package net.data.recvMsg.group {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.group.CopyInfoStruct;
import net.utils.BytesUtil;

/**
 * @author hokenny
 */
public class GroupCopyInfoMsg extends BaseMsg {
    public var count:uint;
    public var copys:Array;

    public function GroupCopyInfoMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        // try
        // {
        var copyInfo:CopyInfoStruct;
        count = BytesUtil.readByte1(bytes);
        copys = [];
        for (var i:uint = 0; i < count; i++) {
            copyInfo = new CopyInfoStruct();
            copyInfo.index = BytesUtil.readByte1(bytes);
            copyInfo.isPass0 = BytesUtil.readByte1(bytes);
            copyInfo.isPass1 = BytesUtil.readByte1(bytes);
            copyInfo.pass1 = BytesUtil.readByte1(bytes);
            copyInfo.pass2 = BytesUtil.readByte1(bytes);
            copys.push(copyInfo);
        }
        // }
        // catch(e:*)
        // {
        //
        // }
        return true;
    }
}
}
