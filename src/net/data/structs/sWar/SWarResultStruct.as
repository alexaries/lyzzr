package net.data.structs.sWar {
/**
 * @author ryan
 */
public class SWarResultStruct {
    private var _win:int = -1;
    /**
     * 戰鬥結果
     */
    public var wins:Array = [];
    /**
     * 戰報ID
     */
    public var battleIds:Array = [];
    /**
     * 戰報结构
     */
    public var reports:Array = [];

    public function get win():int {
        if (_win < 0 && wins.length > 0) {
            var awinCounts:int = 0;
            for each (var i:int in wins) {
                if (!i)
                    awinCounts++;
            }
            if (awinCounts * 2 > wins.length) {
                _win = 0;
            } else {
                _win = 1;
            }
        }
        return _win;
    }
}
}
