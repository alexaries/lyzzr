/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.vo {
import lang.LangArrayTxt;

import laya.maths.Point;

public class TaskTrackVo {
    public var visible:Boolean = false;
    public var pos:Point = new Point(3, 120);
    public var curType:uint = 0;
    public var tabs:Array = LangArrayTxt.TASK_VIEW_34;//[{label:"当前"}, {label:"可接"}, {label:"日常"}];
    public var isOpen:Boolean = true;
    public var isScale:Boolean = true;
    public var flashId:uint;
    public var count:uint = 0;
    public var txtFormat:Array = [];
    public var flashColor:Array = [0xf9c700, 0xffff00];
    public var curTaskTrackList:Array=[];

    public function TaskTrackVo() {
    }


}
}
