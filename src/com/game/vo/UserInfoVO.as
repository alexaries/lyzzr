package com.game.vo {

import com.game.module.prayTree.vo.PrayTreeMyVO;

import net.consts.StaticConfig;

public class UserInfoVO {
    public var playerId16:String = "1";
    public var playerId10:String = "1";
    public var country:int = 2;
    // 所属阵营 峨嵋 昆仑  中立
    public var level:uint = 0;
    public var banneret:int;
    // 仙石
    public var gold:int;
    // 礼券
    public var giftScore:int;
    // 银币
    public var silver:int;
    // 银两
    public var copper:int;
    // 铜钱
    public var prestige:uint;
    public var honour:uint = 0;
    public var gender:int;
    // 性别,0男,1女
    // 主将职业
    /**

     */
    public var career:uint = 0;
    // VIP充值元宝
    public var donation:uint = 0;
    //荣誉
    public var archivement:uint = 0;
    public var corpsName:String = "";
    // 我的帮派
    public var humanSwfUrl:String;
    /**
     *背包容量
     */
    public var capacity:int = 100;
    /**
     *魂魄背包容量
     */
    public var soul_capacity:int = 200;

    /**
     * 宝石背包容量
     */
    public var jewel_capacity:uint = 200;

    /**
     * 阵法背包容量
     */
    public var formation_capacity:uint = 200;

    /**
     * 元神背包容量
     */
    public var sprite_capacity:uint = 200;
    /** 魂器背包容量*/
    public var hunqi_capacity:uint = 200;
    /*灵珠背包容量*/
    public var lingzhu_capacity:uint = 200;
    public var achievScore:int = 100;
    private var _leaveCapacity:int;
    /**
     * 已占用背包的格子数目
     */
    public var packCount:int;
    // 背包物品数目
    /**
     * buff编号
     * 0x40 - 自动补血包
     * 0x41 - 1%能力加成
     * 0x42 - 3%能力加成
     * 0x43 - 5%能力加成
     * 0x44 - 挂机
     * 0x45 - 挂机+15%
     * 0x46 - 挂机+30%
     * 0x4F - 无敌buff
     */
    public var buffList:Array = [];
    public var isWallowValid:uint = 0;
    // 防沉迷验证,true:已验证;false:未验证
    // 坐骑ID
    public var mounts_id:int = 0;
    /**
     * qqVIP等级<br>
     * 0 - 非<br>
     */
    public var qqLv:uint;
    /**
     * QQ年费用户是否<br>
     * 0 - 非<br>
     * 1 - 是
     */
    public var qqYear:uint;

    public var dragonsoul:uint;

    //仙缘
    public var xianyuan:uint;
    /**
     *真元
     */
    public var zhenyuan:uint;
    /**
     *当前充值的仙石数
     */
    public var currentChargeGold:uint;
    /**
     *真元是否领取
     */
    public var isgetzhenyuan:int;
    /**
     * 坐骑等级
     */
    public var rideLv:uint;
    /**
     * 坐骑当前升级进度
     */
    public var rideProcess:uint;
    /**
     * 坐骑收集进度表
     */
    public var rideDatas:Array;
    /**剑冢免费唤剑次数*/
    public var swordFreeTime:int;
    /**友情值*/
    public var friendlyValue:uint;
    /**今日获得的友情值*/
    public var friendlyValueDay:uint;
    public var name:String;
    public var prayTreeVo:PrayTreeMyVO =new PrayTreeMyVO();
    public var statesArr:Array = [];
    public var isHumanRun:Boolean;

    public function get leaveCapacity():int {
        return capacity - packCount;
    }

    public function get packColor():uint {
        if (leaveCapacity > 10)
            return 0xffffff;
        else if (leaveCapacity > -1)
            return 0xffcc00;
        else
            return 0xff0000;
    }


    public function set leaveCapacity(value:int):void {
        _leaveCapacity = value;
    }

    public var userType:int;

    // 玩家类别
    public function UserbaseInfoVO():void {

    }


    // 取得爵位
    public function getPositionString():String {
        return "你真是个人才";
    }

    // 坐骑模型
    public function get rideModelUrl():String {
        if (mounts_id == 0) {
            //TODO 判断 职业 性别
            return StaticConfig.httpServer + "user/ride0_" + career + ".swf";
        } else {
            return StaticConfig.httpServer + "user/ride" + mounts_id + ".swf";
        }
        return StaticConfig.httpServer + "user/ride0" + ".swf";
    }

    /**
     *龙魂背包剩余的格子数
     * @return
     *
     */
    public function get soulPackLeaveCapacity():int{
        return 0;
    }
}
} 