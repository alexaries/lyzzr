/**
 * Created by huangcb on 2018/3/14.
 */
package com.game.module.task.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.events.NotiEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.menu.events.MenuEvent;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.proxy.TaskTrackProxy;
import com.game.module.task.view.TaskSLGTrackView;
import com.game.module.task.vo.TaskSGLKlass;
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskTrackVo;
import com.game.module.task.vo.TaskType;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.game.vo.MenuWinType;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class TaskSLGTrackMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskSLGTrackMediator";
    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }
    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }
    private function get taskTrackProxy():TaskTrackProxy {
        var __vo:TaskTrackProxy = facade.retrieveProxy(TaskTrackProxy.NAME) as TaskTrackProxy;
        return __vo;
    }
    private function get vo():TaskTrackVo {

        return taskTrackProxy.taskTrackVo;
    }
    private function get view() :TaskSLGTrackView{
        return getViewComponent() as TaskSLGTrackView;
    };
    public function TaskSLGTrackMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.onCompleteSignal.getSignal(this).listen(instanceCompleteHander);
        view.vo = vo;
        view.doViewTaGuideSignal.getSignal(this).listen(doViewTaGuideTfLinkClick);

        taskService.trackAutoTask();
    }

    private function doViewTaGuideTfLinkClick(evt_text:TaskTrackItemVo):void {

        var tasklist:TaskVO = taskService.getMainTaskVO();
        if (tasklist ==null) {
            var vo:MenuWindowVO = new MenuWindowVO(MenuWinType.ACTIVE, MenuWindowVO.OPEN, new Object());
            dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));

            return;
        }
        if (evt_text && evt_text.task) {
            if(evt_text.task.state==TaskState.RESOLVED){
                dispatch(new NotiEvent(NotiEvent.TASK_REQUEST_GIVE_UP, [evt_text.task.taskId,1, 0, 0]));
                return;
            }
            taskService.gotoTaskId = evt_text.task.taskId;


            //这里任务直接 处理了~~
          dispatch(new NotiEvent(NotiEvent.TASK_SLG, evt_text));
        }else{
            taskService.trackAutoTask();
        }


        return;
    }

    private function instanceCompleteHander():void {
        //view.buySignal.getSignal(this).listen(doBuy);
        //packProxy = facade.retrieveProxy(PackProxy.NAME) as PackProxy;
        //view.setHasNum(packProxy);
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [ NotiEvent.TASK_REFRESH_INIT,NotiEvent.TASK_REFRESH,NotiEvent.TASK_TRACK_SHOW];
    }

    private function onTaskResponse(gotoTaskVO:TaskVO):void {
        //当前任务
        var gotoItemVO:TaskTrackItemVo = new TaskTrackItemVo();

        gotoItemVO.task = gotoTaskVO;
        //这里 强刷任务 描述

        gotoItemVO.tipArray=TaskSGLKlass.getTips(gotoItemVO.task);
        gotoItemVO.tips=gotoItemVO.tipArray[1];
        refreshTrackShow(gotoItemVO);

        //直接 执行 新任务
        if(gotoTaskVO.type==TaskType.MAIN){
            dispatch(new NotiEvent(NotiEvent.GUIDE_REFRESH,gotoTaskVO));
            //刷新手
        }

    }

    private function refreshTrackShow(taskTrackItemVo:TaskTrackItemVo):void {



        view.refresh(taskTrackItemVo);
    }
    override public function handleNotification(notification:INotification):void {

        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case   NotiEvent.TASK_REFRESH_INIT:
                    //主要的任务刷新点
                onTaskResponse(body as TaskVO);
                break;
            case   NotiEvent.TASK_REFRESH:
                refreshTrackShow(body as TaskTrackItemVo);
                break;
            case   NotiEvent.TASK_TRACK_SHOW:
               // refreshTrackShow(body as TaskTrackItemVo);
                break;
        }
    }
}
}