/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.mediator {
import com.game.common.events.MenuWindowVO;
import com.game.common.mvc.BaseMediator;
import com.game.events.NotiEvent;
import com.game.module.daily.proxy.DailyService;
import com.game.module.daily.vo.DailyVo;
import com.game.module.map.proxy.MapService;
import com.game.module.menu.events.MenuEvent;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.proxy.TaskTrackProxy;
import com.game.module.task.utils.TaskUtils;
import com.game.module.task.view.TaskTrackView;
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskTrackVo;
import com.game.module.task.vo.TaskType;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.vo.MenuWinType;
import com.game.vo.UserData;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class TaskTrackMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskTrackView";

    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    //todo
    private function get view():TaskTrackView {
        return getViewComponent() as TaskTrackView;
    }

    private function get dailyVo():DailyVo {
        var __vo:DailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        return __vo.vo;
    }

    private function get vo():TaskTrackVo {

        return taskTrackProxy.taskTrackVo;
    }

    private function get taskTrackProxy():TaskTrackProxy {
        var __vo:TaskTrackProxy = facade.retrieveProxy(TaskTrackProxy.NAME) as TaskTrackProxy;
        return __vo;
    }

    private function get userData():UserData {
        return userProxy.userData;
    }

    private function get userProxy():UserProxy {
        var userProxy:UserProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
        return userProxy;
    }

    private function get mapService():MapService {
        var userProxy:MapService = facade.retrieveProxy(MapService.NAME) as MapService;
        return userProxy;
    }

    public function TaskTrackMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        view.vo = vo;
        view.doViewTaGuideSignal.getSignal(this).listen(doViewTaGuideTfLinkClick);

        taskService.trackAutoTask();
    }
    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [
            NotiEvent.TASK_REFRESH,
            NotiEvent.TASK_REFRESH_INIT,
            NotiEvent.TASK_TRACK_SHOW
        ];
    }

    private function doViewTaGuideTfLinkClick(evt_text:TaskTrackItemVo):void {

        var tasklist:Array = taskService.taskLists;
        if (tasklist.length == 0) {
            var vo:MenuWindowVO = new MenuWindowVO(MenuWinType.ACTIVE, MenuWindowVO.OPEN, new Object());
            dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));

            return;
        }
        if (evt_text && evt_text.task) {
            taskService.gotoTaskId = evt_text.task.taskId;
            dispatch(new NotiEvent(NotiEvent.TASK_GUIDE_LINK_DO, evt_text));
        }else{
            taskService.trackAutoTask();
        }


        return;
    }




    override public function handleNotification(notification:INotification):void {

        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {
            case   NotiEvent.TASK_REFRESH_INIT:
                onTaskResponse(body as TaskVO);
                break;
            case   NotiEvent.TASK_REFRESH:
                refreshList(body as TaskTrackItemVo);
                break;
            case   NotiEvent.TASK_TRACK_SHOW:
                refreshTrackShow(body as TaskTrackItemVo);
                break;
        }
    }

    private function refreshTrackShow(taskTrackItemVo:TaskTrackItemVo):void {
        updateTask(taskTrackItemVo);
        refreshList(taskTrackItemVo);
        showTips(taskTrackItemVo);
    }

    public function updateTask(itemVO:TaskTrackItemVo):void {
        var taskvo:TaskVO = itemVO.task;
        if (taskvo.state == TaskState.WAIT) {
            itemVO.tipArray = TaskUtils.toTaskTrackAccHtmlListArray(mapService.mapModel, taskvo.cfg, userProxy.userVO.level < 30);
        }
        if (taskvo.state == TaskState.PENDING || taskvo.state == TaskState.RESOLVED) {
            itemVO.tipArray = TaskUtils.toTaskTrackCurHtmlListArray(mapService.mapModel, taskvo, userProxy.userVO.level < 30);
        }
        if (TaskType.getType(taskvo.type) == TaskType.CYC && taskvo.state == TaskState.WAIT) {
            itemVO.tipArray = TaskUtils.toTaskTrackCycHtmlListArray(mapService.mapModel, taskvo.cfg, userProxy.userVO.level < 30);
        }

        if (taskvo.state == TaskState.WAIT) {
            itemVO.tips = TaskUtils.toTaskTrackAccHtmlList(mapService.mapModel, taskvo.cfg, userProxy.userVO.level < 30);
        }
        if (taskvo.state == TaskState.PENDING || taskvo.state == TaskState.RESOLVED) {
            itemVO.tips = TaskUtils.toTaskTrackCurHtmlList(mapService.mapModel, taskvo, userProxy.userVO.level < 30);
        }
        if (TaskType.getType(taskvo.type) == TaskType.CYC && taskvo.state == TaskState.WAIT) {
            itemVO.tips = TaskUtils.toTaskTrackCycHtmlList(mapService.mapModel, taskvo.cfg, userProxy.userVO.level < 30);
        }


    }

    private function onTaskResponse(gotoTaskVO:TaskVO):void {
        //当前任务
        var gotoItemVO:TaskTrackItemVo = new TaskTrackItemVo();
        gotoItemVO.task = gotoTaskVO;
        refreshTrackShow(gotoItemVO);

    }

    public function showTips(tipsVO:TaskTrackItemVo ):void {
            if (tipsVO.task && tipsVO.task.cfg && tipsVO.task.cfg.describe && tipsVO.task.cfg.describe != "") {
                dispatch(new NotiEvent(NotiEvent.TASK_TIP_SHOW, tipsVO.task.cfg.describe))
            }
            else {
                dispatch(new NotiEvent(NotiEvent.TASK_TIP_HIDE))
            }
    }

    public function refreshList(taskTrackItemVo:TaskTrackItemVo):void {

        view.refresh(taskTrackItemVo);
    }
}
}