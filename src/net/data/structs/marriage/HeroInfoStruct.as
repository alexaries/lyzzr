package net.data.structs.marriage {
import utils.ByteArray;

import net.utils.BytesUtil;

public class HeroInfoStruct {
    public var name:String;
    public var lv:uint;
    public var color:uint;

    public function HeroInfoStruct() {
    }

    public static function read(bytes:ByteArray, v:HeroInfoStruct):HeroInfoStruct {
        v.name = BytesUtil.readUserName(bytes);
        v.lv = bytes.readByte();
        v.color = bytes.readByte();
        return v;
    }

    public static function write(bytes:ByteArray, v:HeroInfoStruct):ByteArray {
        bytes.writeUTF(v.name);
        bytes.writeByte(v.lv);
        bytes.writeByte(v.color);
        return bytes;
    }
}
}