package net.data.structs.clan {
public class CDynamicInfoStruct {
    public function CDynamicInfoStruct() {
    }

    public var tag:int;

    /**
     * 0:人事
     * 1:城战
     * 2:技艺
     * 3:其他
     */
    public var type:int;
    public var time:uint;
    public var str1:String;
    public var str2:String;
    public var str3:String;
    public var str4:String;

    public var uint1:uint;
    public var uint2:uint;
    public var uint3:uint;
    public var preStr:String;
}
}