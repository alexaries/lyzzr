package net.data.structs.arena {
/**
 * 新历练
 * @author zhangyu
 *
 */
public class FightInfoStruct2 {
    //--------------------------------------------------------------------------
    //		Constructor
    //--------------------------------------------------------------------------
    public function FightInfoStruct2() {
    }

    public var userName:String;
    public var country:uint = 2;//默认值为2,表示还没有分阵营
    public var career:uint = 0;
    public var sex:uint = 0;
    public var level:uint = 0;
    public var canFight:uint = 0;
    public var color:uint = 0;
}
}