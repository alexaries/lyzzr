/**
 * Created by huangcb on 2017/10/19.
 */
package com.game.module.map.view {
import com.game.common.view.BaseFrame;

import com.game.common.mvc.BaseMediator;

public class SimplePlayersView extends BaseFrame {

//当前地图在线玩家
    public function SimplePlayersView() {
        super()
    }

    public function set vo(value:Object):void {

    }


    override public function dispose():void {
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return super.getMediator();
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

        //getContent().addChild()
        //setToolBarItems([new BaseMenuVO("任务"), new BaseMenuVO("日常")]);
        //setViewStackItems([new TaskView(), new TaskActivityView()]);
        setToolBarSelect(toolBarSelectedIndex);
    }


    override public function toolBarSelectHandler(index:int):void {
        super.toolBarSelectHandler(index);
    }

}
}