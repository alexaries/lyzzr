/**
 * Created by dingcj on 2018/6/19.
 */
package com.game.module.worldMap.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.BaseWindow;
import com.game.module.worldMap.mediator.WorldMapMediator;

public class WorldMapView extends BaseWindow {

    public function WorldMapView() {
        super([]);
    }

    public function set vo(value:Object):void {

    }
    public function get data():Object
    {
        if(_data == null)
          return 0;

        return _data;
    }

    override public function dispose():void {
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new WorldMapMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {

    }
}
}