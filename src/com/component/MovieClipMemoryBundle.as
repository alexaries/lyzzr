/**
 * Created by huangcb on 2017/12/14.
 */
package com.component {
public class MovieClipMemoryBundle  extends  MemoryBundle{
    public function MovieClipMemoryBundle() {
    }

    override  public function remove(tmp:Array ):void {
        for (var i:int = 0; i < tmp.length; i++) {
            memory.remove(tmp[i]) ;
            Laya.loader.clearRes(tmp[i],true);
            MovieClipLoaderMemory.removeRectangle(tmp[i]);
        }
    }
}
}
