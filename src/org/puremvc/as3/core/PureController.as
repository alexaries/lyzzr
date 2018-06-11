/*
 PureMVC - Copyright(c) 2006-08 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
*/
package org.puremvc.as3.core
{
	import org.puremvc.as3.core.*;
	import org.puremvc.as3.interfaces.*;
	import org.puremvc.as3.patterns.observer.*;
	
	/**
	 * A Singleton <code>IController</code> implementation.
	 * 
	 * <P>
	 * In PureMVC, the <code>Controller</code> class follows the
	 * 'Command and Controller' strategy, and assumes these 
	 * responsibilities:</P>
	 * <UL>
	 * <LI> Remembering which <code>ICommand</code>s 
	 * are intended to handle which <code>INotifications</code>.</LI>
	 * <LI> Registering itself as an <code>IObserver</code> with
	 * the <code>View</code> for each <code>INotification</code> 
	 * that it has an <code>ICommand</code> mapping for.</LI>
	 * <LI> Creating a new instance of the proper <code>ICommand</code>
	 * to handle a given <code>INotification</code> when notified by the <code>View</code>.</LI>
	 * <LI> Calling the <code>ICommand</code>'s <code>execute</code>
	 * method, passing in the <code>INotification</code>.</LI> 
	 * </UL>
	 * 
	 * <P>
	 * Your application must register <code>ICommands</code> with the 
	 * Controller.</P>
	 * <P>
 	 * The simplest way is to subclass <code>Facade</code>, 
	 * and use its <code>initializeController</code> method to add your 
	 * registrations. </P>
	 * 
	 * @see org.puremvc.as3.core.view.View View
	 * @see org.puremvc.as3.patterns.observer.Observer Observer
	 * @see org.puremvc.as3.patterns.observer.Notification Notification
	 * @see org.puremvc.as3.patterns.command.SimpleCommand SimpleCommand
	 * @see org.puremvc.as3.patterns.command.MacroCommand MacroCommand
	 */
	public class PureController implements IController
	{
		

		public function PureController( )
		{
			if (instance != null) throw Error(SINGLETON_MSG);
			instance = this;
			commandMap = new Array();	
			initializeController();	
		}

		protected function initializeController(  ) : void 
		{
			view = PureView.getInstance();
		}
	

		public static function getInstance() : IController
		{
			if ( instance == null ) instance = new PureController( );
			return instance;
		}

		public function executeCommand( note : INotification ) : void
		{
            var tmp:Array=commandMap[  note.getName() ];
            for (var i:int = 0; i < tmp.length; i++) {
                var commandClassRef : Class =tmp[i];
                if ( commandClassRef == null ) return;
                var commandInstance : ICommand = new commandClassRef();
                commandInstance.execute( note );
            }

		}

		public function registerCommand( notificationName : String, commandClassRef : Class ) : void
		{
			if ( commandMap[ notificationName ] == null ) {
				view.registerObserver( notificationName, new Observer( executeCommand, this ) );
                commandMap[ notificationName ] = [commandClassRef];
			}else{
                var tmp:Array=commandMap[ notificationName ];
                if(tmp.indexOf(commandClassRef)==-1){
                    tmp.push(commandClassRef)
                }
            }


		}

		public function hasCommand( notificationName:String ) : Boolean
		{
			return commandMap[ notificationName ] != null;
		}

		public function removeCommand( notificationName : String ) : void
		{
			// if the Command is registered...
			if ( hasCommand( notificationName ) )
			{
				// remove the observer
				view.removeObserver( notificationName, this );
							
				// remove the command
				commandMap[ notificationName ] = null;
			}
		}
		
		// Local reference to View 
		protected var view : IView;
		
		// Mapping of Notification names to Command Class references
		protected var commandMap : Array;

		// Singleton instance
		protected static var instance : IController;

		// Message Constants
		protected const SINGLETON_MSG : String = "Controller Singleton already constructed!";

	}
}