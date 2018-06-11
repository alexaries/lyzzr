package net.data.sendCmd.clan {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * 帮派科技<br>
 * 消息协议<br>
 * 协议编号0x99
 * @author RyanCao
 *
 */
public class CSkillCmd extends BaseCmd {
    public function CSkillCmd() {
        super();
        msgType = MsgConst.CLAN_SKILL;
    }

    private var _type:int;
    private var _skillID:int;
    private var _flag:int;
    private var _num:uint;

    /**
     * uint    num    捐献数量
     * @param value
     *
     */
    public function set num(value:uint):void {
        _num = value;
    }

    /**
     * <br>
     * byte    flag    捐献物品<br>
     * 类型        1 - 个人资金<br>
     * 2 - 帮派资金<br>
     * 3 - 其他物品<br>
     * @param value
     *
     */
    public function set flag(value:int):void {
        _flag = value;
    }

    /**
     *byte    skillID    捐献技艺ID
     * @param value
     *
     */
    public function set skillID(value:int):void {
        _skillID = value;
    }

    /**
     * byte    type    消息类型<br>
     * 0 - 请求帮派科技列表（首次）<br>
     * 1 - 请求某个科技的捐献列表（暂时不发）<br>
     * 2 - 贡献资金给某个科技<br>
     * 3 - 请求帮派秘术列表（首次）<br>
     * 4 - 请求帮派秘术（暂时不发）<br>
     * 5 - 升级帮派秘术<br>
     * @param value
     *
     */
    public function set type(value:int):void {
        _type = value;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(_type);
            switch (_type) {
                case 0:
                case 3:
                    break;
                case 1:
                    bodyBytes.writeByte(_skillID);
                    break;
                case 2:
                    bodyBytes.writeByte(_skillID);
                    bodyBytes.writeByte(_flag);
                    bodyBytes.writeUnsignedInt(_num);
                    break;
                case 4:
                    break;
                case 5:
                    // 升级秘术
                    bodyBytes.writeByte(_skillID);
                    break;
            }
        } catch (e:*) {
        }
    }
}
}