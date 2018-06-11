package com.game.module.map.vo {
public class CityBaseInfoVO {
    public var id:int;
    public var name:String;
    public var flag:String;

    public function CityBaseInfoVO() {
        super();
    }

    public var status:int = 0;
    public var type:int = 0;
    public var info:String = "";
    public var map:String = "";
    public var defaultID:int = 1;
}
}