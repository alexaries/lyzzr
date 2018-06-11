/**
 * Created by huangcb on 2017/12/26.
 */
package com.component {
import laya.media.SoundManager;
import laya.net.URL;
import laya.utils.Handler;

public class SoundJsNext {
    static var __instance:SoundJsNext;
    public static function getInstance():SoundJsNext {
        if (__instance == null) {
            __instance = new SoundJsNext();
        }
        return __instance;
    }
    public var __useStarTime:Boolean;
    public var startTime:int;
    var soundInstance;  // the soundInstance returned by Sound when we create or play a src
      public function init():void {
        __useStarTime=false;
         startTime=0;

          /*
          __JS__("createjs.Sound.initializeDefaultPlugins();")
          __JS__("createjs.Sound.alternateExtensions = ['mp3'];")	// add other extensions to try loading if the src file extension is not supported
        //createjs.Sound.onLoadComplete = playSound;  // add a callback for when load is completed
          __JS__("createjs.Sound.addEventListener('fileload',function(event){SoundJsNext.getInstance().playSound(event.src);} ); ")// add an event listener for when load is completed
    */
    }
     public function play(src) {
        // src=URL.formatURL(src);
        // __JS__("createjs.Sound.registerSound(src); ") // register sound, which preloads by default
        playSound(src);

    }

    public function  saveStarTime():void{
        if(soundInstance){
            startTime   =soundInstance.position;
        }

    }
    public function  useStarTime(b:Boolean):void{
         __useStarTime=b;
    }
    function playSound(path) {
        /*
            if(__useStarTime){
                soundInstance =   __JS__("createjs.Sound.play(path,{loop: -1,offset: this.startTime});")  // start playing the sound we just loaded, storing the playing instance
            }else
            {
                soundInstance =   __JS__("createjs.Sound.play(path,{loop: -1});") // start playing the sound we just loaded, storing the playing instance

            }
    */
        if(__useStarTime){
            SoundManager.playMusic(path,1,null,this.startTime)
        }else
        {
            SoundManager.playMusic(path,1);
        }

    }
    public function stop() {
        SoundManager.stopMusic();
      //  soundInstance =   __JS__("createjs.Sound.stop();") // start playing the sound we just loaded, storing the playing instance

    }

    public function setMusicVolume(value):void {

    }
}
}
