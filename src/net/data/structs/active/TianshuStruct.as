package net.data.structs.active {
import com.hurlant.math.BigInteger;

import utils.ByteArray;

import net.utils.BytesUtil;

public class TianshuStruct {
    //
    public var flag:uint;
    public var emName1:String;
    public var emScore1:uint;
    public var emTotal:uint;
    public var emName2:String;
    public var emScore2:uint;
    public var klName1:String;
    public var klScore1:uint;
    public var klName2:String;
    public var klScore2:uint;
    public var klTotal:uint;
    //帮派
    public var type:uint;
    public var clanRanks:Array;
    public var clanScore:uint;
    public var clanRank:uint;
    public var clanEmRanks:Array;
    public var clanKlRanks:Array;
    //个人
    public var ranks:Array;
    public var myRank:uint;
    public var myScore:uint;

    public var members:Array;
    public var total:uint;
    public var todayTotal:uint;
    public var day:uint;
    public var rechange:uint;
    public var consum:uint;
    public var tasks:Array;


    public var dayRanks:Array = [];//每日排行
    public var myDayRank:uint = 0;//我的今日排行
    public var myDayScore:uint = 0;//我的今日积分

    /**每日礼包领取状态*/
    public var dayGiftState:int;
//		public var dayGiftState:Vector.<int> = new Vector.<int>(5);
    public function TianshuStruct() {
    }

    public static function read0x01(bytes:ByteArray):TianshuStruct {
        var len:uint;
        var i:uint;
        var struct:TianshuStruct = new TianshuStruct;
        struct.type = bytes.readUnsignedByte();
        switch (struct.type) {
            case 0:
                len = bytes.readUnsignedByte();
                struct.ranks = [];
                for (i = 0; i < len; i++) {
                    struct.ranks[i] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt()];
                }
                break;
            case 1:
                struct.ranks = [];
                len = bytes.readUnsignedByte();
                struct.ranks[i] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt(), bytes.readUnsignedByte()];
                break;
            case 2:
                struct.myScore = bytes.readUnsignedInt();
                struct.myRank = bytes.readUnsignedByte();
                break;
            case 3:
                len = bytes.readUnsignedByte();
                for (i = 0; i < len; i++) {
                    struct.dayRanks[i] = {};
                    struct.dayRanks[i].name = BytesUtil.readUserName(bytes);
                    struct.dayRanks[i].score = bytes.readUnsignedInt()
                }
                struct.myDayScore = bytes.readUnsignedInt();
                struct.myDayRank = bytes.readUnsignedByte();
                break;
        }
        return struct;
    }

    public static function read0x03(bytes:ByteArray):TianshuStruct {
        var len:uint;
        var i:uint;
        var struct:TianshuStruct = new TianshuStruct;
        struct.type = bytes.readUnsignedByte();
        switch (struct.type) {
            case 0:
                len = bytes.readUnsignedByte();
                struct.clanRanks = [];
                for (i = 0; i < len; i++) {
                    struct.clanRanks[i] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt()];
                }
                break;
            case 1:
                struct.clanRanks = [];
                len = bytes.readUnsignedByte();
                struct.clanRanks[len] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt()];
                break;
            case 2:
                struct.clanScore = bytes.readUnsignedInt();
                struct.clanRank = bytes.readUnsignedByte();
                break;
            case 3:
                struct.clanEmRanks = [];
                len = bytes.readUnsignedByte();
                for (i = 0; i < len; i++) {
                    struct.clanEmRanks[i] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt()];
                    switch (i) {
                        case 0:
                            struct.emName1 = struct.clanEmRanks[i][0];
                            struct.emScore1 = struct.clanEmRanks[i][1];
                            break;
                        case 1:
                            struct.emName2 = struct.clanEmRanks[i][0];
                            struct.emScore2 = struct.clanEmRanks[i][1];
                            break;
                    }
                }
                struct.clanKlRanks = [];
                len = bytes.readUnsignedByte();
                for (i = 0; i < len; i++) {
                    struct.clanKlRanks[i] = [BytesUtil.readUserName(bytes), bytes.readUnsignedInt()];
                    switch (i) {
                        case 0:
                            struct.klName1 = struct.clanKlRanks[i][0];
                            struct.klScore1 = struct.clanKlRanks[i][1];
                            break;
                        case 1:
                            struct.klName2 = struct.clanKlRanks[i][0];
                            struct.klScore2 = struct.clanKlRanks[i][1];
                            break;
                    }
                }
                struct.emTotal = bytes.readUnsignedInt();
                struct.klTotal = bytes.readUnsignedInt();

                break;
        }
        return struct;
    }

    public static function read0x04(bytes:ByteArray):TianshuStruct {
        var len:uint;
        var i:uint;
        var struct:TianshuStruct = new TianshuStruct;
        len = bytes.readUnsignedByte();
        struct.members = [];
        for (i = 0; i < len; i++) {
            struct.members[i] = [BytesUtil.readUserName(bytes), readPlayerId(bytes), bytes.readUnsignedInt(), bytes.readUnsignedByte()];
        }

        return struct;
    }

    public static function read0x05(bytes:ByteArray):TianshuStruct {
        var len:uint;
        var i:uint;
        var struct:TianshuStruct = new TianshuStruct;
        struct.total = bytes.readUnsignedInt();
        struct.day = bytes.readUnsignedByte();
        struct.todayTotal = bytes.readUnsignedInt();
        struct.rechange = bytes.readUnsignedInt();
        struct.consum = bytes.readUnsignedInt();
        struct.tasks = [];
        len = bytes.readUnsignedByte();
        for (i = 0; i < len; i++) {
            struct.tasks.push([bytes.readUnsignedByte(), bytes.readUnsignedByte(), bytes.readUnsignedByte()]);
        }
        return struct;
    }

    public static function read0x07(bytes:ByteArray):TianshuStruct {
        var struct:TianshuStruct = new TianshuStruct;
        struct.dayGiftState = bytes.readByte();
        return struct;
    }

    private static function readPlayerId(bytes:ByteArray):BigInteger {
        var idBytes:ByteArray = BytesUtil.creatByteArray();
        var playerId:BigInteger;
        bytes.readBytes(idBytes, 0, 8);
        playerId = BytesUtil.readUint64(idBytes);
        return playerId;
    }
}
}
