package net.data.structs.fight {
public class AttackerStruct {
    /**行动玩家id*/
    public var actPlayerId:Number = 0;
    /**
     * byte  攻击类型
     * 0 - 主攻
     * 1 - 合击协同者
     * 2 - 阵型技协同者
     * */
    public var atType:Number = 0;

    public var playerName:String;

    public function AttackerStruct() {

    }


}
}