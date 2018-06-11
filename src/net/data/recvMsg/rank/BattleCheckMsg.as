package net.data.recvMsg.rank {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.rank.BattleHeroStruct;
import net.utils.BytesUtil;

/**
 * S->C 协议类型 0x1e
 * @author RyanCao
 *
 */
public class BattleCheckMsg extends BaseMsg {
    public function BattleCheckMsg() {
        super();
    }

    private var _flag:int;
    private var _formation:uint;
    private var _count:uint;
    private var _fighterData:Array;

    /**
     当前阵型是第几套
     1,2,3
     * @return
     *
     */
    public function get flag():int {
        return _flag;
    }

    public function get fighterData():Array {
        return _fighterData;
    }

    public function get count():uint {
        return _count;
    }

    public function get formation():uint {
        return _formation;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            //_flag = BytesUtil.readByte1(bytes);
            _formation = BytesUtil.readByte2(bytes);
            _count = BytesUtil.readByte1(bytes);
            _fighterData = new Array();
            for (var i:int = 0; i < _count; i++) {
                var battle_s:BattleHeroStruct = new BattleHeroStruct();
                battle_s.heroid = bytes.readUnsignedInt();
                battle_s.pos = BytesUtil.readByte1(bytes);
                _fighterData.push(battle_s);
            }

        } catch (e:*) {

        }
        return true;
    }
}
}