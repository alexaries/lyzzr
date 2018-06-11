/* ---------------------------------------------------------------------------------------------------------------------------- /

 DisasterEventStruct -- NEROKING

 / ---------------------------------------------------------------------------------------------------------------------------- */

package net.data.structs.disaster {

public class DisasterEventStruct {

    public var type:int;
    public var state:uint;
    public var time:int;
    public var questList:Array;
    public var percent:int;
    public var copyId:uint = 0;
    public var copyFinish:uint = 0;
    public var n:uint;
    public var rank:int;
    public var score:int;
    public var first:Object;
    public var top:String;
    public var topScore:uint;

    public function DisasterEventStruct() {
    }

    // --- Private Function ---------------------------------------------------------------------------------------------- //

}
}