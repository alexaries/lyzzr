/**
 * Created by guanll on 2017/11/7.
 */
package utils {
import globals.PlatformSDK;
import globals.vo.PlatformProductInfo;
import globals.vo.PlatformRoleInfo;

import net.consts.StaticConfig;

//平台的相关操作
public class PlatformUtil {
    private static var window:* = Laya.Browser.window;

    public function PlatformUtil() {
    }

    public static function createRoleInfo(input:PlatformRoleInfo):Object {
        var info:Object;
        if (window.ssh5platform && PlatformSDK.getInstance().checkIsTest()==false) {
            switch (window.ssh5platform) {
                case 1:
                    info = {role_name: input.role_name, app_district: input.app_district, app_server: input.server};
                    break;
                case 2:
                    info = {uid: input.uid, server: input.server, role_name: input.role_name, roleId: input.roleId};
                    break;
                case 3:
                    info = {serverId:input.server, serverName:input.server_name, gameRoleId:input.roleId, gameRoleName:input.role_name};
                    break;
            }
            return info;
        } else {
            return null;
        }
    }

    public static function createProductInfo(input:PlatformProductInfo):Object {
        var info:Object;
        if (window.ssh5platform && PlatformSDK.getInstance().checkIsTest()==false) {
            switch (window.ssh5platform) {
                case 1:
                    info = {
                        product_id:input.product_id,
                        product_name:input.product_name,
                        app_order_id:input.app_order_id,
                        pay_amount:input.money_amount,
                        role_name:input.app_user_name,
                        app_name:input.app_name,
                        app_extra1:input.app_extra1,
                        app_extra2:input.app_extra2,
                        app_district:input.app_district,
                        app_server:input.app_server,
                        sign:input.sign
                    };
                    break;
                case 2:
                    info = {
                        gid:input.gid,
                        uid:input.pa_open_uid,
                        appusername:input.app_user_name,
                        sid:input.app_district,
                        openuid:input.app_extra1,
                        productid:input.product_id,
                        money:input.money_amount,
                        resource:input.resource,
                        app_order_id:input.app_order_id
                    };
                    break;
                case 3:
                    info = {
                        appId:936,
                        serverId:input.app_server,
                        serverName:input.app_district,
                        gameRoleId:input.app_extra1,
                        gameRoleLevel:input.roleLevel,
                        gameRoleName:input.app_user_name,
                        mcode:input.product_id,
                        uid:input.pa_open_uid,
                        gameOrderCid:input.app_order_id,
                        created_at:input.unixTime,
                        notifyUrl:input.notifyUrl,
                        sign:input.sign
                    };
                    break;
                case 4:
                case 6:
                    info = {
                        defaultScore:input.qzone_charge_num,
                        appid:1106262458
                    };
                    break;
                case 5:
                    var awyIds:Array = [11135,10841,10842,10843,10844,10845,10846,11046,11047];//11135是测试商品
                    info = {
                        pid:awyIds[input.product_id],// pid: 商品ID，必选参数，默认选中指定的商品的选项。
                        txid:input.app_order_id,// txid: 商户订单号，可选参数，最多64个字节。如果不为空，则支付平台会检测商户订单号是否重复，防止用户在同一个页面支付两次，并且会在通知发货接口中原样返回。
                        userdata:input.app_extra1,// userdata: 商户自定义参数，可选参数，最多128个字节。如果不为空，则会在通知发货接口中返回给商户，请对该数据进行url转义，否则可能会丢失数据，可以参考js的encodeURI或者php中的urlencode进行转义。
                        product_count:1// product_count: 商品的数量，可选参数。不填写该参数时，表示购买数量是1。批量购买商品时使用，最大不要超过1000。如果不为空，则会在通知发货接口中返回给参数。
                    };
                    break;
            }
            return info;
        } else {
            return null;
        }
    }
}
}
