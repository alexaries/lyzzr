/*
 PureMVC - Copyright(c) 2006-08 Futurescale, Inc., Some rights reserved.
 Your reuse is governed by the Creative Commons Attribution 3.0 United States License
 */
package com.game.common.mvc {
import com.game.common.view.BaseWindow;

import org.puremvc.as3.patterns.mediator.Mediator;
import org.puremvc.as3.patterns.observer.Notification;

public class BaseMediator extends Mediator {
    public function BaseMediator( mediatorName:String=null, viewComponent:Object=null ) {
            super (mediatorName, viewComponent);
        if(getViewComponent() is BaseWindow){
          //  var $view:BaseWindow=getViewComponent() as BaseWindow;
          //  $view.onHideSignal.getSignal(this).listen(onRemove);
          //  $view.onShowSignal.getSignal(this).listen(onRegister);
        }
    }



    protected function dispatch(notiEvent:Notification):void {
        facade.notifyObservers(notiEvent);
    }

}
}