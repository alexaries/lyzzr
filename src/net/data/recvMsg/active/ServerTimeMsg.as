/*******************************************************************************
 * Class name:    ServerTimeMsg.as
 * Description:    服务器时间
 * Author:        caoqingshan
 * Create:        Sep 13, 2012 11:45:24 AM
 * Update:        Sep 13, 2012 11:45:24 AM
 ******************************************************************************/
package net.data.recvMsg.active {
//-----------------------------------------------------------------------------
// import_declaration
//-----------------------------------------------------------------------------
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class ServerTimeMsg extends BaseMsg {
    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------
    /**
     * type = 1 服务器当前时间<br>
     * type = 2 角色创建时间<br>
     * type = 3 角色回流时间<br>
     */
    public var type:uint;
    public var time:uint;

    //-----------------------------------------------------------------------------
    // Constructor
    //-----------------------------------------------------------------------------
    public function ServerTimeMsg() {
        super();
    }

    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        type = BytesUtil.readByte1(bytes);
        time = bytes.readUnsignedInt();

        return true;
    }
}
}