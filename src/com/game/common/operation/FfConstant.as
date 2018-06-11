/**
 * Created by dingcj on 2018/5/16.
 */
package com.game.common.operation {
public class FfConstant {
    public static const GAME_WIDTH:int = 1920;
    public static const GAME_HEIGHT:int = 1080;
    public static const ROW:int = 5;
    public static const COLUMN:int = 5;
    public static const ROW_WIDTH:int = 180;//列宽
    public static const COLUMN_HEIGHT:int = 130;//行高

    /**
     * side跟位置无关，跟服务器发过来的攻守方是一致的
     */
    public static const SIDE_DEF:int = 1;
    public static const SIDE_AT:int = 0;
    public static const OTHER_SIDE:int = 99
    public static const COLOR:Array = ["FFFFFF", "2CC345", "2593EF", "9154E5", "FFCC33", "996600", "FF0000"];
    public static const COLOR_OX:Array = [0xFFFFFF, 0x2CC345, 0x2593EF, 0x9154E5, 0xFFCC33, 0x996600, 0xFF0000];
    public static const bgSkinArr:Array = ["common/surface/frame_blue.png","common/surface/frame_green.png","common/surface/frame_blue.png","common/surface/frame_purple.png","common/surface/frame_yellow.png","common/surface/frame_yellow.png","common/surface/frame_red.png"];

    public static const LABELS:Array = FfClipName.LABELS;
    public static const FRAME_RATE:Array = [12, 12, 12, 12, 12, 12, 12];
    public static const NUMBER_COLOR:Array = ["yellow", "green", "red", "blue"];
    public static const NUMBER_CHAR:Array = ["0123456789-+", "0123456789+", "0123456789-", "0123456789-+"];

    /**
     * 微调战斗速度
     */
    public static const TIME_OFFSET:int = 10;

    /**
     * 由于按以前的帧率动画会播太快，帧率会除以这个值
     */
    public static const FRAME_RATE_OFFSET:Number = 1.5;

    public static var TIME_SCALE:Number = TIME_SCALE_TWO;
    public static var TIME_SCALE_ONE:Number = 1;
    public static var TIME_SCALE_TWO:Number = 1.5;
    public static var TIME_SCALE_THREE:Number = 2;
    public static var CHAOS_FIGHT_JUMP_TIME:int = 20;
    public static var SHOW_NAME:Boolean=true;

}
}
