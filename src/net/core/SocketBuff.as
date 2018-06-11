package net.core {
import utils.ByteArray;

import net.utils.BytesUtil;

import utils.Endian;

/**
 * socket数据缓冲区,数据包不完整的时候,等待数据完整。当出现多个数据包拼接在一起的时候,拆分成独立数据包
 */
public class SocketBuff {
    private var bufflength:int;
    private var ctrlBit:int;
    private var msgType:int;
    /**
     * 一个二维数组,msgList[x][0]为控制位内容,msgList[x][1]为消息类型,msgList[x][2]为消息体,若为多个数据包,返回数据包列表
     */
    private var msgList:Array;
    /**
     * 存储需要解析而没有被解析的内容
     */
    private var buffData:ByteArray;

    public function SocketBuff() {
    }

    /**
     * 将socket数据全部放入buffData再作处理,以保证数据完整
     * @param bytes
     *
     */
    public function addSocketData(bytes:ArrayBuffer):void {
        if (buffData == null) {
            buffData = new ByteArray();
            buffData.endian=Endian.LITTLE_ENDIAN;
        }
       // else {
            buffData.position = buffData.length;
            buffData.writeArrayBuffer(bytes);

          //  trace("addSocketData"+buffData.length);
            //trace(showbyte(bytes));
            //trace("--@--NetFrame.SocketBuff.addSocketData："+buffData.length);
       // }
    }

    public function showbyte(bytes:ByteArray, hex:int = 16):String {
        var position:int = bytes.position;
        bytes.position = 0;
        var lineNum:int = 0;
        var str:String = '';
        while (bytes.bytesAvailable) {
            str += (bytes.readUnsignedByte()).toString(hex) + "	";
            lineNum++;
            if (lineNum > 7) {
                lineNum = 0;
                str += '\n';
            }
        }
        bytes.position = position;
        return str;
    }

    /**
     * 将从socket接收到buffData中的数据解析成可用数据
     *
     * @return 返回数据包中各个独立的消息体
     *
     */
    public function getPackList():Array {
        if (!buffData) return null;

        buffData.position = 0;

        msgList = new Array();
        var msgBody:ByteArray;
        while (buffData.bytesAvailable > 0) {
            /*trace(buffData.readByte());
             trace(buffData.readByte());
             trace(buffData.readByte());
             trace(buffData.readByte());*/

            //var n:Number = buffData.readInt();
            //var n:Number = BytesUtil.readByte1(buffData);
            //buffData.read
            //trace(buffData.readShort());
            if (buffData.bytesAvailable < 4)
                return msgList;

            bufflength = BytesUtil.readByte2(buffData); //buffData.readUnsignedShort()&0xFFFF;
        //    trace("bufflength "+bufflength);
            ctrlBit = BytesUtil.readByte1(buffData);
            msgType = BytesUtil.readByte1(buffData);

            msgBody = BytesUtil.creatByteArray();
            var remainBody:ByteArray = BytesUtil.creatByteArray();

            if (buffData.bytesAvailable >= bufflength) {
                if (bufflength > 0) {
                    buffData.readBytes(msgBody, 0, bufflength);
                    buffData.readBytes(remainBody, 0, buffData.bytesAvailable);
                    buffData = remainBody;
                }
                msgList.push([ctrlBit, msgType, msgBody]);
            }
            else {
//					buffData.position = buffData.position-4;
//					buffData.readBytes(msgBody,0,buffData.bytesAvailable);
//					buffData = msgBody;
                buffData.position = 0;
                return msgList;
            }
        }
        buffData = null;

        return msgList;
    }

    public function get bytesAvailable():int {
        return buffData ? buffData.length : 0;
    }
}
}