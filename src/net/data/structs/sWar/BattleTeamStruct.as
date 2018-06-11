/* ---------------------------------------------------------------------------------------------------------------------------- /

 BattleTeamStruct -- NEROKING

 / ---------------------------------------------------------------------------------------------------------------------------- */

package net.data.structs.sWar {
import com.hurlant.math.BigInteger;

public class BattleTeamStruct {

    // --- Vars ---------------------------------------------------------------------------------------------------------- //
    public var fpop:uint = 0;
    /**
     *  投注类别<br>
     *    0 - 未投注<br>
     *    1 - 仙石<br>
     *  2 - 银币
     */
    public var tael:uint = 0;
    public var portrait:uint = 0;
    public var color:uint = 0;
    public var countryID:uint = 0;
    public var lv:uint = 0;
    public var name:String = "";
    public var teamId:BigInteger;
    public var pos:uint;
    public var group:uint;
    /**队伍战斗力 */
    public var power:uint;
    /**鼓舞 */
    public var morale:uint;
    public var members:Array = new Array(3);

    public function BattleTeamStruct() {
    }

    // --- Private Function ---------------------------------------------------------------------------------------------- //

}
}