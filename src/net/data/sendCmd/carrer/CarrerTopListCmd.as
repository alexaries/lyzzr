/*******************************************************************************
 * Class name:    SWarTopListCmd.as
 * Description:
 * Author:        caoqingshan
 * Create:        Aug 17, 2012 5:55:32 PM
 * Update:        Aug 17, 2012 5:55:32 PM
 ******************************************************************************/
package net.data.sendCmd.carrer {
//-----------------------------------------------------------------------------
// import_declaration
//-----------------------------------------------------------------------------
import net.data.BaseCmd;
import net.events.MsgConst;

public class CarrerTopListCmd extends BaseCmd {
    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------
    public var flag:uint;
    public var id:uint;
    //-----------------------------------------------------------------------------
    // Constructor
    //-----------------------------------------------------------------------------
    public function CarrerTopListCmd() {
        super();
        msgType = MsgConst.CARRER;
        flag = 0x02;
    }

    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    override protected function createBody():void {
        try {
            bodyBytes.writeByte(flag);
            bodyBytes.writeByte(id);
        }
        catch (error:Error) {

        }
    }
}
}