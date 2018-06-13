package com.game.common.view {
import com.game.events.NotiEvent;

import lang.SystemInfo;

import laya.html.dom.HTMLDivElement;
import laya.ui.Dialog;
import laya.utils.Handler;

import org.puremvc.as3.patterns.facade.Facade;
import org.puremvc.as3.patterns.observer.Notification;

import ui.dialog.AlertUI;

import utils.CSSStyleCfg;
import utils.HtmlUtil;

public class Alert {
    private static var ui:AlertUI;

    public static function show(s:String, a:String = "提示", btns:Array = null, handler:Handler = null):void {
        if (ui == null) {
            ui = new AlertUI();
            ui.popupEffect = null;
            ui.closeEffect=null;
            Dialog.manager.popupEffectHandler = null;
            Dialog.manager.popupEffectHandler = null;
        }
        if (ui.parent) {
            return;
        }
        setDefaultCSS(ui.txtContent);
        if (s.indexOf("<span") != -1) {
            ui.txtContent.innerHTML = s;
        } else {
            ui.txtContent.innerHTML = HtmlUtil.color(s);
        }

        ui.txtTitle.text = a;
        ui.btnOk.visible = false;
        ui.btnCancel.visible = false;
        ui.btnClose.visible = false;
        ui.btnSure.visible = false;

        layoutVertical(ui);

        var len:int = 0;


        if (btns && (btns.indexOf(SystemInfo.OK) != -1 || btns.indexOf(SystemInfo.USE_YinBi) != -1)) {
            ui.btnOk.visible = true;
            len++;
        }
        if (btns && (btns.indexOf(SystemInfo.INSURE_ONCE) != -1 || btns.indexOf(SystemInfo.USE_XIANSHI) != -1)) {
            ui.btnSure.visible = true;
            len++;
        }
        if (btns && btns.indexOf(SystemInfo.CANCEL) != -1) {
            ui.btnCancel.visible = true;
            len++;
        }
        if (ui.btnCancel.visible == false && ui.btnOk.visible == false) {
            ui.btnClose.visible = true;
        }

        if (len == 0) {
            ui.btnOk.visible = true;
            ui.btnOk.x = 261;
            ui.btnOk.label = "确定";
        }
        else if (len == 1) {
            //只有一个按钮时 这个按钮要居中显示
            if (ui.btnOk.visible) {
                ui.btnOk.x = 261;
                ui.btnOk.label = btns[0];
            }
            if (ui.btnCancel.visible) {
                ui.btnCancel.x = 261;
                ui.btnCancel.label = btns[0];
            }
        } else if (len == 2) {
            ui.btnOk.x = 97;
            ui.btnCancel.x = 425;
            ui.btnOk.label = btns[0];
            ui.btnCancel.label = btns[1];
        }
        else {
            ui.btnOk.x = 27;
            ui.btnSure.x = 261;
            ui.btnCancel.x = 495;
            ui.btnOk.label = btns[0];
            ui.btnSure.label = btns[1];
            ui.btnCancel.label = btns[2];
        }
        ui.closeHandler = handler;
        ui.onClosed = onAlertClosed;
        ui.popup(true);
    }

    private static function onAlertClosed(type:String = null):void{
        if(ui.closeHandler){
            ui.closeHandler.clear();
        }
        ui.closeHandler = null;
    }

    /**
     * 展示自定义的提示框
     */
    public static function showCustomAlert(sp:Dialog, handler:Handler = null):void {
        if (sp.parent) {
            return;
        }
        sp.closeHandler = handler;
        sp.onClosed = function(sp:Dialog):Function{
                return function(type:String = null):void{
                    if(sp.closeHandler){
                        sp.closeHandler.clear();
                    }
                    sp.closeHandler = null;
                };
        }(sp);
        sp.popup(true);
    }

    public static function layoutVertical(d:AlertUI):void {
        //纵向自适应
        var txtHeight:Number = d.txtContent.contextHeight;
        if (txtHeight < 120) {
            txtHeight = 120;//至少是3行的高度
        }
        d.lineBg.y = txtHeight + d.txtContent.y + 25;
        d.btnOk.y = d.btnCancel.y = d.btnSure.y = d.lineBg.y + 27;
        var bgHeight:Number = d.btnOk.y + d.btnOk.height + 33;
        d.height = bgHeight;
        d.bg1.height = bgHeight - d.bg1.y - 10;
        d.bg2.height = bgHeight - d.bg2.y - 10;
        d.bg3.height = bgHeight - d.bg3.y - 10;
        d.bg4.height = bgHeight - d.bg4.y;
    }

    public static function setDefaultCSS(s:HTMLDivElement):void {
        s.style.fontFamily = CSSStyleCfg.defaultFontName;
        s.style.lineHeight = 40;
        s.style.color = "#feffec";
        s.style.fontSize = CSSStyleCfg.defaultFontSize;
        s.style.align = "center";
        s.style.valign = "middle";
        s.style.width = 584;
        s.style.height = 213;
    }

    public static function roll(SHOP_VIEW_4:String):void {
        Facade.getInstance().notifyObservers(new Notification(NotiEvent.ROLL_SCREEN, HtmlUtil.color(SHOP_VIEW_4)));
    }
}
}