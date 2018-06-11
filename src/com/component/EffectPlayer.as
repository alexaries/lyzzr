/**
 * Created by guanll on 2017/12/21.
 */
package com.component {
import laya.events.Event;
import laya.net.Loader;
import laya.ui.Image;
import laya.utils.Handler;
import laya.utils.Utils;

public class EffectPlayer extends Image{
    /**全局缓存动画缓存池，存储了全局Graphics动画数据。使用缓存可以播放指定动画，比如播放"hero_run"动画：ani.play(0 , true ,"hero_run"); */
    public static var framesMap:Object = {};
    /**@private */
    protected var _frames:Array;
    /**@private */
    protected var _url:String;

    /**是否循环播放*/
    public var loop:Boolean;
    /**播放类型：0为正序播放，1为倒序播放，2为pingpong播放*/
    public var wrapMode:int = 0;
    /**@private */
    protected var _index:int;
    /**@private */
    protected var _count:int;
    /**@private */
    protected var _isPlaying:Boolean;
    /**@private */
    protected var _labels:Object;
    /**是否是逆序播放*/
    protected var _isReverse:Boolean = false;
    /**@private */
    protected var _frameRateChanged:Boolean = false;
    /**@private */
//    private var _controlNode:Sprite;
    /**@private */
    protected var _actionName:String;

    /**@private 播放间隔(单位：毫秒)。*/
    protected var _interval:int = Config.animationInterval;
    public function EffectPlayer() {
    }

    /**
     * 加载图片集合作为动画。
     * @param	urls	图片地址集合。如：[url1,url2,url3,...]。
     * @param	cacheName 缓存的动画模板名称。此模板为全局模板，缓存后，可以使用play(start,loop,name)接口进行播放，无需重复创建动画模板（相同动画能节省创建动画模板开销），设置为空则不缓存。
     * @return 	返回动画本身。
     */
    public function loadImages(urls:Array, cacheName:String = ""):EffectPlayer {
        this._url = "";
        if (!_setFramesFromCache(cacheName)) {
            this.frames = framesMap[cacheName] ? framesMap[cacheName] : createFrames(urls, cacheName);
        }
        return this;
    }

    /**
     * 加载一个图集作为动画。
     * @param	url 	图集地址。
     * @param	loaded	加载完毕回调。
     * @param	cacheName 缓存的动画模板名称。此模板为全局模板，缓存后，可以使用play(start,loop,name)接口进行播放，无需重复创建动画模板（相同动画能节省创建动画模板开销），设置为空则不缓存。
     * @return 	返回动画本身。
     */
    public function loadAtlas(url:String, loaded:Handler = null, cacheName:String = ""):EffectPlayer {
        this._url = "";
        var _this:EffectPlayer = this;
        if (!_this._setFramesFromCache(cacheName)) {
            function onLoaded(loadUrl:String):void {
                if (url === loadUrl) {
                    _this.frames = framesMap[cacheName] ? framesMap[cacheName] : createFrames(url, cacheName);
                    if (loaded) loaded.run();
                }
            }
            if (Loader.getAtlas(url)) onLoaded(url);
            else Laya.loader.load(url, Handler.create(null, onLoaded, [url]), null, Loader.ATLAS);
        }
        return this;
    }

    /**
     * 创建动画模板，相同地址的动画可共享播放模板，而不必每次都创建一份新的，从而节省创建Graphics集合的开销
     * createFrames如果url是图集则需要预加载图集，而loadAtlas方法则不需要
     * @param	url 图集路径(已经加载过的)或者url数组(可以异步加载)
     * @param	name 全局动画名称，如果name不为空，则缓存动画模板，否则不缓存
     * @return	Graphics动画模板
     */
    public static function createFrames(url:*, name:String):Array {
//        var arr:Array;
//        var i:int;
//        var n:int;
//        if (url is Array) {
//            arr = [];
//            for (i = 0, n = url.length; i < n; i++) {
//                arr.push(url[i]);
//            }
//        }
//        if (name) framesMap[name] = arr;
//        return arr;

        var arr:Array;
        if (url is String) {
            var atlas:Array = Loader.getAtlas(url);
            if (atlas && atlas.length) {
                arr = [];
                for (var i:int = 0, n:int = atlas.length; i < n; i++) {
                    arr.push(atlas[i]);
                }
            }
        } else if (url is Array) {
            arr = [];
            for (i = 0, n = url.length; i < n; i++) {
                arr.push(url[i]);
            }
        }
        if (name) framesMap[name] = arr;
        return arr;
    }

    public function set frames(value:Array):void {
        this._frames = value;
        if (value) {
            this._count = value.length;
            if (_isPlaying) play(_index, loop, _actionName);
            else index = _index;
        }
    }

    /**
     * 播放动画。可以指定name属性，播放缓存中某个动画。
     * @param	start 开始播放的动画索引或label。
     * @param	loop 是否循环播放。
     * @param	name 如果name为空(可选)，则播放当前动画，如果不为空，则播放全局缓存动画（如果有）
     */
    public function play(start:* = 0, loop:Boolean = true, name:String = ""):void {
        if (name) _setFramesFromCache(name);
        this._isPlaying = true;
        this.index = (start is String) ? _getFrameByLabel(start) : start;
        this.loop = loop;
        this._actionName = name;
        _isReverse = wrapMode == 1;
        if (this._frames && this.interval > 0) {
            timerLoop(this.interval, this, _frameLoop, null, true);
        }
    }

    /** 播放间隔(单位：毫秒)，默认为50毫秒，可以通过Config.animationInterval修改默认时间间隔。*/
    public function get interval():int {
        return _interval;
    }

    public function set interval(value:int):void {
        if (_interval != value) {
            _frameRateChanged = true;
            _interval = value;
            if (_isPlaying && value > 0) {
                timerLoop(value, this, _frameLoop, null, true);
            }
        }
    }

    /**@private */
    protected function _getFrameByLabel(label:String):int {
        var i:int;
        for (i = 0; i < _count; i++) {
            if (_labels[i] && (_labels[i] as Array).indexOf(label) >= 0) return i;
        }
        return 0;
    }

    /**当前播放索引。*/
    public function get index():int {
        return _index;
    }

    public function set index(value:int):void {
        _index = value;
        _displayToIndex(value);
        if (_labels && _labels[value])
        {
            var tArr:Array = _labels[value];
            for (var i:int = 0, len:int = tArr.length; i < len; i++)
            {
                event(Event.LABEL, tArr[i]);
            }
        }
    }

    /**@private */
    protected function _setFramesFromCache(name:String):Boolean {
        var showWarn:Boolean = name != "";
        if (_url) name = _url + "#" + name;
        if (name && framesMap[name]) {
            var tAniO:*;
            tAniO = framesMap[name];
            if (tAniO is Array) {
                this._frames = framesMap[name];
                this._count = _frames.length;
            } else {
                this._frames = tAniO.frames;
                this._count = _frames.length;
                //如果是读取动的画配置信息，帧率按照动画设置的帧率播放
                if (!_frameRateChanged) _interval = tAniO.interval;
                _labels = _copyLabels(tAniO.labels);
            }
            return true;
        } else {
            if (showWarn) trace("ani not found:", name);
        }
        return false;
    }

    /**@private */
    private function _copyLabels(labels:Object):Object {
        if (!labels) return null;
        var rst:Object;
        rst = {};
        var key:String;
        for (key in labels) {
            rst[key] = Utils.copyArray([], labels[key]);
        }
        return rst;
    }

    /**
     * @private
     * 显示到某帧
     * @param value 帧索引
     */
    protected function _displayToIndex(value:int):void {
        if (this._frames) this.skin = this._frames[value];
    }

    /**动画长度。*/
    public function get count():int {
        return _count;
    }

    /**清理。方便对象复用。*/
    public function clear():void {
        stop();
        this._labels = null;
    }

    /**
     * 停止播放。
     */
    public function stop():void {
        this._isPlaying = false;
        clearTimer(this, _frameLoop);
    }

    /**@private */
    protected function _frameLoop():void {
        if (!_style.visible || _style.alpha <= 0.01) {
           return;
        }

        if (_isReverse) {
            this._index--;
            if (this._index < 0) {
                if (loop) {
                    if (wrapMode == 2) {
                        this._index = this._count > 0 ? 1 : 0;
                        _isReverse = false;
                    } else {
                        this._index = this._count - 1;
                    }
                    event(Event.COMPLETE);
                } else {
                    this._index = 0;
                    stop();
                    event(Event.COMPLETE);
                    return;
                }
            }
        } else {
            this._index++;
            if (this._index >= this._count) {
                if (loop) {
                    if (wrapMode == 2) {
                        this._index = this._count - 2 >= 0 ? this._count - 2 : 0;
                        _isReverse = true;
                    } else {
                        this._index = 0;
                    }
                    event(Event.COMPLETE);
                } else {
                    this._index--;
                    stop();
                    event(Event.COMPLETE);
                    return;
                }
            }
        }
        this.index = this._index;
    }
}
}
