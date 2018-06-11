package com.game.common.events {
import org.puremvc.as3.patterns.observer.Notification;

/**
	 * @author hokenny
	 */
	public class WindowEvent extends Notification {
		public static const MENU_WIN_ADD:String = "menuwinadd";
		public static const MENU_WIN_REMOVE:String = "menuwinremove";
		public static const MENU_WIN_REMOVE_ALL:String = "menuwinremoveall";
		public static const MENU_WIN_SET_INDEX : String = "menuwinsetindex";
		public static const MENU_WIN_EFFECT : String = "MENU_WIN_EFFECT";
		
		//关闭所有窗口事件 包括用 POPUP弹出的
		public static const MENU_CLOSE_ALL_WIN : String = "MENU_CLOSE_ALL_WIN";
		
		public var data:*;
		public var winType:String;
		
		public function WindowEvent(type : String, _data:* = null  ) {
			super(type, _data);
		}
	}
}
