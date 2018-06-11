package net.data.sendCmd.practice {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class PlaceRobCmd extends BaseCmd {
    /**0:昆仑山,1:黄山,2:武当山,3:九华山,4:衡山,5:喜马拉雅山*/
    public var type:uint = 0;
    /**当前索引位置*/
    public var numIndex:uint = 0;
    /**玩家名*/
    public var userName:String = "";

    public function PlaceRobCmd() {
        this.msgType = MsgConst.PLACE_ROB;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeByte(numIndex);
            this.bodyBytes.writeUTF(userName);
        }
        catch (e:*) {

        }
    }
}
}
