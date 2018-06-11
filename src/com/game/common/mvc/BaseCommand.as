/*
 PureMVC - Copyright(c) 2006-08 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.game.common.mvc {
import org.puremvc.as3.patterns.command.SimpleCommand;
import org.puremvc.as3.patterns.observer.Notification;

public class BaseCommand extends SimpleCommand {

    protected function dispatch(notiEvent:Notification):void {
        facade.notifyObservers(notiEvent);
    }
}
}