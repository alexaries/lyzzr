package net.data.recvMsg.camps {
import utils.ByteArray;

import net.consts.StaticConfig;
import net.consts.TempDataModel;
import net.data.BaseMsg;
import net.data.structs.ctwar.CTDynamicStruct;
import net.data.structs.ctwar.CTLevelStruct;
import net.data.structs.ctwar.WarFightElementStruct;
import net.utils.BytesUtil;

/**
 * 消息类型：<br>
 * (S->C) 0x66 国战信息 <br>
 * 首先通过协议更改列表人物与状态
 * 其次显示字符
 * @author RyanCao
 *
 */
public class CampsStringMsg extends BaseMsg {
    public function CampsStringMsg() {
        super();
    }

    private var _tempdatamodel:TempDataModel = TempDataModel.getInstance();
    private var _dynamicData:Array;
    public var ePoint:int;
    public var kPoint:int;
    /**
     * 峨眉
     * @see WarFightElementStruct
     * */
    public var eData:Array;
    /**
     * 昆仑
     * @see WarFightElementStruct
     * */
    public var kData:Array;
    // 攻击者ID
    private var atkID:int = 0;
    // 占有者ID
    private var ownerID:int;
    public var personInfo:Array = [0, 0, 0, 0];
    public var highestObj:Object;

    public function get dynamicData():Array {
        return _dynamicData;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {

        ePoint = bytes.readUnsignedInt();
        kPoint = bytes.readUnsignedInt();
//				ePoint = BytesUtil.readByte2(bytes);
//				kPoint = BytesUtil.readByte2(bytes);

        var num:int = BytesUtil.readByte2(bytes);

        _dynamicData = [];

        eData = _tempdatamodel.eData;
        kData = _tempdatamodel.kData;

        personInfo = _tempdatamodel.personInfo;
        highestObj = _tempdatamodel.highestObj;

        atkID = _tempdatamodel.atkID;
        ownerID = _tempdatamodel.ownerID;

        /*先发动态国展数据的时候 直接返回*/
        if (!eData || !kData)
            return false;

        var s_vector:Array;

        for (var i:int = 0; i < num; i++) {
            var dynamicD:CTDynamicStruct = new CTDynamicStruct();
            dynamicD.type = BytesUtil.readByte1(bytes);
            dynamicD.pos = BytesUtil.readByte1(bytes);
            var warf:WarFightElementStruct;
            var struct:CTLevelStruct;
            var index:int;

            switch (dynamicD.type) {
                case 0:
                    dynamicD.winName = BytesUtil.readUserName(bytes);
                    struct = getLevelStruct(dynamicD.pos);
                    if (!struct) {
                        struct = new CTLevelStruct();
                        struct.level = dynamicD.pos & 0x3f;
                        struct.nums = 1;
                        s_vector = [];
                        warf = new WarFightElementStruct();
                        warf.name = dynamicD.winName;
                        warf.isrestable = 0;
                        s_vector.push(warf);
                        struct.usersData = s_vector;
                        switch (dynamicD.pos >> 6) {
                            case 0:
                                eData.push(struct);
                                break;
                            case 1:
                                kData.push(struct);
                                break;
                            default:
                                break;
                        }
                    } else {
                        s_vector = struct.usersData;
                        index = getWarFightElementIndexFromVector(dynamicD.winName, s_vector);
                        // 重复判断
                        if (index > -1) {
                            warf = s_vector[index];
                            warf.isrestable = 0;
                        } else {
                            warf = new WarFightElementStruct();
                            warf.name = dynamicD.winName;
                            warf.isrestable = 0;
                            s_vector.push(warf);

                            if (dynamicD.winName == StaticConfig.userName)
                                personInfo[1] = 0;

                            struct.nums++;
                        }
                    }
                    break;
                case 1:
                    dynamicD.winName = BytesUtil.readUserName(bytes);
                    struct = getLevelStruct(dynamicD.pos);
                    if (struct) {
                        s_vector = struct.usersData;
                        index = getWarFightElementIndexFromVector(dynamicD.winName, s_vector);
                        if (index != -1) {
                            s_vector.splice(index, 1);
                            if (dynamicD.winName == StaticConfig.userName)
                                personInfo[1] = 0;
                            struct.nums--;
                        } else {
                        }
                    }
                    break;
                case 2:
                    dynamicD.winName = BytesUtil.readUserName(bytes);
                    struct = getLevelStruct(dynamicD.pos);
                    if (struct) {
                        s_vector = struct.usersData;
                        index = getWarFightElementIndexFromVector(dynamicD.winName, s_vector);
                        if (index != -1) {
                            warf = s_vector[index];
                            warf.isrestable = 1;
                        } else {
                        }
                    }
                    break;
                case 3:
                    dynamicD.winName = BytesUtil.readUserName(bytes);
                    dynamicD.winScore = BytesUtil.readByte1(bytes);
                    struct = getLevelStruct(dynamicD.pos);
                    if (struct) {
                        s_vector = struct.usersData;
                        index = getWarFightElementIndexFromVector(dynamicD.winName, s_vector);
                        if (index != -1) {
                            warf = s_vector[index];
                            warf.isrestable = 0;
                        } else {
                        }
                    }
                    // 加分 ==
                    _dynamicData.push(dynamicD);
                    break;
                case 4:
                    dynamicD.winName = BytesUtil.readUserName(bytes);
                    dynamicD.winFreak = BytesUtil.readByte1(bytes);
                    dynamicD.winScore = BytesUtil.readByte1(bytes);
                    dynamicD.loseName = BytesUtil.readUserName(bytes);
                    dynamicD.loseFreak = BytesUtil.readByte1(bytes);
                    if (!highestObj || dynamicD.winFreak > int(highestObj.msFreak)) {
                        highestObj = new Object();
                        highestObj.msFreak = dynamicD.winFreak;
                        highestObj.msName = dynamicD.winName;
                        highestObj.msCountry = dynamicD.winCountryID;
                        //trace("dynamicD.winFreak", dynamicD.winFreak, dynamicD.winName, dynamicD.winCountryID);
                    }
                    struct = getLevelStruct(dynamicD.pos);
                    if (struct) {
                        s_vector = struct.usersData;
                        index = getWarFightElementIndexFromVector(dynamicD.winName, s_vector);

                        if (dynamicD.winName == StaticConfig.userName) {
                            personInfo[2]++;
                            personInfo[1] = dynamicD.winFreak;
                            if (dynamicD.winFreak > personInfo[0])
                                personInfo[0] = dynamicD.winFreak;
                        }

                        if (index != -1) {
                            warf = s_vector[index];
                            warf.isrestable = 0;
                        } else {
                        }
                    }
                    struct = getLevelStruct((dynamicD.pos + 64) % 128);
                    if (struct) {
                        s_vector = struct.usersData;
                        index = getWarFightElementIndexFromVector(dynamicD.loseName, s_vector);

                        if (dynamicD.loseName == StaticConfig.userName) {
                            personInfo[3]++;
                            personInfo[1] = 0;
                        }

                        if (index != -1) {
                            s_vector.splice(index, 1);
                            struct.nums--;
                        } else {
                        }
                    }
                    // 积分修改 ==
                    _dynamicData.push(dynamicD);
                    break;
                case 5:
                    dynamicD.winName = BytesUtil.readUserName(bytes);
                    dynamicD.winFreak = BytesUtil.readByte1(bytes);
                    dynamicD.winScore = BytesUtil.readByte1(bytes);
                    dynamicD.loseName = BytesUtil.readUserName(bytes);
                    dynamicD.loseFreak = BytesUtil.readByte1(bytes);
                    if (!highestObj || dynamicD.winFreak > int(highestObj.msFreak)) {
                        highestObj = new Object();
                        highestObj.msFreak = dynamicD.winFreak;
                        highestObj.msName = dynamicD.winName;
                        highestObj.msCountry = dynamicD.winCountryID;
                    }
                    struct = getLevelStruct(dynamicD.pos);
                    if (struct) {
                        s_vector = struct.usersData;
                        index = getWarFightElementIndexFromVector(dynamicD.winName, s_vector);

                        if (dynamicD.winName == StaticConfig.userName) {
                            personInfo[2]++;
                            personInfo[1] = dynamicD.winFreak;
                            if (dynamicD.winFreak > personInfo[0])
                                personInfo[0] = dynamicD.winFreak;
                        }

                        if (index != -1) {
                            warf = s_vector[index];
                            warf.isrestable = 0;
                        } else {
                        }
                    }
                    struct = getLevelStruct((dynamicD.pos + 64) % 128);
                    if (struct) {
                        s_vector = struct.usersData;
                        index = getWarFightElementIndexFromVector(dynamicD.loseName, s_vector);

                        if (dynamicD.loseName == StaticConfig.userName) {
                            personInfo[3]++;
                            personInfo[1] = 0;
                        }

                        if (index != -1) {
                            s_vector.splice(index, 1);
                            // 删除人
                            struct.nums--;
                        } else {
                        }
                    }
                    // --积分修改
                    _dynamicData.push(dynamicD);
                    break;
                default:
                    break;
            }

            _tempdatamodel.eData = eData;
            _tempdatamodel.kData = kData;
            _tempdatamodel.personInfo = personInfo;
            _tempdatamodel.highestObj = highestObj;
        }

        return true;
    }

    public function getWarAtkID():int {
        return atkID;
    }

    public function getWarOwnerID():int {
        return ownerID;
    }

    private function getLevelStruct(value:int):CTLevelStruct {
        var struct:CTLevelStruct;

        var countryID:int = value >> 6;
        var levelID:int = value & 0x3f;

        switch (countryID) {
            case 0:
                struct = findStruct(eData, levelID);
                break;
            case 1:
                struct = findStruct(kData, levelID);
                break;
        }
        return struct;
    }

    private function findStruct(data:Array, levelID:int):CTLevelStruct {
        for each (var levelData:CTLevelStruct in data) {
            if (levelData.level == levelID) {
                return levelData;
                break;
            }
        }
        return null;
    }

    /**
     * 寻找名字的那个玩家数据
     * */
    private function getWarFightElementIndexFromVector(name:String, s_vector:Array):int {
        if (!s_vector)
            return -1;
        var len:int = s_vector.length;
        var index:int = -1;
        for (var i:int = 0; i < len; i++) {
            var warf:WarFightElementStruct = s_vector[i];
            if (warf.name == name) {
                index = i;
                break;
            }
        }
        return index;
    }
}
}