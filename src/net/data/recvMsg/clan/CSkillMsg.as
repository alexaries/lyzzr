package net.data.recvMsg.clan {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.clan.CSkillDevoteStruct;
import net.data.structs.clan.CSkillStruct;
import net.utils.BytesUtil;

/**
 *  帮派科技返回<br>
 * (S->C) 0x99
 * @author RyanCao
 *
 */
public class CSkillMsg extends BaseMsg {
    public function CSkillMsg() {
        super();
    }

    private var _type:int;
    private var _skillArr:Array;
    private var _devoteArr:Array;
    private var _result:int;
    private var _skillID:int;
    private var _devote:uint;
    private var _newDevoteStruct:CSkillDevoteStruct;

    /**
     * 捐献的数据类
     * @return
     *
     */
    public function get newDevoteStruct():CSkillDevoteStruct {
        return _newDevoteStruct;
    }

    /**
     * 贡献值
     * @return
     *
     */
    public function get devote():uint {
        return _devote;
    }

    /**
     * 操作的技能ID
     * @return
     *
     */
    public function get skillID():int {
        return _skillID;
    }

    /**
     * 贡献结果
     * @return
     *
     */
    public function get result():int {
        return _result;
    }

    /**
     * 贡献
     * @return
     *
     */
    public function get devoteArr():Array {
        return _devoteArr;
    }

    /**
     * 技艺
     * @return
     *
     */
    public function get skillArr():Array {
        return _skillArr;
    }

    /**
     * byte    type    消息类型<br>
     * 0-帮派科技列表信息返回<br>
     * 1-当前宗族科技的捐献列表返回（最后30条记录）（暂时不用）<br>
     * 2-贡献返回<br>
     * 3-科技进度更新<br>
     * 4-捐献列表的更新（暂时不用）<br>
     * 5-返回的科技喜好品ID（暂时不用）<br>
     * 6-帮派秘术列表信息返回<br>
     * 7-帮派秘术信息更新<br>
     * 8-帮派秘术升级结果返回<br>
     * @return
     *
     */
    public function get type():int {
        return _type;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _type = BytesUtil.readByte1(bytes);
            var len:int;
            var i:int = 0;
            var struct:CSkillStruct;
            switch (_type) {
                case 0:
                    len = BytesUtil.readByte1(bytes);
                    _skillArr = [];
                    for (i = 0; i < len; i++) {
                        struct = new CSkillStruct();
                        struct.skillID = BytesUtil.readByte1(bytes);
                        struct.devote = bytes.readUnsignedInt();
                        _skillArr.push(struct);
                    }
                    break;
                case 6:
                    len = BytesUtil.readByte1(bytes);
                    _skillArr = [];
                    for (i = 0; i < len; i++) {
                        struct = new CSkillStruct();
                        struct.skillID = BytesUtil.readByte1(bytes);
                        struct.devote = BytesUtil.readByte1(bytes);
                        _skillArr.push(struct);
                    }
                    break;
                case 1:
                    _skillID = BytesUtil.readByte1(bytes);
                    len = BytesUtil.readByte1(bytes);
                    _devoteArr = [];
                    for (i = 0; i < len; i++) {
                        var devotestruct:CSkillDevoteStruct = new CSkillDevoteStruct();
                        devotestruct.name = BytesUtil.readUserName(bytes);
                        devotestruct.devote = bytes.readUnsignedInt();
                        devotestruct.time = bytes.readUnsignedInt();
                        _devoteArr.push(devotestruct);
                    }
                    break;
                case 2:
                    _result = BytesUtil.readByte1(bytes);
                    break;
                case 3:
                    _skillID = BytesUtil.readByte1(bytes);
                    _devote = bytes.readUnsignedInt();
                    break;
                case 7:
                    _skillID = BytesUtil.readByte1(bytes);
                    _devote = BytesUtil.readByte1(bytes);
                    break;
                case 4:
                    _skillID = BytesUtil.readByte1(bytes);
                    _newDevoteStruct = new CSkillDevoteStruct();
                    _newDevoteStruct.name = BytesUtil.readUserName(bytes);
                    _newDevoteStruct.devote = bytes.readUnsignedInt();
                    _newDevoteStruct.time = bytes.readUnsignedInt();
                    break;
                case 5:
                    break;
                case 8:
                    _skillID = BytesUtil.readByte1(bytes);
                    _result = BytesUtil.readByte1(bytes);
                    break;
            }
        } catch (e:*) {
        }
        return true;
    }
}
}