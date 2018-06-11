/**
 * Created by huangcb on 2017/8/21.
 */
package net.data.recvMsg.rune {
import laya.utils.Dictionary;

import net.data.BaseMsg;
import net.utils.BytesUtil;

import utils.ByteArray;

public class RuneSystemMsg extends BaseMsg {
    public function RuneSystemMsg() {
    }

    public var runeInfos:Vector.<RuneInfoMsg>;
    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        runeInfos = new Vector.<RuneInfoMsg>();
        var i:int;
        var j:int;
        var length:int;
        var length2:int;

        // 读入所有武将所有技能的符文信息
        length = BytesUtil.readByte1(bytes);
        var rInfo:RuneInfoMsg;
        for (i = 0; i < length; i++) {
            rInfo = new RuneInfoMsg();
            rInfo.heroID = bytes.readUnsignedInt(); // 获得武将ID

            length2 = BytesUtil.readByte1(bytes); // 获得符文个数
            for (j = 0; j < length2; j++) {
                var __skillInfo:RuneSkillInfoMsg = new RuneSkillInfoMsg();
                __skillInfo.skillID = bytes.readUnsignedInt();// 获得技能ID
                __skillInfo.maxValue = bytes.readUnsignedInt(); // 获得最大熔炼值
                __skillInfo.nowValue = bytes.readUnsignedInt(); // 获得当前熔炼值
                __skillInfo.nowLevel = BytesUtil.readByte1(bytes); // 获得当前等级
                __skillInfo.maxLevel = BytesUtil.readByte1(bytes); // 获得解封等级
                rInfo.skillInfos[j] = __skillInfo;
            }
            runeInfos.push(rInfo);
        }

        return true;
    }
}
}
