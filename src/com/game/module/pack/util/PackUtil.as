package com.game.module.pack.util {
import com.game.module.pack.vo.PackVO;

import config.ConfigManager;
import config.item.item.IItemCfg;

import utils.ArrayUtil;

public class PackUtil {
    public static const noTipBtnType:int = 99

    public static function createPackVO(itemID:int):PackVO {

        var packvo:PackVO = new PackVO();
        var tempStaticVO:IItemCfg = ArrayUtil.find(ConfigManager.instance.item_item.itemCfg, function (item:IItemCfg) {
            return item.id == itemID
        });
        if (!tempStaticVO) {
            trace("tempStaticVO null");
            return null;
        }

        trace(tempStaticVO.id, tempStaticVO.name, tempStaticVO.imageId, "sdgsdgsdg")
        packvo.id = itemID;
        packvo.name = tempStaticVO.name;
        packvo.type = tempStaticVO.type;
        packvo.level = tempStaticVO.level;
        packvo.career = tempStaticVO.career;
        packvo.color = tempStaticVO.color;
        packvo.stackLimit = tempStaticVO.pile;
        packvo.price = tempStaticVO.price;
        packvo.energy = tempStaticVO.energy;
        packvo.useable = tempStaticVO.useable;
        packvo.propId = tempStaticVO.propId;
        packvo.description = tempStaticVO.tips;
        packvo.imgID = tempStaticVO.imageId;
        packvo.trumpExp = tempStaticVO.trumpExp;
        if (packvo.type < 19 || packvo.type >= 171 && packvo.type <= 173)
        return packvo;
    }

    public static function showTip(vo:PackVO,type:int = 1):void{
    }
}
}