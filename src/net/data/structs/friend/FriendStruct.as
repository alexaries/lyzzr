package net.data.structs.friend {
import com.hurlant.math.BigInteger;

import net.data.structs.prayTree.PrayTreeOtherStruct;

public class FriendStruct {
    /**添加好友操作*/
    public static const ADD_FRIEND:uint = 0x01;
    /**删除好友操作*/
    public static const DELETE_FRIEND:uint = 0x02;
    /**添加黑名单操作*/
    public static const ADD_TO_BLACK:uint = 0x03;
    /**移出黑名单操作*/
    public static const REMOVE_FROM_BLACK:uint = 0x04;
    /**添加仇人操作*/
    public static const ADD_E_FRIEND:uint = 0x05;
    /**移出仇人操作*/
    public static const REMOVE_E_FRIEND:uint = 0x06;
    /**添加密友操作*/
    public static const ADD_G_FRIEND:uint = 0x07;
    /**移出密友操作*/
    public static const REMOVE_G_FRIEND:uint = 0x08;

    public static const ADD_C_FRIEND:uint = 0x09;

    public static const REMOVE_C_FRIEND:uint = 0x10;


    /**关系类型,0为好友,1为黑名单*/
    public var relationType:uint = 0;
    /**玩家id*/
    public var userId:BigInteger = BigInteger.nbv(0);
    /**玩家姓名*/
    public var userName:String = "";
    /**玩家帮派名*/
    public var clan:String = "";
    /**平台编号,0x01:蓝钻,0x02,黄钻*/
    public var platform:uint = 0;
    /**玩家性别*/
    public var sex:uint = 0;
    /**玩家职业*/
    public var cls:uint;
    /**玩家阵营*/
    public var country:uint;
    /**玩家等级*/
    public var level:uint = 0;
    /**/
    public var mood:uint = 0;
    public var log:String = "";
    public var ranking:uint = 0;
    /**
     * 1在线，0不在线
     */
    public var online:uint = 0;
    /**许愿树*/
    public var prayTreevo:PrayTreeOtherStruct = new PrayTreeOtherStruct();
    /**受赠次数*/
    public var receiveCount:uint;

    public var openid:String = "";
    public var isLimitQQRequest:Boolean = false;
    //友好度
    public var friendlyValue:uint;
    //是否结拜
    public var isBrother:Boolean;
    //今日已赠送鲜花数
    public var flowerCount:uint;
    //是否隐藏称号
    public var isHideTitle:uint;


    /**
     * vip等级，用于表示vip图标 0xff表示隐藏
     */
    public var vipLevel:uint = 0;

    public function FriendStruct() {

    }


}
}