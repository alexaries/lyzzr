/*******************************************************************************
 ******************************************************************************/
package net.data.recvMsg.carrer {

import utils.ByteArray;

import net.data.BaseMsg;
import net.data.structs.carrer.CarrerPlayerStruct;
import net.utils.BytesUtil;

//-----------------------------------------------------------------------------
// import_declaration
// -----------------------------------------------------------------------------


public class CarrerTopListMsg extends BaseMsg {
    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------
    public var type:uint;
    public var state:uint;
    public var value:uint;
    public var topList:Array;

    //-----------------------------------------------------------------------------
    // Constructor
    //-----------------------------------------------------------------------------

    public function CarrerTopListMsg() {
        super();
    }

    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    override public function byteArrayToMsg(bytes:ByteArray):Boolean {
        try {
            type = BytesUtil.readByte1(bytes);
            state = BytesUtil.readByte1(bytes);
            if (state == 1) {
                value = bytes.readUnsignedInt();
            } else if (type != 4 && state == 2) {
                //var len:uint = BytesUtil.readByte2(bytes);
                var len:uint = 9;
                topList = [];
                for (var i:int = 0; i < len; i++) {
                    var player:CarrerPlayerStruct = new CarrerPlayerStruct();
                    player.name = BytesUtil.readUserName(bytes);
                    player.score = BytesUtil.readByte2(bytes);
                    topList.push(player);
                }

            } else if (type == 4 && state == 2) {
                //var len:uint = BytesUtil.readByte2(bytes);
                topList = [];
                for (var j:int = 0; j < 3; j++) {
                    var teamArr:Array = [];
                    teamArr.push(BytesUtil.readByte2(bytes));

                    for (var k:int = 0; k < 3; k++) {
                        var player2:CarrerPlayerStruct = new CarrerPlayerStruct();
                        player2.name = BytesUtil.readUserName(bytes);
                        player2.score = BytesUtil.readByte2(bytes);
                        teamArr.push(player2);

                    }
                    topList.push(teamArr);
                }

            }
        } catch (e:Error) {
            trace(e)
        }
        return true;
    }

    public function test():void {
        type = 1;
        state = 1;
        topList = [];
        for (var i:int = 0; i < 9; i++) {
            var player:CarrerPlayerStruct = new CarrerPlayerStruct;
            player.name = "zzz" + i;
            player.score = 100 + i
            topList.push(player);
        }
    }

    public function test2():void {
        type = 2;
        state = 2;
        topList = [];
        value = 2;
        for (var i:int = 0; i < 9; i++) {
            var player:CarrerPlayerStruct = new CarrerPlayerStruct;
            player.name = "zxy" + i;
            player.score = 100 + i
            topList.push(player);
        }
    }
}
}