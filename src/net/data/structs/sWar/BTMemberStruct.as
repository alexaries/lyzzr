/* ---------------------------------------------------------------------------------------------------------------------------- /

 TeamMemberStruct -- NEROKING

 / ---------------------------------------------------------------------------------------------------------------------------- */

package net.data.structs.sWar {
import com.hurlant.math.BigInteger;

import net.consts.StaticConfig;

public class BTMemberStruct {

    // --- Vars ---------------------------------------------------------------------------------------------------------- //
    public var name:String;

    public var id:BigInteger;

    public var level:int;

    public var score:int;
    /**
     *战斗印记
     * 1石头
     * 2剪子
     * 3 布
     */
    public var flag:int;
    /**
     *战斗力
     */
    public var power:uint;

    /**
     *职位 1 为队长  2 队员
     */
    public var post:int;
    /**
     *头像
     */
    public var imgID:uint;


    public function get url():String {
        return StaticConfig.httpServer + "avatars/user/" + imgID + ".jpg";
    }

    public function get flagStr():String {
        switch (flag) {
            case 1:
                return "石头";
                break;
            case 2:
                return "剪刀";
                break;
            case 3:
                return "布";
                break;
        }
        return "";
    }

    // --- Private Function ---------------------------------------------------------------------------------------------- //

}
}