/**
 * Created by dingcj on 2017/12/18.
 */
package net.data.recvMsg.tavern {
import net.data.BaseMsg;
import net.data.structs.tavern.TavernFighterStruct;
import net.utils.BytesUtil;

import utils.ByteArray;

public class TavernHireMsg extends BaseMsg {

    private var _type:int;
    private var _players:Array = [];

    public function TavernHireMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);

            _players = [];
            var cnt:int = BytesUtil.readByte1(bytes);
            for (var i = 0; i < cnt; i++) {
                var ps:TavernFighterStruct = new TavernFighterStruct();

                var id:int = bytes.readUnsignedShort();
                var has:int = BytesUtil.readByte1(bytes);
                ps.id = id;
                ps.has = has;

                _players.push(ps);
            }
        }
        catch (e:*) {
        }
    }

    public function get type():int {
        return _type;
    }

    public function get players():Array {
        return _players;
    }
}
}
