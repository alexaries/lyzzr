package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.clan.CDepotRecordStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CDepotRecordMsg extends BaseMsg {
    public function CDepotRecordMsg() {
        super();
    }

    private var crecordList:Array;
    private var _all_len:int;
    private var _idx:int;
    public var type:int;

    private var money_all_len:int;
    private var money_idx:int;
    /**
     *资金列表
     */
    public var cmoneyList:Array;

    public function getIdx():int {
        return _idx;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            var cfight:CDepotRecordStruct;
            var len:int
            if (type == 0) {
                _all_len = BytesUtil.readByte2(bytes);
                _idx = BytesUtil.readByte2(bytes);
                len = BytesUtil.readByte1(bytes);
                crecordList = [];
                for (var i:int = 0; i < len; i++) {
                    cfight = readCDepotRecord(bytes);
                    crecordList.push(cfight);
                }
            } else if (type == 1) {
                money_all_len = BytesUtil.readByte2(bytes);
                money_idx = BytesUtil.readByte2(bytes);
                len = BytesUtil.readByte1(bytes);
                cmoneyList = [];

                for (i = 0; i < len; i++) {
                    cfight = readMoneyList(bytes);
                    cmoneyList.push(cfight);
                }
            }
        } catch (e:*) {

        }
        return true;
    }

    /**
     * 取得当前请求的 宗族数据
     * @return Array.&ltgetCRecordList&gt
     * @see CDepotRecordStruct
     */
    public function getCRecordList():Array {
        if (crecordList == null) {
            crecordList = [];
        }
        return crecordList;
    }

    /**
     * 取得数据的条数
     * @return
     *
     */
    public function getLen():int {
        return _all_len;
    }

    public function getMoneylen():int {
        return money_all_len;
    }

    //读取的 一个静态   元素
    private function readCDepotRecord(bytes:ByteArray):CDepotRecordStruct {
        var item:CDepotRecordStruct = new CDepotRecordStruct();
        item.type = BytesUtil.readByte1(bytes);
        item.time = bytes.readUnsignedInt();
        item.pName = BytesUtil.readUserName(bytes);
        item.preStr = bytes.readUTF();
        return item;
    }

    private function readMoneyList(bytes:ByteArray):CDepotRecordStruct {
        var item:CDepotRecordStruct = new CDepotRecordStruct();
        item.moneyName = BytesUtil.readUserName(bytes);
        item.moneyTotype = BytesUtil.readByte1(bytes);
        item.moneyType = BytesUtil.readByte1(bytes);
        item.moneyNum = bytes.readUnsignedInt();
        item.moneyTime = bytes.readUnsignedInt();
        return item;
    }
}
}
