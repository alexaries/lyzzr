/**
 * Created by huangcb on 2017/8/22.
 */
package utils {
import laya.utils.Dictionary;

public class KnetAnalysis {
    // 新授权玩家消息
    public static const NEW_CONNECT : String = "nv1";
    // 从授权到flash
    public static const NEW_CONNECTED : String = "nv1_0";
    // 连上服务器
    public static const NEW_CREATEROLE_LOADED : String = "nv2";
    // 进入角色选择页
    public static const NEW_CREATEROLE_SUBMIT : String = "nv2_0";
    // 提交角色选择
    public static const NEW_CREATEROLE_FORBIDEN : String = "nv2_1";
    // 提交角色被拒
    public static const NEW_CREATEROLE_SUCCESS : String = "nv3";
    // 角色创建成功
    public static const NEW_PRELOAD_BEFOREMAIN : String = "nv4_0";
    // 部分资源Loading成功
    public static const NEW_PRELOAD_LOADED : String = "nv4";
    // Main资源Loading成功
    public static const NEW_GAME_INITED : String = "nv5";
    // 玩家进入游戏
    public static const NEW_FINGHT_LOAD_START : String = "nv5_0";
    // 首次战斗加载
    public static const NEW_FINGHT_LOAD_STOP : String = "nv5_1";
    // 首次战斗加载结束
    public static const NEW_GUIDER : String = "nv6_";
    // 新手引导统计
    // 游戏消息
    public static const GAME_INITED : String = "game_inited";
    // 玩家进入游戏
    public static const GAME_CONNECTED : String = "game_connected";
    // 连上服务器
    public static var analysisDic : Dictionary = new Dictionary();
    public static var kingnetaz : Dictionary = new Dictionary();

    public function KnetAnalysis() {
    }

    public static function setUdpAnalysis(path1:String ="",path : String = "") : void {

    }
    public static function setQQUdpAnalysis(path1:String ="",  path : String = "") : void {


    }
    public static function hasQQUdpAnalysis(path1:String ="",  path : String = ""):Boolean{

        return false;
    }

    public static function setKingnetaz(path : String = "") : void {

    }
}
}
