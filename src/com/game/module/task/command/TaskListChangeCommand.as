/**
 * Created by huangcb on 2017/9/8.
 */
package com.game.module.task.command {

import com.game.common.events.MenuWindowVO;
import com.game.common.view.Alert;
import com.game.events.NotiEvent;
import com.game.module.guide.proxy.GuideService;
import com.game.module.map.events.MapOperatorEvent;
import com.game.module.map.proxy.MapService;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.struct.TaskNpcStruct;
import com.game.module.task.utils.TaskUtils;
import com.game.module.task.vo.TaskState;
import com.game.module.task.vo.TaskType;
import com.game.module.task.vo.TaskVO;
import com.game.module.task.vo.item.TaskTrackItemVo;
import com.game.module.user.proxy.UserProxy;
import com.game.utils.ShellUtils;
import com.game.vo.MenuWinType;

import net.consts.StaticConfig;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;
import com.game.common.mvc.BaseCommand;

public class TaskListChangeCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();
        switch (name) {

            case NotiEvent.INIT_TASK:

                doTaskChange(body as TaskVO);
                doModelTaskCurListChangeCAMP_SELECT_VIEW();
                break;
            case NotiEvent.TASK_GUIDE_LINK_DO:

                doTaskTrackItemVo(body as TaskTrackItemVo);
                break;
            case NotiEvent.TASK_REFRESH_INIT:
                guide_refresh(body as TaskVO);
                break;
        }
    }

    public function guide_refresh(taskvo:TaskVO):void {
        if(taskvo.type==TaskType.MAIN){
            dispatch(new NotiEvent(NotiEvent.GUIDE_REFRESH,taskvo));
            //刷新手
        }else{
            userProxy.userData.isInAutoTaskGuide=false;
        }
    }
    private function get guideService():GuideService {
        return facade.retrieveProxy(GuideService.NAME) as GuideService;
        ;
    }

    private function doTaskChange(taskvo:TaskVO):void {

        //引导第一个不是任务 或npc对话的 断掉
        //todo
        if (StaticConfig.welcome) {
            dispatch(new NotiEvent(NotiEvent.GIFT_DIFF));
            return;
        }

        return;

        //直接 执行 新任务
        if (userProxy.userData.isInAutoTaskGuide) {
            dispatch(new MapOperatorEvent(MapOperatorEvent.STOP_AUTO_RUN));
            trace("停止自动任务",taskvo)
            return;
        }
        /**
         * 1:对话;2:杀怪;3:采集;4:护送;5:使用;6:收集;7:送信;8:探索;9:特殊;10:特殊;
         * 11 "穿戴装备"
         12 "分解装备"
         13 "强化装备"
         14 "穿戴技能"
         15 "升级技能"
         16 "穿戴法宝"
         17 "强化法宝"
         18 "招募散仙"
         */
        if (taskvo.state == TaskState.RESOLVED ){
            if (taskvo.cfg.klass == 2 || taskvo.cfg.klass == 3 || taskvo.cfg.klass == 6) {
                 // toAutoPopupNpc();
               // return;
            }
        }
        var itemVO:TaskTrackItemVo = new TaskTrackItemVo();
        itemVO.task = taskvo;

        doTaskTrackItemVo(itemVO);
    }

    public function doTaskTrackItemVo( itemVO:TaskTrackItemVo ):void {

        var taskvo:TaskVO=itemVO.task;
       // trace("doTaskTrackItemVo",taskvo);
        if (taskvo.state==TaskState.WAIT) {
            itemVO.tips = TaskUtils.toTaskTrackAccHtmlList(mapService.mapModel, taskvo.cfg, userProxy.userVO.level < 30);
        }
        if (taskvo.state==TaskState.PENDING||taskvo.state==TaskState.RESOLVED) {
            itemVO.tips = TaskUtils.toTaskTrackCurHtmlList(mapService.mapModel, taskvo, userProxy.userVO.level < 30);
        }
        if (TaskType.getType(taskvo.type)==TaskType.CYC&&taskvo.state == TaskState.WAIT) {
            itemVO.tips = TaskUtils.toTaskTrackCycHtmlList(mapService.mapModel, taskvo.cfg, userProxy.userVO.level < 30);
        }

        var patt:RegExp = new RegExp("<font link='(.*?)'", "g");
        if (patt.test(itemVO.tips)) {
            var str:String = itemVO.tips.match(patt)[0];
            var evt_text:String = str.replace("<font link='", "").replace("'", "");
            trace("###############@自动引导", evt_text)
            dispatch(new NotiEvent(NotiEvent.TASK_GUIDE_LINK, [evt_text, itemVO.task.cfg.type==1]));
            return;
        }

        if(taskvo.taskId==201||taskvo.taskId==202){
           // var vo:MenuWindowVO = new MenuWindowVO(MenuWinType.HOTEL_INFO, MenuWindowVO.OPEN, new Object());
           // dispatch(new MenuEvent(MenuEvent.MENU_CLIK, vo));
        }
    }

    function  get  mapService():MapService {
        return facade.retrieveProxy(MapService.NAME) as MapService;
    }

    function  get   userProxy():UserProxy {
        return facade.retrieveProxy(UserProxy.NAME) as UserProxy;
    }



    function  get  service():TaskService {
        return facade.retrieveProxy(TaskService.NAME) as TaskService;
    }


    private function doModelTaskCycListChange():void {
        userProxy.userData.curMapBuildsIcon = toMapIcons(mapBuilds);
        dispatch(new NotiEvent(NotiEvent.MODEL_MAP_ICONS_CHANGE));
        return;
    }


    public function toMapIcons(builds:Array):Array {
        var icons:Array;
        var buildId:uint;
        icons = [];
        for each (buildId in builds) {
            icons.push({id: buildId, icon: toBuildsIcon(buildId)});
        }
        return icons;
    }

    public function get taskLists():Vector.<TaskVO> {
        var arr:Vector.<TaskVO> = service.tasks.filter(function(vo:TaskVO){
            return vo.state==TaskState.PENDING||vo.state==TaskState.RESOLVED;
        });
        return arr;
    }

    public function toBuildsIcon(buildId:uint):uint {
        //todo
        var npcs:Array;
        var npc:TaskNpcStruct;
        var icons:Array = [];
        var icon:uint;
        npcs = ShellUtils.npcsInBuild(mapService.mapModel, buildId);
        var tasks:Vector.<TaskVO> = taskLists;
        for each (npc in npcs) {
         // var tmp_icons:Array = TaskUtils.toNpcIcon(tasks, userProxy.userData.accTaskList, userProxy.userData.cycTaskList, userProxy.userData.cycTask4, userProxy.userData.cycTask5, npc.id);
           // icons = icons.concat(tmp_icons);
        }
        icon = 0;
        for (var i:uint = 1; i < 8; i++) {
            if (icons.indexOf(i) > -1) {
                icon = i;
                break;
            }
        }
        return icon;
    }



    public function get mapBuilds():Array {
        var builds:Array;
        var arr:Array;
        var obj:Object;
        builds = [];
        arr = mapService.mapModel.mapNpcBaseInfoVOList;
        for each (obj in arr) {
            builds.push(obj["locID"]);
        }
        return builds;
    }
    private function doModelTaskCurListChangeCAMP_SELECT_VIEW( ) : void {

        if (service.guideTaskId ==57 &&service.getTaskById(57).state==TaskState.RESOLVED && userProxy.userVO.country == 2) {
        }
        return;
    }


    private function toAutoPopupNpc():void {
        if (service.getMainTaskVO() != null)return;
        var icon:uint = toBuildsIcon(userProxy.userData.buildId);
        doModelTaskCycListChange()
        if (icon > 0 && icon != 7) {
            if (TaskUtils.getNpcIdList(mapService.mapModel, userProxy.userData.buildId).length > 0) {
                dispatch(new NotiEvent(NotiEvent.POPUP_DLG, [MenuWinType.TASK_NPC_VIEW, 1]));
            }

        }

        return;
    }
}
}
