/*******************************************************************************
 * Class name:    SWarTopListMsg.as
 * Description:
 * Author:        caoqingshan
 * Create:        Aug 17, 2012 5:57:40 PM
 * Update:        Aug 17, 2012 5:57:40 PM
 ******************************************************************************/
package net.data.recvMsg.sWar {
//-----------------------------------------------------------------------------
// import_declaration
//-----------------------------------------------------------------------------
import utils.ByteArray;

import net.data.BaseMsg;
import net.utils.BytesUtil;

public class SWarTopListMsg extends BaseMsg {
    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------
    public var type:uint;
    public var topList:Array;
    public var topList_team:Array;
    public var topList_server:Array;
    public var championList:Array;
    public var teamName:String;
    public var teamLeaderName:String;
    public var canbaiType:int;
    public var noCanbai:Boolean;
    //-----------------------------------------------------------------------------
    // Constructor
    //-----------------------------------------------------------------------------

    public function SWarTopListMsg() {
        super();
    }

    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            var len:uint;
            var obj:Object
            switch (type) {
                case 1:
                    topList = [];
                    len = BytesUtil.readByte2(bytes);
                    for (var i:int = 0; i < len; i++) {
                        obj = new Object();
                        obj.rank = BytesUtil.readByte2(bytes);
                        obj.name = BytesUtil.readUserName(bytes);
                        obj.flag = 1;
                        topList.push(obj);
                    }
                    break;
                case 2:
                    len = BytesUtil.readByte2(bytes);
                    topList_team = [];
                    for (var j:int = 0; j < len; j++) {
                        obj = new Object();
                        obj.rank = BytesUtil.readByte2(bytes);
                        obj.name = BytesUtil.readUserName(bytes);
                        obj.leaderName = BytesUtil.readUserName(bytes);
                        obj.member1Name = BytesUtil.readUserName(bytes);
                        obj.member2Name = BytesUtil.readUserName(bytes);
                        obj.flag = 2;
                        topList_team.push(obj);
                    }
                    break;
                case 6:
                    len = BytesUtil.readByte2(bytes);
                    topList_server = [];
                    for (var m:int = 0; m < len; m++) {
                        obj = new Object();
                        obj.rank = BytesUtil.readByte2(bytes);
                        obj.name = BytesUtil.readUserName(bytes);
                        var memberNums:uint = BytesUtil.readByte1(bytes);
                        var members:Array = parseChampion(bytes, memberNums);
                        obj.members = members;
                        obj.flag = 3;
                        topList_server.push(obj);
                    }
                    break;
                case 3:
                    championList = null;
                    len = BytesUtil.readByte1(bytes);
                    if (len == 0) {//无冠军参拜

                    } else {
                        parseChampion(bytes, len);
                        canbaiType = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 4:
                    championList = null;
                    if (bytes.position == bytes.length) {//无冠军参拜
                    } else {
                        teamName = BytesUtil.readUserName(bytes);
                        teamLeaderName = BytesUtil.readUserName(bytes);
                        len = BytesUtil.readByte1(bytes);
                        parseChampion(bytes, len);
                        var leaderData:Object;
                        for (var k:int = 0; k < 3; k++) {
                            if (championList[k].name == teamLeaderName) {
                                leaderData = championList[k];
                                championList.splice(k, 1);
                                championList.unshift(leaderData);
                                break;
                            }
                        }
                        canbaiType = BytesUtil.readByte1(bytes);
                    }
                    break;
                case 5:
                    championList = null;
                    if (bytes.position == bytes.length) {//无冠军参拜
                    } else {
                        teamName = BytesUtil.readUserName(bytes);
                        len = BytesUtil.readByte1(bytes);
                        parseChampion(bytes, len);
                        canbaiType = BytesUtil.readByte1(bytes);
                    }
                    break;
            }

        } catch (e:*) {

        }
        return true;
    }

    private function parseChampion(bytes:ByteArray, len:uint):Array {
        championList = [];
        var obj:Object;
        for (var i:int = 0; i < len; i++) {
            obj = {};
            obj.name = BytesUtil.readUserName(bytes);
            obj.level = BytesUtil.readByte1(bytes);
            obj.power = bytes.readUnsignedInt();
            obj.id = BytesUtil.readByte1(bytes);
            championList.push(obj);
        }
        return championList;
    }
}
}