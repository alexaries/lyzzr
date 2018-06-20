/**
 * Created by huangcb on 2017/9/2.
 */
package com.game.module.task.command {

import com.game.common.mvc.BaseCommand;
import com.game.events.NotiEvent;
import com.game.module.task.events.TaskEvent;
import com.game.module.task.proxy.TaskCycProxy;
import com.game.module.task.proxy.TaskDialogProxy;
import com.game.module.task.proxy.TaskGuideProxy;
import com.game.module.task.proxy.TaskHookProxy;
import com.game.module.task.proxy.TaskService;
import com.game.module.task.proxy.TaskTrackProxy;

import net.events.MsgEvent;

import org.puremvc.as3.interfaces.ICommand;
import org.puremvc.as3.interfaces.INotification;

public class TaskStartupCommand extends BaseCommand implements ICommand {

    override public function execute(notification:INotification):void {
        trace("TaskStartupCommand");
        facade.registerProxy(new TaskService());
        facade.registerProxy(new TaskTrackProxy());
        facade.registerProxy(new TaskHookProxy());
        facade.registerProxy(new TaskCycProxy());
        facade.registerProxy(new TaskGuideProxy());
        facade.registerProxy(new TaskDialogProxy());

        facade.registerCommand(NotiEvent.TASK_SLG, TaskSGLCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_ACCEPT_LIST, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_CURR_LIST, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_GIVE_UP, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_DIALOG, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_DIALOG_RETURN, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_CYC_FRESH, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_HOOK, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_HOOK_ADD, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REQUEST_HOOK_STOP, TaskCommand);
        facade.registerCommand(NotiEvent.TASK_REFRESH_INIT, TaskListChangeCommand);

        facade.registerCommand(MsgEvent.GET_TASK_LIST, TaskMsgCommand);
        facade.registerCommand(MsgEvent.GET_USABLE_TASK, TaskMsgCommand);

        facade.registerCommand(MsgEvent.PLAYER_ABANDON_TASK, TaskMsgCommand);
        facade.registerCommand(MsgEvent.DIALOG_START, TaskMsgCommand);
        facade.registerCommand(MsgEvent.DIALOG_INTERACTION, TaskMsgCommand);

        facade.registerCommand(MsgEvent.UPDATE_TASK_PROCESS, TaskMsgCommand);
        facade.registerCommand(MsgEvent.NEW_TASK, TaskMsgCommand);

        facade.registerCommand(MsgEvent.TASK_CYC_FRESH, TaskMsgCommand);

        facade.registerCommand(MsgEvent.TASK_RESPONSE_HOOK, TaskMsgCommand);
        facade.registerCommand(NotiEvent.TASK_GUIDE_LINK, TaskGuideLinkCommand);

        facade.registerCommand(NotiEvent.TASK_GUIDE_LINK_DO, TaskListChangeCommand);
      //  facade.registerCommand(NotiEvent.INIT_TASK, TaskListChangeCommand);
        //doViewLstLimitActOpen
        facade.registerCommand(TaskEvent.DO_LIMIT_ACT_OPEN, TaskActivityCommand);
        facade.registerCommand(TaskEvent.DO_UNLIMIT_ACT_OPEN, TaskActivityCommand);
        facade.registerCommand(   NotiEvent.HOTEL_RESPONSE_PUB_LIST, TaskActivityCommand);
        facade.registerCommand(  NotiEvent.BOOKSTORE_RESPONSE_LIST, TaskActivityCommand);
        facade.registerCommand(NotiEvent.GUIDE_TAB_CHANGE, TaskShellCommand);
        facade.registerCommand(NotiEvent.TASK_GUIDE_NPC, TaskShellCommand);

        facade.registerCommand(NotiEvent.TASK_RESPONSE_DIALOG, TaskShellCommand);
        facade.registerCommand(NotiEvent.TASK_RESPONSE_DIALOG_RETURN, TaskShellCommand);
        facade.registerCommand(NotiEvent.TASK_GUIDE_DLG, TaskShellCommand);

    }
}
}
