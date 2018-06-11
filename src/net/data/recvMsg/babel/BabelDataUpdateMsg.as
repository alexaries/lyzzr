package net.data.recvMsg.babel {
import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.copy.CopyMonsterStruct;
import net.data.structs.copy.CopyRecordStruct;
import net.data.structs.copy.CopyRewardStruct;
import net.data.structs.copy.CopyRoportStruct;
import net.utils.BytesUtil;

/**
 * (S->C)消息类型 0x59<br>
 * 更新副本信息
 * @author RyanCao
 *
 */
public class BabelDataUpdateMsg extends BaseMsg {
    private var _justice:uint;

    public function BabelDataUpdateMsg() {
        super();
    }

    private var _flag:int;
    private var _type:int;

    private var _isUseHook:Boolean;
//		private var _mode:int ;

    /**
     *byte    level    副本级别<br>
     1 - 普通难度<br>
     2 - 修罗难度
     * @return
     *
     */
//		public function get mode():int
//		{
//			return _mode;
//		}
    /**
     *byte    type    副本类别<br>
     1 - 40级副本<br>
     2 - 50级副本<br>
     3 - 60级副本<br>
     4 - 70级副本<br>
     5 - 80级副本
     * @return
     *
     */
    public function get type():int {
        return _type;
    }

    /**
     *    返回副本信息的内容<br>
     0-当前副本玩家的信息<br>
     1-今日记录信息<br>
     2-我的收获记录<br>
     3 - 更新今日记录(后面内容同1 添加)<br>
     4 - 更新我的收获(后面内容同2 添加)<br>
     5 - 更新当前副本的其他信息
     * @return
     *
     */
    public function get flag():int {
        return _flag;
    }

    private var _isIn:int;
    private var _passCount:int;
    private var _firstPassTime:uint;

    private var _currentCount:int;
    private var _freeCount:int;
    private var _payCount:int;
    private var _currentFloor:int;
    private var _currentLevel:int;

    /**
     *    当前是否已进入副本<br>
     0 - 在副本中<br>
     1- 不在副本中
     * @return
     *
     */
    public function get isIn():int {
        return _isIn;
    }

    /**
     *首次通关时间
     * @return
     *
     */
    public function get firstPassTime():uint {
        return _firstPassTime;
    }

    /**
     *    累计通关次数
     * @return
     *
     */
    public function get passCount():int {
        return _passCount;
    }

    /**
     *当前副本难度 1 ,2
     * @return
     *
     */
    public function get currentLevel():int {
        return _currentLevel;
    }

    /**
     *当前副本层数
     * @return
     *
     */
    public function get currentFloor():int {
        return _currentFloor;
    }

    /**
     *当前次数
     * @return
     *
     */
    public function get currentCount():int {
        return _currentCount;
    }

    /**
     * 当前付费可进行的次数
     * */
    public function get payCount():int {
        return _payCount;
    }

    /**
     * 当前免费的副本次数
     * */
    public function get freeCount():int {
        return _freeCount;
    }

    /**
     * 取缓存 数据 <br>
     * flag为下列值时分别代表<br>
     * 0-此数据无用<br>
     1-今日记录信息，第一次取得的数据<code>CopyRecordStruct</code><br>
     2-我的收获记录，第一次取得的数据<code>CopyRewardStruct</code><br>
     3 - 更新今日记录(后面内容同1 添加)，在首次取得的数据后面加上<code>CopyRecordStruct</code><br>
     4 - 更新我的收获(后面内容同2 添加)，在首次取得的数据后面加上<code>CopyRewardStruct</code><br>
     5 - 更新当前副本的其他信息，代表的是怪物数据<code>CopyMonsterStruct</code>
     * @return
     *
     */
    public function get tempArray():Array {
        return arrTemp;
    }

    private var arrTemp:Array;

    public var arrTempReport:Array = new Array();

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {

            _flag = BytesUtil.readByte1(bytes);
            _type = BytesUtil.readByte1(bytes);
            //_mode = BytesUtil.readByte1(bytes);

            var len:int;
            var i:int;
            var j:int;
            arrTemp = [];

            var copyRecord:CopyRecordStruct;
            var copyReward:CopyRewardStruct;
            var copyMonster:CopyMonsterStruct;

            switch (_flag) {
                case 0:
                    _isIn = BytesUtil.readByte1(bytes);
//						if(_mode == 0)
//							_isIn = 0;
                    _currentCount = BytesUtil.readByte1(bytes);

                    var intTemp:int = BytesUtil.readByte1(bytes);

                    _freeCount = intTemp & 0x0f;
                    _payCount = intTemp >> 4;
                    ;

                    _passCount = BytesUtil.readByte2(bytes);
                    _firstPassTime = bytes.readUnsignedInt();
                    _justice = BytesUtil.readByte1(bytes);
                    _isUseHook = bytes.readBoolean();
                    break;
                case 1:
                    len = BytesUtil.readByte2(bytes);
                    for (i = 0; i < len; i++) {
                        copyRecord = new CopyRecordStruct();
                        copyRecord.playerCountryId = BytesUtil.readByte1(bytes);
                        copyRecord.playerName = BytesUtil.readUserName(bytes);
                        copyRecord.itemId = BytesUtil.readByte2(bytes);
                        copyRecord.itemNum = BytesUtil.readByte1(bytes);
                        arrTemp.push(copyRecord);
                    }
                    break;
                case 2:
                    len = BytesUtil.readByte2(bytes);
                    for (i = 0; i < len; i++) {
                        copyReward = new CopyRewardStruct();
                        copyReward.itemId = BytesUtil.readByte2(bytes);
                        copyReward.itemNum = BytesUtil.readByte1(bytes);
                        arrTemp.push(copyReward);
                    }
                    break;
                case 3:
                    len = BytesUtil.readByte2(bytes);
                    for (i = 0; i < len; i++) {
                        copyRecord = new CopyRecordStruct();
                        copyRecord.playerCountryId = BytesUtil.readByte1(bytes);
                        copyRecord.playerName = BytesUtil.readUserName(bytes);
                        copyRecord.itemId = BytesUtil.readByte2(bytes);
                        copyRecord.itemNum = BytesUtil.readByte1(bytes);
                        arrTemp.push(copyRecord);
                    }
                    break;
                case 4:		//更新我的收获信息
                    len = BytesUtil.readByte2(bytes);
                    for (i = 0; i < len; i++) {
                        copyReward = new CopyRewardStruct();
                        copyReward.itemId = BytesUtil.readByte2(bytes);
                        copyReward.itemNum = BytesUtil.readByte1(bytes);
                        arrTemp.push(copyReward);
                    }
                    break;
                case 5:		//主要是当前层次的怪物信息
                    _currentFloor = BytesUtil.readByte1(bytes);
                    _justice = BytesUtil.readByte1(bytes);
                    len = BytesUtil.readByte1(bytes);
                    for (i = 0; i < len; i++) {
                        var len2:int = BytesUtil.readByte1(bytes);
                        ;
                        var arr:Array = [];
                        for (j = 0; j < len2; j++) {
                            copyMonster = new CopyMonsterStruct();
                            copyMonster.monsterId = BytesUtil.readByte2(bytes);
                            copyMonster.monsterNum = BytesUtil.readByte1(bytes);
                            arr.push(copyMonster);
                        }
                        arrTemp.push(arr);
                    }
                    len = BytesUtil.readByte1(bytes);
                    arrTempReport = new Array();
                    var copyRport:CopyRoportStruct;
                    for (i = 0; i < len; i++) {
                        copyRport = new CopyRoportStruct();
                        copyRport.country = BytesUtil.readByte1(bytes);
                        copyRport.name = BytesUtil.readUserName(bytes);
                        copyRport.reportID = bytes.readUnsignedInt();
                        copyRport.floor = _currentFloor;
                        arrTempReport.push(copyRport);
                    }
                    break;
                case 6:
                    _justice = BytesUtil.readByte1(bytes);
                    break;
            }
        }catch(e:*)
        {

        }
        return true;
    }

    public function get justice():uint {
        return _justice;
    }

    public function get isUseHook():Boolean {
        return _isUseHook;
    }

}
}