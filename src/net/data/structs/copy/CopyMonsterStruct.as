package net.data.structs.copy {
/**
 * 副本怪物
 * @author RyanCao
 *
 */
public class CopyMonsterStruct {
    public function CopyMonsterStruct() {
    }

    public var monsterId:int;
    private var _monsterNum:int;
    private var _maxNum:int;
    private var _minNum:int;

    public function get minNum():int {
        return _minNum;
    }

    public function get maxNum():int {
        return _maxNum;
    }

    public function set monsterNum(value:int):void {
        _monsterNum = value;
        _maxNum = value >> 4;
        _minNum = value & 0x0f;
        if (_maxNum == 0) {
            _maxNum = _minNum;
        }
    }

}
}