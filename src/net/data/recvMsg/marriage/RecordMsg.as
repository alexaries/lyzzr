package net.data.recvMsg.marriage {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class RecordMsg extends BaseMsg {
    public var type:uint;
    public var total:uint;
    public var page:uint;
    public var list0:Array = [];
    public var list1:Array = [];
    public var list2:Array = [];

    public function RecordMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            var idBytes:ByteArray;
            var id:BigInteger;
            var name:String;
            var i:uint;
            var max:uint;
            type = BytesUtil.readByte1(bytes);
            total = bytes.readUnsignedShort();
            page = bytes.readUnsignedShort();
            max = BytesUtil.readByte1(bytes);
            switch (type) {
                case 0:
                    list0 = [];
                    for (i = 0; i < max; i++) {
                        name = BytesUtil.readUserName(bytes);
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        id = BytesUtil.readUint64(idBytes);
                        list0[i] = [name,
                            id,
                            bytes.readByte(),
                            bytes.readByte()];
                    }
                    break;
                case 1:
                    list1 = [];
                    for (i = 0; i < max; i++) {
                        name = BytesUtil.readUserName(bytes);
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        id = BytesUtil.readUint64(idBytes);
                        list1[i] = [name,
                            id,
                            bytes.readByte(),
                            bytes.readByte()];
                    }
                    break;
                case 2:
                    list2 = [];
                    for (i = 0; i < max; i++) {
                        list2[i] = [
                            bytes.readUnsignedInt(),
                            BytesUtil.readUserName(bytes),
                            bytes.readByte(),
                            BytesUtil.readUserName(bytes),
                            bytes.readByte(),
                            bytes.readByte()
                        ];
                    }
                    break;
            }

        } catch (e:*) {

        }
        return true;
    }
}
}
