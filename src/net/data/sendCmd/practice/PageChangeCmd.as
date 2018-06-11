package net.data.sendCmd.practice {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * @author hokenny
 */
public class PageChangeCmd extends BaseCmd {
    /**0:昆仑山,1:黄山,2:武当山,3:九华山,4:衡山,5:喜马拉雅山*/
    public var type:uint = 0;
    /**当前索引页*/
    public var pageIndex:uint = 0;
    /**一页请求数量*/
    public var pageNum:uint = 0;

    public function PageChangeCmd() {
        this.msgType = MsgConst.PRACTICE_PAGE_CHANGE;
    }

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(type);
            this.bodyBytes.writeByte(pageIndex);
            this.bodyBytes.writeByte(pageNum);
        }
        catch (e:*) {

        }
    }

}
}
