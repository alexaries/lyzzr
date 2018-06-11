package net.data {
import utils.ByteArray;

import net.consts.StaticConfig;
import net.utils.BytesUtil;

public class BaseCmd {
    //---------------------------------消息头部内容定义------------------------------
    /**预留控制位*/
    private var _ctrlBit:Number = 0xFF;
    /**消息类型*/
    private var _msgType:Number = 0;
    //--------------------------------消息体内容定义--------------------------------
    /**消息体内容*/
    public var bodyBytes:ByteArray;
    /**发送到服务端的字节数据*/
    public var sendBytes:ByteArray;

    public function BaseCmd() {

    }

    /**
     * 把消息串拼接成ByteArray,通过socket发送到服务端
     * @return
     *
     */
    public function msgToByteArray():ByteArray {
        bodyBytes = BytesUtil.creatByteArray();
        sendBytes = BytesUtil.creatByteArray();
        createBody();
        //消息原始长度

        var msgLen:uint = bodyBytes.length;
        //todo  不加压缩
        /*
        if (bodyBytes.length > 64 || _msgType == 0x20 || _msgType == 0x21) {
            ctrlBit = 0xFE;
//				bodyBytes.deflate();
            bodyBytes.compress();
            sendBytes.writeShort(bodyBytes.length + 2);
            sendBytes.writeByte(StaticConfig.checkBit ^ 0x33);
            //消息体的长度,预留控制位
            sendBytes.writeByte(ctrlBit);
            //消息类型
            sendBytes.writeByte(msgType);
            sendBytes.writeShort(msgLen);
            //消息体
//				bodyBytes.position = int(Math.random()*bodyBytes.length);
//				bodyBytes.writeByte(int(Math.random()*255));
//				sendBytes.writeBytes(bodyBytes,0,bodyBytes.length);
            sendBytes.writeBytes(bodyBytes);
        }
        else {*/
            sendBytes.writeShort(bodyBytes.length);
            sendBytes.writeByte(StaticConfig.checkBit ^ 0x33);
            //消息体的长度,预留控制位
            sendBytes.writeByte(ctrlBit);
            //消息类型
            sendBytes.writeByte(msgType);
            //消息体
            sendBytes.writeBytes(bodyBytes);
       // }
        sendBytes.position = 0;
        return sendBytes;
    }

    protected function createBody():void {
        throw new Error("createBody must be override ");
    }

    //------------------------------以下是头部内容的getter setter----------------------
    /**
     * 获取或设置消息类型
     * @return
     *
     */
    public function get msgType():Number {
        return _msgType;
    }

    public function set msgType(value:Number):void {
        _msgType = value;
    }

    /**
     * 获取或设置控制位
     * @return
     *
     */
    public function get ctrlBit():Number {
        return _ctrlBit;
    }

    public function set ctrlBit(value:Number):void {
        _ctrlBit = value;
    }

}
}