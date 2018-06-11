package com.game.module.map.vo {

public class BuildBaseInfoVO {
    public var id:int;
    public var name:String;

    public function BuildBaseInfoVO() {
        super();
    }

    /**
     * 9 - 普通据点<br/>
     * 7 - 普通据点<br/>
     * 6 - 阵营战<br/>
     * 5 - 英雄岛<br/>
     * 4 - 通天塔<br/>
     * 3 - 副本<br/>
     * 2 - 阵图<br/>
     * 1 - 帮派战<br/>
     */
    public var type:int = 0;		// --表示建筑的类型	其中有一个是传送点的标志
    public var info:String = "";	// --表示建筑的信息
    public var status:int = 0;  	// --表示阵营的状态
    public var isAutoPk:int = 0;	// --默认情况 为安全区
    public var copyID:int = 0;		// --如果是副本 ，代表副本对应的副本ID
    public var level:int = 0;		// --如果是帮派城战的据点，则存在这个据点级别，只能一级一级的行走，不能跨级行走

    public var value:int = 0;
    public var gold:int = 0;

}
}