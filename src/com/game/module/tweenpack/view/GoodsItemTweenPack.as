/**
 * Created by dangww on 2018/1/12.
 */
package com.game.module.tweenpack.view {
import com.game.common.mvc.BaseMediator;
import com.game.common.operation.FunctionOper;
import com.game.common.operation.Queue;
import com.game.common.operation.TimeoutOper;
import com.game.common.operation.TweenOper;
import com.game.common.view.BaseWindow;
import com.game.common.view.MyHomeView;
import com.game.consts.BaseLayer;
import com.game.module.tweenpack.mediator.GoodsItemTweenPackMediator;
import com.game.vo.GoodsVO;
import com.tween.easing.Linear;

import globals.ConfigLocator;

import laya.maths.Point;
import laya.ui.Image;

import ui.pack.ItemTweenToPackUI;

public class GoodsItemTweenPack extends BaseWindow {

    private var ui:ItemTweenToPackUI
    private var stonePoint:Point;
    private var sliverPoint:Point;

    public function GoodsItemTweenPack() {
        super([]);
        onlyHide=true;
        layer = BaseLayer.ITEMTWEEN;
    }

    override public function dispose():void {
        super.dispose();
    }

    override public function getMediator():BaseMediator {
        return new GoodsItemTweenPackMediator(this);
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
        ui = new ItemTweenToPackUI();
        addChild(ui);

        point = MyHomeView.packPoint//( mainui.downBtn4.parent as Box).localToGlobal(new Point(mainui.downBtn4.x,mainui.downBtn4.y))
        stonePoint = MyHomeView.stonePoint;
        sliverPoint = MyHomeView.sliverPoint;
        doTween(content);
    }
    private var point:Point
    public var animCount:int;
    private var content:String;
    function doTween(content:String):void{
        var goods:GoodsVO;
        var reg = /\[(.+?)\]/g;
        var str : String = content;
        var args : Array;
        var bmp:Image;
        if (str && content.indexOf("x") > -1) {
            str = (reg.exec(content) as Array).join(",");
            args = str.split(",");
            if (args && args.length > 1) {
                str = args[1];
                args = str.split(":");
                goods = ConfigLocator.getInstance().goodsList.get(parseInt(args[1])) as GoodsVO;
                bmp = new Image();
                bmp.x = 4;
                bmp.y = 4;
                bmp.size(128, 128);
                bmp.skin = goods.imgURL;
                ui.container.addChild(bmp);
                var pos:Point;
                pos = new Point(point.x - ui.container.x, point.y - ui.container.y);
                bmp.alpha = 0;
                var list:Array=[
                    new TimeoutOper(animCount * 200),
                    new TweenOper(bmp,100,{alpha:1},Linear.easeIn),
                    new TweenOper(bmp,1100,{x:pos.x,y:pos.y,alpha:0.3,scaleX:0.5,scaleY:0.5},Linear.easeIn),
                    new FunctionOper(this,tweenComplete,[bmp])
                ]
                var que:Queue =new Queue(list);
                que.execute();
                animCount++;
            }
        }else{
            var skinURL:String = "";
            var pos:Point;
            var flag:Boolean = false
            if(str.indexOf("获得") != -1 && str.indexOf("仙石") != -1 ){
                skinURL = "main/stone.png"
                pos = new Point(stonePoint.x - ui.container.x, stonePoint.y - ui.container.y);
                flag = true
            }else if(str.indexOf("获得") != -1 && str.indexOf("银币") != -1 ){
                skinURL = "main/shushanMoney.png"
                pos = new Point(sliverPoint.x - ui.container.x, sliverPoint.y - ui.container.y);
                flag = true
            }
            if(!flag)return;
            bmp = new Image();
            bmp.skin = skinURL;
            ui.container.addChild(bmp);
            bmp.alpha = 0;
            var list:Array=[
                new TimeoutOper(animCount * 200),
                new TweenOper(bmp,100,{alpha:1},Linear.easeIn),
                new TweenOper(bmp,1200,{x:pos.x,y:pos.y,alpha:0.3,scaleX:0.5,scaleY:0.5},Linear.easeIn),
                new FunctionOper(this,tweenComplete,[bmp])
            ];
            var que:Queue =new Queue(list);
            que.execute();
            animCount++;
        }
    }
    override  public function setData(obj:Object):void {
        var arr:Array = obj as Array;
        content = arr[0] as String;
        if(!ui)return;
        doTween(content);

    }
    private function tweenComplete(img:Image) : void {
            animCount--;
            img.skin = "";
            img = null;
    }
}
}