package net.data.structs.fight {
public class PlayerStruct {
    /**作用角色id **/
    public var charID:uint;
    /**技能效果，0为过期**/
    public var skillID:uint;
    /**改变属性类型**/
    public var type:uint;
    public var value:uint;

    public function PlayerStruct() {
    }
}
}