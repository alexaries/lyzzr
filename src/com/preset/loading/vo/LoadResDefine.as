package com.preset.loading.vo {
import laya.utils.Handler;

public class LoadResDefine {
    public var resArray:Array;
    public var tips:String;
    public var type:int;//1 游戏之前的预加载 2 游戏内部资源加载
    public var completeHandler:Handler;
    public var errorHandler:Handler;
    public function LoadResDefine(res:Array,name:String,complete:Handler = null,t:int = 2,error:Handler = null) {
        resArray = res;
        tips = name;
        completeHandler = complete;
        errorHandler = error;
        type = t;
    }
}
}
