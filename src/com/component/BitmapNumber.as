/**
 * Created by huangcb on 2017/9/19.
 */
package com.component {

import laya.display.Sprite;
import laya.ui.Image;
import laya.utils.Pool;

public class BitmapNumber extends Sprite {
    protected var _number:Array =[];
    protected var _numberImages:Array =[];
    protected  var pathPre:String
    protected  var pad:int
    var align:String="left"
    protected var container: Sprite
    public function BitmapNumber( )
    {
        super();
        container=new Sprite();
        addChild(container);
    }
    public function  setAlign(align:String):void{
        this.align=align;

    }
    public function setColor(color:String,pad :int):void {
        this.pad=pad;
        if(color.indexOf("/") != -1){
            pathPre = color;
        }else{
            pathPre = "main/numberRes/"+color+"/";
        }
    }

    public function set number(value:String):void
    {
        _number=[];
        for (var i:int = 0; i < value.length; i++) {
            _number.push( value.charAt(i));
        }
        update();
    }

    public function dispose():void {
        for (var i:int = 0; i < _numberImages.length; i++) {
            var obj:Image = _numberImages[i];

            obj.removeSelf()
            Pool.recover("BitmapNumberImage", obj);
        }
    }

    public function update():void
    {
        dispose();

        var w:int=0;
        for(var i:int = 0;i < _number.length;i++){
            var img:Image = Pool.getItemByClass("BitmapNumberImage", Image);
            _numberImages.push(img)
            img.skin = pathPre+_number[i]+".png";
            img.y = 0;
            img.x = w ;
            container.addChild(img);
            w+=img.width+pad;

        }
        if(align=="center")
        {
            container.x=-w/2
        }
        if(align=="left")
        {
            container.x=0
        }
    }
}
}
