/**
 * Created by guanll on 2017/9/12.
 */
package tools {
import laya.utils.Browser;

public class OpenWindow {

    private static var browserName:String = "";

    public static function open(url:String, window:String="_blank", features:String=""):void{
        Browser.window.open(url,window,features);
    }

    private static function getBrowserName():String{
        var browser:String;

        //Uses external interface to reach out to browser and grab browser useragent info.
        try
        {
            var browserAgent:String = Browser.userAgent;
        }
        catch(e:*)
        {

        }

        //  Debug.text += "Browser Info: [" + browserAgent + "]";

        //Determines brand of browser using a find index. If not found indexOf returns (-1).
        if(browserAgent != null && browserAgent.indexOf("Firefox") >= 0) {
            browser = "Firefox";
        }
        else if(browserAgent != null && browserAgent.indexOf("Safari") >= 0){
            browser = "Safari";
        }
        else if(browserAgent != null && browserAgent.indexOf("MSIE") >= 0){
            browser = "IE";
        }
        else if(browserAgent != null && browserAgent.indexOf("Opera") >= 0){
            browser = "Opera";
        }
        else {
            browser = "Undefined";
        }
        return browser;
    }
}
}
