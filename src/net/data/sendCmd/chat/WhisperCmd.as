package net.data.sendCmd.chat {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * (C->S) 0xF1 私聊
 */
public class WhisperCmd extends BaseCmd {
    private var _userId:BigInteger = BigInteger.nbv(0);
    private var _chatMsg:String = "";

    public function WhisperCmd() {
        this.msgType = MsgConst.WHISPER;
    }

    public function set chatMsg(value:String):void {
        _chatMsg = value;
    }

    public function set userId(value:BigInteger):void {
        _userId = value;
    }

    override protected function createBody():void {
        try {
//				BytesUtil.writeBytes8(this.bodyBytes,_userId)
            BytesUtil.writeUint64(this.bodyBytes, _userId);
            bodyBytes.writeUTF(_chatMsg);
        }
        catch (e:*) {

        }
    }
}
}