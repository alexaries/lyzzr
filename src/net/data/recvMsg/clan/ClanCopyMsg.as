package net.data.recvMsg.clan {
import com.hurlant.math.BigInteger;

import net.consts.StaticConfig;
import net.data.BaseMsg;
import net.data.structs.clan.CcAwardInfo;
import net.data.structs.clan.CcBaseInfo;
import net.data.structs.clan.CcBattleStruct;
import net.data.structs.clan.CcFightInfo;
import net.data.structs.clan.CcItemStruct;
import net.data.structs.clan.CcMonsterStruct;
import net.data.structs.clan.CcPlayerStruct;
import net.data.structs.clan.CcSpotStruct;
import net.data.structs.clan.ClanCopyLogsStruct;
import net.utils.BytesUtil;

import utils.ByteArray;

public class ClanCopyMsg extends BaseMsg {
    public var type:uint;
    public var typePop:uint;
    public var name:String;
    public var onlineMemberCount:uint;
    public var statueTechLevel:uint;
    public var copyTechLevel:uint;
    public var robTechLevel:uint;
    public var statueLevel:uint;
    public var statueExp:uint;
    public var statueNextExp:uint;
    public var expOut:int;
    public var expConsume:uint;
    public var exHp:uint;
    public var exAttack:uint;
    public var exDefend:uint;
    public var copyLevel:uint;
    public var expOutput:uint;
    public var expOutputNext:uint;
    public var buttonType:uint;
    public var copyMemberCount:uint;
    public var robWearyValue:uint;
    public var robButtonType:uint;
    public var logNum:uint;
    public var logs:Array;

    public var baseInfo:CcBaseInfo;
    public var fightInfo:CcFightInfo;
//		public var awardValue:int;
    public var awardInfo:CcAwardInfo;

    public var status:int;
    public var leftTime:int;
    public var yuanShenCount:int;
    public var bossHp:int;
    public var bossLeftHp:int;
    public var cd:int;
    public var damageList:Array;
    public var orderResult:int;
    public var bossType:int;
    public var count:int;
    public var goodsArr:Array;
    public var shopType:int;
    public var bossBuffStatu:int;
    public var bossAllotarr:Array;
    public var Allotflag:Boolean;

    public function ClanCopyMsg() {
        super();
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            if (type == 0x01) {
                name = BytesUtil.readUserName(bytes);
                onlineMemberCount = BytesUtil.readByte1(bytes);
                statueTechLevel = BytesUtil.readByte2(bytes);
                copyTechLevel = bytes.readUnsignedInt();
                robTechLevel = BytesUtil.readByte2(bytes);
                statueLevel = BytesUtil.readByte2(bytes);
                statueExp = bytes.readUnsignedInt();
                statueNextExp = bytes.readUnsignedInt();
                expOut = bytes.readInt();
                expConsume = bytes.readUnsignedInt();
                exHp = bytes.readUnsignedInt();
                exAttack = bytes.readUnsignedInt();
                exDefend = bytes.readUnsignedInt();
                copyLevel = BytesUtil.readByte2(bytes);
                expOutput = bytes.readUnsignedInt();
                expOutputNext = bytes.readUnsignedInt();
                buttonType = BytesUtil.readByte1(bytes);
                copyMemberCount = BytesUtil.readByte1(bytes);
                robWearyValue = BytesUtil.readByte1(bytes);
                robButtonType = BytesUtil.readByte1(bytes);
                logNum = BytesUtil.readByte1(bytes);
                logs = [];
                var item:ClanCopyLogsStruct;
                for (var i:int = 0; i < logNum; i++) {
                    item = readClanCopyLogsStruct(bytes);
                    logs.push(item);
                }
            }
            else if (type == 0x02) {
                typePop = BytesUtil.readByte1(bytes);
                if (typePop == 3) {
//						awardValue = bytes.readUnsignedInt();
                    readAwardInfo(bytes);
                } else if (typePop == 6) {
                    awardInfo = new CcAwardInfo();
                    awardInfo.bNoAward = true;
                    awardInfo.awardValue = bytes.readUnsignedInt();
                    awardInfo.expOutput = bytes.readInt();
                }
            }
            else if (type == 0x03) {
                readBaseInfo(bytes);
            }
            else if (type == 0x04) {
                readFightInfo(bytes);
            } else if (type == 0x10) {
                readBossInfo(bytes);
            } else if (type == 0x30) {
                readShopInfo(bytes);
            }
        }
        catch (e:*) {

        }
        return true;
    }

    private function readShopInfo(bytes:ByteArray):void {
    }

    private function readBossInfo(bytes:ByteArray):void {
        bossType = BytesUtil.readByte1(bytes);
        var count:int;
        if (bossType == 1) {
            status = BytesUtil.readByte1(bytes);
            switch (status) {
                case 0:
                    bossAllotarr = [0, 0];
                    var idBytes0:ByteArray = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes0, 0, 8);
                    bossAllotarr[0] = BytesUtil.readUint64(idBytes0);
                    var idBytes2:ByteArray = BytesUtil.creatByteArray();
                    bytes.readBytes(idBytes2, 0, 8);
                    bossAllotarr[1] = BytesUtil.readUint64(idBytes2);
//                    Allotflag = (bossAllotarr[0] as BigInteger).equals(StaticConfig.bigUserId);
//                    if (!Allotflag)
//                        Allotflag = (bossAllotarr[1] as BigInteger).equals(StaticConfig.bigUserId);
                    Allotflag = (bossAllotarr[0] as BigInteger).equals(StaticConfig.bigUserId);
                    if (!Allotflag)
                        Allotflag = (bossAllotarr[1] as BigInteger).equals(StaticConfig.bigUserId);
                    break;
                case 1:
                    leftTime = bytes.readUnsignedInt();
                    break;
                case 2:
                    cd = bytes.readUnsignedInt();
                    bossHp = bytes.readUnsignedInt();
                    bossLeftHp = bytes.readUnsignedInt();
                    yuanShenCount = BytesUtil.readByte1(bytes);
                    count = BytesUtil.readByte1(bytes);
                    damageList = [];
                    var obj:Object;
                    for (var i:int = 0; i < count; i++) {
                        obj = {};
                        obj.rank = i + 1;
                        obj.name = BytesUtil.readUserName(bytes);
                        obj.damage = bytes.readUnsignedInt();
                        damageList.push(obj);
                    }
                    break;
                case 3: //结束
                    break;
            }
        } else if (bossType == 2) {
            orderResult = BytesUtil.readByte1(bytes);
        } else if (bossType == 5) {
            bossBuffStatu = BytesUtil.readByte1(bytes);
        } else if (bossType == 6) {
            bossAllotarr = [0, 0];
            var idBytes:ByteArray = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes, 0, 8);
            bossAllotarr[0] = BytesUtil.readUint64(idBytes);
            var idBytes1:ByteArray = BytesUtil.creatByteArray();
            bytes.readBytes(idBytes1, 0, 8);
            bossAllotarr[1] = BytesUtil.readUint64(idBytes1);

//            Allotflag = (bossAllotarr[0] as BigInteger).equals(StaticConfig.bigUserId);
//            if (!Allotflag)
//                Allotflag = (bossAllotarr[1] as BigInteger).equals(StaticConfig.bigUserId);
            Allotflag = (bossAllotarr[0] as BigInteger).equals(StaticConfig.bigUserId);
            if (!Allotflag)
                Allotflag = (bossAllotarr[1] as BigInteger).equals(StaticConfig.bigUserId);



        }

    }

    private function readAwardInfo(bytes:ByteArray):void {
        awardInfo = new CcAwardInfo();
        awardInfo.awardValue = bytes.readUnsignedInt();
        awardInfo.expOutput = bytes.readInt();
        awardInfo.itemList = new Array();
        var itemCount:int = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < itemCount; i++) {
            var item:CcItemStruct = new CcItemStruct();
            awardInfo.itemList.push(item);
            item.itemId = bytes.readUnsignedInt();
            item.itemCount = BytesUtil.readByte2(bytes);
        }
    }

    private function readFightInfo(bytes:ByteArray):void {
        fightInfo = new CcFightInfo();
        fightInfo.copyId = bytes.readUnsignedInt();
        fightInfo.copyLevel = BytesUtil.readByte2(bytes);
        fightInfo.maxWaveCount = BytesUtil.readByte2(bytes);
        fightInfo.curWaveCount = BytesUtil.readByte2(bytes);
        fightInfo.homeMaxHp = bytes.readUnsignedInt();
        fightInfo.homeHp = bytes.readUnsignedInt();
        fightInfo.tickCount = BytesUtil.readByte2(bytes);
        fightInfo.spotList = new Array();
        var spotCount:int = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < spotCount; i++) {
            var spot:CcSpotStruct = new CcSpotStruct();
            fightInfo.spotList.push(spot);
            spot.spotId = BytesUtil.readByte1(bytes);
            spot.spotMaxPlayer = BytesUtil.readByte1(bytes);
            spot.bufferType = BytesUtil.readByte1(bytes);
            spot.bufferValue = BytesUtil.readByte2(bytes);
            spot.playerList = new Array();
            var playerCount:int = BytesUtil.readByte1(bytes);
            for (var j:int = 0; j < playerCount; j++) {
                var player:CcPlayerStruct = new CcPlayerStruct();
                spot.playerList.push(player);
                player.playerIndex = BytesUtil.readByte1(bytes);
                var idBytes:ByteArray;
                idBytes = BytesUtil.creatByteArray();
                bytes.readBytes(idBytes, 0, 8);
                player.playerId = BytesUtil.readUint64(idBytes);
                player.deadType = BytesUtil.readByte1(bytes);
//					player.skillType = BytesUtil.readByte1(bytes);
                player.spotId = spot.spotId;
            }
            spot.monsterList = new Array();
            var monsterCount:int = BytesUtil.readByte1(bytes);
            for (j = 0; j < monsterCount; j++) {
                var monster:CcMonsterStruct = new CcMonsterStruct();
                spot.monsterList.push(monster);
                monster.monsterIndex = bytes.readUnsignedInt();
                monster.monsterId = bytes.readUnsignedInt();
                monster.monsterType = BytesUtil.readByte1(bytes);
                monster.monsterValue = BytesUtil.readByte2(bytes);
                monster.nextSpotId = BytesUtil.readByte1(bytes);
                monster.isDead = BytesUtil.readByte1(bytes);
                monster.spotId = spot.spotId;
            }
            spot.battleList = new Array();
            var battleInfoCount:int = BytesUtil.readByte1(bytes);
            for (j = 0; j < battleInfoCount; j++) {
                var battle:CcBattleStruct = new CcBattleStruct();
                spot.battleList.push(battle);
                idBytes = BytesUtil.creatByteArray();
                bytes.readBytes(idBytes, 0, 8);
                battle.playerId = BytesUtil.readUint64(idBytes);
                battle.monsterIndex = bytes.readUnsignedInt();
                battle.result = BytesUtil.readByte1(bytes);
//					battle.skillType = BytesUtil.readByte1(bytes);
                battle.remainHp = BytesUtil.readByte1(bytes);
                battle.spotId = spot.spotId;
                for each (player in spot.playerList) {
                    if (player.playerId.equals(battle.playerId)) {
                        player.deadType = 3;
                    }
                }
                for each (monster in spot.monsterList) {
                    if (monster.monsterIndex == battle.monsterIndex) {
                        battle.monsterId = monster.monsterId;
                        if (battle.result != 0xFF) {
                            monster.isDead = 2;
                        }
                    }
                }
                if (battle.result == 0xFF) {
                    battle.monsterId = battle.playerId.valueOf();
                    battle.remainHp = fightInfo.homeHp;
                }
            }
        }
//        trace(fightInfo.toXML())
    }

    private function readBaseInfo(bytes:ByteArray):void {
        baseInfo = new CcBaseInfo();
        baseInfo.copyLevel = BytesUtil.readByte2(bytes);
        baseInfo.spotList = new Array();
        var spotCount:int = BytesUtil.readByte1(bytes);
        for (var i:int = 0; i < spotCount; i++) {
            var spot:CcSpotStruct = new CcSpotStruct();
            baseInfo.spotList.push(spot);
            spot.spotId = BytesUtil.readByte1(bytes);
            spot.spotMaxPlayer = BytesUtil.readByte1(bytes);
            spot.bufferType = BytesUtil.readByte1(bytes);
            spot.bufferValue = BytesUtil.readByte2(bytes);
            spot.playerList = new Array();
            var playerCount:int = BytesUtil.readByte1(bytes);
            for (var j:int = 0; j < playerCount; j++) {
                var player:CcPlayerStruct = new CcPlayerStruct();
                spot.playerList.push(player);
                player.playerIndex = BytesUtil.readByte1(bytes);
                var idBytes:ByteArray;
                idBytes = BytesUtil.creatByteArray();
                bytes.readBytes(idBytes, 0, 8);
                player.playerId = BytesUtil.readUint64(idBytes);
                player.playerName = BytesUtil.readUserName(bytes);
                player.playerLevel = BytesUtil.readByte1(bytes);
//					player.skillType = BytesUtil.readByte1(bytes);
                player.spotId = spot.spotId;
            }
        }
    }

    private function readClanCopyLogsStruct(bytes:ByteArray):ClanCopyLogsStruct {
        var item:ClanCopyLogsStruct = new ClanCopyLogsStruct();
        item.year = BytesUtil.readByte2(bytes);
        item.month = BytesUtil.readByte1(bytes);
        item.data = BytesUtil.readByte1(bytes);
        item.type = BytesUtil.readByte1(bytes);
        switch (item.type) {
            case 1:
            {
                item.name = BytesUtil.readUserName(bytes);
                item.level = BytesUtil.readByte1(bytes);
                break;
            }
            case 2:
            {
                item.downedLevel = BytesUtil.readByte1(bytes);
                break;
            }
        }
        return item;
    }
}
}
