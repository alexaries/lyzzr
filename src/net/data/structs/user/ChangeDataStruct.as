package net.data.structs.user {

import net.data.structs.lingShi.LingShiStruct;
import net.data.structs.pack.EqInfoStruct;

public class ChangeDataStruct {
    /**
     * 改变字段
     * 0x01 - HP
     * 0x02 - 等级
     * 0x03 - 经验
     * 0x04 - 潜力
     * 0x05 - 忠诚
     * 0x11 - 技能
     * 0x21 - 武器
     * 0x22 - 头部
     * 0x23 - 胸部
     * 0x24 - 肩部
     * 0x25 - 腿部
     * 0x26 - 足部
     * 0x27 - 戒指
     * 0x28 - 项链
     * 0x63 - 灵侍1
     * 0x64 - 灵侍2
     * 0x65 - 灵侍3
     * 0x71 - 魂器1
     * 0x72 - 魂器2
     * 0x73 - 魂器3
     * 0x74 - 魂器4
     *
     */
    public var field:uint = 0;
    /**
     * 改变到的数值，如果为装备则为EqInfoStruct;
     */
    public var data:uint = 0;
    public var exp:Number = 0;
    /**
     * 装备信息结构
     */
    public var eqInfoStruct:EqInfoStruct;
    /**
     * 灵侍信息结构
     */
    public var lingShiStruct:LingShiStruct;
    /**
     * 数组
     */
    public var otherData:Array;

    public var isFeisheng:Boolean;

    public var attributeInFsLvVec:Vector.<int> = new Vector.<int>(6);//御龙仙甲

    public function ChangeDataStruct() {

    }
}
}