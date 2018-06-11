/**
 * Created by huangcb on 2017/12/13.
 */
package com.component {
import laya.resource.Texture;
import laya.utils.Dictionary;

public class MovieClipLoaderMemory {
    private static const memovyRectangle:Dictionary = new Dictionary();

    public static function getRectangle(url_atlas:String):MovieClipRectangle {
        return memovyRectangle.get(url_atlas) as MovieClipRectangle;
    }

    public static function addRectangle(url_atlas:String, moiveClipRectangle:MovieClipRectangle):void {
        memovyRectangle.set(url_atlas, moiveClipRectangle);
    }

    public static function removeRectangle(url_atlas:String):void {
        var moiveClipRectangle:MovieClipRectangle=getRectangle(url_atlas);
        for (var i:int = 0; i < moiveClipRectangle.vet.length; i++) {
            var texture:Texture = moiveClipRectangle.vet[i];
            texture.bitmap=null;
        }
        moiveClipRectangle.vet=null;
        memovyRectangle.remove(url_atlas);
    }
}
}
