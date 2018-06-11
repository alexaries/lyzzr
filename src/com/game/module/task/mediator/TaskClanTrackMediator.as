/**
 * Created by huangcb on 2018/3/17.
 */
package com.game.module.task.mediator {
import com.game.common.mvc.BaseMediator;
import com.game.events.NotiEvent;
import com.game.module.clan.event.ClanServiceEvent;
import com.game.module.clan.proxy.ClanService;
import com.game.module.clan.vo.ClanSelfVO;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.view.TaskClanTrackView;
import com.game.module.task.vo.TaskSGLKlass;
import com.game.module.task.vo.TaskSGLType;
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.game.module.user.proxy.UserProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;

public class TaskClanTrackMediator extends BaseMediator implements IMediator {
    public static const NAME:String = "TaskClanTrackMediator";
    function  get  taskService():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }

    public var service:ClanService;
    private var userProxy:UserProxy;
    private function get view() :TaskClanTrackView{
        return getViewComponent() as TaskClanTrackView;
    };
    public function TaskClanTrackMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        service = facade.retrieveProxy(ClanService.NAME) as ClanService;
        userProxy = facade.retrieveProxy(UserProxy.NAME) as UserProxy;
//        view.onCompleteSignal.getSignal(this).listen(completeClanTaskHander);
        view.onVisibleSignal.getSignal(this).listen(completeClanTaskHander);
        view.doViewTaGuideSignal.getSignal(this).listen(doViewTaGuideTfLinkClick);
        refresh();
    }
    private function doViewTaGuideTfLinkClick(evt_text:TaskTrackItemVo):void {

        var tasklist:Array = taskService.taskLists;
        if (tasklist.length == 0) {

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
    }
    private function completeClanTaskHander():void {
        if(view.visible == false)
            return;

        refresh();
    }

    override public function onRemove():void {
        super.onRemove();
    }

    override public function listNotificationInterests():Array {
        return [ NotiEvent.TASK_REFRESH_INIT,
            NotiEvent.TASK_REFRESH,
            NotiEvent.TASK_TRACK_SHOW,
            ClanServiceEvent.CLAN_UPDATE_RETURN];
    }
    private function refresh():void {

        if(view.visible == false)
            return;

        var taskList:Vector.<TaskVO> = taskService.tasks.filter(function(vo:TaskVO){
            return vo.type==TaskSGLType.CLAN;
        });

        var dataList:Array=[];

        for(var i:int=0;i<taskList.length;i++)
        {
            var gotoItemVO:TaskTrackItemVo = new TaskTrackItemVo();
            gotoItemVO.task = taskList[i];
            //这里 强刷任务 描述
            gotoItemVO.tipArray=TaskSGLKlass.getClanTaskTips(gotoItemVO.task);
            gotoItemVO.tips=gotoItemVO.tipArray[1];
            dataList.push(gotoItemVO);
        }

        view.setClanTaskList(dataList);

    }
    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case NotiEvent.TASK_REFRESH_INIT:
                refresh();
                break;
            case  NotiEvent.TASK_REFRESH:
                refresh();
                break
            case NotiEvent.TASK_TRACK_SHOW:
                refresh();
                break
            case ClanServiceEvent.CLAN_UPDATE_RETURN:
//                refresh();
                break
        }

    }
}
}