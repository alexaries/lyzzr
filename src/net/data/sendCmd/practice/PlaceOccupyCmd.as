package net.data.sendCmd.practice {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class PlaceOccupyCmd extends BaseCmd {
    /**0:昆仑山,1:黄山,2:武当山,3:九华山,4:衡山,5:喜马拉雅山,6:无主之地*/
    public var type:uint = 0;
    /**当前索引位置*/
    public var numIndex:uint = 0;
    /**修炼时间类型,0:8小时,1:24小时*/
    public var timeType:uint = 0;
    /**保护类型,0:不需保护,1:护法弟子,2:仙府禁法*/
    public var protectType:uint = 0;

    public function PlaceOccupyCmd() {
        this.msgType = MsgConst.PLACE_OCCUPY;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeByte(numIndex);
            this.bodyBytes.writeByte(timeType);
            this.bodyBytes.writeByte(protectType);
        }
        catch (e:*) {

        }
    }
}
}
