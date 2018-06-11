package com.game.vo {

public class UserAppendVO {
    public static const STATE_KILL:int = 1;	//PK状态
    public static const STATE_PEACE:int = 0;//和平状态

    //状态0x01-pk打开0x00-pk关闭
    public var killState:int;
    //玩家罪恶值
    public var killValue:int;
    public var needTime:int;
    public var earCount:int;

    public function UserAppendVO() {
    }
}
}