/**
 * Created by Haru on 2017/8/4.
 */
package net.data.structs.pet {
public class PetStruct {
    public var id:uint;
    public var isMySelf:Boolean;
    public var formationPos:uint;
    public var equips:Vector.<PetEquipStruct>;
    public var taskProgress:uint;
    public var trainLv:uint;
    public var mainHeroHp:uint;
    public var mainHeroAp:uint;
    public var mainHerpDef:uint;
    public var mainHeroMagicAp:uint;
    public var mainHeroMagicDef:uint;
    public var pinjieID:uint;
    public var genguID:uint;
    public var huns:Vector.<PetHunStruct> = new Vector.<PetHunStruct>(3);//灵宠三魂
    /**灵宠七魄*/
    public var polist:Vector.<PetPoStruct> = new Vector.<PetPoStruct>(7);

    public function PetStruct() {
    }


}
}
