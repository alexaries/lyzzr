package net.data.structs.marriage {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.utils.BytesUtil;

public class PlayerStruct {
    public var id:BigInteger;
    public var name:String;
    public var color:uint;
    public var careerId:uint;
    public var sex:uint;
    public var lv:uint;
    public var server:uint;
    public var rank:uint;
    public var clan:String;
    public var fight:uint;
    public var sword:uint;
    public var token:TokenInfoStruct;
    public var heros:Array;
    public var pet:HeroInfoStruct;

    public function PlayerStruct() {
    }

    public static function read(bytes:ByteArray, v:PlayerStruct):PlayerStruct {
        var idBytes:ByteArray;
        idBytes = BytesUtil.creatByteArray();
        bytes.readBytes(idBytes, 0, 8);
        v.id = BytesUtil.readUint64(idBytes);
        v.name = BytesUtil.readUserName(bytes);
        v.lv = BytesUtil.readByte1(bytes);
        v.color = bytes.readByte();
        v.careerId = bytes.readByte() - 1;
        v.sex = bytes.readByte();
        v.server = bytes.readUnsignedShort();
        v.rank = bytes.readByte();
        v.clan = BytesUtil.readUserName(bytes);
        v.fight = bytes.readUnsignedInt();
        v.sword = bytes.readUnsignedInt();
        v.token = TokenInfoStruct.read(bytes, new TokenInfoStruct);
        var max:uint = bytes.readByte();
        v.heros = [];
        for (var i:uint = 0; i < max; i++) {
            v.heros[i] = HeroInfoStruct.read(bytes, new HeroInfoStruct);
        }
        max = bytes.readByte();
        if (max == 1) {
            v.pet = HeroInfoStruct.read(bytes, new HeroInfoStruct);
        }
        return v;
    }

    public static function write(bytes:ByteArray, v:PlayerStruct):ByteArray {
        BytesUtil.writeUint64(bytes, v.id);
        BytesUtil.writeUserName(v.name, bytes);
        bytes.writeByte(v.careerId);
        bytes.writeByte(v.color);
        bytes.writeByte(v.sex);
        bytes.writeUnsignedInt(v.server);
        bytes.writeByte(v.rank);
        bytes.writeUTF(v.clan);
        bytes.writeUnsignedInt(v.fight);
        bytes.writeUnsignedInt(v.sword);
        TokenInfoStruct.write(bytes, v.token);
        var max:uint = v.heros.length;
        for (var i:uint = 0; i < max; i++) {
            HeroInfoStruct.write(bytes, v.heros[i]);
        }
        HeroInfoStruct.write(bytes, v.pet);
        return bytes;
    }
}
}