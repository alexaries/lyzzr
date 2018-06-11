package net.data.sendCmd.sWar {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class SWarOperCmd extends BaseCmd {
    public var operation:int;
    public var position:int;
    public var group:int;
    public var reportID:uint;
    public var state:int;
    public var tael:int;
    public var p_id:BigInteger;
    public var teamName:String;
    public var playerName:String;
    public var memberID:BigInteger;
    public var skillId:int;
    public var num:uint;
    public var memberIdStr:String;
    public var memberFlagStr:String;
    public var m_id_1:BigInteger;
    public var m_id_2:BigInteger;
    public var m_id_3:BigInteger;
    public var canbai_freeOrMoney:int;
    public var start_id:int;

    public function SWarOperCmd() {
        super();
        msgType = MsgConst.SWAR_OPER;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(operation);
            switch (operation) {
                case 2:
                    bodyBytes.writeByte(state);
                    bodyBytes.writeByte(tael);
                    if (state < 2) {
                        BytesUtil.writeUint64(bodyBytes, p_id);
                    } else {
                        bodyBytes.writeShort(position);
                        bodyBytes.writeByte(group);
                    }
                    break;
                case 3:
                    bodyBytes.writeUnsignedInt(reportID);
                    break;
                case 5://创建战队
                    bodyBytes.writeUTF(teamName);
                    break;
                case 7://添加战队成员
                    BytesUtil.writeUserName(playerName, bodyBytes);
                    break;
                case 8://开除战队成员
                case 9:
                    BytesUtil.writeUint64(bodyBytes, memberID);
                    break;
                case 10://升级战队技能
                    bodyBytes.writeByte(skillId);
                    bodyBytes.writeUnsignedInt(num);
                    break;
                case 11://设置成员出战顺序 和 印记
                    BytesUtil.writeUint64(bodyBytes, m_id_1);
                    BytesUtil.writeUint64(bodyBytes, m_id_2);
                    BytesUtil.writeUint64(bodyBytes, m_id_3);
                    bodyBytes.writeUTF(memberFlagStr);
                    break;
                case 16:
                    bodyBytes.writeByte(state);
                    bodyBytes.writeByte(tael);
                    if (state < 1) {
                        BytesUtil.writeUint64(bodyBytes, p_id);
                    } else {
                        bodyBytes.writeShort(position);
                        bodyBytes.writeByte(group);
                    }
                    break;
                case 17:
                    bodyBytes.writeByte(canbai_freeOrMoney);
                    break;
                case 19:
                    BytesUtil.writeUserName(teamName, bodyBytes);
                    break;
                case 20:
                    bodyBytes.writeShort(start_id);
                    bodyBytes.writeByte(num);
                    break;
                case 21:
                    BytesUtil.writeUserName(teamName, bodyBytes);
                    break
                case 22:
                    BytesUtil.writeUserName(playerName, bodyBytes);
                    break
                case 24:
                    bodyBytes.writeByte(state);
                    BytesUtil.writeUint64(bodyBytes, p_id);
                    break;
                default:
            }
        } catch (e:Error) {
        }
    }
}
}
