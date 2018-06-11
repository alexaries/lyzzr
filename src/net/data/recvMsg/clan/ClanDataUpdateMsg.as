package net.data.recvMsg.clan {
import com.game.module.task.vo.TaskVO;
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

/**
 * 消息协议  0x98<br>
 *<code> (S->C) </code>
 * @author RyanCao
 *
 */
public class ClanDataUpdateMsg extends BaseMsg {
    public function ClanDataUpdateMsg() {
        super();
    }

    /**个人帮派任务列表*/
    public var clanTaskList:Array=[];

    private var _flag:int;
    private var _id:BigInteger = BigInteger.nbv(0);
    private var _name:String;
    private var _level:int;
    private var _status:int;
    private var _time:uint;
    private var _proffer:uint;
    private var _pos:int;
    private var _infoStr:String;
    public var pf:uint;
    /**
     *活跃度
     */
    public var active:uint;

    /**
     *帮贡
     * @return
     *
     */
    public function get proffer():uint {
        return _proffer;
    }

    public function getInfoStr():String {
        return _infoStr;
    }

    public function getPos():int {
        return _pos;
    }

    public function getTime():uint {
        return _time;
    }

    public function getStatus():int {
        return _status;
    }

    public function getLevel():int {
        return _level;
    }

    public function getName():String {
        return _name;
    }

    public function getId():BigInteger {
        return _id;
    }

    /**
     * 0 - 宗门添加新成员<br>
     * 1 - 宗门成员内容修改<br>
     * 2 - 宗门成员删除<br>
     * 3 - 宗族QQ修改<br>
     * 4 - 宗族公告修改
     * @return
     *
     */
    public function getFlag():int {
        return _flag;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _flag = BytesUtil.readByte1(bytes);
            var idBytes:ByteArray;
            switch (_flag) {
                case 0:
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    _id = BytesUtil.readUint64(idBytes);
                    _pos = BytesUtil.readByte1(bytes);
                    _name = BytesUtil.readUserName(bytes);
                    _level = BytesUtil.readByte1(bytes);
                    _status = BytesUtil.readByte1(bytes);
                    _time = bytes.readUnsignedInt();
                    pf = BytesUtil.readByte1(bytes);
                    break;
                case 1:
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    _id = BytesUtil.readUint64(idBytes);
                    _pos = BytesUtil.readByte1(bytes);
                    _level = BytesUtil.readByte1(bytes);
                    _status = BytesUtil.readByte1(bytes);
                    active = bytes.readUnsignedInt();
                    _time = bytes.readUnsignedInt();
                    break;
                case 2:
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    _id = BytesUtil.readUint64(idBytes);
                    break;
                case 3:
                    _infoStr = bytes.readUTF();
                    break;
                case 4:
                    _infoStr = bytes.readUTF();
                    break;
                case 5:
                    _proffer = bytes.readUnsignedInt();
                    break;
                case 6:
                    // idBytes = MsgUtil.creatByteArray();
                    // bytes.readBytes(idBytes,0,8);
                    // _id = BytesUtil.readUint64(idBytes);
                    _name = BytesUtil.readUserName(bytes);
                    break;
                case 7:
                    // 帮派建设度
                    _proffer = bytes.readUnsignedInt();
                    break;
                case 8:
                    // 帮派资金
                    _proffer = bytes.readUnsignedInt();
                    break;
                case 9:
                    // 个人任务进度
//                    _pos = BytesUtil.readByte1(bytes);
                    clanTaskList = [];
                       var cnt:int = BytesUtil.readByte4(bytes);
                       var taskId:int;
                        for(var i:int=0;i<cnt;i++)
                        {
                            taskId = bytes.readUnsignedInt();
                            var taskVo:TaskVO = new TaskVO();
                            taskVo.taskId = taskId;
                            clanTaskList.push(taskVo);
                        }
                    break;
                case 10:
                    // 个人人员上限
                    _pos = BytesUtil.readByte1(bytes);
                    break;
                case 11:
                    idBytes = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes, 0, 8);
                    _id = BytesUtil.readUint64(idBytes);
                    active = bytes.readUnsignedInt();
                    break;
            }
        } catch (e:*) {
        }
        return true;
    }
}
}