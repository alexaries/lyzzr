/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.mediator {
import com.game.events.NotiEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.map.util.MapUtil;
import com.game.module.map.vo.BuildBaseInfoVO;
import com.game.module.map.vo.MapModel;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.struct.TaskNpcStruct;
import com.game.module.task.utils.TaskUtils;
import com.game.module.task.view.TaskNpcView;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskNpcItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

import com.game.utils.ShellUtils;

public class TaskNpcMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskNpcMediator";


    private function get view():TaskNpcView {
        return getViewComponent() as TaskNpcView;
    }

    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }

    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    public function TaskNpcMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.closeFuncEnable = true;

        refresh();
        view.doTileListOpenSignal.getSignal(this).listen(doTileListOpen);
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            NotiEvent.MODEL_BUILD_CHANGE];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();


        switch (name) {


            case   NotiEvent.MODEL_BUILD_CHANGE:
                doModelBuildChange();
                break;
        }
    }

    private function doTileListOpen(vo:TaskNpcItemVo):void {
        var npc:TaskNpcStruct = ShellUtils.npcInBuildById(mapService.mapModel, vo.npc.id);


        dispatch(new NotiEvent(NotiEvent.TASK_GUIDE_NPC, [npc.id]));
        return;
    }

    private function doModelBuildChange():void {
        if (TaskUtils.getNpcs(mapService.mapModel, userProxy.userData.buildId).length == 0)
            dispatch(new NotiEvent(NotiEvent.POPUP_DLG, [MenuWinType.TASK_NPC_VIEW, 0]));
    }



    private function refresh():void {
        if(userProxy.userData.buildId==-1) return;
        var npcs:Array = [];
        var tmp:Array = TaskUtils.getNpcs(mapService.mapModel, userProxy.userData.buildId);
        for (var i:int = 0; i < tmp.length; i++) {
            var object:TaskNpcStruct = tmp[i];
            var item_vo:TaskNpcItemVo = new TaskNpcItemVo();
            item_vo.npc = object;
            item_vo.icons = getIcons(item_vo.npc)
            npcs.push(item_vo);
        }
        var buildinfo:BuildBaseInfoVO = MapUtil.getBuildBaseInfoVObyId(mapService.mapModel, userProxy.userData.buildId);
        if(buildinfo!=null){
            view.setBuildInfo(buildinfo);
        }

        view.tlNpcSetDataProvider = npcs;
        view.refresh();

    }

    public function getIcons(npc:TaskNpcStruct):Array {
        var arr:Array;
        arr = [];
        if (npc) {
            //todo
          //  var tasks:Vector.<TaskVO> = new Vector.<TaskVO>();
         //   for (var i:int = 0; i < userProxy.userData.accTaskList.length; i++) {
         //       var id:int = userProxy.userData.accTaskList[i];
         //       tasks.push(taskService.getTaskById(id));
          //  }
        //    arr = TaskUtils.toNpcIcon(tasks, userProxy.userData.accTaskList, userProxy.userData.cycTaskList,  cycTask4,  cycTask5, npc.id);
        }
        return arr;
    }
}
}