/**
 * Created by huangcb on 2017/10/26.
 */
package com.component {

import laya.maths.Rectangle;
import laya.net.Loader;
import laya.resource.Texture;
import laya.utils.Handler;
import laya.utils.Pool;

import utils.ArrayUtil;

public class MovieClipLoader {

    protected var movieClipLabels:Vector.<MovieClipLabel>;
    public var jsonObj:IAtlas;
    var pathUrl:String = "fight/avatars/";
    var ower:MovieClipCustom;
    var _currentFrameLoop:Boolean;
    var isDispose:Boolean;
    var _currentFrameLabel:String;
    private var waitPlay:Boolean;
    private var keyId:String;
    private var movieClipLabelUrls:Array=[];

    public function MovieClipLoader(ower:MovieClipCustom) {
        this.ower=ower;

        movieClipLabels = new Vector.<MovieClipLabel>();
    }

    public function getAtlasUrl():String {
        return pathUrl + keyId + ".json";
    }

    function getTextureAtlasUrl(keyId:String):String {
        return pathUrl + jsonObj.textureAtlas.name + "/" + keyId + ".png";
    }

    //一组动作
    public function loadAtlas(pathUrl:String,keyId:String,waitPlay:Boolean=false):void {
        this.pathUrl=pathUrl;
        this.waitPlay=waitPlay;
        this.keyId=keyId;
        var url = getAtlasUrl();
        var urls:Array = [url];
        Laya.loader.load(urls, Handler.create(this, onLoadedJsonOver, [url]), null, Loader.JSON);//json
        // trace("loadAtlas",keyId , url);
    }

    private function onLoadedJsonOver(url:String):void {
        if(url==null){
            return;
        }
        jsonObj = Loader.getRes(url);   //json
        if(waitPlay==false &&jsonObj!=null){
            if( jsonObj.textureAtlas.atlas   instanceof  Array){
                for (var i:int = 0; i < jsonObj.textureAtlas.atlas.length; i++) {
                    var atlas:ITextureAtlas_atlas=jsonObj.textureAtlas.atlas[i];
                    if(ower.loadCond(atlas)){
                        loadedAtlas(atlas);
                    }
                }
            }
            else{
                loadedAtlas(jsonObj.textureAtlas.atlas as ITextureAtlas_atlas );
            }
        }
        else{
            if(_currentFrameLabel!=null){
                loadedAtlasAndPlay(_currentFrameLabel);
                //  trace("@onLoadedJsonOver loadedAtlasAndPlay",_currentFrameLabel)
            }

        }

    }
    public function loadedAtlasAndPlay(atlas_name:String):void {
        if(isDispose) return;
        if(jsonObj!=null){
            if( jsonObj.textureAtlas.atlas   instanceof  Array) {
                var atlas_ = ArrayUtil.find(jsonObj.textureAtlas.atlas, function (atlas:ITextureAtlas_atlas) {
                    return atlas.name == atlas_name;
                })
                if (atlas_ != null) {
                    loadedAtlas(atlas_);
                } else {
                    //   trace("@loadedAtlasAndPlay", atlas_name)
                }
            }
            else{
                loadedAtlas( jsonObj.textureAtlas.atlas  as ITextureAtlas_atlas );
            }
        }
    }
    private function loadedAtlas(atlas:ITextureAtlas_atlas):void {
        if(isDispose) {
            return;
        }

        var url_atlas:String = getTextureAtlasUrl(atlas.name);
        if(movieClipLabelUrls.indexOf(url_atlas)!=-1){
            return;
        }
        Laya.loader.load([url_atlas], Handler.create(this, onLoadedAtlasOver, [atlas, url_atlas]), null, Loader.IMAGE);//png
    }

    private function onLoadedAtlasOver(bigT:ITextureAtlas_atlas, url_atlas:String):void {
        if(isDispose) {
            return;
        }
        if(bigT==null){
            return;
        }

        //这里需要做图集管理 和回收
        //   trace("onLoadedAtlasOver",bigT , url_atlas);
        var sourceTexture:Texture = Loader.getRes(url_atlas);


        if(!sourceTexture)
            return;
        var moiveClipRectangle:MovieClipRectangle = MovieClipLoaderMemory.getRectangle(url_atlas);
        if(moiveClipRectangle==null){
            moiveClipRectangle=new MovieClipRectangle();
            trace(sourceTexture.width, sourceTexture.height);
            var vet:Vector.<Texture> = new <Texture>[];
            if(bigT.sub instanceof  Array){
                for (var i:int = 0, len:int = bigT.sub.length; i < len; i++) {
                    //小图
                    var smallT:ITextureAtlas_atlas_sub = bigT.sub[i];
                    var texture:Texture = Texture.createFromTexture(sourceTexture, smallT.x, smallT.y, smallT.width, smallT.height);
                    texture.offsetX = -smallT.pivotX;
                    texture.offsetY = -smallT.pivotY;
                    vet.push(texture);
                }
            }else{
                var smallT = bigT.sub  as Object;
                var texture:Texture = Texture.createFromTexture(sourceTexture, smallT.x, smallT.y, smallT.width, smallT.height);
                texture.offsetX = -smallT.pivotX;
                texture.offsetY = -smallT.pivotY;
                vet.push(texture);
            }
            moiveClipRectangle.vet=vet;
            MovieClipLoaderMemory.addRectangle(url_atlas,moiveClipRectangle);
        }


        if(moiveClipRectangle.vet.length>0){
            MemoryManager.getBundle(MemoryManager.MOVIE_CLIP).addLabel(url_atlas)
            if(isDispose){
                MemoryManager.getBundle(MemoryManager.MOVIE_CLIP).removeLabel(url_atlas);
                return;
            }
            addLabel(bigT.name, moiveClipRectangle.vet, bigT.fps, url_atlas);
            if (_currentFrameLabel == bigT.name)
                gotoAndPlay(bigT.name,_currentFrameLoop);
            //等自己 播放
        }

    }

    private function gotoAndPlay(name:String, _currentFrameLoop:Boolean):void {
        ower.gotoAndPlay(name,_currentFrameLoop)
    }

    private function addLabel(labelName:String, texturesVet:Vector.<Texture>, fps:int, url_atlas:String):void {

        movieClipLabelUrls.push(url_atlas);
        var label:MovieClipLabel =  Pool.getItemByClass("MovieClipLabel", MovieClipLabel);
        label.init(texturesVet, fps);
        label.name = labelName;
        movieClipLabels.push(label);
        label.fps = fps * ower.timeScale;
        label.onCompleteSignal.getSignal(this).listen(dispatchEventWith);
    }
    private function dispatchEventWith(COMPLETE:String):void {
        ower.dispatchEventWith(COMPLETE);
    }
    function getLabel(labelName:String):MovieClipLabel {
        for (var i:int = 0; i < movieClipLabels.length; i++) {
            var object:MovieClipLabel = movieClipLabels[i];
            if (object.name == labelName) return object;

        }
        return null;
    }

    function removeLabel(labelName:String):void {
        movieClipLabels = movieClipLabels.filter(function (object:MovieClipLabel) {
            return object.name != labelName;
        })
    }
    public function setTimeScale(timeScale:Number):void {
        if (jsonObj &&jsonObj.textureAtlas && jsonObj.textureAtlas.atlas instanceof  Array) {
            for (var i:int = 0; i < movieClipLabels.length; i++) {
                var object:MovieClipLabel = movieClipLabels[i];
                var atlas:ITextureAtlas_atlas = ArrayUtil.find(jsonObj.textureAtlas.atlas, function (a:ITextureAtlas_atlas) {
                    return a.name == object.name;
                })
                object.fps = atlas.fps * timeScale
            }
        }
    }

    public function dispose():void {
        if(isDispose) return;
        isDispose=true;

        for (var i:int = 0; i < movieClipLabelUrls.length; i++) {
            var url_atlas:String = movieClipLabelUrls[i];
            MemoryManager.getBundle(MemoryManager.MOVIE_CLIP).removeLabel(url_atlas)
        }
        movieClipLabelUrls=null;
        for (var i:int = 0; i < movieClipLabels.length; i++) {
            var object_:MovieClipLabel = movieClipLabels[i];
            object_.dispose();
            Pool.recover("MovieClipLabel", object_);

        }
        movieClipLabels=null;
        jsonObj=null;
    }

}
}
