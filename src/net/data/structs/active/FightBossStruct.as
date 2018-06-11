/**
 * Created with IntelliJ IDEA.
 * User: jianghao
 * Date: 14-6-10
 * Time: 下午5:26
 * To change this template use File | Settings | File Templates.
 */
package net.data.structs.active {
import net.utils.BytesUtil;

import utils.ByteArray;

public class FightBossStruct {
    public var type:uint;
    public var type1:uint;
    public var delayLifeTime:uint;
    public var fight_num:uint;
    public var leftTime:uint;
    public var attack_delay_time:uint;
    //自己排行信息
    public var self_info:Array;
    //鼓舞
    public var guwu_count:uint;
    public var guwu_per:uint;
    public var guwu_hurt:uint;
    //跳过攻击结果
    public var jump_fight_hurt:uint;//伤害
    public var jump_fight_exp:uint;//获得经验
    //排行玩家
    public var reportList:Array;
    //出生点玩家
    public var playerList:Array;
    public var jump_fight_state:uint;
    //
    public var r_pos:uint;
    public var r_hurt:uint;
    public var r_per:uint;
    public var r_exp:uint;
    //
    public var attack_tip1:uint;
    public var attack_tip2:uint;
    public var boss_time:uint;

    public function FightBossStruct() {
    }

    public static function toType1(bytes:ByteArray, struct:FightBossStruct):void {

        var count:uint;
        var i:uint;
        struct.type1 = bytes.readUnsignedByte();
        switch (struct.type1) {
            case 1:
                struct.delayLifeTime = bytes.readUnsignedByte();
                break;
            case 2:
                struct.fight_num = bytes.readUnsignedShort();
                break;
            case 3:
                struct.leftTime = bytes.readUnsignedInt();
                break;
            case 4:
                struct.guwu_count = bytes.readUnsignedByte();
                struct.guwu_per = bytes.readUnsignedByte();
                struct.guwu_hurt = bytes.readUnsignedInt();
                break;
            case 5:
                count = bytes.readUnsignedByte();
                struct.reportList = [];
                for (i = 0; i < count; i++) {
                    struct.reportList.push([
                        bytes.readUnsignedShort(),
                        BytesUtil.readUserName(bytes),
                        bytes.readUnsignedInt()
                    ]);
                }
                break;
            case 6:
                struct.jump_fight_state = bytes.readUnsignedByte();
                break;
            case 7:
                struct.self_info = [
                    bytes.readUnsignedShort(),
                    BytesUtil.readUserName(bytes),
                    bytes.readUnsignedInt()
                ];
                break;
            case 8:
                struct.boss_time = bytes.readUnsignedInt();
                break;
        }

        return;
    }

    public static function read(bytes:ByteArray):FightBossStruct {

        var count:uint;
        var i:uint;
        var idBytes:ByteArray
        var struct:FightBossStruct = new FightBossStruct();
        struct.type = bytes.readUnsignedByte();
        switch (struct.type) {
            case 0x01:
                toType1(bytes, struct);
                break;
            case 0x02:
                break;
            case 0x03:
                break;
            case 0x04:
                break;
            case 0x05:
                bytes.readUnsignedByte();
                struct.jump_fight_hurt = bytes.readUnsignedInt();
                struct.jump_fight_exp = bytes.readUnsignedInt();
                break;
            case 0x06:
                struct.r_pos = bytes.readUnsignedByte();
                struct.r_hurt = bytes.readUnsignedInt();
                struct.r_per = bytes.readUnsignedShort();
                struct.r_exp = bytes.readUnsignedInt();
                break;
            case 0x07:
                break;
            case 0x08:
                struct.attack_delay_time = bytes.readUnsignedInt();
                break;
            case 0x09:
                struct.attack_tip1 = bytes.readUnsignedInt();
                struct.attack_tip2 = bytes.readUnsignedInt();
                break;
            case 0x10:
                count = bytes.readUnsignedByte();
                struct.playerList = [];
                for (i = 0; i < count; i++) {
                    struct.playerList.push([
                        BytesUtil.readUserId(bytes),
                        BytesUtil.readUserName(bytes),
                        bytes.readUnsignedByte(),
                        bytes.readUnsignedByte(),
                        bytes.readUnsignedByte()
                    ]);
                }
                break;
        }

        return struct;
    }
}
}
