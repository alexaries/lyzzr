package net.data.structs.flaunt {

import net.data.structs.charm.CharmStruct;
import net.data.structs.lingShi.LingShiStruct;
import net.data.structs.pack.EqInfoStruct;
import net.data.structs.pet.MarryHomePetStruct;
import net.data.structs.pet.PetStruct;

/**
 * 炫耀返回结构
 */
public class FlauntStruct {
    /**装备*/
    public static const FLAUNT_EQ:int = 0x01;
    /**将领*/
    public static const FLAUNT_HERO:int = 0x02;
    /**物品*/
    public static const FLAUNT_GOOD:uint = 0x03;
    /**战报*/
    public static const FLAUNT_FIGHT:uint = 0x04;
    /**邀请组队*/
    public static const INVITE_GROUP:uint = 0x05;
    /**仙宠装备*/
    public static const FLAUNT_PET_EQUIP:uint = 0x06;
    /**仙宠*/
    public static const FLAUNT_PET:uint = 0x07;
    /**仙宠精魄*/
    public static const FLAUNT_PET_JEWEL:uint = 0x08;
    /**空间活动*/
    public static const FLAUNT_SHOW_COUPON_ACTIVITY:uint = 0x09;
    /**首充禮包*/
    public static const FLAUNT_FIRST_PAY:uint = 0x0a;
    /**阵元*/
    public static const FLAUNT_ZHENYUAN:uint = 0x0b;
    /**查看炫耀装备*/
    public static const FLAUNT_EQ_LOOK:uint = 0x11;
    /**查看炫耀将领*/
    public static const FLAUNT_HERO_LOOK:uint = 0x12;
    /**查看宠物装备数据*/
    public static const FLAUNT_PET_EQUIP_LOOK:uint = 0x16;
    /**查看宠物数据*/
    public static const FLAUNT_PET_LOOK:uint = 0x17;
    /**邀请宠物副本组队*/
    public static const INVITE_PET_GROUP:uint = 0x18;
    /*主动炫耀夫妻宠物*/
    public static const MARRYHOME_PET:uint = 0x19;
    /*查看炫耀夫妻宠物*/
    public static const MARRYHOME_PET_look:uint = 0x20;
    /*加入夺宝奇兵*/
    public static const CLAN_ROLL_ENTER:uint = 0x21;
    /**加入仙界遗迹进攻小队*/
    public static const JOIN_IN_FAIRY_TEAM:uint = 0x22;
    /*加入帮派祭火*/
    public static const CLAN_FIRE_ENTER:uint = 0x23;
    /**阵元*/
    public static const FLAUNT_ZHENYUAN_LOOK:uint = 0x1b;
    /**灵侍炫耀*/
    public static const FLAUNT_LING_SHI:uint = 0x0c;
    /**查看灵侍炫耀*/
    public static const FLAUNT_LING_SHI_LOOK:uint = 0x1c;
    /**玲珑符咒*/
    public static const FLAUNT_CHARM:uint = 0x0d;
    /**查看符咒数据*/
    public static const FLAUNT_CHARM_LOOK:uint = 0x1d;

    /**邀请仙界组队*/
    public static const INVITE_CITY_TEAM:uint = 0x1e;

    /**类型,0x01:装备,0x02:将领*/
    public var type:uint = 0;
    /**炫耀物品id*/
    public var id:Number = 0;
    /**炫耀者名称*/
    public var flaunter:String = "";
    /**0:峨嵋,1:昆仑*/
    public var flaunterCountry:uint = 0;
    /**物品名称*/
    public var name:String = "";
    /**绑定属性,0:不绑定，1:为绑定*/
    public var binding:uint = 0;
    /**物品颜色*/
    public var nameColor:uint = 0;
    /**性别图像 */
    public var gender:uint = 0;
    /**装备信息结构*/
    public var equipInfo:EqInfoStruct;
    /**将领信息结构*/
    public var fighterData:FlauntHeroStruct;
    /**图片*/
    public var img:String = "";
    /**显示说明信息*/
    public var about:String = "";
    /**宠物数据*/
    public var petVO:PetStruct;
    public var marryHome_petVO:MarryHomePetStruct;
    /**灵侍数据*/
    public var lingShiData:LingShiStruct;
    /**符咒数据*/
    public var charmVo:CharmStruct;

    public function FlauntStruct() {
    }
}
}