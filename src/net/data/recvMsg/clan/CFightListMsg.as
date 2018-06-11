package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.clan.CFightRankStruct;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class CFightListMsg extends BaseMsg {
    private var cfightList:Array;
    private var _all_len:int;
    private var _idx:int;

    public function CFightListMsg() {
        super();
    }

    public function getIdx():int {
        return _idx;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _all_len = BytesUtil.readByte2(bytes);
            _idx = BytesUtil.readByte2(bytes);
            var len:int = BytesUtil.readByte1(bytes);
            cfightList = [];
            var cfight:CFightRankStruct;
            for (var i:int = 0; i < len; i++) {
                cfight = readCFightRank(bytes);
                cfight.sort = i + _idx + 1;
                cfightList.push(cfight);
            }
        } catch (e:*) {

        }
        return true;
    }

    /**
     * 取得当前请求的 宗族数据
     * @return Array.&ltCFightRankStruct&gt
     * @see CFightRankStruct
     */
    public function getCFightList():Array {
        if (cfightList == null) {
            cfightList = [];
        }
        return cfightList;
    }

    /**
     * 取得数据的条数
     * @return
     *
     */
    public function getLen():int {
        return _all_len;
    }

    //读取的 一个静态   元素
    private function readCFightRank(bytes:ByteArray):CFightRankStruct {
        var item:CFightRankStruct = new CFightRankStruct();
        item.id = bytes.readUnsignedInt();
        item.name = BytesUtil.readUserName(bytes);
        item.gname = BytesUtil.readUserName(bytes);
        item.countryID = BytesUtil.readByte1(bytes);
        item.score = bytes.readUnsignedInt();
        return item;
    }
}
}
