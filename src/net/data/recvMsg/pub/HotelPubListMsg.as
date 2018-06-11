package net.data.recvMsg.pub {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.pub.FighterDataStruct;

public class HotelPubListMsg extends BaseMsg {
    public var time:uint;
    public var refreshCount:uint;
    public var heros:Array;

    public function HotelPubListMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {

            time = bytes.readUnsignedShort();
            refreshCount = bytes.readUnsignedShort();
            heros = [];
            var fighterData:FighterDataStruct;
            var count:Number = 6;
            for (var i:uint = 0; i < count; i++) {
                fighterData = new FighterDataStruct();
                fighterData.id = bytes.readUnsignedShort();
                fighterData.price = bytes.readUnsignedInt();
                //fighterData.flag = 0;
                fighterData.flag = bytes.readByte();
                heros.push(fighterData);
            }

        }
        catch (e:*) {

        }
        return true;
    }
}
}