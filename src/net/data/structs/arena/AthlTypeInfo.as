package net.data.structs.arena {
import utils.ByteArray;

import net.utils.BytesUtil;

dynamic public class AthlTypeInfo {
    //--------------------------------------------------------------------------
    //		Constructor
    //--------------------------------------------------------------------------
    public function AthlTypeInfo() {

    }

    public var athlDifficulty:int;
    public var athlCategory:int;
    public var state:int = 0;
    public var award:String = "";
    //--------------------------------------------------------------------------
    //		Variables
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //		Propertise
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //		Method
    //--------------------------------------------------------------------------
    public static function read(bytes:ByteArray):AthlTypeInfo {
        var info:AthlTypeInfo = new AthlTypeInfo();
        info.athlDifficulty = BytesUtil.readByte1(bytes);
        info.athlCategory = BytesUtil.readByte1(bytes);
        info.state = BytesUtil.readByte1(bytes);
        info.award = bytes.readUTF();
        return info;
    }

    //--------------------------------------------------------------------------
    //		Event Handler
    //--------------------------------------------------------------------------
    //--------------------------------------------------------------------------
    //		Private
    //--------------------------------------------------------------------------
}
}