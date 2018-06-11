package com.preset.loading.proxy {
import com.component.MemoryManager;
import com.preset.loading.events.LoadingEvent;
import com.preset.loading.vo.LoadResDefine;

import laya.events.Event;
import laya.net.Loader;
import laya.utils.Handler;

import org.puremvc.as3.interfaces.IProxy;
import com.game.common.mvc.BaseProxy;

import utils.ArrayUtil;

public class LoadingProxy extends BaseProxy implements IProxy {
    public static const NAME:String = "LoadingProxy";
    public var max:int = 0;
    public var resList:Vector.<LoadResDefine>;

    public var progressHandle:Handler;
    private var curIndex:LoadResDefine;
   

    public function LoadingProxy() {
        super(NAME); 
        resList = new Vector.<LoadResDefine>();
        progressHandle = Handler.create(this, loadProgressHandler, null, false);
        Laya.loader.on(Event.ERROR,this,loadErrorHandler);
    }

    public function loadRes(res:LoadResDefine = null):void {
        if(res == null){
            return;
        }

        var do_next:Boolean=false;
        for (var i:int = 0; i < res.resArray.length; i++) {
            var object_url:Object = res.resArray[i];
            if(!Laya.loader.getRes(object_url.url)){
                do_next=true;
                break;
            }
        }
        if(do_next==false){
            loadCompleteHandler(res);
            return
        }
        resList.push(res);
        max ++;
        var resName:String;
        if(curIndex){
            resName = curIndex.tips;
        }else{
            resName = "";
        }
        sendNotification(LoadingEvent.SHOW_LOADING_VIEW,{total:max,left:resList.length,curName:resName});
        next();
    }

    public function next() {
        if(curIndex){
            return;
        }
        curIndex = resList.pop();
        trace("loadingProxy==@next", curIndex);
        var completeHandle:Handler = Handler.create(this, loadCompleteHandler, [curIndex]);
        Laya.loader.load(curIndex.resArray, completeHandle, progressHandle);
    }

    private function loadErrorHandler(e):void {
        trace("LoadingError==",e);
        if(curIndex && curIndex.errorHandler){
        
            curIndex.errorHandler.run();
        }
        curIndex = null;
        if (resList == null || resList.length <= 0) {
            max = 0;
            sendNotification(LoadingEvent.LOADING_END);
            return;
        }
        next();
    }



    private function loadProgressHandler(val:Number):void {
        var resName:String;
        if(curIndex){
            resName = curIndex.tips;
        }else{
            resName = "";
        }
        sendNotification(LoadingEvent.LOADING_PROGRESS, {total:max,left:resList.length+1,curName:resName,progress: val});
    }



    private function loadCompleteHandler(res:LoadResDefine):void {

        if (res.completeHandler) {
            addRes(res.resArray)
            res.completeHandler.run();

        }
        trace("loadingProxy==@loadConpleteHandler", res);
        curIndex = null;
        if (resList == null || resList.length <= 0) {
            max = 0;
            sendNotification(LoadingEvent.LOADING_END);
            return;
        }
        next();
    }
    public function addRes(resArr:Array):void {
        if(resArr && resArr.length > 0){
            resArr.forEach(function(obj:Object){
                MemoryManager.getBundle(MemoryManager.IMAGE).addLabel( obj.url)
            })
        }
    }
    public function removeRes(resArr:Array):void {
        if(resArr && resArr.length > 0){
            resArr.forEach(function(obj:Object){
                MemoryManager.getBundle(MemoryManager.IMAGE).removeLabel( obj.url)
            })
        }
    }
}
}