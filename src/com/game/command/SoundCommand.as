/**
 * Created by huangcb on 2017/8/16.
 */
package com.game.command {
import com.component.SoundJsNext;
import com.game.common.mvc.BaseCommand;
import com.game.events.NotiEvent;

import net.consts.StaticConfig;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class SoundCommand extends BaseCommand implements ICommand {
    public static const BG_1:String = "bg1.mp3";
    public static const BG_2:String = "bg2.mp3";
    public static const FIGHT_1:String = "fight1.mp3";
    public static const FIGHT_2:String = "fight2.mp3";
    public static const FIGHT_3:String = "fight3.mp3";
    public static const FIGHT_4:String = "fight4.mp3";

//    SoundManager.playMusic("res/atlas/bg.mp3",0);   //0表示循环播放
    //     SoundManager.playSound("res/atlas/hit.wav",1);
    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case NotiEvent.MUSIC_CHANGE:
                StaticConfig.musicName = Math.round(Math.random()) == 0 ? SoundCommand.BG_1 : SoundCommand.BG_2;
                playSoundBg(StaticConfig.musicName);
                break;
            case NotiEvent.MUSIC_EFFECT:
                var n:uint = Math.floor(Math.random() * 3);
                var str:String = [SoundCommand.FIGHT_1, SoundCommand.FIGHT_2, SoundCommand.FIGHT_3][n];
                playSoundFight(str);
                break;
            case NotiEvent.SOUND_VOLUME_SET:
                soundVolume(body as uint);
                break;
            case NotiEvent.MUSIC_FIGHT_CLOSE:
                resumeBgSound();
                break;
            case NotiEvent.MUSIC_SET:
                if (StaticConfig.musicOnOff) {
                    playSoundBg(StaticConfig.musicName);
                } else {
                    SoundJsNext.getInstance().stop();
                }
                break;
            default:
                break;
        }
    }

    private function resumeBgSound():void {
        if (!StaticConfig.musicOnOff) {
            return;
        }
        playSoundBg(StaticConfig.musicName, StaticConfig.musicTime);
    }


    private function soundVolume(value:Number):void {
        if (!StaticConfig.musicOnOff) {
            return;
        }
        SoundJsNext.getInstance().setMusicVolume(value);
    }

    private function playSoundFight(sound:String):void {
        if (!StaticConfig.musicOnOff) {
            return;
        }
        var url:String = StaticConfig.soundUrl + sound;
        StaticConfig.soundFightUrl = url;




        if (StaticConfig.playSoundUrl){
            SoundJsNext.getInstance().saveStarTime()
            SoundJsNext.getInstance().stop();
           /// SoundManager.destroySound(StaticConfig.playSoundUrl);
            StaticConfig.playSoundUrl=null;
        }

        SoundJsNext.getInstance().useStarTime(false)
        SoundJsNext.getInstance().play(url )


    }

    private function playSoundBg(sound:String, musicTime:Number = 0):void {
        if (!StaticConfig.musicOnOff) {
            return;
        }
        var url:String = StaticConfig.soundUrl + sound;
        trace(url);
        StaticConfig.playSoundUrl = url;


        if (StaticConfig.soundFightUrl){
            SoundJsNext.getInstance().stop();
           // SoundManager.destroySound(StaticConfig.soundFightUrl);
            StaticConfig.soundFightUrl=null;
        }
        SoundJsNext.getInstance().useStarTime(true)
        SoundJsNext.getInstance().play(url )



    }
}
}
