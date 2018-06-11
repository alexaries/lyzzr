package net.data.structs.carrer {
/**
 * @author ryan
 */
public class CarrerResultStruct {
    private var _win:int = -1;


    /**
     * 戰鬥結果
     */
    public var wins:Array = [];
    /**
     * 戰報ID
     */
    public var battleIds:Array = [];


    public var players:Array = [];

    /**
     *
     * @return
     *
     */
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


    public function get winner():CarrerPStruct {
        var p:CarrerPStruct
        if (players && win > -1) {
            p = players[win]
        } else {
            p = players[0]
        }

        return p;
    }

    public function get finished():Boolean {
        if (wins.length >= 3)
            return true;

        return false;
    }

    public function get valid():Boolean {
        for each (var i:int in battleIds) {
            if (i > 0)
                return true
        }
        return false;
    }
}
}
