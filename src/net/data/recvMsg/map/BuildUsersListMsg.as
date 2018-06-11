package net.data.recvMsg.map {
import utils.ByteArray;

import net.consts.TempDataModel;
import net.data.BaseMsg;
import net.data.structs.map.BuildUserStruct;
import net.utils.BytesUtil;

/**
 * 据点玩家列表信息  (S->C) 0x54
 * @author r.c
 *
 */
public class BuildUsersListMsg extends BaseMsg {
    public function BuildUsersListMsg() {
        super();
    }

    private var _userDatas:Array;

    public function getUserDatas():Array {
        return _userDatas;
    }

    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            var len:uint = BytesUtil.readByte1(bytes);
            _userDatas = new Array();
            for (var i:int = 0; i < len; i++) {
                var builduser:BuildUserStruct = new BuildUserStruct();
                builduser.playerName = BytesUtil.readUserName(bytes);
                builduser.platform = BytesUtil.readByte1(bytes);
                builduser.classType = BytesUtil.readByte1(bytes);
                builduser.countryID = BytesUtil.readByte1(bytes);
                builduser.lv = BytesUtil.readByte1(bytes);
                builduser.status = BytesUtil.readByte1(bytes);

                if (isUserIn(builduser.playerName, _userDatas)) {
                    _userDatas.push(builduser);
                } else {
                    replaceData(builduser.playerName, _userDatas, builduser);
                }
            }
            TempDataModel.getInstance().buildusersList = _userDatas;
            //trace("_userDatas.length 0x54" + _userDatas.length);
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