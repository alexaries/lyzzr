package net.data.recvMsg.potencial {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.potential.HeroInfoStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x2C 潜力洗炼
 *
 */
public class RetreatMsg extends BaseMsg {
    public function RetreatMsg() {
        super();
    }

    public var type:uint;
    private var num:uint;
    public var heros:Array;
    public var hero:HeroInfoStruct;

    /**已经进入的次数*/
    public var goTimes:int;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            var heroInfoStruct:HeroInfoStruct;
            type = BytesUtil.readByte1(bytes);
            switch (type) {
                case 0:
                    num = BytesUtil.readByte1(bytes);
                    heros = [];
                    for (var i:uint = 0; i < num; i++) {
                        heroInfoStruct = new HeroInfoStruct;
                        heroInfoStruct.id = bytes.readUnsignedInt();
                        heroInfoStruct.type = BytesUtil.readByte1(bytes);
                        heroInfoStruct.time = bytes.readUnsignedInt();
                        heros.push(heroInfoStruct);
                    }
                    break;
                case 1:
                    heroInfoStruct = new HeroInfoStruct;
                    heroInfoStruct.id = bytes.readUnsignedInt();
                    heroInfoStruct.type = BytesUtil.readByte1(bytes);
                    heroInfoStruct.time = bytes.readUnsignedInt();
                    hero = heroInfoStruct;
                    break;
                case 2:
                    heroInfoStruct = new HeroInfoStruct;
                    heroInfoStruct.id = bytes.readUnsignedInt();
                    heroInfoStruct.type = BytesUtil.readByte1(bytes);
                    heroInfoStruct.time = 0;
                    if (heroInfoStruct.type == 0)
                        heroInfoStruct.time = bytes.readUnsignedInt();
                    hero = heroInfoStruct;
                    break;
                case 3:
                    goTimes = BytesUtil.readByte4(bytes);
                    break;

            }
        } catch (e:*) {
        }
        return true;
    }
}
}