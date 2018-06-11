package com.game.common.events {
import org.puremvc.as3.patterns.observer.Notification;

public class MenuWindowVO  {
    public static const OPEN:String = "open";
    public static const CLOSE:String = "close";
    public static const CLOSE_ALL:String = "closeAll";
    public static const HERO_LIST:String = "hero_list";

    public var menuWinTypeName:String;					//窗口的名称
    public var state:String;					//窗口的名称
    public var data:Object;


    /**
     *
     * @param name         窗口的名称                        DEFAULT:NULL
     * @param status  窗口状态，OPEN或者CLOSE        DEFAULT:MenuWinActionVO.OPEN
     * @param index   此窗口默认打开的序号            DEFAULT:0
     *
     */
    public function MenuWindowVO( menuWinTypeName:String, state:String=MenuWindowVO.OPEN,data:Object=null) {

        this.data = data;
        this.state=state;
        this.menuWinTypeName=menuWinTypeName;

    }
    static public function setTabIndex(data:Object,index:int):void {
        data["tabIndex"]=index;
    }
    static public function getTabIndex(data:Object):int {
        var index:int = 0;
        if (data != null && data["tabIndex"] != null) {
            index = data["tabIndex"];
        }
        return index
    }
}
}