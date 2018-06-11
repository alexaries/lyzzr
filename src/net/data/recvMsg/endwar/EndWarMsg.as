package net.data.recvMsg.endwar {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.endwar.StaffStruct;
import net.utils.BytesUtil;

public class EndWarMsg extends BaseMsg {

    private var _type:uint;
    private var _isIn:uint;
    public var status:uint;
    public var myStatus:uint;
    public var cd:int;
    private var _result:uint;
    private var _playerList:Array;

    public var percent:uint;
    public var clanPoint:uint;
    public var point:uint;
    private var _currTime:uint;
    private var _startTime:uint;
    private var _endTime:uint;


    //6神器充能进度
    public var artifact:Array = [0, 0, 0, 0, 0, 0];
    public var clanData:Array = [0, 0, 0, 0];
    public var buffs:Array = [];
    public var captain:String;
    public var xianyun:uint;
    public var bossMode:uint;
    public var bossPower:uint;
    public var bossMaxHp:uint;
    public var bossHp:uint;
    public var bossMaxHp2:uint;
    public var bossHp2:uint;


    //占领帮派数
    public var clanCount:int;
    //已占领人数
    public var num:int;
    public var maxNum:int;
    public var clans:Array;
    public var players:Array

    public var clanName:String;
    public var playerName:String;
    public var place:uint;
    public var str:String;

    public var time:uint;

    public function EndWarMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            var idBytes:ByteArray;
            _type = BytesUtil.readByte1(bytes);
            var len:int;
            var i:int;
            var count:int;
            var clanObj:StaffStruct;
            var staff:StaffStruct;
            switch (_type) {
                case 0:
                    status = BytesUtil.readByte1(bytes);
                    /**在帮派中*/
                    if (status == 0) {
                        myStatus = BytesUtil.readByte1(bytes);
                        cd = BytesUtil.readByte1(bytes);
                        place = BytesUtil.readByte1(bytes);
                        percent = BytesUtil.readByte1(bytes);
                        captain = BytesUtil.readUserName(bytes);
                        xianyun = bytes.readUnsignedInt();
                        clanPoint = bytes.readUnsignedInt();
                        point = bytes.readUnsignedInt();

                        for (i = 0; i < 4; i++) {//人员
                            clanData[i] = BytesUtil.readByte1(bytes);
                        }
                        for (i = 0; i < 3; i++) {//鼓舞次数
                            buffs[i] = BytesUtil.readByte1(bytes);
                        }
                        for (i = 0; i < 6; i++) {//神器充能
                            artifact[i] = bytes.readUnsignedShort();
                        }
                        count = BytesUtil.readByte1(bytes);
                        clans = [];
                        for (i = 0; i < count; i++) {
                            var obj:Object = new Object;
                            obj.rank = i + 1;
                            obj.name = BytesUtil.readUserName(bytes);
                            obj.p = bytes.readUnsignedInt();
                            clans.push(obj);
                        }
                    }
                    break;
                case 1:
                    bossMode = BytesUtil.readByte1(bytes);
                    bossPower = BytesUtil.readByte1(bytes);
                    bossMaxHp = bytes.readUnsignedInt();
                    bossHp = bytes.readUnsignedInt();
                    bossMaxHp2 = bytes.readUnsignedInt();
                    bossHp2 = bytes.readUnsignedInt();
                    break;
                case 2:
                    status = BytesUtil.readByte1(bytes);
                    break;
                case 3:
                    xianyun = BytesUtil.readByte1(bytes);
                    status = BytesUtil.readByte1(bytes);
                    if (status >= 2) {
                        clanName = BytesUtil.readUserName(bytes);
                        playerName = BytesUtil.readUserName(bytes);
                    }
                    break;
                case 4:
                    clans = [];
                    num = bytes.readUnsignedShort();
                    maxNum = bytes.readUnsignedShort();
                    count = bytes.readUnsignedShort();
                    for (i = 0; i < count; i++) {//占领信息
                        clanObj = new StaffStruct;
                        clanObj.status = 0;
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        clanObj.id = BytesUtil.readUint64(idBytes);
                        trace(clanObj.id.toString());
                        clanObj.clan = BytesUtil.readUserName(bytes);
                        clanObj.n = BytesUtil.readByte1(bytes);
                        clans.push(clanObj);
                    }
                    //testClans();
                    break;
                case 5:
                    players = [];
                    count = BytesUtil.readByte1(bytes);
                    for (i = 0; i < count; i++) {//占领信息
                        staff = new StaffStruct;
                        staff.status = 2;
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        staff.id = BytesUtil.readUint64(idBytes);
                        staff.name = BytesUtil.readUserName(bytes);
                        staff.level = BytesUtil.readByte1(bytes);
                        staff.n = BytesUtil.readByte1(bytes);
                        players.push(staff);
                    }
                    //testPlayers()
                    break;
                case 6:
                    status = BytesUtil.readByte1(bytes);
                    break;
                case 7:
                    point = BytesUtil.readByte1(bytes);
                    status = BytesUtil.readByte1(bytes);
                    if (status >= 2) {
                        clanName = BytesUtil.readUserName(bytes);
                        playerName = BytesUtil.readUserName(bytes);
                    }
                    break;
                case 8:
                    clans = [];
                    num = bytes.readUnsignedShort();
                    maxNum = bytes.readUnsignedShort();
                    count = bytes.readUnsignedShort();
                    for (i = 0; i < count; i++) {//占领信息
                        clanObj = new StaffStruct;
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        clanObj.id = BytesUtil.readUint64(idBytes);
                        clanObj.clan = BytesUtil.readUserName(bytes);
                        clanObj.n = BytesUtil.readByte1(bytes);
                        clanObj.status = 1;
                        clans.push(clanObj);
                    }

                    break;
                case 9:
                    players = [];
                    count = BytesUtil.readByte1(bytes);
                    for (i = 0; i < count; i++) {//占领信息
                        staff = new StaffStruct;
                        staff.status = 3;
                        idBytes = BytesUtil.creatByteArray();
                        bytes.readBytes(idBytes, 0, 8);
                        staff.id = BytesUtil.readUint64(idBytes);
                        staff.name = BytesUtil.readUserName(bytes);
                        staff.level = BytesUtil.readByte1(bytes);
                        staff.n = BytesUtil.readByte1(bytes);
                        players.push(staff);
                    }
                    //	testPlayers()
                    break;
                case 10:
                    for (i = 0; i < 6; i++) {//神器充能
                        artifact[i] = bytes.readUnsignedShort();
                    }
                    break;
                case 11:
                    myStatus = BytesUtil.readByte1(bytes);
                    cd = BytesUtil.readByte1(bytes);
                    place = BytesUtil.readByte1(bytes);
                    percent = BytesUtil.readByte1(bytes);
                    captain = BytesUtil.readUserName(bytes);
                    xianyun = bytes.readUnsignedInt();
                    clanPoint = bytes.readUnsignedInt();
                    point = bytes.readUnsignedInt();


                    for (i = 0; i < 4; i++) {//人员
                        clanData[i] = BytesUtil.readByte1(bytes);
                    }
                    for (i = 0; i < 3; i++) {//鼓舞次数
                        buffs[i] = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 12:
                    status = BytesUtil.readByte1(bytes);
                    break;
                case 13:
                    status = BytesUtil.readByte1(bytes);
                    break;
                case 14:
                    count = BytesUtil.readByte1(bytes);
                    for (i = 0; i < count; i++) {
                        var myobj:Object = new Object;
                        myobj.id = BytesUtil.readByte1(bytes);
                        myobj.time = bytes.readUnsignedInt();
                        myobj.cd = bytes.readUnsignedInt();
                        buffs.push(myobj);
                    }

                    break;
                case 15:
                    status = BytesUtil.readByte1(bytes);
                    bossPower = BytesUtil.readByte1(bytes);

                    trace("发动" + status + ":::" + bossPower)
                    break;
                case 16:
                    myStatus = BytesUtil.readByte1(bytes);
                    cd = BytesUtil.readByte1(bytes);
                    place = BytesUtil.readByte1(bytes);
                    break;
                case 17:
                    str = bytes.readUTF();
                    break;
                case 20:
                    status = BytesUtil.readByte1(bytes);
                    if (status < 2) {
                        time = bytes.readUnsignedInt();
                    }

//						_currTime = bytes.readUnsignedInt();
//						_startTime = bytes.readUnsignedInt();
//						_endTime = bytes.readUnsignedInt();
                    break;
                case 21:
                    //等待人数
                    for (i = 0; i < 4; i++) {//人员
                        clanData[i] = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 22:
                    //鼓舞
                    for (i = 0; i < 3; i++) {//鼓舞次数
                        buffs[i] = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 23:
                    //贡献 仙蕴
                    captain = BytesUtil.readUserName(bytes);
                    xianyun = bytes.readUnsignedInt();
                    clanPoint = bytes.readUnsignedInt();
                    point = bytes.readUnsignedInt();
                    break;
                case 24:
                    //排行榜
                    count = BytesUtil.readByte1(bytes);
                    clans = [];
                    for (i = 0; i < count; i++) {
                        var rankObj:Object = new Object;
                        rankObj.rank = i + 1;
                        rankObj.name = BytesUtil.readUserName(bytes);
                        rankObj.p = bytes.readUnsignedInt();
                        clans.push(rankObj);
                    }
                    //testTops();

                    break;
                case 25:
                    //末日进度百分比
                    percent = BytesUtil.readByte1(bytes);

                    break;
                default:
            }
        }
        catch (e:*) {

        }
        return true;
    }

    /*private function testTops():void
     {
     var rankObj:Object=new Object;
     rankObj.rank=1;
     rankObj.name="测试帮派5"
     rankObj.p=100000;
     clans.push(rankObj);
     var rankObj:Object=new Object;
     rankObj.rank=2;
     rankObj.name="测试帮派15"
     rankObj.p=200000;
     clans.push(rankObj);
     var rankObj:Object=new Object;
     rankObj.rank=3;
     rankObj.name="测试帮派3"
     rankObj.p=300000;
     clans.push(rankObj);
     }		

     private function testClans():void
     {

     for (var i=0;i<30;i++){//占领信息
     var staff:StaffStruct=new StaffStruct;
     staff.id=BigInteger.nbv(1);
     staff.name="测试帮派"+i
     staff.clan="测试帮派"+i
     staff.level=45;
     staff.status=1;
     staff.n=10+i;
     clans.push(staff);
     }
     }


     private function testPlayers():void{
     for (var i=0;i<50;i++){//占领信息
     var staff:StaffStruct=new StaffStruct;
     staff.id=BigInteger.nbv(1);
     staff.name="测试玩家"+i
     staff.level=45;
     staff.status=2;
     staff.n=5+i;
     players.push(staff);
     }
     }*/


    public function get type():uint {
        return _type;
    }

    public function get isIn():uint {
        return _isIn;
    }


    public function get result():uint {
        return _result;
    }

    public function get playerList():Array {
        return _playerList;
    }


    public function get currTime():uint {
        return _currTime;
    }

    public function get startTime():uint {
        return _startTime;
    }

    public function get endTime():uint {
        return _endTime;
    }

}
}
