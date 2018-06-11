package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.clan.ClanListItemStruct;
import net.utils.BytesUtil;

/**
 * 消息协议  0x90
 * @author RyanCao
 *
 */
public class ClanReqListMsg extends BaseMsg {
    private var _flag:uint;

    public function ClanReqListMsg() {
        super();
    }

    private var clanItemList:Array;

    private var _all_len:int;
    private var _idx:int;

    public function getIdx():int {
        return _idx;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            //_flag = BytesUtil.readByte1(bytes);
            _all_len = BytesUtil.readByte2(bytes);
            _idx = BytesUtil.readByte2(bytes);

            var len:int = BytesUtil.readByte1(bytes);

            var clanitem:ClanListItemStruct;

            clanItemList = new Array();

            for (var i:int = 0; i < len; i++) {
                clanitem = readClanElement(bytes);
                clanItemList.push(clanitem);
            }

        } catch (e:*) {

        }
        return true;
    }

    /**
     * 取得当前请求的 宗族数据
     * @return Array.&ltClanListItemStruct&gt
     * @see ClanListItemStruct
     */
    public function getReqClanList():Array {
        if (clanItemList == null) {
            clanItemList = new Array();
        }
        return clanItemList;
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
    private function readClanElement(bytes:ByteArray):ClanListItemStruct {
        var clanitem:ClanListItemStruct = new ClanListItemStruct();

        clanitem.id = bytes.readUnsignedInt();
        clanitem.name = BytesUtil.readUserName(bytes);
        clanitem.gname = BytesUtil.readUserName(bytes);
        clanitem.countryID = BytesUtil.readByte1(bytes);
        clanitem.level = BytesUtil.readByte1(bytes);
        clanitem.count = BytesUtil.readByte1(bytes);
        clanitem.count_max = BytesUtil.readByte1(bytes);
        //clanitem.platform	= BytesUtil.readByte1(bytes);

        return clanitem;
    }

    public function get flag():uint {
        return _flag;
    }
}
}