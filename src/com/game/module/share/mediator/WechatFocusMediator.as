/**
 * Created by guanll on 2018/3/30.
 */
package com.game.module.share.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.module.share.view.WeChatFocusView;

import laya.utils.Browser;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class WechatFocusMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "WechatFocusMediator";

    private function get view():WeChatFocusView{
        return getViewComponent() as WeChatFocusView;
    };
    public function WechatFocusMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
    }

    private function instanceCompleteHander():void {
        view.clickBtnSignal.getSignal(this).listen(clickBtnHandler);
    }

    private function clickBtnHandler():void {
        //打开链接 http://mp.weixin.qq.com/s?__biz=MzUzOTczMTg2Ng==&mid=2247483655&idx=1&sn=c1bfe11a245410ad8e9b4f305c80a690&chksm=fac2b3f2cdb53ae4f36e0dfa37c5f3500e31886d15e94c2cfcf38fae525b6735e485e56c5944&mpshare=1&scene=23&srcid=0330dVrOwQ96cHKwEaejhzhS#rd
//        var window:* = Browser.window;
//        __JS__("window.open('http://mp.weixin.qq.com/s?__biz=MzUzOTczMTg2Ng==&mid=2247483655&idx=1&sn=c1bfe11a245410ad8e9b4f305c80a690&chksm=fac2b3f2cdb53ae4f36e0dfa37c5f3500e31886d15e94c2cfcf38fae525b6735e485e56c5944&mpshare=1&scene=23&srcid=0330dVrOwQ96cHKwEaejhzhS#rd');")
//        __JS__("var a = document.createElement('a');a.setAttribute('href', 'http://mp.weixin.qq.com/s?__biz=MzUzOTczMTg2Ng==&mid=2247483655&idx=1&sn=c1bfe11a245410ad8e9b4f305c80a690&chksm=fac2b3f2cdb53ae4f36e0dfa37c5f3500e31886d15e94c2cfcf38fae525b6735e485e56c5944&mpshare=1&scene=23&srcid=0330dVrOwQ96cHKwEaejhzhS#rd');a.setAttribute('target', '_blank');a.setAttribute('id', 'l0');if(!document.getElementById('l0')) {document.body.appendChild(a);}a.click(); ")

        if(Browser.getElementById("pageCon")){
            Browser.getElementById("pageCon").style.display = "block";
            Browser.getElementById("wechatinfo").src = "http://mp.weixin.qq.com/s?__biz=MzUzOTczMTg2Ng==&mid=2247483655&idx=1&sn=c1bfe11a245410ad8e9b4f305c80a690&chksm=fac2b3f2cdb53ae4f36e0dfa37c5f3500e31886d15e94c2cfcf38fae525b6735e485e56c5944&mpshare=1&scene=23&srcid=0330dVrOwQ96cHKwEaejhzhS#rd";
        }else{
            var con:* = Browser.createElement("div");
            con.id = "pageCon";

            var iframe:* = Browser.createElement("iframe");
            iframe.id = "wechatinfo";
            iframe.src = "http://mp.weixin.qq.com/s?__biz=MzUzOTczMTg2Ng==&mid=2247483655&idx=1&sn=c1bfe11a245410ad8e9b4f305c80a690&chksm=fac2b3f2cdb53ae4f36e0dfa37c5f3500e31886d15e94c2cfcf38fae525b6735e485e56c5944&mpshare=1&scene=23&srcid=0330dVrOwQ96cHKwEaejhzhS#rd";
            iframe.width = Laya.Browser.clientWidth;
            iframe.height = Laya.Browser.clientHeight;
            iframe.style["position"] = "absolute";
            con.appendChild(iframe);

            var closeBtn:* = Browser.createElement("img");
            closeBtn.src = "btn_back.png";
            closeBtn.style = "width:75px;height:75px;position:absolute;top:0;right:0";
            closeBtn.onclick = __JS__("function(){pageCon.style.display='none'}");
            con.appendChild(closeBtn);

            Browser.document.getElementById('layaContainer').appendChild(con);
        }
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case "":
                break;
        }
    }
}
}