package net.data.structs.user {
/**
 * @author ryan
 */
public class IndexStruct {
    public var data:int;
    public var label:int;
    public var index:int;
    public var blChoose:Boolean = false;
    public var listNum:int = 0;
    /*仅对新增加的ID段有效*/
    public var hasLearn:Boolean = true;

    public function clone():IndexStruct {
        var idS:IndexStruct = new IndexStruct();
        idS.data = data;
        idS.label = label;
        idS.index = index;
        idS.blChoose = blChoose;
        idS.listNum = listNum;
        idS.hasLearn = hasLearn;
        return idS;
    }
}
}
