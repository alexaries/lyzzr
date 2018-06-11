package net.data.sendCmd.soul {
import net.data.BaseCmd;
import net.events.MsgConst;

public class SoulnewCmd extends BaseCmd {
    public var type:uint;
    public var fighterId:int;		//散仙ID
    public var classType:int;		//元神类型： 1-青龙2-朱雀3-玄武
    public var itemNum:int;			//元神材料个数
    public var itemInfo:Array;		//物品信息
    public var itemId:int;			//物品ID
    public var bind:int;			//是否绑定： 0-非绑定1-绑定
    public var itemId1:int = 0;		//技能书ID：0-装备新技能，其他-将要替换的技能
    public var itemId2:int = 0;		//技能书ID：0-卸载，其他-将要装备的技能
    public var bindType:int = 0;	//是否绑定：0-非绑定1-绑定

    public function SoulnewCmd() {
        this.msgType = MsgConst.SOUL_SYSTEM;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            switch (type) {
                case 0x00:
                    bodyBytes.writeShort(fighterId);
                    break;
                case 0x01:
                    bodyBytes.writeShort(fighterId);
                    bodyBytes.writeByte(classType);
                    break;
                case 0x02:
                    bodyBytes.writeShort(fighterId);
                    break;
                case 0x03:
                    bodyBytes.writeShort(fighterId);
                    bodyBytes.writeShort(itemInfo.length);
                    for (var i:int = 0; i < itemInfo.length; i++) {
                        writeSoulnewStruct(itemInfo[i]);
                    }
                    break;
                case 0x04:
                    bodyBytes.writeShort(fighterId);
                    bodyBytes.writeShort(itemId1);
                    bodyBytes.writeShort(itemId2);
                    bodyBytes.writeByte(bindType);
                    break;
                default:
                    break;
            }
        }
        catch (error:Error) {

        }
    }

    private function writeSoulnewStruct(arr:Array):void {
        bodyBytes.writeShort(arr[0]);
        bodyBytes.writeByte(arr[1]);
    }
}
}