package net.data.structs.map {
public class BuildUserStruct {
    public function BuildUserStruct() {
    }

    public var playerName:String;
    /**平台编号,0x01:蓝钻,0x02,黄钻*/
    public var platform:int;
    /**
     *0-猛将男
     *1-猛将女
     *2-刺客男
     *3-刺客女
     *4-术士男
     *5-术士女
     */
    public var classType:int;

    /**所属阵营
     1-天族,2-魔族*/
    public var countryID:int;
    /**状态
     0x01-打开PK
     0x10-交战中*/
    public var status:int;
    /**人物宗族名*/
    public var groupName:String;
    /**人物等级*/
    public var lv:int;
    /**官职名*/
    public var officName:String;

}
}