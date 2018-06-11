package net.data.structs.map {
public class NpcInfoStruct {
    /**
     * NPC编号
     */
    public var npcId:uint = 0;
    /**
     * 据点编号
     */
    public var locId:uint = 0;
    /**
     * 0 - 隐藏<br>
     * 1 - <br>
     * 2 - 普通怪物<br>
     * 3 - <br>
     * 4 - NPC<br>
     * 5 - <br>
     * 6 - Boss
     * */
    public var type:uint = 0;
    /**
     * 0 - 无
     * 1 - 感叹号
     * 2 - 问号
     * 3 - 感叹号+问号
     */
    public var flag:uint = 0;

    public function NpcInfoStruct() {
    }
}
}