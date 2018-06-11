package net.data.recvMsg.chat {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.chat.ChatStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0xF0 接收聊天
 */
public class ChatMsg extends BaseMsg {
    private var _chatVO:ChatStruct;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _chatVO = new ChatStruct();
            _chatVO.type = BytesUtil.readByte1(bytes);
            _chatVO.name = BytesUtil.readUserName(bytes);
            _chatVO.vipLevel = BytesUtil.readByte1(bytes);
            _chatVO.countryId = BytesUtil.readByte1(bytes);
            _chatVO.gender = BytesUtil.readByte1(bytes);
            //测试
            /*_chatVO.officeId = BytesUtil.readByte1(bytes);*/
            _chatVO.officeId = BytesUtil.readByte2(bytes);
            _chatVO.platform = BytesUtil.readByte1(bytes);
            _chatVO.bodymsg = bytes.readUTF();
            _chatVO.level = BytesUtil.readByte1(bytes);
            _chatVO.isCoupleId = BytesUtil.readByte1(bytes);
            _chatVO.isHideTitle = BytesUtil.readByte1(bytes);
        } catch (e:*) {
            bytes.position = 0;
            _chatVO = new ChatStruct();
            _chatVO.type = BytesUtil.readByte1(bytes);
            _chatVO.name = BytesUtil.readUserName(bytes);
            _chatVO.vipLevel = BytesUtil.readByte1(bytes);
            _chatVO.countryId = BytesUtil.readByte1(bytes);
            _chatVO.gender = BytesUtil.readByte1(bytes);
            /*测试*/
            /*_chatVO.officeId = BytesUtil.readByte1(bytes);*/
            _chatVO.officeId = BytesUtil.readByte2(bytes);
            _chatVO.platform = BytesUtil.readByte1(bytes);
            _chatVO.bodymsg = bytes.readUTF();
        }

        return true;
    }

    public function getChatVO():ChatStruct {
        return this._chatVO;
    }
}
}