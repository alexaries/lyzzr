/**
 * Created by dingcj on 2017/11/13.
 */
package com.talkingdata {
import com.game.events.NotiEvent;

import globals.PlatformSDK;

import net.consts.StaticConfig;

import org.puremvc.as3.patterns.facade.Facade;

public class TDManager {

    public function TDManager() {

    }

    public static function check():void {

    }

    //{taskId:"0",step:"dakaichuangkou"}
    public static function addEvent(eventId:String, eventData:Object = null, catalog:String = ""):void {
        if (!isCheck) return;
        addDanaEvent(catalog, eventId, eventData);
        __JS__("TDGA.onEvent(eventId, eventData)");
    }

    //catalog|actid|actcnt|timecount|param|gameid|platid
    private static function addDanaEvent(log:String, eventId:String, eventData:Object):void {
        var catalog:String = log;//事件分类
        var actid:String = eventId;//事件ID
        var actcnt:String = "1";//事件发生次数
        var timecount:String = "0";//行为时长
        var param:String = jsonToStr(eventData);//key:value
        var gid:String = "00007";
        var gameid:String = gid;//游戏id
        var platid:String = StaticConfig.platform + "";//平台编号
        var str:String = catalog + "|" + actid + "|" + actcnt + "|" + timecount + "|" + param + "|" + gameid + "|" + platid;
        Facade.getInstance().notifyObservers(new NotiEvent(NotiEvent.GUIDE_ANALYSIS, [0, str, ""]))
    }

    private static function jsonToStr(json:Object):String {
        return JSON.stringify(json);
    }

    //账户信息
    public static function initTDAccount(_accountId:String, _level:int, _server:String, _accountType:int = 1):void {
        if (!isCheck)return;
        _accountId = _accountId + "";
        var _accountName:String = " ";
        __JS__("TDGA.Account({accountId:_accountId, level:_level, gameServer:_server, accountType:_accountType,accountName:_accountName});");

        //Tracking
        trackingInit();
    }

    //玩家显性注册成功
    public static function setAccountName(name:String):void {
        if (!isCheck) return;
        __JS__("TDGA.Account.setAccountName(name);");
        __JS__("TDGA.Account.setAccountType(1);");

        //Tracking
        trackingRegister();
    }

    //注册方式 3账户显示注册
    public static function setAccountType(type:int):void {
        if (!isCheck) return;
        __JS__("TDGA.Account.setAccountType(type);");
    }

    //玩家升级
    public static function setLevel(level:int):void {
        if (!isCheck) return;
        __JS__("TDGA.Account.setLevel(level);");
    }

    //玩家性别
    public static function setGender(gender:int):void {
        if (!isCheck) return;
        __JS__("TDGA.Account.setGender(gender)");
    }

    //设置玩家年龄
    public static function setAge(age:int):void {
        if (!isCheck) return;
        __JS__("TDGA.Account.setAge(age)");
    }

    //gameServer
    public static function setGameServer(gameServer:String):void {
        if (!isCheck) return;
        __JS__("TDGA.Account.setGameServer(gameServer)");
    }


    //充值

    //充值请求
    public static function onChargeRequest(_orderId:String, _iapId:String, _currencyAmount:String,
                                           _currencyType:String, _virtualCurrencyAmount:String, _paymentType:String):void {
        if (!isCheck) return;
        __JS__("TDGA.onChargeRequest({orderId : _orderId,iapId :_iapId,currencyAmount : _currencyAmount,currencyType : _currencyType,virtualCurrencyAmount : _virtualCurrencyAmount,paymentType : _paymentType})");

        //Tracking
        trackingOrder(_orderId);
    }

    //充值成功
    public static function onChargeSuccess(_orderId:String, _iapId:String, _currencyAmount:String,
                                           _currencyType:String, _virtualCurrencyAmount:String, _paymentType:String):void {
        if (!isCheck) return;
        __JS__("TDGA.onChargeSuccess({orderId : _orderId,iapId :_iapId,currencyAmount : _currencyAmount,currencyType : _currencyType,virtualCurrencyAmount : _virtualCurrencyAmount,paymentType : _paymentType})");

        //Tracking
        trackingPayment(_orderId, _currencyAmount, _currencyType, _paymentType);
    }


    //消费点

    //记录付费点
    public static function onItemPurchase(_itemId:String, _itemNum:int, _price:int):void {
        if (!isCheck) return;
        _itemId = _itemId + "";
        __JS__("TDGA.onItemPurchase({item:_itemId,itemNumber:_itemNum,priceInVirtualCurrency:_price})");
    }

    //消耗物品或服务等
    public static function onItemUse(_itemId:String, _itemNum:int):void {
        if (!isCheck) return;
        __JS__("TDGA.onItemUse({item:_itemId,itemNumber:_itemNum})");
    }

    //任务
    public static function get isCheck():Boolean {
        __JS__("return (typeof TDGA !== 'undefined');");
        return false;
    }

    //获取设备Id
    public static function getDeviceId(userId:Number):String {
        if (!isCheck) return userId + "";
        return __JS__("TDGA.getDeviceId()");
    }

    //热云SDK
    private static function isTracking():Boolean {
        return StaticConfig.platform == PlatformSDK.ORANGE;
    }

    public static function trackingInit():void {
        if (!isTracking())return;
        var appKey:String = "b06e3e8beda1f714a468a45075ff5b92";
        __JS__("TrackingIO.init(appKey)")
    }

    public static function trackingRegister():void {
        if (!isTracking())return;
        var accountId:String = StaticConfig.userId + "";
        __JS__("TrackingIO.init(accountId)");
    }

    public static function trackingLoginIn():void {
        if (!isTracking())return;
        var accountId:String = StaticConfig.userId + "";
        __JS__("TrackingIO.loggedin(accountId)");
    }

    //下单时
    public static function trackingOrder(_orderId:String):void {
        if (!isTracking())return;
        __JS__("TrackingIO.order(_orderId)");
    }

    //付费成功
    public static function trackingPayment(_transactionId:String, _currentAmount:String, _currentType:String, _paymentType:String):void {
        if (!isTracking())return;
        var currentAmount:Number = (Number)(_currentAmount);
        __JS__("TrackingIO.payment(_transactionId,currentAmount,_currentType,_paymentType)");
    }
}
}
