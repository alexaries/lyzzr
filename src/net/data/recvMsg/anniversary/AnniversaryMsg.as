package net.data.recvMsg.anniversary {
import laya.utils.Dictionary;

import utils.ByteArray; 

import net.data.BaseMsg;
import net.data.sendCmd.anniversary.AnniversaryCmd;
import net.utils.BytesUtil;

public class AnniversaryMsg extends BaseMsg {
    public static const GIFTS_TYPE:String = "gifts_type";
    public static const GIFTS_RESULT:String = "gifts_result";

    public static const ROUTE_INFO_TYPE:String = "route_info_type";
    public static const ROUTE_EVENT:String = "route_event";
    public static const ROUTE_SCORE0:String = "route_score0";
    public static const ROUTE_SCORE1:String = "route_score1";
    public static const ROUTE_SCORE2:String = "route_score2";
    public static const ROUTE_SCORE3:String = "route_score3";
    public static const ROUTE_SCORE4:String = "route_score4";
    public static const ROUTE_UPDATING_SCORE:String = "route_updating_score";
    public static const ROUTE_LEADER1:String = "route_leader1";
    public static const ROUTE_LEADER2:String = "route_leader2";
    public static const ROUTE_LEADER3:String = "route_leader3";
    public static const ROUTE_LEADER4:String = "route_leader4";
    public static const ROUTE_UPDATING_LEADER:String = "route_updating_leader";
    public static const ROUTE_LEADER_SCORE1:String = "route_leader_score1";
    public static const ROUTE_LEADER_SCORE2:String = "route_leader_score2";
    public static const ROUTE_LEADER_SCORE3:String = "route_leader_score3";
    public static const ROUTE_LEADER_SCORE4:String = "route_leader_score4";
    public static const ROUTE_POS:String = "route_pos";
    public static const ROUTE_POS1:String = "route_pos1";
    public static const MULTI_STEPS:String = "multiSteps";
    public static const PREV_STEPS:String = "prev_steps";
    public static var _routeScoreKeys:Vector.<String>;
    public static var _routeLeaderScoreKeys:Vector.<String>;
    public static var _routeLeaderKeys:Vector.<String>;


    public var type:uint;
    public var data:Dictionary = new Dictionary();
    public var flag:uint;

    public function AnniversaryMsg() {
        super();

        _routeScoreKeys = new <String>[ROUTE_SCORE0, ROUTE_SCORE1, ROUTE_SCORE2, ROUTE_SCORE3, ROUTE_SCORE4];
        _routeLeaderScoreKeys = new <String>[ROUTE_LEADER_SCORE1, ROUTE_LEADER_SCORE2, ROUTE_LEADER_SCORE3, ROUTE_LEADER_SCORE4];
        _routeLeaderKeys = new <String>[ROUTE_LEADER1, ROUTE_LEADER2, ROUTE_LEADER3, ROUTE_LEADER4];
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        var temp:int;

        bytes.position = 0;
        type = bytes.readByte();
        switch (type) {
            case AnniversaryCmd.GIFTS:
                data.set("gifts_type",bytes.readByte());
                data.set("gifts_result", bytes.readByte());
                break;
            case AnniversaryCmd.ROUTE:
                data.set(ROUTE_INFO_TYPE, bytes.readByte());
                if (data.get(ROUTE_INFO_TYPE) == 0) {
                    data.set(ROUTE_SCORE0, bytes.readUnsignedInt());
                    data.set(ROUTE_EVENT, bytes.readByte());
                    data.set(ROUTE_SCORE1, bytes.readUnsignedInt());
                    data.set(ROUTE_SCORE2, bytes.readUnsignedInt());
                    data.set(ROUTE_SCORE3, bytes.readUnsignedInt());
                    data.set(ROUTE_SCORE4, bytes.readUnsignedInt());
                    var i:int, len:uint = _routeLeaderKeys.length//_routeLeaderScoreKeys.length;
                    for (i = 0; i < len; i++) {
                        data.set(_routeLeaderKeys[i], BytesUtil.readUserName(bytes));
                        data.set(_routeLeaderScoreKeys[i], bytes.readUnsignedInt());
                        if (data.get(_routeLeaderScoreKeys[i])== 0) {
                            data.set(_routeLeaderKeys[i], "");
                        }
//							data.set(_routeLeaderScoreKeys[i], bytes.readUnsignedInt();
//							if(data.set(_routeLeaderScoreKeys[i],= 0)
//							{
//								data.set(_routeLeaderKeys[i], "";
//							}
//							else
//							{
//								data.set(_routeLeaderKeys[i], bytes.readUTF();
//							}
                    }
                }
                else if (data.get(ROUTE_INFO_TYPE)== 1) {
//						data.set(ROUTE_POS, 3;
//						data.set(ROUTE_POS1, 1;
//						data.set(ROUTE_UPDATING_SCORE, 1;
//						if(data.set(ROUTE_UPDATING_SCORE] > 0)
//						{
//							data.set(_routeScoreKeys[data.set(ROUTE_UPDATING_SCORE] - 1], 10;
//						}

                    data.set(ROUTE_POS, bytes.readUnsignedInt());
                    data.set(ROUTE_POS1, bytes.readByte());
                    data.set(ROUTE_UPDATING_SCORE, bytes.readByte());
                    if (data.get(ROUTE_UPDATING_SCORE)> 0) {
                        data.set(_routeScoreKeys[data.get(ROUTE_UPDATING_SCORE)], bytes.readUnsignedInt());
                    }
                }
                else if (data.get(ROUTE_INFO_TYPE)== 2) {
                    data.set(ROUTE_UPDATING_LEADER, bytes.readByte());
                    if (data.get(ROUTE_UPDATING_LEADER) < 1 || data.get(ROUTE_UPDATING_LEADER) > 4) {
                        throw new Error("");
                    }
                    var tempName:String = BytesUtil.readUserName(bytes);
                    var tempScore:int = bytes.readUnsignedInt();
                    if (tempScore == 0) {
                        data.set(_routeLeaderKeys[data.get(ROUTE_UPDATING_LEADER) - 1], "");
                    }
                    else {
                        data.set(_routeLeaderKeys[data.get(ROUTE_UPDATING_LEADER) - 1], tempName);
                    }
                    data.set(_routeLeaderScoreKeys[data.get(ROUTE_UPDATING_LEADER) - 1], tempScore);
                }
                break;
            case AnniversaryCmd.VOICE:
            case AnniversaryCmd.BLUEGIFT:
                flag = bytes.readByte();
                break;
        }
        return true;
    }
}
}