/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-7-28
 * Time: 上午10:11
 * To change this template use File | Settings | File Templates.
 */
package net.data.structs.active {
import utils.ByteArray;

import net.utils.BytesUtil;

public class FindTaStruct {
    public var proType:uint;
    public var type:uint;

    public var type1:uint;
    public var myInfo:Array;
    public var info:Array;//魅力值
    public var friendInfo:Array;

    public var rank:Array;

    public var list:Array;

    public var log:Array;

    public var animInfo:Array;

    public var ret:uint;

    public function FindTaStruct() {
    }

    public static function read(bytes:ByteArray):FindTaStruct {
        var struct:FindTaStruct = new FindTaStruct();
        var i:uint;
        var count:uint;
        var args:Array;
        try {
            bytes.position = 0;
            struct.proType = BytesUtil.readByte1(bytes);
            if (struct.proType == 0x12) {
                struct.type = bytes.readUnsignedByte();
                switch (struct.type) {
                    case 0x01:
                        struct.myInfo = [
                            bytes.readUnsignedInt(),
                            bytes.readUnsignedShort(),
                            bytes.readUnsignedInt(),
                            bytes.readUnsignedShort(),
                            bytes.readUTF()
                        ];
                        break;
                    case 0x02:
                        struct.type1 = bytes.readUnsignedByte();
                        struct.info = [
                            bytes.readUnsignedInt(),
                            bytes.readUnsignedShort(),
                            bytes.readUnsignedInt(),
                            bytes.readUnsignedShort()
                        ];
                        break;
                    case 0x03:
                        struct.list = [];
                        struct.rank = [[], [], [], []];
                        struct.type1 = bytes.readUnsignedByte();
                        count = bytes.readUnsignedByte();
                        for (i = 0; i < count; i++) {
                            args = [
                                bytes.readUnsignedShort(),
                                BytesUtil.readUserId(bytes),
                                BytesUtil.readUserName(bytes),
                                bytes.readUnsignedByte(),
                                bytes.readUnsignedInt(),
                                bytes.readUnsignedInt(),
                                bytes.readUnsignedByte()
                            ];
                            if (i < 4) {
                                struct.rank[i] = args;
                            } else {
                                struct.list.push(args);
                            }
                        }
                        break;
                    case 0x04:
                        struct.friendInfo = [
                            BytesUtil.readUserId(bytes),
                            bytes.readUnsignedInt(),
                            bytes.readUnsignedShort(),
                            bytes.readUnsignedInt(),
                            bytes.readUnsignedShort(),
                            bytes.readUTF(),
                            BytesUtil.readUserName(bytes)
                        ]
                        break;
                    case 0x11:
                        break;
                    case 0x12:
                        struct.ret = bytes.readUnsignedByte();
                        break;
                    case 0x13:
                        struct.log = [];
                        count = bytes.readUnsignedInt();
                        for (i = 0; i < count; i++) {
                            args = [
                                bytes.readUnsignedInt(),
                                BytesUtil.readUserName(bytes),
                                bytes.readUnsignedInt(),
                                bytes.readUnsignedByte()
                            ];
                            struct.log.push(args);
                        }
                        break;
                    case 0x14:
                        struct.animInfo = [
                            bytes.readUnsignedByte(),
                            bytes.readUTF(),
                            BytesUtil.readUserName(bytes)
                        ];
                        break;
                }
            }
        } catch (err:Error) {
        }
        return struct;
    }
}
}
