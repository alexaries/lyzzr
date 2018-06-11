package net.data.recvMsg.user {

import utils.ByteArray;

import lang.LangArrayTxt;

import net.data.BaseMsg;
import net.data.structs.user.TitleStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x15 个人信息改变
 */
public class StateMsg extends BaseMsg {
    /**
     * 改变字段:
     * 0x01 - 元宝
     * 0x02 - 礼券
     * 0x03 - 银两
     * 0x04 - 铜钱
     * 0x05 - 状态bit0 1-pk打开 0-pk关闭
     bit1 1-切磋打开 0-切磋关闭
     bit4 1-使用二次密码保护 0-不使用
     bit7 1-探险关闭 0-探险打开
     * 0x06 - 罪恶值
     * 0x07 - 贡献值
     * 0x08 - 战功
     * 0x09 - 移动速度
     * 0x40+n - buff编号n(@ see 0x14协议的 buffData)
     */
    private var _field:uint = 0;
    //private var _field:uint = 0;
    /**
     * 改变到的数值
     */
    private var _data:uint = 0;
    /**
     * 称号数量
     */
    public var titleNum:uint;
    /**
     * 称号
     */
    public var titleArr:Array;
    /**
     * 当前帮派称号
     */
    public var currentClanTitle:uint = 0;
    /**
     * 帮派称号数量
     */
    public var clanTitleNum:uint = 0;
    /**
     *帮派ID
     */
    public var clanTitleArr:Array;

    public var newName:String;
    /**
     *是否领取过真元 0-未领取 1-已领取
     */
    public var isGetZhenyuan:int

    public function StateMsg() {
        super();
    }

    public function get data():uint {
        return _data;
    }

    public function set data(value:uint):void {
        _data = value;
    }

    public function get field():uint {
        return _field;
    }

    public function set field(value:uint):void {
        _field = value;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            field = BytesUtil.readByte1(bytes);
            trace(field);
            if (0x17 == field) {//称号
                titleArr = [];
                //----------
                titleNum = BytesUtil.readByte2(bytes);
                for (var i:uint = 0; i < titleNum; i++) {
                    var vo:TitleStruct = new TitleStruct();
                    vo.titleID = BytesUtil.readByte2/*1*/(bytes);
                    vo.timeLimit = bytes.readUnsignedInt();
                    titleArr.push(vo);
                }
            } else if (field == 0x20) {
                data = BytesUtil.readByte1(bytes);
                if (data == 1) {
                    newName = BytesUtil.readUserName(bytes);
                }
            } else if (field == 0x21) {
                data = bytes.readUnsignedInt();
                isGetZhenyuan = BytesUtil.readByte1(bytes);
            }
            else if (field == 0x22) {
                data = bytes.readUnsignedInt();
            }
            else if (field == 0x23) {
                titleArr = [];
                currentClanTitle = BytesUtil.readByte1(bytes);
                clanTitleNum = BytesUtil.readByte1(bytes);
                //vo;
                for (i = 0; i < clanTitleNum; i++) {
                    vo = new TitleStruct();
                    vo.titleID = BytesUtil.readByte1(bytes);
                    vo.name = LangArrayTxt.NAME_OF_CLAN[vo.titleID];
                    vo.deadLine = bytes.readUnsignedInt();
                    if (vo.titleID != 0) {
                        titleArr.push(vo);
                    }
                }
            } else if (field == 0x26) {
                data = BytesUtil.readByte2(bytes);
            }else if(field == 0x27){
                data = BytesUtil.readByte1(bytes);
            } else {
                data = bytes.readUnsignedInt();
            }
        }
        catch (e:*) {

        }

        return true;
    }
}
}