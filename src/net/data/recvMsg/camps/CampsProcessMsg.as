package net.data.recvMsg.camps {
import utils.ByteArray;

import net.consts.TempDataModel;
import net.data.BaseMsg;
import net.data.structs.ctwar.CTLevelStruct;
import net.data.structs.ctwar.WarFightElementStruct;
import net.utils.BytesUtil;

/**
 * 消息协议：0x63  国战进行中的数据
 * @author r.c
 *
 */
public class CampsProcessMsg extends BaseMsg {
    public function CampsProcessMsg() {
        super();
    }

    // 峨眉积分
    public var ePoint:uint;
    // 昆仑积分
    public var kPoint:uint;
    /**
     * 峨眉数组
     */
    public var eData:Array;
    /**
     * 昆仑数组
     * @see WarFightElementStruct
     * */
    public var kData:Array;
    /**
     * 个人数据
     */
    public var personInfo:Array = [0, 0, 0, 0];
    /**
     * 个人战功
     */
    public var selfAchive:int = 0;
    /**
     * 最高连杀者数据
     */
    public var highestObj:Object;
    private var _tempdatamodel:TempDataModel = TempDataModel.getInstance();
    private var _flag:int;
    private var _type:int;
    private var _time:uint;
    // 攻击者ID
    private var atkID:int = 0;
    // 占有者ID
    private var ownerID:int;

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        _type = BytesUtil.readByte1(bytes);
        switch (_type) {
            case 0:
                // 正常数据   当玩家进入国战据点   打开面板的的时候向服务器请求的数据(第一次)；
                getStaticUserDatas(bytes);
                break;
            case 1:
                selfAchive = BytesUtil.readByte2(bytes);
                break;
            case 2:
                // 国战状态切换
                changeCTWarStatus(bytes);
                break;
        }
        return true;
    }

    /**
     * 国战状态切换
     *
     * byte    stage    0-准备阶段    1-国战开始
     * uint    timeLeft    剩余秒数
     * */
    private function changeCTWarStatus(bytes:ByteArray):void {
        _flag = BytesUtil.readByte1(bytes);
        _time = bytes.readUnsignedInt();
    }

    private function getStaticUserDatas(bytes:ByteArray):void {
        _flag = BytesUtil.readByte1(bytes);
        _time = bytes.readUnsignedInt();

        var type:int = BytesUtil.readByte1(bytes);

        eData = [];
        kData = [];

        switch (type) {
            case 0:
                // 中立
                ownerID = 0;
                break;
            case 1:
            case 2:
                // 非中立
                ownerID = type;
                atkID = type % 2 + 1;
                break;
        }

        ePoint = bytes.readUnsignedInt();
        kPoint = bytes.readUnsignedInt();

//			ePoint = BytesUtil.readByte2(bytes);
//			kPoint = BytesUtil.readByte2(bytes);

        selfAchive = BytesUtil.readByte2(bytes);
        personInfo[2] = BytesUtil.readByte1(bytes);
        personInfo[3] = BytesUtil.readByte1(bytes);
        personInfo[1] = BytesUtil.readByte1(bytes);
        personInfo[0] = BytesUtil.readByte1(bytes);

        highestObj = new Object();

        highestObj.msCountry = BytesUtil.readByte1(bytes);
        highestObj.msName = BytesUtil.readUserName(bytes);
        highestObj.msFreak = BytesUtil.readByte1(bytes);

        // 峨眉数据
        readDataStruct(bytes, eData);

        // 昆仑数据
        readDataStruct(bytes, kData);

        // 存取 缓存
        _tempdatamodel.eData = eData;
        _tempdatamodel.kData = kData;
        _tempdatamodel.atkID = atkID;
        _tempdatamodel.ownerID = ownerID;
        _tempdatamodel.ePoint = ePoint;
        _tempdatamodel.kPoint = kPoint;
        _tempdatamodel.personInfo = personInfo;
        _tempdatamodel.highestObj = highestObj;
    }

    private function readDataStruct(bytes:ByteArray, data:Array):void {
        var len:int = BytesUtil.readByte1(bytes);

        for (var i:int = 0; i < len; i++) {
            var levelData:CTLevelStruct = new CTLevelStruct();
            levelData.level = BytesUtil.readByte1(bytes);
            levelData.nums = BytesUtil.readByte2(bytes);
            levelData.usersData = [];
            for (var j:int = 0; j < levelData.nums; j++) {
                var warfighter:WarFightElementStruct = readWarFightElement(bytes);
                levelData.usersData.push(warfighter);
            }
            data.push(levelData);
        }
    }

    public function getWarAtkID():int {
        return atkID;
    }

    public function getWarOwnerID():int {
        return ownerID;
    }

    public function getTime():uint {
        return _time;
    }

    public function getFlag():int {
        return _flag;
    }

    public function getType():int {
        return _type;
    }

    // 读取的 一个静态   元素
    private function readWarFightElement(bytes:ByteArray):WarFightElementStruct {
        var warfighte:WarFightElementStruct = new WarFightElementStruct();
        warfighte.name = BytesUtil.readUserName(bytes);
        warfighte.isrestable = BytesUtil.readByte1(bytes);
        return warfighte;
    }
}
}