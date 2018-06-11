package utils {
import com.game.module.heroic.vo.HeroVO;
import com.game.module.map.proxy.MapService;
import com.game.module.map.util.MapUtil;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.map.vo.NpcBaseInfoVO;
import com.game.vo.GoodsVO;
import com.game.vo.MonsterVO;
import com.game.vo.SkillVO;
import com.game.vo.TaskCfg;

import config.disaster.disaster.IDisaster_level;

import globals.ConfigLocator;

import lang.LangArrayTxt;

import net.consts.StaticConfig;
import net.utils.ColorUtil;

import org.puremvc.as3.patterns.facade.Facade;

public class HtmlUtil {
    // public static const COLOR_REGEXP:RegExp = /\[([.\S\s]+?)\]/g;
    // public static const COLOR_REGEXP:RegExp = /\[([\S\s^\[\]]+?)\]/g;
    public static const COLOR_REGEXP:RegExp = /\[([^\[\]]+?)\]/g;
    public static var setLink:Boolean = false;
    public static var txtNormalColor:String = "";
    public static var currReplaceNum:uint = 0;
    public static var totalReplaceNum:uint = 0;

    public function HtmlUtil() {
    }


    // -----------------------------------------华丽的分隔线
    public static function color(content:String, theColor:String = "#ffffff"):String {
        return "<span style='color:"+theColor+";font-size:"+CSSStyleCfg.defaultFontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + content + "</span>";
    }
    public static function fontSizeAndColor(content:String, theColor:String, fontSize:int):String {
        return "<span style='color:"+theColor+";font-size:"+ fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + content + "</span>";
    }
    public static function colorAlign(content:String, theColor:String = "#ffffff",align:String = "left"):String{
        return "<span style='color:"+theColor+";font-size:"+CSSStyleCfg.defaultFontSize + "px;font-family:" + CSSStyleCfg.defaultFontName +";text-align:" + align+"'>" + content + "</span>";

    }
    public static function fontSize(content:String, fontSize:int):String {
        return "<span style='color:"+CSSStyleCfg.defaultFontColor1+";font-size:"+ fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + content + "</span>";
    }
    public static function p(content:String, align:String = "left"):String {
        return "<p align=\"" + align + "\">" + content + "</p>";
    }

    public static function u(content:String):String {
        return "<u>" + content + "</u>";
    }

    public static function customColor(content:String, theColor:String):String {
        return "&" + theColor + "&" + content;
    }

    public static function bold(content:String):String {
        return "<b>" + content + "</b>";
    }

    public static function autoBr(content:String, length:int = 15):String {
        return content;
    }

    public static function removeHtml(content:String):String {
        var result:String = content.replace(/\<\/?[^\<\>]+\>/gmi, "");
        result = result.replace(/[\r\n ]+/g, "");
        return result;
    }

    public static function nameHtml(content:String):String {
        var result:String = content.replace(/\</gmi, "&lt;");
        result = result.replace(/\>/gmi, "&gt;");
        return result;
    }

    public static function chatHtml(content:String):String {
        var result:String = content.replace(/&lt;/gmi, "<");
        result = result.replace(/&gt;/gmi, ">");
        return result;
    }

    /**
     * 合服，用来区别名将的名字 的方法
     * */
    public static function replaceHeroName(heroName:String):String {
        var num:int = 0;
        var serverId:int;
        var index:int = heroName.length - 1;
        if (index > 0) {
            serverId = heroName.charCodeAt(index);
            if (serverId < 32 && serverId > 0) {
                num = (num * 31 + serverId - 1);
                index--;
            } else {
                return heroName;
            }
            while (index > 0) {
                serverId = heroName.charCodeAt(index);
                if (serverId < 32 && serverId > 0) {
                    num = (num * 31 + serverId - 1);
                    index--;
                } else
                    break;
            }
            num++;
            if (num != Number(StaticConfig.serverId))
                return heroName.substr(0, index + 1) + ".S" + num.toString();
            else
                return heroName.substr(0, index + 1);
        }
        return heroName;
    }

    public static function addEventParameter(str:String, parameter:String):String {
        return "<a href=\"event:" + parameter + "\">" + str + "</a>";
    }

    public static function getSenderName(text:String):String {
        var pattern:RegExp = /\[([^\[\]]+?)\]/;
        var obj:Object = pattern.exec(text);
        if (obj && obj[1]) {
            var str:String = obj[1];
            var array:Array = str.split(":");
            return array[2];
        }
        return "";
    }

    public static function shiftColorText(text:String, link:Boolean = false, withColor:Boolean = false,fontSize:int=32):String {
        setLink = link;
        var str:String;
        if (withColor){
            if(text.indexOf("[") != -1 && text.indexOf("]") != -1){
                var first:String = text.substr(7,text.indexOf("[") - 7)
                var rStr:String = text.substr(text.indexOf("["),text.indexOf("]") - text.indexOf("[") + 1)  ;
                var left:String = text.substr(text.indexOf("]") + 1,text.length)
                str = "<span style='color:"+text.substr(0, 7) +";font-size:"+fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + first+ "</span>";
                str += rStr.replace(COLOR_REGEXP,replaceStr);
                str += "<span style='color:"+text.substr(0, 7) +";font-size:"+fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" +left +"</span>";
            }else{
                str = "<span style='color:"+text.substr(0, 7) +";font-size:"+fontSize + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + text.substr(7, text.length).replace(COLOR_REGEXP,replaceStr)+ "</span>";
            }

        } else{
            str = text.replace(COLOR_REGEXP, replaceStr);
        }
        return str;
    }

    private static function replaceStr():String {
        var arr:Array;
        if (arguments[1].substr(0, 1) == "l")
            arr = arguments[1].split(">>");
        else
            arr = arguments[1].split(":");
        var tempStr:String = "";
        var hrefStr:String = "";
        var baseLineFirst:String = "<u>";
        var baseLineLast:String = "</u>";
        if (!setLink) {
            baseLineFirst = "";
            baseLineLast = "";
        }

        var name:String = "";

        var color:String = "";
        var npcVo:NpcBaseInfoVO;
        if (arr[0] == "1") {
            if ((arr[1]) < 0x1000) {
                var general:HeroVO = ConfigLocator.getInstance().gernalHeros.get(arr[1]);
                npcVo = ConfigLocator.getInstance().talkNpcs.get(arr[1]);
                if (general)
                    name = general.name;
                else if (npcVo)
                    name = npcVo.name;
                color = ColorUtil.getColorStr(general.nameColor);
            } else {
                npcVo = ConfigLocator.getInstance().talkNpcs.get(arr[1]);
                var monsterVo:MonsterVO = ConfigLocator.getInstance().monsters.get(arr[1]);
                if (monsterVo)
                    name = monsterVo.name;
                else if (npcVo)
                    name = npcVo.name;
                color = ColorUtil.TASKCOLOR[0];
            }
        } else if (arr[0] == "2") {
            var buildVO:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, parseInt(arr[1]));
            if (buildVO){
                ///var n1:int = (Math.random() * (buildVO.name.length));
                name = buildVO.name;
            }
           color = ColorUtil.TASKCOLOR[1];
        } else if (arr[0] == "3") {
            name = LangArrayTxt.COUNTRYARR[(arr[1])];
            color = ColorUtil.getCountryColorStr((arr[1]));
        } else if (arr[0] == "4") {
            var goodVo:GoodsVO = ConfigLocator.getInstance().goodsList.get(arr[1]);
            if (goodVo) {
                name = goodVo.name;
                color = GoodsVO.TEXTCOLOR[goodVo.color - 1];
            }
        } else if (arr[0] == "5") {
            var taskCfg:TaskCfg = ConfigLocator.getInstance().taskDic.get(arr[1]);
            if (taskCfg){
                name = taskCfg.name;
            }
            color = "#ffffff";
        } else if (arr[0] == "7") {
            var skillData:int = (arr[1]);
            var skillID:int = (skillData / 10);
            var skillLevel:int = skillData % 10 + 1;
            var skillvo:SkillVO = ConfigLocator.getInstance().skillDatas.get(skillID);
            var degree:int = 1;
            if (skillvo) {
                name = skillvo.name + " Lv" + skillLevel.toString();
                degree = skillvo.degree ? skillvo.degree : 5;
            }
            color = ColorUtil.getColorStr((HeroVO.COLOR[degree - 1]));
        } else if (arr[0] == "8") {
//            name = TreasureSystem.getAreaInfoName((arr[1]));
//            color = "#9154E5";
        } else if (arr[0] == "p") {
            name = arr[2];
            name = replaceHeroName(name);
            color = ColorUtil.getCountryColorStr((arr[1]));
        } else if (arr[0] == "f") {
            name = arr[2];
            name = replaceHeroName(name);
            color = ColorUtil.getColorStr(HeroVO.COLOR[(arr[1])]);
        } else if (arr[0] == "t") {
            name = arr[2];
            color = ColorUtil.getColorStr(ConfigLocator.getInstance().titleNameDic.get(arr[1]));
        } else if (arr[0] == "e") {

            name = arr[2];
            color = GoodsVO.TEXTCOLOR[(arr[1]) - 1];
        } else if (arr[0] == "l") {
            name = arr[2];
            color = GoodsVO.TEXTCOLOR[(arr[1]) - 1];
        } else if (arr[0] == "11") {
            //天劫消息
            var myId:int = (arr[1]);
            var myEventIndex:int = (arr[2]) - 1;
            var myXML:IDisaster_level = (ConfigLocator.getInstance().DISASTER_EVENT.get(myId));
            if (myXML && myEventIndex < 5) {
                name = myXML.name;
            }
            color = ColorUtil.TASKCOLOR[1];

        } else if (arr[0] == "12") {
//            var buildVO1:buildVO1 = MapUtil.getBuildBaseInfoVObyId((arr[1]));
            var buildVO1:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, parseInt(arr[1]));
//            if (UserData.instance.activityTempLocation == (arr[1])) {
//                name = UserData.instance.activityTempLoactionName;
//            } else {
                if (buildVO1)
                    var n:int = (Math.random() * (buildVO1.name.length));
                    name = buildVO1.name.substr(n, 1);
//                UserData.instance.activityTempLoactionName = name;
//                UserData.instance.activityTempLocation = (arr[1]);
//           }
           color = ColorUtil.TASKCOLOR[1];
        } else if (arr[0] == "13") {
//            name = FairylandProxy.getCityData(arr[1]) == null ? "" : FairylandProxy.getCityData(arr[1]).cityName;
        }
        else if (arr[0] == "v") {
//            var idStr:String = arr[1];
//            TianTiModel.inst.inviterId = new BigInteger(idStr);
        } else {
            name = "[" + arr[0] + "]";
        }

        if (arr[0] == "1" || arr[0] == "2" || arr[0] == "3" || arr[0] == "4" || arr[0] == "5") {
            if (setLink)
                hrefStr = "<a href=\"event:" + arr[1] + "\">" + name + "</a>";
            else
                hrefStr =  name;
        } else if (arr[0] == "p" || arr[0] == "f" || arr[0] == "e" || arr[0] == "t") {
            if (setLink)
                hrefStr = "<a href=\"event:" + arr[2] + "\">" + name + "</a>";
            else
                hrefStr = "<a>" + name + "</a>";
        } else if (arr[0] == "l") {
            hrefStr = "<a href=\"" + arr[3] + "\"" + " target=\"_blank\"" + ">" + name + "</a>";
        } else {
            hrefStr = "<a>" + name + "</a>";
        }
        tempStr = baseLineFirst + "<span style='color:"+color+  ";font-size:"+CSSStyleCfg.FontSize_1 + "px;font-family:" + CSSStyleCfg.defaultFontName + "'>" + hrefStr + "</span>" + baseLineLast;
        return tempStr;
    }
    public static function shiftColorTxtStr(str:String, color:int):String {
        currReplaceNum = 0;
        totalReplaceNum = 1;
        var result:Object = COLOR_REGEXP.exec(str);
        while (result != null) {
            result = COLOR_REGEXP.exec(str);
            totalReplaceNum++;
        }
        txtNormalColor = ColorUtil.CHAT_COLOR_1[color];
        if (str.substr(0, 1) != "[")
            str = "&" + txtNormalColor + "&" + str;
        var tmpStr:String = str.replace(COLOR_REGEXP, replaceColorStr);
        //todo

       // if (tmpStr.substr(tmpStr.length - 1, 1) == "&" && ("#" + tmpStr.substr(tmpStr.length - 7, 6)) >= 0)
        if (tmpStr.substr(tmpStr.length - 1, 1) == "&" && ("#" + tmpStr.substr(tmpStr.length - 7, 6)) )
            tmpStr = tmpStr.substr(0, tmpStr.length - 9);
        // 切掉后面多算的一个
        return tmpStr;
    }
    public static function replaceColorStr():String {
        // trace("-@-HtmlUtil.shiftColorTxtStr :",arguments[1])
        currReplaceNum++;
        var arr:Array;
        if (arguments[1].substr(0, 1) == "l")
            arr = arguments[1].split(">>");
        else
            arr = arguments[1].split(":");
        var tempStr:String = "";
        var name:String = "";
        var color:String = "";
        var npcVo:NpcBaseInfoVO;


        if (arr[0] == "1") {
            if (parseInt(arr[1]) < 0x1000) {
                var general:HeroVO = ConfigLocator.getInstance().gernalHeros.get(arr[1]);
                npcVo = ConfigLocator.getInstance().talkNpcs.get(arr[1]);
                if (general)
                    name = general.name;
                else if (npcVo)
                    name = npcVo.name;
                color = ColorUtil.getColorStr(general.nameColor);
                // color = ColorUtil.getColorStr(HeroVO.COLOR[HeroVO.COLOR.length-1])
            } else {
                npcVo = ConfigLocator.getInstance().talkNpcs.get(arr[1]);
                var monsterVo:MonsterVO = ConfigLocator.getInstance().monsters.get(arr[1]);
                if (monsterVo)
                    name = monsterVo.name;
                else if (npcVo)
                    name = npcVo.name;
                color = ColorUtil.TASKCOLOR[0];
            }
        } else if (arr[0] == "2") {
            var buildVO:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, parseInt(arr[1]));
            if (buildVO){
               // var n1:int = (Math.random() * (buildVO.name.length));
                name = buildVO.name;
            }
            color = ColorUtil.TASKCOLOR[1];
        } else if (arr[0] == "3") {
            name = LangArrayTxt.COUNTRYARR[parseInt(arr[1])];
            color = ColorUtil.getCountryColorStr(parseInt(arr[1]));
        } else if (arr[0] == "4") {
            var goodVo:GoodsVO = ConfigLocator.getInstance().goodsList.get(arr[1]);
            if (goodVo) {
                name = goodVo.name;
                color = GoodsVO.TEXTCOLOR[goodVo.color - 1];
            }
        } else if (arr[0] == "5") {
            var taskCfg:TaskCfg = ConfigLocator.getInstance().taskDic.get(arr[1]);
            if (taskCfg)
                name = taskCfg.name;
            color = "#ffffff";
        } else if (arr[0] == "7") {
            var skillData:int = parseInt(arr[1]);
            var skillID:int = Math.round(skillData / 10);
            var skillLevel:int = skillData % 10 + 1;
            var skillvo:SkillVO = ConfigLocator.getInstance().skillDatas.get(skillID);
            var degree:int = 1;
            if (skillvo) {
                name = skillvo.name + " Lv" + skillLevel.toString();
                degree = skillvo.degree ? skillvo.degree : 5;
            }
            color = ColorUtil.getColorStr(parseInt(HeroVO.COLOR[degree - 1]));
        } else if (arr[0] == "8") {
/*            name = TreasureSystem.getAreaInfoName(int(arr[1]));
            color = "#9154E5";*/
        }

        else if (arr[0] == "9") {
           // var upType:uint = parseInt(arr[1]);//0品阶 1根骨
           /// if (upType == 0) {
                //var pinjieID:uint = uint(arr[2]);
         /*       name = PetModel.getPetPinjieCfg(2, pinjieID);
                color = "#70FF4B";//品阶的颜色是固定的*/
           // }
           // else if (upType == 1) {
                //var genguID:uint = uint(arr[2]);
/*                name = PetModel.getPetGenguCfg(4, genguID);
                color = PetModel.getPetGenguCfg(6, genguID);*/
           // }
        }

        else if (arr[0] == "p") {
            name = arr[2];
            name = replaceHeroName(name);
            color = ColorUtil.getCountryColorStr(parseInt(arr[1]));
        } else if (arr[0] == "f") {
            name = arr[2];
            name = replaceHeroName(name);
            var v:int = parseInt(arr[1]);
            var hc:Array = HeroVO.COLOR;
            var c:int = hc[v];
            color = ColorUtil.getColorStr(c);
        } else if (arr[0] == "t") {
            var titleInfo:Array = ConfigLocator.getInstance().titleNameDic.get((arr[2]))//XMLLocator.getInstance().titleNameDic[int(arr[2])];
            name = titleInfo[0];
            color = ColorUtil.CHAT_COLOR[parseInt(titleInfo[1]) - 1];
        } else if (arr[0] == "e") {
            name = arr[2];
            color = GoodsVO.TEXTCOLOR[parseInt(arr[1]) - 1];
        } else if (arr[0] == "l") {
            name = arr[2];
            color = ColorUtil.CHAT_COLOR[parseInt(arr[1]) - 1];
            tempStr += "<<<" + name + ">>>" + color + ">>>" + arr[3] + "<<<";
            if (currReplaceNum != totalReplaceNum)
                tempStr += "&" + txtNormalColor + "&";
            return tempStr;
        } else if (arr[0] == "11") {
            //天劫消息
            var myId:int = parseInt(arr[1]);
            var myEventIndex:int = parseInt(arr[2]) - 1;
           /* var myXML:XML = XML(XMLLocator.getInstance().DISASTER_EVENT.level.(@id == myId));
            if (myXML && myEventIndex < 5) {
                name = myXML.event[myEventIndex].@name;
            }*/
            color = ColorUtil.TASKCOLOR[1];

        } else if (arr[0] == "12") {
            //var buildVO1:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(parseInt(arr[1]));
            var buildVO1:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, parseInt(arr[1]));
           // if (UserData.instance.activityTempLocation == int(arr[1])) {
               // name = UserData.instance.activityTempLoactionName;
           // } else {
                if (buildVO1)
                    var n:int = int(Math.random() * (buildVO1.name.length));
                name = buildVO1.name.substr(n, 1);
             //   UserData.instance.activityTempLoactionName = name;
                //UserData.instance.activityTempLocation = int(arr[1]);
          //  }
            color = ColorUtil.TASKCOLOR[1];
        } else if (arr[0] == "13") {
          //  name = FairylandProxy.getCityData(arr[1]) == null ? "" : FairylandProxy.getCityData(arr[1]).cityName;
            color = "#ff0000";
        }
        else if (arr[0] == "14") {
            name = arr[1];
            color = "#00ff00";
        }
        else if (arr[0] == "15") {
            name = arr[1];
//			color = "#00ff00";
            tempStr += "[" + name + "]";
            return tempStr;
        }
        else {
            name = arr[0];
            tempStr += "[" + name + "]";
            return tempStr;
        }
        tempStr += HtmlUtil.customColor("[" + name + "]", color);
        if (currReplaceNum != totalReplaceNum)
            tempStr += "&" + txtNormalColor + "&";
        return tempStr;
    }
    public static function  get mapService():MapService{
       return Facade.getInstance().retrieveProxy(MapService.NAME) as MapService;
    }
}
}