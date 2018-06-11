package net.data.structs.fight
{

/***
 单一数据包结构，

 数据类型说明:
 byte - 单字节，8个bit位，0-255
 char - 单字节，1个符号位+7个bit位，(-128)-127
 ushort - 双字节，16个bit位，0-65535
 short - 双字节，1个符号位+31个bit位，(-32768)-32767
 uint - 四字节，32个bit位，0-4294967295
 int - 四字节，1个符号位+31个bit位，(-2147483648)-2147483647
 string - 字符串，前四个字节为uint类型，表示字符串长度n，后面n个字节为字符串内容

 头部结构:
 ushort size; // 数据包长度，不包括头部4个字节
 byte reserved; // 保留字节，目前为0xFF，以后可以用作扩展
 byte cmd; // 协议类型

 byte  攻方阵型
 byte  守方阵型
 byte  攻方玩家数x
 byte  守方玩家数y
 x * player  攻方玩家数据，详细见player结构
 y * player  守方玩家数据，详细见player结构
 25 * character  攻方人物数据，详细见character结构
 25 * character  守方人物数据
 uint  动作个数c
 c * action  动作数据，详细见action结构

 player结构:
 byte  玩家id绑定 (1-10)
 string  玩家名字

 character结构:
 byte  所属玩家id (1-10=玩家id, 0-空, 255, 254, 253 - 障碍物 )
 id为0时无数据
 id为1-10时:
 string  人物的名字
 byte  人物职业
 0 - 猛将男
 1 - 猛将女
 2 - 刺客男
 3 - 刺客女
 4 - 术士男
 5 - 术士女
 ushort  所持武器id
 uint  当前hp
 uint  hp上限
 uint  加成后的hp上限
 ushort  攻击
 ushort  加成后的攻击
 ushort  防御
 ushort  加成后的防御
 id为255,254,...时
 uint  障碍物hp

 action结构:
 byte  行动方
 0 - A方
 1 - B方
 byte  动作类型
 0 - 攻击
 1 - 连锁攻击
 2 - 武将技/主动技
 3 - 阵型技
 4 - 使用物品
 0x20 - 反击闪避
 0x40 - 连击flag，仅用于主动技
 0x80 - 暴击flag
 ushort  附加动作属性
 当动作为攻击/连锁攻击时，为保留空
 当动作为武将技/主动技时，表示技能id
 当动作为阵型技时，此为阵型技能id(如果每个阵型可以有多个阵型技)或者为保留空
 当动作为使用物品时，表示物品id
 byte  动作结果
 0 - 无变化
 1 - 被攻击方溃阵
 2 - 攻击方溃阵
 3 - 双方均溃阵
 4 - 攻击方复阵
 byte  攻击点的格子位 (0-24表示被攻击方，25-49表示攻击方)
 byte  行动玩家数量p
 p * attacker  行动玩家列表，详细见attacker结构
 byte  受作用玩家数量q
 q * effect  作用结果列表，详细见effect结构
 byte  状态改变的玩家数量r
 r * status  状态改变结果列表，详细见status结构

 attacker结构:
 byte  行动玩家id
 byte  攻击类型
 0 - 主攻
 1 - 合击协同者
 2 - 阵型技协同者
 byte   行动后武将技槽点数

 effect结构:
 byte  作用玩家的id
 byte  受作用类型
 0 - 被伤害
 1 - 上前援护被伤害
 2 - 闪避
 3 - 被加血
 4 - 复活
 0x80 - 反击flag
 uint  作用数值(复活时表示复活后恢复到的hp)
 uint  作用后hp数值(0表示死亡，复活时同作用数值)
 byte   被攻击后武将技槽点数
 [如果有反击flag的话，增加以下两个字段]
 uint  反击造成hp伤害
 uint  反击后攻击方剩余的hp

 status结构:
 uint  改变后的最大hp
 ushort  改变后的攻击
 ushort  改变后的防御
 ***/
public class MsgStruct
{
    public var nextFightId:Number = 0;
    /**byte 背景**/
    public var backgroundID      :Number = 0;
    /**byte  攻方阵型*/
    public var atRankId          :Number = 0;
    /**byte  守方阵型*/
    public var defRankId         :Number = 0;
    /**byte 攻击方等级**/
    public var atLevel           :Number = 0;
    /**byte 防守方等级**/
    public var defLevel           :Number = 0;
    /**byte  攻方玩家数x*/
    public var atPlayerNums      :Number = 0;
    /**byte  守方玩家数y*/
    public var defPlayerNums     :Number = 0;
    /**
     * 攻击方头像
     * */
    public var atPayerHead:Number = 0;
    /**
     * 防守方头像
     * */
    public var defPlayerHead:Number = 0;
    public var atBenchHead:uint = 0;
    public var defBenchHead:uint = 0;
    public var atTeam:Array = [];
    public var defTeam:Array = [];
    /**x * player  攻方玩家数据，详细见player结构 PlayerStruct*/
    public var atPlayerData      :Array = [];
    /**y * player  守方玩家数据，详细见player结构 PlayerStruct*/
    public var defPlayerData     :Array = [];
    /**攻方人物数据，详细见character结构 CharacterStruct*/
    public var atNpcData         :Array = [];
    /**守方人物数据 CharacterStruct*/
    public var defNpcData        :Array = [];

    /*攻方宠物数据*/
    public var actPetInsignias    :Array = [];
    /*防御方宠物数据*/
    public var defPetInsignias   :Array = [];


    /*攻方宠物是否飞升*/
    public var actPetIsFeisheng:Boolean;
    /*防御防宠物是否飞升*/
    public var defPetIsFeisheng:Boolean;


    /*魁杓装备数据*/
    public var actKuishaoVec:Array = new Array();
    public var defKuishaoVec:Array = new Array();
    public var isShowKuishao:Boolean = true;
    public var atPlayerName      :String = "";
    public var defPlayerName     :String = "";
    /**攻击方英雄数**/
    public var atHeroNum         :uint = 0;
    /**防守方英雄数**/
    public var defHeroNum        :uint = 0;
    /**攻击方的buf**/
    public var atBuff            :uint = 0;
    /**防守方buf**/
    public var defBuff           :uint = 0;
    /**动作个数c*/
    public var actNums           :uint = 0;
    /**动作数据，详细见action结构 ActionStruct*/
    public var actData           :Array = [];
    public var result:uint;

    //替补数据
    public var actBenchFighterData:CharacterStruct;
    public var defBenchFighterData:CharacterStruct;

    public function MsgStruct()
    {

    }

    public function getAtCharacter(id:int):CharacterStruct{
//			for each (var character:CharacterStruct in atNpcData){
//				if (character.pos-1 == id){
//					return character;
//				}
//			}
//			return null;
        return atNpcData[id];
    }
    public function getDefCharacter(id:int):CharacterStruct{
//			for each (var character:CharacterStruct in defNpcData){
//				if (character.pos-1 == id){
//					return character;
//				}
//			}
//			return null;
        return defNpcData[id];
    }
    public function get atPlayerList():Array{
        var list:Array = new Array();
        for each (var character:CharacterStruct in atNpcData){
            if (character.pos > 0){
                list.push(character);
            }
        }
        return list;
    }
    public function get defPlayerList():Array{
        var list:Array = new Array();
        for each (var character:CharacterStruct in defNpcData){
            if (character.pos > 0){
                list.push(character);
            }
        }
        return list;
    }

    /**
     * 对手的名字
     * @return
     *
     */
    public function getRivalName(name:String):String
    {
        if(atPlayerName == name)
            return defPlayerName;

        if(defPlayerName == name)
            return atPlayerName;
        return "";
    }


}
}
