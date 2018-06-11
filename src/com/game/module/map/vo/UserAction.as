/**
 * Created by huangcb on 2017/8/23.
 */
package com.game.module.map.vo {
/**
 * 存放玩家当前的动作状态,如:正在阵营战、采集、聚灵、打战等
 * @author hokenny
 */
public class UserAction {
    //------------------------------------------------------------------------------------------------
    // StateID
    //------------------------------------------------------------------------------------------------
    //正常状态
    public static const NORMAL:int = -1;
    //自动回血包
    public static const AUTO_RECOVER:uint = 0x00;
    //阵营战
    //public static const COUNTRY_WAR:int = 8;//阵营战
    //public static const COUNTRYWAR_RELAX:int = 9;//阵营战休息
    //public static const COUNTRYWAR_WEAK:int = 12;//阵营战虚弱
    //public static const COUNTRYWAR_AWAY:int = 14;//战场逃亡
    //城战逃亡中
    //public static const CASTLE_MOVABLE:int = 0x47;//城战移动
    //public static const CASTLE_RELIVE:int = 0x48;//城战复活
    //public static const CASTLE_ENABLE:int = 0x51;//城战进行中
    //public static const CASTLE_DESERTER:int = 0x53;//城战逃亡中
    //public static const CASTLE_RELIVE_STRONG:int = 0x54;//城战复活增强Buff
    //public static const WATCHINT_COUNTRY_WAR:int = 3;//正在观看阵营战
    //public static const GM_BUFFER:uint = 0x4F;

    //英雄岛
    public static const HEROISLAND_ATKABLE:int = 0x23 ;
    public static const HEROISLAND_RELIVE:int = 0x24 ;
    public static const HEROISLAND_MOVABLE:int = 0x26 ;

    //------------------------------------------------------------------------------------------------
    // 物品ID
    //------------------------------------------------------------------------------------------------
    //修为挂机符
    public static const GATHER_PRACTICE_ONEPOINTFIVE:uint = 57;//1.2倍
    public static const GATHER_PRACTICE_TWO:uint = 58;//1.5倍
    //经验符
    public static const GATHER_EXP_ONEPOINTFIVE:uint = 55;//1.2倍
    public static const GATHER_EXP_TWO:uint = 56;//1.5倍
}
}
