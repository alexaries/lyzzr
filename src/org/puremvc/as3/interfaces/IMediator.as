/*
 PureMVC - Copyright(c) 2006-08 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
*/
package org.puremvc.as3.interfaces
{
	

	public interface IMediator
	{
		
		/**
		 * Get the <code>IMediator</code> instance name
		 * 
		 * @return the <code>IMediator</code> instance name
		 */
		function getMediatorName():String;
		
		/**
		 * Get the <code>IMediator</code>'s view component.
		 * 
		 * @return Object the view component
		 */
		function getViewComponent():Object;

		/**
		 * Set the <code>IMediator</code>'s view component.
		 * 
		 * @param Object the view component
		 */
		function setViewComponent( viewComponent:Object ):void;
		
		/**
		 * List <code>INotification</code> interests.
		 * 
		 * @return an <code>Array</code> of the <code>INotification</code> names this <code>IMediator</code> has an interest in.
		 */
		function listNotificationInterests( ):Array;
		
		/**
		 * Handle an <code>INotification</code>.
		 * 
		 * @param notification the <code>INotification</code> to be handled
		 */
		function handleNotification( notification:INotification ):void;
        function $handleNotification( notification:INotification ):void;

		/**
		 * Called by the View when the Mediator is registered
		 */ 
		function onRegister( ):void;

		/**
		 * Called by the View when the Mediator is removed
		 */ 
		function onRemove( ):void;
		
	}
}