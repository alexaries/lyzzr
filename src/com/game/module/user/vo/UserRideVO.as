/**
 * Created by huangcb on 2017/8/29.
 */
package com.game.module.user.vo {
import com.game.vo.GoodsVO;
import com.game.vo.RideVO;

import globals.ConfigLocator;

public class UserRideVO {
    public var id:int;

    private var _items:String;
    /**
     * 套装属性ID
     */
    public var propID:uint;
    private var _select:Boolean;
    /**
     * 对应法器进度
     * 一个state表示8位子法器收集情况
     */
    private var _itemState:uint;
    private var itemIDs:Array;
    /**当前的层数*/
    private var _currFloor:int;
    /**探寻失败的次数*/
    public var faileTimes:int;
    public var preFloor:int;
    private var inited2:Boolean;
    public var preFloor2:int;
    private var inited:Boolean;
    /**是否升级*/
    private var _isUpgrade:Boolean;
    /**达到最大层继续唤剑后的层数*/
    private var _currFloor2:int;
    /**是否已经完成收集套装*/
    private var _hasFinished:Boolean;

    //-----------------------------------------------------------------------------
    // Var
    //-----------------------------------------------------------------------------

    public function UserRideVO() {
    }

    //-----------------------------------------------------------------------------
    // Methods
    //-----------------------------------------------------------------------------
    public function set items(itemStr:String):void {
        _items = itemStr;
        itemIDs = _items.split(";");
    }

    public function get items():String {
        return _items;
    }

    public function get itemLists():Array {
        var a:Array = [];
        for (var i:int = 0, len:int = itemIDs.length; i < len; i++) {
            var object:Object = {itemid: itemIDs[i], itemNum: 1, state: (itemState >> i) & 0x01};
            a.push(object);
        }
        return a;
    }

    public function get select():Boolean {
        return _select;
    }

    public function set select(value:Boolean):void {
        _select = value;
    }

    public function get itemState():uint {
        return _itemState;
    }

    public function clone():UserRideVO {
        var rvo:UserRideVO = new UserRideVO();
        rvo._items = _items;
        rvo._itemState = _itemState;
        rvo._select = _select;
        rvo.propID = propID;

        rvo.id = id;
        return rvo;
    }

    public function get currFloor():int {
        if ((preFloor == 0 && _currFloor == 0))inited = true;
        return _currFloor;
    }

    public function set currFloor(value:int):void {
        preFloor = _currFloor;
        _currFloor = value;
        if (_currFloor == 8)_hasFinished = true;
        if (!inited) {
            preFloor = _currFloor;
            inited = true;
        } else {
            if (_currFloor > preFloor)isUpgrade = true;
            else isUpgrade = false;
        }
    }

    public function get isUpgrade():Boolean {
        return _isUpgrade;
    }

    public function set isUpgrade(value:Boolean):void {
        _isUpgrade = value;
    }

    public function get currFloor2():int {
        return _currFloor2;
    }

    public function set currFloor2(value:int):void {
        preFloor2 = _currFloor2;
        _currFloor2 = value;
        if (!inited2) {
            preFloor2 = _currFloor2;
            inited2 = true;
        } else {
            if (_hasFinished) {
                if (_currFloor2 > preFloor2 || (_currFloor2 && preFloor2 == 8))isUpgrade = true;
                else isUpgrade = false;
            }
        }
    }

    public function get hasFinished():Boolean {
        return _hasFinished;
    }
}
}
