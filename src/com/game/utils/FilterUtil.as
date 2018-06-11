/**
 * Created by huangcb on 2017/9/18.
 */
package com.game.utils {

import laya.filters.ColorFilter;
import laya.filters.GlowFilter;

public class FilterUtil {
    public static var filter1:ColorFilter = new ColorFilter([0.2, 0.2, 0.2, 0,
        0, 0.2, 0.2, 0.2,
        0, 0, 0.2, 0.2,
        0.2, 0, 0, 0,
        0, 0, 1, 1]);
    public static var filter2:GlowFilter = new GlowFilter("#FFFFFF", 4, 2, 2);
    public static var filter3:GlowFilter = new GlowFilter("#FFFFFF", 4, 5, 5);
    public static var filter4:GlowFilter = new GlowFilter("#FFFFFF", 4, 5, 5);
    public static var filter5:GlowFilter = new GlowFilter("#FFFFFF", 4, 5, 5);
    public static var filter6:ColorFilter = new ColorFilter([1, 0, 0, 0, 30, 0, 1, 0, 0, 30, 0, 0, 1, 0, 30, 0, 0, 0, 1, 0]);
    public static var filter7:ColorFilter = new ColorFilter([0.5, 0.5, 0.5, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 0, 1, 1]);
    public static var filter8:ColorFilter = new ColorFilter([0.792, 0.4, 0.4, 0, 0, 0, 0.392, 0, 0, 0, 0, 0, 0.392, 0, 0, 0, 0, 0, 1, 0]);
    public static var filter9:ColorFilter = new ColorFilter([0.8, 0.4, 0.4, 0, 0, 0, 0.8, 0.1, 0.1, 0, 0, 0, 0.392, 0, 0, 0, 0, 0, 1, 0]);
    public static var filter10:ColorFilter = new ColorFilter([0, 0, 0.392, 0, 0, 0, 0.392, 0, 0, 0, 0.692, 0.4, 0.4, 0, 0, 0, 0, 0, 0.6, 0]);
    public static var yellowGlowFilter:GlowFilter = new GlowFilter("#FFFF00", 5, 2, 2);
    public static var whiteGlowFilter:GlowFilter = new GlowFilter("#FFFFFF", 5, 2, 2);
    public static var redGlowFilter:GlowFilter = new GlowFilter("#FF0000", 5, 2, 2);
    public static var greenColorMatrixFilter:ColorFilter = new ColorFilter([0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0]);
    public static const grayColorFilters:Array = [];
}
}
