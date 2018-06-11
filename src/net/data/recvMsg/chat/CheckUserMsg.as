package net.data.recvMsg.chat {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * (S->C) 0xF2 寻找玩家结果
 */
public class CheckUserMsg extends BaseMsg {
    /**
     *  玩家id，如果没找到则此字段为0
     */
    private var _userId:BigInteger = BigInteger.nbv(0);
    /**
     * 玩家名
     */
    private var _userName:String = "";
    /**
     * 国籍  (0:天族,1：魔族，2：中立)
     */
    private var _countryId:int = 0;
    /**
     *  性别(0:男，1:女)
     */
    public var sex:uint = 0;
    /**
     * 官职
     */
    public var office:uint = 0;
    /**
     * 守护者(副本守护
     * 0:不是守护者
     * 0x11表示对第一塔第一层守护.....
     * 0x21表示对第二塔的第一层守护.....
     * 0x31 表示对第三塔的第一层守护.....)
     */
    public var protectId:uint = 0;

    public function CheckUserMsg() {
        super();
    }

    public function get userId():BigInteger {
        return _userId;
    }

    public function set userId(value:BigInteger):void {
        _userId = value;
    }

    public function get userName():String {
        return _userName;
    }

    public function set userName(value:String):void {
        _userName = value;
    }

    public function get countryId():int {
        return _countryId;
    }

    public function set countryId(value:int):void {
        _countryId = value;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

            var idBytes:ByteArray = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes, 0, 8);
            userId = BytesUtil.readUint64(idBytes);//.readBytes8(bytes)
            userName = BytesUtil.readUserName(bytes);
            countryId = BytesUtil.readByte1(bytes);
            sex = BytesUtil.readByte1(bytes);
            office = BytesUtil.readByte2(bytes);
            protectId = BytesUtil.readByte1(bytes);

        return true;
    }

}
}