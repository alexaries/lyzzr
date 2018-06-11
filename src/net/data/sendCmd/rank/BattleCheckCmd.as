package net.data.sendCmd.rank {
import net.data.BaseCmd;
import net.data.structs.rank.BattleHeroStruct;
import net.events.MsgConst;

public class BattleCheckCmd extends BaseCmd {
    public function BattleCheckCmd() {
        super();
        this.msgType = MsgConst.BATTLE_CHECK;
    }

    private var _formation:int;
    private var _fighterData:Array;

    public function setFighterData(value:Array):void {
        _fighterData = value;
    }


    public function setFormation(value:int):void {
        _formation = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeShort(_formation);
            var len:int = _fighterData.length;
            bodyBytes.writeByte(len);
            for (var i:int = 0; i < len; i++) {
                var tempItem:BattleHeroStruct = _fighterData[i] as BattleHeroStruct;
                bodyBytes.writeUnsignedInt(tempItem.heroid);
                bodyBytes.writeByte(tempItem.pos);
            }

        } catch (e:*) {

        }
    }
}
}