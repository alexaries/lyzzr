package net.data.structs.practice {
/**
 * 正在修炼的玩家数据
 */
public class PracticeStruct {
    public static const PROTECT_NO:uint = 0;
    public static const PROTECT_SILVER:uint = 1;
    public static const PROTECT_GOLD:uint = 2;

    public var index:uint = 0;
    public var userName:String = "";
    /**阵营: 0-峨嵋，1-昆仑，2-中立*/
    public var country:uint = 0;
    public var career:uint = 0;
    public var sex:uint = 0;
    public var level:uint = 0;
    public var protectType:uint = 0;
    public var time:uint = 0;

    public function PracticeStruct() {

    }
}
}
