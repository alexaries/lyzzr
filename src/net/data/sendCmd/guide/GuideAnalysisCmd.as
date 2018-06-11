package net.data.sendCmd.guide {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author john
 */
public class GuideAnalysisCmd extends BaseCmd {
    public var type:uint = 0;
    public var chapter:String = "";
    public var step:String = "";

    public function GuideAnalysisCmd() {
        this.msgType = MsgConst.GUIDE_ANALYSIS;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeUTF(chapter);
            this.bodyBytes.writeUTF(step);
        } catch (e:*) {
        }
    }
}
}
