package net.data.structs.clan {
/**
 *宗族列表数据
 */
public class ClanListItemStruct {
    public function ClanListItemStruct() {
    }

    private var _id:uint;
    private var _name:String;
    private var _gname:String;
    private var _level:int;
    private var _count:int;
    private var _count_max:int;
    private var _countryID:int;
    //private var _platform:int ;

    public function get gname():String {
        return _gname;
    }

    public function set gname(value:String):void {
        _gname = value;
    }

    public function get countryID():int {
        return _countryID;
    }

    public function set countryID(value:int):void {
        _countryID = value;
    }

    public function get count_max():int {
        return _count_max;
    }

    public function set count_max(value:int):void {
        _count_max = value;
    }

    public function get count():int {
        return _count;
    }

    public function set count(value:int):void {
        _count = value;
    }

    public function get level():int {
        return _level;
    }

    public function set level(value:int):void {
        _level = value;
    }

    public function get name():String {
        return _name;
    }

    public function set name(value:String):void {
        _name = value;
    }

    public function get id():uint {
        return _id;
    }

    public function set id(value:uint):void {
        _id = value;
    }

//		public function get platform():int
//		{
//			return _platform;
//		}
//		
//		public function set platform(value:int):void
//		{
//			_platform = value;
//		}
}
}