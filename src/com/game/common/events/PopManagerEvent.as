package com.game.common.events {
import org.puremvc.as3.patterns.observer.Notification;

public class PopManagerEvent extends Notification {
		public static const SHOW_MASK:String = "show_mask";
		
		public static const UPGRADE_REWARD:String = "UPGRADE_REWARD";
		public static const GUIDE_ONEKEY:String = "GUIDE_ONEKEY";
		public static const MARRIAGE_POPUP:String = "MARRIAGE_POPUP";
		public static const INFO_POPUP:String = "INFO_POPUP";
		public static const EQUIP_POPUP:String = "EQUIP_POPUP";
		public static const PD_INVITE_VIEW:String = "PD_INVITE_VIEW";
		public static const FIGHTDEMON_POPUP:String = "FIGHTDEMON_POPUP";
        public static const MARRYHOME_ONLINEPOPUP:String = "MARRYHOME_ONLINEPOPUP";
        public static const RECEIVE_INVITE_DRINK:String = "RECEIVE_INVITE_DRINK";
        public static const RECEIVE_INVITE_LUMBER:String = "RECEIVE_INVITE_LUMBER";
        public static const CLANBOSS_POPUP:String = "CLANBOSS_POPUP";
		public static const SHOW_DRAKDRAGON_GO:String = "SHOW_DRAKDRAGON_GO";//黯龙王之怒 前往
		public static const SHOW_QIANYUANPLACE:String = "SHOW_QIANYUANPLACE";//乾元
        public static const FIELD_BOSS:String = "FIELD_BOSS";//野外Boss
        public static const GAME_789:String = "GAME_789";//野外Boss
		//------------------------------------------------------------------------
		public static const SHOW:String = "MENU_WIN_SHOW";

		public var data:* ;
		public static var FIRSTGOLD_POPUP:String="FIRSTGOLD_POPUP";
		public static var FEST_POPUP:String="FEST_POPUP";  
		public static var JIUTIANXZ_POPUP:String = "JIUTIANXZ_POPUP";

		public function PopManagerEvent(type : String, _data:* = null  ) {
			data = _data ;
			super(type, _data);
		}
	}
}
