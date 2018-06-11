package net.data.sendCmd.user {
import net.data.BaseCmd;
import net.data.structs.user.RankFlagInfo;
import net.events.MsgConst;

public class StarsCmd extends BaseCmd {
    /***
     * 0 察看阵封 星辰信息
     * 1宝石镶嵌
     * 2宝石拆卸
     * 3转化
     * 4升级
     *
     *
     * */
    public var type:uint;
    public var heroId:uint;
    public var gemId:uint;
    public var gem_bind:uint;
    public var pos:uint;
    public var rank_list:Array;

    public function StarsCmd() {
        this.msgType = MsgConst.USER_STARS;
    }

    override protected function createBody():void {
        try {
            var len:uint;
            var item:RankFlagInfo;
            bodyBytes.writeByte(type);
            bodyBytes.writeShort(heroId);
            switch (type) {
                case 0:
                    break;
                case 1:
                    bodyBytes.writeShort(gemId);
                    bodyBytes.writeByte(gem_bind);
                    bodyBytes.writeByte(pos);
                    break;
                case 2:
                    bodyBytes.writeByte(pos);
                    break;
                case 3:
                    len = rank_list.length;
                    bodyBytes.writeByte(len);
                    for (var i:uint = 0; i < len; i++) {
                        item = rank_list[i];
                        bodyBytes.writeShort(item.id);
                        bodyBytes.writeUnsignedInt(item.num);
                        bodyBytes.writeByte(item.bind);
                    }
                    break;
                case 4:
                    break;
                case 5:
                    break;
                case 6:
//						bodyBytes.writeShort(gemId);
//						bodyBytes.writeByte(gem_bind);
                    break;
                case 7:
                    break;
            }
        }
        catch (e:*) {

        }

    }
}
}