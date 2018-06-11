/**
 * Created by huangcb on 2017/8/21.
 */
package net.data.recvMsg.rune {
import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

public class RuneSystemUpdateMsg  extends  BaseMsg{
    public var skillInfo:RuneSkillInfoMsg;
    public var heroId:int;
    public function RuneSystemUpdateMsg() {
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        // 更新指定武将指定技能的符文信息
        heroId= bytes.readUnsignedInt();

        // 如果当前已有此武将 更新武将技能符文信息
        skillInfo = new RuneSkillInfoMsg();
        skillInfo.skillID = bytes.readUnsignedInt();
        ; // 获得技能ID


        // 已有此技能信息
        skillInfo.maxValue = bytes.readUnsignedInt(); // 获得最大熔炼值
        skillInfo.nowValue = bytes.readUnsignedInt(); // 获得当前熔炼值
        skillInfo.nowLevel = BytesUtil.readByte1(bytes); // 获得当前等级
        skillInfo.maxLevel = BytesUtil.readByte1(bytes); // 获得最大等级
        return super.byteArrayToMsg(bytes);
    }
}
}
