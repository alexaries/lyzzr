package com.game.common.events
{
import org.puremvc.as3.patterns.observer.Notification;


public class HelpViewEvent extends Notification
	{
		public static const SHOW:String = "HelpViewEvent_Show";
		public static const HIDE : String = "HelpViewEvent_Hide";
		
		//--------------------------------------------------------------------------
		//		Constructor
		//--------------------------------------------------------------------------
		
		public function HelpViewEvent(type:String, helpType:String, subType:String)
		{
			super(type);
			
			_helpType = helpType;
			_subType = subType;
		}
		
		//--------------------------------------------------------------------------
		//		Variables
		//--------------------------------------------------------------------------
		private var _subType : String;
		public function get subType() : String {
			return _subType;
		}
		
		private var _helpType:String;

		public function get helpType():String
		{
			return _helpType;
		}

		

		//--------------------------------------------------------------------------
		//		Propertise
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//		Methods
		//--------------------------------------------------------------------------
		
		//--------------------------------------------------------------------------
		//		Event Handler
		//--------------------------------------------------------------------------
	}
}