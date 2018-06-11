package net.data.sendCmd {
import utils.ByteArray;

import net.data.BaseCmd;

/**
 *
 * @author Luna
 *
 */
public class DynamicCmd extends BaseCmd {
    //----------------------------------------------
    //		Variables
    //----------------------------------------------
    private var _body:ByteArray;
    //----------------------------------------------
    //		Constructor
    //----------------------------------------------
    public function DynamicCmd(msgType:uint, body:ByteArray = null) {
        super();
        this.msgType = msgType;
        _body = body;
        //_body.endian = Endian.LITTLE_ENDIAN;

    }

    override protected function createBody():void {
        if (_body != null) {
            this.bodyBytes = _body;
        }
    }

    //----------------------------------------------
    //		Get	Set
    //----------------------------------------------

}


}