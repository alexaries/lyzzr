/**
 * Created by dingcj on 2018/6/1.
 */
package com.game.module.battle.events {
public class BattleEvent {
    //战斗开始
    public static var BATTLE_ENTER = "BATTLE_ENTER";

    //client
    public static var BATTLE_PROGRESS_UPDATE = "BATTLE_PROGRESS_UPDATE";
    public static var BATTLE_STRENGTH_FINISHED = "BATTLE_STRENGTH_FINISHED";
    public static var BATTLE_EVENT_FINISHED = "BATTLE_EVENT_FINISHED";
    public static var BATTLE_DISPLAY = "BATTLE_DISPLAY";

    //protocol
    public static var BATTLE_UPDATE_INFO = "BATTLE_UPDATE_INFO";
}
}
