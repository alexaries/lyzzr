/**
 * Created by dingcj on 2018/6/20.
 */
package com.game.module.company.view {
import com.game.common.mvc.BaseMediator;
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

    private var courseArr:Array = [];

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

    private function onCourseItemClick():void {
        ///////-------------------------------------------------------------------working
    }

    private function onSelectItemClick():void {

    }

    public function updateSelectInfo():void {
        var arr:Array = [];
        for (var i = 0; i < 6; i++) {
            arr.push("");
        }
        ui.selectList.array = arr;
    }

    private function onRenderSelectItem(cell:CompanySelectItem, index:int):void {
        cell.initInfo(index, itemSelectSignal);
    }

    private function initCourse():void {
        courseArr = [];
        for (var i = 0; i < 6; i++) {
            var course:CompanyCourseItem = new CompanyCourseItem();
            ui.container.addChild(course);
            courseArr.push(course);
            course.initInfo(itemCourseSignal, posArr[i]);
        }
    }

    private function destroyCourse():void {
        for (var i = 0; i < courseArr.length; i++) {
            courseArr[i].destroy();
        }
        courseArr = [];
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