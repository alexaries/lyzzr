/*******************************************************************************
 * Class name:    MailSend2Cmd.as
 * Description:
 * Author:        caoqingshan
 * Create:        Oct 25, 2012 4:35:15 PM
 * Update:        Oct 25, 2012 4:35:15 PM
 ******************************************************************************/
package net.data.sendCmd.mail {
//-----------------------------------------------------------------------------
// import_declaration
//-----------------------------------------------------------------------------
import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

public class MailSend2Cmd extends BaseCmd {
    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------
    /**目标玩家名*/
    public var target:String = "";
    /**标题*/
    public var title:String = "";
    /**内容*/
    public var content:String = "";
    /**物品ID  大于65535 装备流水号*/
    public var goodid:uint = 0;
    /**物品数量*/
    public var count:int = 0;
    //-----------------------------------------------------------------------------
    // Constructor
    //-----------------------------------------------------------------------------
    public function MailSend2Cmd() {
        this.msgType = MsgConst.MAIL_SEND;
    }

    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    override protected function createBody():void {
        try {
            BytesUtil.writeUserName(target, bodyBytes);
            this.bodyBytes.writeUTF(title);
            this.bodyBytes.writeUTF(content);
            this.bodyBytes.writeUnsignedInt(goodid);
            this.bodyBytes.writeByte(count);
        }
        catch (e:*) {

        }
    }
}
}