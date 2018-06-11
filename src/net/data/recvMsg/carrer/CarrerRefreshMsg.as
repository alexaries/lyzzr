/*******************************************************************************
 ******************************************************************************/
package net.data.recvMsg.carrer {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.carrer.CarrerReportDataStruct;
import net.utils.BytesUtil;

//-----------------------------------------------------------------------------
// import_declaration
// -----------------------------------------------------------------------------


public class CarrerRefreshMsg extends BaseMsg {
    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------
    public var match:uint;
    public var phase:uint;
    public var report:CarrerReportDataStruct;
    //-----------------------------------------------------------------------------
    // Constructor
    //-----------------------------------------------------------------------------


    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            match = BytesUtil.readByte1(bytes);
            phase = BytesUtil.readByte1(bytes);
            if (phase == 1) {
                readReportData(bytes);
            }
        } catch (e:*) {

        }
        return true;
    }

    private function readReportData(bytes:ByteArray):* {
        report = new CarrerReportDataStruct();
        if (bytes) {
            //var tempbyte : int = BytesUtil.readByte1(bytes);
            report.titleFlag = match - 1;
            report.bflag = 0;
            report.group = BytesUtil.readByte1(bytes) + 1;
            report.result = BytesUtil.readByte1(bytes);

            if (report.result == 2) {
                report.result = 1;
            }

            report.portrait = BytesUtil.readByte2(bytes);
            report.reportID = bytes.readUnsignedInt();
            // report.lv = BytesUtil.readByte1(bytes);
            report.fightName = BytesUtil.readUserName(bytes);

        }

    }

}
}