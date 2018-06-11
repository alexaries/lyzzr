package net.data.sendCmd.heroIsland {
import com.hurlant.math.BigInteger;

import net.data.BaseCmd;
import net.events.MsgConst;
import net.utils.BytesUtil;

/**
 * @author ryan
 */
public class HeroIslandDataCmd extends BaseCmd {

    public var type:int;
    public var locID:uint;
    /**
     * 攻击类型
     */
    public var akType:uint;
    public var npcid:int;
    public var userid:BigInteger = BigInteger.nbv(0);
    public var fightcfg:String;

    public function HeroIslandDataCmd() {
        super();
        msgType = MsgConst.HERO_ISLAND_DATA;
    }

    override protected function createBody():void {
        try {
            bodyBytes.writeByte(type);
            switch (type) {
                case 0:
                    //trace("0-请求当前英雄岛状态信息");
                    break;
                case 1:
                    //trace("1 - 进入英雄岛");
                    break;
                case 2:
                    //trace("2 - 要进入英雄岛前请求自己状态");
                    break;
                case 3:
                    //trace("3 - 请求赏金任务目标状态");
                    break;
                case 4:
                    bodyBytes.writeUnsignedInt(locID);
                    //trace("4 - 英雄岛据点移动",locID);
                    break;
                case 5:
                    bodyBytes.writeByte(akType);
                    if (akType == 0) {
                        bodyBytes.writeShort(npcid);
                    } else if (akType == 1) {
                        BytesUtil.writeUint64(bodyBytes, userid);
                    }
                    //trace("5 - 攻击英雄岛NPC 玩家",userid.toString());
                    break;
                case 6:
                    //trace("6 - 提交赏金任务目标状态");
                    break;
                case 7:
                    bodyBytes.writeByte(locID);
                    /**
                     * 使用技能的类型
                     * 0:不收费
                     * 1:收费
                     */
                    bodyBytes.writeByte(akType);
                    //trace("7 - 使用技能",locID);
                    break;
                case 8:
                    bodyBytes.writeByte(locID);
                    //trace("8 - 领取奖励",locID);
                    break;
                case 9:
                    bodyBytes.writeByte(locID);
                    bodyBytes.writeByte(akType);
                    break;
                case 11:
                    //trace("11 - 请求自动英雄岛配置信息");
                    break;
                case 12:
                    //自动战斗配置
                    bodyBytes.writeUTF(fightcfg);
                    //trace("12 - 保存自动英雄岛配置信息",fightcfg);
                    break;
                case 13:
                    //关闭或者开启
                    bodyBytes.writeByte(locID);
                    //trace("13 - 开启自动英雄岛配置信息",locID);
                    break;
                default:
            }
        }
        catch (e:Error) {

        }
    }
}
}
