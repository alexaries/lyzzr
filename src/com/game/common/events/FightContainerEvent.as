package com.game.common.events {
import org.puremvc.as3.patterns.observer.Notification;

/**
	 * @author ryan
	 */
	public class FightContainerEvent extends Notification {
		public static const CAMPS_SHOW : String = "CAMPS_SHOW";
		/**
		 * 通天塔
		 */
		public static const BABEL_SHOW : String = "BABEL_SHOW";
		/**
		 * 自动爬塔
		 */
		public static const BABEL_HOOK_SHOW : String = "BABEL_HOOK_SHOW";
		public static const COPY_SHOW : String = "COPY_SHOW";
		/** 自动副本界面 */
		public static const COPY_HOOK_SHOW : String = "COPY_HOOK_SHOW";
		public static const FORMATION_SHOW : String = "FORMATION_SHOW";
		public static const XUANJI_SHOW:String = "XUANJI_SHOW";
		
		/** 自动阵图界面 */
		public static const FORMATION_HOOK_SHOW : String = "FORMATION_HOOK_SHOW";
		public static const XUANJI_HOOK_SHOW:String = "XUANJI_HOOK_SHOW";
		//public static const ARENA_SHOW : String = "arenaShow";
		/** 英雄岛显示 */
		public static const HEROISLAND_SHOW : String = "HEROISLAND_SHOW";
		public static const HEROISLAND_PK_SHOW : String = "HEROISLAND_PK_SHOW";
		/** 帮派战显示*/
		public static const CFIGHT_SHOW : String = "cfight_show";
		/** 帮派战准备显示*/
		public static const CFIGHT_PRE_SHOW : String = "cfight_pre_show";
		/** 寻墨挂机显示*/
		public static const TILE_HOOK_SHOW:String = "tileHookShow";
		
		public function FightContainerEvent(type : String, _data:* = null ) {

			super(type, _data);
		}
	}
}
