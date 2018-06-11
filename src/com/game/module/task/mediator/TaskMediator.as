/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.mediator {
import com.game.events.NotiEvent;
import com.game.module.daily.proxy.DailyService;
import com.game.module.daily.vo.DailyVo;
import com.game.module.map.proxy.MapService;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.proxy.TaskTrackProxy;
import com.game.module.task.utils.TaskUtils;
import com.game.module.task.view.TaskView;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskTrackItemVo;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseMediator;

import com.game.utils.ShellUtils;
import utils.StringUtil;

public class TaskMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskMediator";

    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }
    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    function get taskTrackProxy():TaskTrackProxy {
        var __vo:TaskTrackProxy = facade.retrieveProxy(TaskTrackProxy.NAME) as TaskTrackProxy;
        return __vo;
    }


    private function get dailyVo():DailyVo {
        var __vo:DailyService = facade.retrieveProxy(DailyService.NAME) as DailyService;
        return __vo.vo;
    }


    private function get view():TaskView {
        return getViewComponent() as TaskView;
    };
    public function TaskMediator(viewComponent:Object = null) {
        super(NAME, viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        return;
        view.doTaskListOpenSignal.getSignal(this).listen(doTaskListOpen);
        view.gotoTaskSignal.getSignal(this).listen(gotoTask);
        view.showFrameMsgSignal.getSignal(this).listen(showFrameMsgHandler);
        refresh();
    }

    private function showFrameMsgHandler(msg:String = ""):void {
        dispatch(new NotiEvent(NotiEvent.SHOW_FRAME_MSG,msg));
    }

    private function gotoTask(vo:TaskVO):void {
        var evt_text:TaskTrackItemVo=new TaskTrackItemVo();
        evt_text.task=vo;
        taskService.gotoTaskId=vo.taskId;
        taskService.trackAutoTask();
        dispatch(new NotiEvent(NotiEvent.TASK_GUIDE_LINK_DO, evt_text));
        dispatch(new NotiEvent(NotiEvent.TASK_TRACK_SHOW, evt_text));

    }


    private function doTaskListOpen(vo:TaskVO):void {
        view.showTaskVO(vo, toFlow(vo));
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [];
        return [NotiEvent.TASK_RESPONSE_GIVE_UP,
            NotiEvent.TASK_RESPONSE_CYC_FRESH,
            NotiEvent.MODEL_IS_TRACK];
    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case  NotiEvent.TASK_RESPONSE_GIVE_UP:
                doTaskResponseGiveUp(body as int);

                break;
            case   NotiEvent.TASK_RESPONSE_CYC_FRESH:
                doTaskResponseCycFresh();
                break;


            case   NotiEvent.MODEL_IS_TRACK:
                doModelIsTrack();
                break;
        }
    }

    private function doModelIsTrack():void {
        refresh();
        return;
    }

    private function refresh():void {
        view.taskLists = taskService.taskLists;
        view.refresh();

    }

    private function doTaskResponseCycFresh():void {

        return;
    }

    private function doTaskResponseGiveUp(action:int):void {


        refresh();
    }


    private function toFlow(taskVo:TaskVO):Array {
        var args:Array = [];
        args[0] = StringUtil.substitute(TaskUtils.TEMP_HTML_CMD, [0,
            [taskVo.cfg.npcPublish.buildId, taskVo.taskId, taskVo.cfg.npcPublishID].join(","),
            StringUtil.substitute(TaskUtils.TEMP_TASK_TRACK_PATH_01,
                    [ShellUtils.cityById(mapService.mapModel, taskVo.cfg.npcPublish.buildId).colorName,
                        ShellUtils.buildById(mapService.mapModel, taskVo.cfg.npcPublish.buildId).colorName,
                        taskVo.cfg.npcPublish.colorName]
            )
        ]);

        args[1] = StringUtil.substitute(TaskUtils.TEMP_HTML_CMD, [0,
            [taskVo.cfg.npcFinish.buildId, taskVo.taskId, taskVo.cfg.npcFinishID].join(","),
            StringUtil.substitute(TaskUtils.TEMP_TASK_TRACK_PATH_01,
                    [ShellUtils.cityById(mapService.mapModel, taskVo.cfg.npcFinish.buildId).colorName,
                        ShellUtils.buildById(mapService.mapModel, taskVo.cfg.npcFinish.buildId).colorName,
                        taskVo.cfg.npcFinish.colorName
                    ])
        ]);
        args[2] = TaskUtils.toTaskFlow(taskVo).join("<br/>");
        return args;
    }

}
}