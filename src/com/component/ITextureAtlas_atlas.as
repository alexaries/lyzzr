/**
 * Created by huangcb on 2017/9/1.
 */
package com.component {
import globals.*;

public interface ITextureAtlas_atlas {
    // ATTRIBUTES
    function get name():String;
    function get fps():int;
    // ELEMENTS
    function get sub():Vector.<ITextureAtlas_atlas_sub>;
}
}
