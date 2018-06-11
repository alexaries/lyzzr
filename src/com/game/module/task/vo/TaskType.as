/**
 * Created by huangcb on 2017/12/6.
 */
package com.game.module.task.vo {
public class TaskType {
    public static var MAIN:int=1;
    public static var OTHER:int=2;

    public static var CYC:int=3;


    public static function getType(type:int):int {
        var t:int=type;
        switch ( type) {
            case 1:
            case 2:
                break;
            case 3:
            case 4:
            case 5:
            case 6:
                    t=CYC;
                break;
        }
        return t;
    }

}
}
