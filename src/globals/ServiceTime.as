/**
 * Created by huangcb on 2017/9/7.
 */
package globals {
import utils.TimerUtil;

public class ServiceTime  {
    private static var __instance:ServiceTime;

    public static function getInstance():ServiceTime {
        if (__instance == null) {
            __instance = new ServiceTime();
        }
        return __instance;
    }
    private var mode:int;
    private var offest:Number;
    private var prevServiceOffest:Number;
    public function get nowTime():uint {
        return (TimerUtil.getTimer() / 1000);
    }

    private var _nowDate:Date = new Date;
    public function get nowDate():Date {
        _nowDate.setTime (nowTime * 1000);
        return _nowDate;
    }
    public function ServiceTime() {

    }

    public function setServiceTime(serviceTime:Number):void
    {
        mode=1;
        this.offest = (new Date().getTime()) - serviceTime;
        this.prevServiceOffest = serviceTime - (TimerUtil.getTimer());
    }
    public function getServiceTime():Number
    {
        if(this.mode != 0)
        {
            if(isNaN(this.prevServiceOffest))
            {
                return  (new Date().getTime());
            }
            else
            {
                return  (this.prevServiceOffest + (TimerUtil.getTimer()));
            }
        }
        else
        {
            return (new Date().getTime()) - this.offest;
        }
    }
}
}