package net.data.structs.ctwar {
/**
 * 国战中玩家动态的数据
 * @author RyanCao
 *
 */
public class CTDynamicStruct {
    public function CTDynamicStruct() {
    }

    /**
     *  0 - 新玩家进入国战<br>
     *  1 - 国战内玩家退出国战<br>
     *  2 - 国战轮空<br>
     *  3 - 国战战斗<br>
     *  4 - 国战战斗(一血)<br> <br>
     *
     * type=0玩家变为休息状态<BR>
     * type=1玩家离开列表<BR>
     * type=2玩家变为休息状态<BR>
     * type为3/4时<BR>
     * win玩家变为休息状态，lose玩家离开国战
     */
    public var type:int;
    public var winCountryID:int;
    private var _pos:int;

    /**
     * type为0/1时<br>
     * type=0玩家变为休息状态
     * <br>type=1玩家离开列表
     */
    public var winName:String;
    public var winFreak:int;
    public var winScore:int;

    public var loseName:String;
    public var loseFreak:int;

    /**
     * type为0/1/2时为玩家所在侧<br><br>
     * type为3/4时为胜利方玩家所在侧 <br>
     * 0x00/0x01/0x10/0x11<br>
     * 40-59天族/60-80天族/40-59魔族/60-80魔族
     */
    public function get pos():int {
        return _pos;
    }

    /**
     * @private
     */
    public function set pos(value:int):void {
        _pos = value;
        winCountryID = _pos >> 6;
    }

}
}