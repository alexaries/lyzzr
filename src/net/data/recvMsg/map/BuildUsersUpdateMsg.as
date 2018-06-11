package net.data.recvMsg.map {
import utils.ByteArray;

import net.consts.TempDataModel;
import net.data.BaseMsg;
import net.data.structs.map.BuildUserStruct;
import net.utils.BytesUtil;

/**
 * (S->C) 0x55
 * @author RyanCao
 *
 */
public class BuildUsersUpdateMsg extends BaseMsg {
    public function BuildUsersUpdateMsg() {
        super();
    }

    private var _userDatas:Array;

    private var _action:int;

    private var _leavename:String;

    public function get leavename():String {
        return _leavename;
    }

    public function get action():int {
        return _action;
    }

    public function getUserDatas():Array {
        return _userDatas;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            _action = BytesUtil.readByte1(bytes);
            _userDatas = TempDataModel.getInstance().buildusersList;
            if (_userDatas == null) {
                _userDatas = new Array();
            }
            if (action) {
                //删除
                var name:String = BytesUtil.readUserName(bytes);
                _leavename = name;
                for (var i:int = 0; i < _userDatas.length; i++) {
                    if (name == (_userDatas[i] as BuildUserStruct).playerName) {
                        _userDatas.splice(i, 1);
                        break;
                    }
                }

            } else {
                //添加
                var newuserS:BuildUserStruct = new BuildUserStruct();
                newuserS.playerName = BytesUtil.readUserName(bytes);
                newuserS.platform = BytesUtil.readByte1(bytes);
                newuserS.classType = BytesUtil.readByte1(bytes);
                newuserS.countryID = BytesUtil.readByte1(bytes);
                newuserS.lv = BytesUtil.readByte1(bytes);
                newuserS.status = BytesUtil.readByte1(bytes);

                if (isUserIn(newuserS.playerName, _userDatas)) {
                    _userDatas.push(newuserS);
                } else {
                    replaceData(newuserS.playerName, _userDatas, newuserS);
                }
            }
            TempDataModel.getInstance().buildusersList = _userDatas;
        } catch (e:*) {

        }
        return true;
    }

    /**
     * 入口参数  是 这个玩家的姓名
     * @param name
     * @return 是否已经在列表中
     *
     */
    private function isUserIn(name:String, userlist:Array):Boolean {
        var len:int = userlist.length;
        for (var i:int = 0; i < len; i++) {
            if ((userlist[i] as BuildUserStruct).playerName == name) {
                return false;
            }
        }
        return true;
    }

    /**
     * 入口参数  是 这个玩家的姓名
     * @param name
     * @return 是否已经在列表中
     *
     */
    private function replaceData(name:String, userlist:Array, vo:BuildUserStruct):void {
        var len:int = userlist.length;
        for (var i:int = 0; i < len; i++) {
            if ((userlist[i] as BuildUserStruct).playerName == name) {
                userlist[i] = vo;
                break;
            }
        }
    }
}
}