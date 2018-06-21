package net.data.structs.rank {
import com.game.vo.GernalHeroVO;

import globals.ConfigLocator;

public class BattleHeroStruct {
    public function BattleHeroStruct() {
    }

    private var _heroid:uint;
    private var _pos:uint;
    // 职业Id 根据职业Id取得相关职业的信息			其中0表示儒，1表示释，2表示道 3墨 8妖
    public var careerId:int;

    public function get pos():uint {
        return _pos;
    }

    public function set pos(value:uint):void {
        _pos = value;
    }

    public function get heroid():uint {
        return _heroid;
    }

    public function set heroid(value:uint):void {
        _heroid = value;
    }
}
}
