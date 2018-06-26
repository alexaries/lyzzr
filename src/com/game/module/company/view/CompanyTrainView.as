/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.company.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.view.Alert;
import com.game.common.view.BaseView;
import com.game.module.company.mediator.CompanyTrainMediator;
import com.game.module.company.view.items.CompanyCourseItem;
import com.game.module.company.view.items.CompanyDepartItem;
import com.game.module.company.view.items.CompanySelectItem;
import com.game.module.copy.view.items.PropertyValueItem;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.utils.Handler;

import ui.company.CompanyTrainViewUI;

import utils.ArrayUtil;

public class CompanyTrainView extends BaseView {

    private var ui:CompanyTrainViewUI;
    public var oneKeySignal:SignalDispatcher;
    public var itemSelectSignal:SignalDispatcher;//待选列表的item
    public var itemCourseSignal:SignalDispatcher;//已经选中的item

    private var posArr:Array = [
        {x: 183, y: 549},
        {x: 0, y: 879},
        {x: 183, y: 1214},
        {x: 664, y: 1214},
        {x: 867, y: 879},
        {x: 664, y: 549}
    ];

    private var courseItemArr:Array = [];

    public function CompanyTrainView() {
        super([]);
        oneKeySignal = new SignalDispatcher();
        itemSelectSignal = new SignalDispatcher();
        itemCourseSignal = new SignalDispatcher();
    }

    override public function getMediator():BaseMediator {
        return new CompanyTrainMediator(this);
    }

    override public function hide():void {
        super.hide();
    }

    override public function show():void {
        super.show();
    }

    override public function onComplete():void {
        __onComplete();
        super.onComplete();

    }

    function __onComplete():void {
        ui = new CompanyTrainViewUI();
        this.addChild(ui);

        init();
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickCloseBtn);
        ui.oneKeyBtn.on(Event.CLICK, this, onClickOneKeyBtn);

        ui.departList.itemRender = CompanyDepartItem;
        ui.departList.renderHandler = Handler.create(this, onRenderDepartItem, null, false);

        ui.propertyList.itemRender = PropertyValueItem;
        ui.propertyList.renderHandler = Handler.create(this, onRenderPropertyValueItem, null, false);

        ui.selectList.itemRender = CompanySelectItem;
        ui.selectList.renderHandler = Handler.create(this, onRenderSelectItem, null, false);
        ui.selectList.hScrollBarSkin = "";
        ui.selectList.repeatX = 10;
        ui.selectList.repeatY = 1;
        ui.selectList.spaceX = 20;

        itemSelectSignal.getSignal(this).listen(onSelectItemClick);
        itemCourseSignal.getSignal(this).listen(onCourseItemClick);

        initCourse();
        updateSelectInfo();
    }

    private function onCourseItemClick(id:int):void {
        ArrayUtil.remove(courseArr, id);
        selectArr.push(id);

    }

    private function onSelectItemClick(id:int):void {
        if (courseArr.length >= maxCount) {
            Alert.show("所选培训已经超过最大数量");
            return;
        }
        courseArr.push(id);
        ArrayUtil.remove(selectArr, id);


        updateCourseInfo();
    }

    private var selectArr:Array = [];//待选列表的Id
    private var courseArr:Array = [];//已选列表的Id
    private var maxCount:int = 6;//最大可选数量

    public function updateSelectInfo():void {
//        var arr:Array = [];
//        for (var i = 0; i < 6; i++) {
//            arr.push("");
//        }
//        ui.selectList.array = arr;
    }

    public function updateCourseInfo():void {
        if (courseArr == null || courseArr.length == 0)return;
        for (var i = 0; i < courseArr.length; i++) {
            courseItemArr[i].updateInfo(courseArr[i]);
        }
    }

    private function onRenderSelectItem(cell:CompanySelectItem, index:int):void {
        var id:int = 1;
        cell.initInfo(index, itemSelectSignal, id);
    }

    private function initCourse():void {
        courseItemArr = [];
        for (var i = 0; i < 6; i++) {
            var course:CompanyCourseItem = new CompanyCourseItem();
            ui.container.addChild(course);
            courseItemArr.push(course);
            course.initInfo(itemCourseSignal, posArr[i]);
        }
    }

    private function destroyCourse():void {
        for (var i = 0; i < courseItemArr.length; i++) {
            courseItemArr[i].destroy();
        }
        courseItemArr = [];
    }

    private function onRenderPropertyValueItem(cell:PropertyValueItem, index:int):void {

    }

    private function onRenderDepartItem(cell:CompanyDepartItem, index:int):void {

    }

    private function onClickOneKeyBtn():void {
        if (oneKeySignal)oneKeySignal.dispatch(null);
    }

    private function onClickCloseBtn():void {
        this.hide();
    }

    public function refresh():void {

    }

    override public function dispose():void {
        super.dispose();
        ui.closeBtn.off(Event.CLICK, this, onClickCloseBtn);
        ui.oneKeyBtn.off(Event.CLICK, this, onClickOneKeyBtn);

        if (oneKeySignal)oneKeySignal.dispose();
        if (itemSelectSignal)itemSelectSignal.dispose();
        if (itemCourseSignal)itemCourseSignal.dispose();

        if (ui.departList.renderHandler)ui.departList.renderHandler.clear();
        if (ui.propertyList.renderHandler)ui.propertyList.renderHandler.clear();
        if (ui.selectList.renderHandler)ui.selectList.renderHandler.clear();

        destroyCourse();
    }
}
}