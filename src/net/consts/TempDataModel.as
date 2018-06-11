package net.consts {
public class TempDataModel {
    private static var _instance:TempDataModel;

    public function TempDataModel() {
        if (_instance) {
            throw(new Error("---RyanCao--Single--Model-TempDataModel-"));
        }
        _instance = this;
    }

    public static function getInstance():TempDataModel {
        if (!_instance) {
            _instance = new TempDataModel();
        }
        return _instance;
    }

    public var atkID:int;
    public var ownerID:int;
    /**
     * 峨眉
     * 返回数组   元素为:
     * CTLevelData
     * @see WarFightElementStruct
     * */
    public var eData:Array;
    /**
     * 昆仑
     * 返回数组   元素为:
     * CTLevelData
     * @see WarFightElementStruct
     * */
    public var kData:Array;
    // 自己最高连杀 ，当前连杀，赢，输，累计战功
    public var personInfo:Array = [0, 0, 0, 0];
    // 峨眉积分
    public var ePoint:int = 0;
    // 昆仑积分
    public var kPoint:int = 0;
    public var highestObj:Object;
    // 最高连杀人
    public var buildusersList:Array;
    /**
     * 宗族战报列表
     */
    public var cfReportList:Array;
    /**
     * 宗族城据点玩家列表
     */
    public var ccastleuserList:Array;
    public var ccastleunionList:Array;
}
}