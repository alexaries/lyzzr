/*******************************************************************************
 * Class name:	NoBlockEvent.as
 * Description:	
 * Author:		caoqingshan
 * Create:		Mar 21, 2013 4:46:58 PM
 * Update:		Mar 21, 2013 4:46:58 PM
 ******************************************************************************/
package com.game.common.events
{
import org.puremvc.as3.patterns.observer.Notification;

//-----------------------------------------------------------------------------
	// import_declaration
	//-----------------------------------------------------------------------------

	
	
	public class NoBlockEvent extends Notification
	{
		//-----------------------------------------------------------------------------
		// Var
		//-----------------------------------------------------------------------------
		public static var MENU_WIN_ADD:String = "MENU_WIN_ADD";
		public static var MENU_WIN_REMOVE:String = "MENU_WIN_REMOVE";
		public static var MENU_WIN_REMOVE_ALL:String = "MENU_WIN_REMOVE_ALL";

		//-----------------------------------------------------------------------------
		// Constructor
		//-----------------------------------------------------------------------------
		public function NoBlockEvent(type:String,_data:* = null )
		{
			super(type, _data);
		}
		
		//-----------------------------------------------------------------------------
		// Methods
		//-----------------------------------------------------------------------------
	}
}