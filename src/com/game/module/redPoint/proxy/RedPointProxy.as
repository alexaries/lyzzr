/**
 * Created by wangq on 2017/12/26.
 */
package com.game.module.redPoint.proxy {
import com.game.common.mvc.BaseProxy;
import com.game.events.NotiEvent;
import com.game.module.redPoint.view.RedPoint;
import com.game.module.redPoint.vo.RedPointStruct;

import globals.ConfigLocator;

import laya.display.Node;

import laya.ui.Box;
import laya.ui.Component;
import laya.utils.Dictionary;

import laya.utils.Pool;

import net.proxy.SocketConnectionProxy;
import net.utils.BytesUtil;

import org.puremvc.as3.interfaces.IProxy;

import utils.ByteArray;

public class RedPointProxy  extends BaseProxy implements IProxy {
    public static const NAME:String = "RedPointProxy";
    public var connection:SocketConnectionProxy;


    /**主按钮红点 数据   key:红点id, value:是否显示*/
    public var redpointDic:Dictionary;

    public function RedPointProxy() {
        redpointDic = new Dictionary();
        super(NAME);
        connection = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;

    }


    /**接受红点协议  type:id,  flag:是否显示红点*/
    public function getRedPointInfo(byte:ByteArray):void {
        byte.position = 0;
        if (byte.bytesAvailable == 0)
            return;
        var cmd:uint = BytesUtil.readByte1(byte);
        if (cmd != 0x36)
            return;

        var type:uint = BytesUtil.readByte4(byte);  //红点id
        var flag:uint = BytesUtil.readByte1(byte);   //是否红点

        redpointDic.set(type,flag);
        var PType:uint = Math.floor(type/10)*10;  //主按钮

        var redS:RedPointStruct = ConfigLocator.getInstance().redPointDic.get(PType) as RedPointStruct;
        var icon_name:String = redS.btnName;  //转换成名字
        trace("---------------redpoint --server---------icon_name-------"+ icon_name +"---------type:"+type+"-----flag:" + flag);
        Laya.timer.once(5000,this,function(){dispatch(new NotiEvent(NotiEvent.INFO_REDPOINT,[icon_name,flag,type]));});   //右边按钮没刷新 暂时延时处理
//        dispatch(new NotiEvent(NotiEvent.INFO_REDPOINT,[icon_name,flag,type]));
    }

    /**id:红点主icon id （redpoint.csv  表），flag：是否显示红点*/
    public function getRedPointInfoByClient(arr:Array):void
    {
        var type:uint = arr[0];
        var flag:uint = arr[1];

        var redS:RedPointStruct = ConfigLocator.getInstance().redPointDic.get(type) as RedPointStruct;
        var icon_name:String = redS.btnName;  //转换成名字
        trace("----------------redpoint --client--------icon_name-------"+ icon_name +"---------type:"+type +"-----flag:" + flag);
        dispatch(new NotiEvent(NotiEvent.INFO_REDPOINT,[icon_name,flag]));
    }



    /**是否显示红点   redCon:要加红点的显示对象 ，needShow：是否显示红点 ，  posX posY：手动指定红点位置*/
    public function redPointNotice(redCon:Component,needShow:Boolean = true,posX:int=-1,posY:int=-1):void
    {
        if(redCon == null)return;
        if(needShow)  //显示红点
        {
            if(redCon.getChildByName("RedPoint") != null)
                return ;
            else
            {
                var point:RedPoint = Pool.getItemByClass("RedPoint", RedPoint);
                point.name = "RedPoint";

                if(posX == -1)
                    point.x = redCon.width - point.width;
                else
                    point.x = posX;
//                if(redCon.name == "zhujiemian_richang" || redCon.name == "zhujiemian_sanxian" || redCon.name == "zhujiemian_renwu")//这2个按钮特殊处理
//                    point.x += 20;

                if(posY == -1)
                    point.y =  0;
                else
                    point.y = posY;
                redCon.addChild(point);
            }
        }else  //不显示红点
        {
            if(redCon.getChildByName("RedPoint") != null)
            {
                Pool.recover("RedPoint", redCon.removeChildByName("RedPoint"));
            }
        }

    }





    /**延时处理 */
    public static function delaySchedule(delay:int, caller:*, method:Function, args:Array = null, coverBefore:Boolean = true):void
    {
        Laya.timer.once(delay, caller, method, args, coverBefore);
    }



}
}
