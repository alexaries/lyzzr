/**
 * Created by huangcb on 2017/11/23.
 */
package config {
import net.consts.StaticConfig;

import org.osmf.net.StreamingURLResource;

public class BaseConfig {

    public function BaseConfig() {

    }



    public function hasLocalVersion():Boolean{

        var localObj=localStorage_getItem("config","version");
        if(localObj){
            var localVersionNum:String=localObj;
            if(localVersionNum==StaticConfig.curVersion){
                trace("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@hasLocalVersion")
                return true;
            }
        }
        localStorageClear();
        return false

    }
    public function loadVer():void{
        attributeUnSerialization( StaticConfig.curVersion)
    }
    public function saveVer():void{
        localStorage_setItem("config","version",StaticConfig.curVersion)
        attributeSerialization( StaticConfig.curVersion)
    }


    protected function attributeUnSerialization(curVersion:String):void {

    }


    protected function attributeSerialization(curVersion:String):void {

    }
    public  function  localStorageClear(){
        __JS__("localStorage.clear();");
    }

    protected function serialization(version:String, name:String, config:*):void {
        __JS__("localStorage.setItem(version+'_'+name, LZString.compress(JSON.stringify(config)));");
    }
    protected function localStorage_setItem(version:String, name:String, config:*):void {
        __JS__("localStorage.setItem(version+'_'+name, config);");
    }
    protected function localStorage_getItem(version:String,name:String):* {
        __JS__("return localStorage.getItem(version+'_'+name);");
    }
    protected function unSerialization(version:String,name:String):* {
        __JS__("return JSON.parse(LZString.decompress(localStorage.getItem(version+'_'+name)));");
    }
}
}
