/**
 * Created by dingcj on 2017/11/2.
 */
package com.preset.login.view {
import com.preset.login.mediator.LoginNoticeMediator;
import com.preset.view.PresetBaseView;
import com.signal.SignalDispatcher;

import laya.events.Event;
import laya.net.HttpRequest;
import laya.net.Loader;

import org.puremvc.as3.patterns.mediator.Mediator;

import ui.login.LoginNoticeUI;

import utils.HtmlUtil;

public class LoginNoticeView extends PresetBaseView {

    private var ui:LoginNoticeUI;
    public var closeClick:SignalDispatcher;

    public function LoginNoticeView() {
        closeClick = new SignalDispatcher();
        super([ "登录素材",{url: "module/login/top_title_bar_2.png", type: Loader.IMAGE}]);
    }

    override public function getMediator():Mediator {
        return new LoginNoticeMediator(this);
    }

    override public function onComplete():void {
        super.onComplete();
        __onComplete();
    }

    private function __onComplete():void {
        ui = new LoginNoticeUI();
        Laya.stage.addChild(ui);

        init();
        requestServer();
    }

    private function init():void {
        ui.closeBtn.on(Event.CLICK, this, onClickBtn);
        initHtml();
    }

    private function onClickBtn(e:Event):void {
        if (e.target == ui.closeBtn) {
            closeClick.dispatch(null);
        }
    }

    private function initHtml():void {
        if (ui.msgHtml)ui.msgHtml.innerHTML = HtmlUtil.color(
                "1.传承民国玄幻小说开山之作《蜀山剑侠传》经典剧情，诚意打造中国纯正修仙手游精品。\n" +
                "2.从东海到喜马拉雅，从南疆到昆仑山，中华美景尽收眼底。目之所及，山青水绿。美女玩家流连忘返，你愿意陪她一起修行吗？\n" +
                "3.天师, 慈航, 剑仙三大职业，五种散仙多种组合，15种阵法，修炼百种技能心法，多达万种的策略变化，真正属于聪明人的智慧较量。\n" +
                "4.围殴Boss、单挑斗剑、锁妖塔封魔、阵营对抗、帮派混战……不断衍生的PK玩法，释放你的战斗渴望。\n" +
                "5.免客户端，即点即玩。一键传送，一键战斗，一键挂机，无需刷怪升级。修仙，原来可以这么休闲。"
        );
       // if (ui.bugHtml) ui.bugHtml.innerHTML = HtmlUtil.color("暂无");
        //if (ui.tuHtml) ui.tuHtml.innerHTML = HtmlUtil.color("暂无");
    }

    private var hr:HttpRequest = new HttpRequest();

    private function requestServer():void {
        var channelID:int = 1;
        //var url:String = "http://api.ssh5.new.kingnet.com/notice/" + channelID + ".xml";
//        var url:String = "http://s3.qq.com/webplat/info/news_version3/1523/1524/1525/1529/m1446/201409/280974.shtml";
//
//        hr.once(Event.PROGRESS, this, onHttpRequestProgress);
//        hr.once(Event.COMPLETE, this, onHttpRequestComplete);
//        hr.once(Event.PROGRESS, this, onHttpRequestError);
//        hr.send(url.toLowerCase(), null, "post", "text");
    }

    private function onHttpRequestProgress(e:* = null):void {
        trace(e);
    }

    private function onHttpRequestComplete(e:* = null):void {
        trace(e);
        ui.msgHtml.text = hr.data;
    }

    private function onHttpRequestError(e:* = null):void {
        trace(e);
    }

    override public function dispose():void {
        if (isDispose)return;
        closeClick.dispose();
        Laya.stage.removeChild(ui);
        if (ui)ui.destroy();
        super.dispose();
    }
}
}