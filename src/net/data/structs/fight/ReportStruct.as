package net.data.structs.fight {
/**
 * @author john
 */
public class ReportStruct {
    public var result:uint;
    /**
     * 是否倒置<br>
     * 0 - 非倒置<br>
     * 1 - 倒置
     */
    public var invert:uint = 0;
    public var atName:String;
    public var atHead:String;
    public var atLevel:uint;
    public var defName:String;
    public var defHead:String;
    public var defLevel:uint;
    /**
     * 战报播放最长时间
     */
    public var maxTime:uint = 40000;
    /**
     * 战报播放持续时间
     */
    public var lastTime:uint = 40000;
    public var recordid:uint;
    public var record:Array;
}
}
