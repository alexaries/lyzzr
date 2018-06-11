/**
 * Created by huangcb on 2017/12/13.
 */
package com.component {
import laya.utils.Dictionary;

public class MemoryManager {

    static public var memorylist:Dictionary=new Dictionary();
    public static const MOVIE_CLIP:String = "MOVIE_CLIP";
    public static const OPER:String ="OPER" ;
    public static const IMAGE:String = "IMAGE";


    static public function getBundle(name:String):MemoryBundle {
        if(memorylist.get(name) ){
            return memorylist.get(name)
        }
        if(name==MOVIE_CLIP){
            var bundle:MovieClipMemoryBundle=new MovieClipMemoryBundle();
            bundle.name=name;
            memorylist.set(name ,bundle)
            return bundle;
        }
        if(name==IMAGE){
            var bundleImage:ImageMemoryBundle=new ImageMemoryBundle();
            bundleImage.name=name;
            memorylist.set(name ,bundleImage)
            return bundleImage;
        }

        return null;

    }
}
}
