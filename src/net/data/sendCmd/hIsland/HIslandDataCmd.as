/**
 * Created by huangcb on 2017/8/21.
 */
package net.data.sendCmd.hIsland {
import net.data.BaseCmd;
import net.events.MsgEvent;

public class HIslandDataCmd extends BaseCmd
    {
        //-----------------------------------------------------------------------------
        // Var
        //-----------------------------------------------------------------------------
        public var type:int;
        public var locID:uint;
        public var flag:uint;

        //-----------------------------------------------------------------------------
        // Constructor
        //-----------------------------------------------------------------------------
        public function HIslandDataCmd()
        {
            super();
            msgType = parseInt(MsgEvent.HERO_ISLAND_DATA_NEW  ) ;
        }

        //-----------------------------------------------------------------------------
        // Methods
        //-----------------------------------------------------------------------------
        override protected function createBody():void
        {

                bodyBytes.writeByte(type);
                switch(type) {
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
                        bodyBytes.writeByte(locID);
                        //trace("4 - 英雄岛据点移动",locID);
                        break;
                    case 4:
                        //使用技能
                        bodyBytes.writeByte(locID);
                        bodyBytes.writeByte(flag);
                        //bodyBytes.writeUnsignedInt(locID);
                        break;
                    case 5:
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
//						bodyBytes.writeByte(akType);
                        break;
                    case 8:
                        //						bodyBytes.writeByte(locID);
                        break;
                    case 9:
                        //						bodyBytes.writeByte(locID);
                        //						bodyBytes.writeByte(akType);
                        break;
                    case 11:
                        break;
                    case 12:
                        //自动战斗配置
                        //						bodyBytes.writeUTF(fightcfg);
                        //trace("12 - 保存自动英雄岛配置信息",fightcfg);
                        break;
                    case 13:
                        //关闭或者开启
                        //						bodyBytes.writeByte(locID);
                        //trace("13 - 开启自动英雄岛配置信息",locID);
                        break;
                    default:
                }

        }

}
}
