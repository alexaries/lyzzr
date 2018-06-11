/**
 * Created by huangcb on 2017/8/17.
 */
package com.preset.createRole.mediator {
import com.preset.createRole.view.CreateRoleView;
import com.preset.createRole.vo.RandomName;
import com.preset.events.DataEvent;
import com.preset.login.view.LoginView;
import com.talkingdata.TDItem;
import com.talkingdata.TDManager;

import net.consts.StaticConfig;
import net.data.sendCmd.CreateRoleCmd;
import net.proxy.SocketConnectionProxy;

import org.puremvc.as3.interfaces.IMediator;
import org.puremvc.as3.interfaces.INotification;
import org.puremvc.as3.patterns.mediator.Mediator;

public class CreateRoleMediator extends Mediator implements IMediator {
    public static const NAME:String = "CreateRoleMediator";

    var __createRoleView:CreateRoleView;

    var socketConnectionProxy:SocketConnectionProxy;
    private var _index:int;
    private var _name:String;

    public function CreateRoleMediator(__viewComponent:Object = null) {
        super(NAME, __viewComponent);
    }

    override public function onRegister():void {
        super.onRegister();
        StaticConfig.welcome=true;
        socketConnectionProxy = facade.retrieveProxy(SocketConnectionProxy.NAME) as SocketConnectionProxy;
        __createRoleView = getViewComponent() as CreateRoleView;
        __createRoleView.createClick.getSignal(this).listen(onClickCreateBtn);
//        __createRoleView.backClick.getSignal(this).listen(onClickBackBtn);
    }

    private function onClickCreateBtn(inputName, index):void {
        this._name = inputName;
        this._index = index;

        sendNewRoleCmd(inputName, index);
        //__createRoleView.dispose();
        //new GameMain();
    }

//    private function onClickBackBtn():void {
//        sendNotification(DataEvent.BACK_LOGIN);

//    }

    override public function handleNotification(notification:INotification):void {
        var name:String = notification.getName();
        var body:Object = notification.getBody();

        switch (name) {
            case DataEvent.CREATE_SUCCESS:
                //创角成功
                addCareerEvent();
                addNameEvent();
                addAccountType();

                //开始登入
                sendNotification(DataEvent.LOGIN_SUCCESS);
                break;
            case DataEvent.CREATE_DUP:
                ////角色名重复			消息说明    重新输入角色
                randomNameAndMessage();
                break;
            case DataEvent.CREATE_ILLEGAL:
                //角色名字非法
                illegalName();
                break;
        }
    }

    private function addCareerEvent():void {
        var arr:Array = [
            TDItem.zhiyexuanze_nanru,
            TDItem.zhiyexuanze_nvru,
            TDItem.zhiyexuanze_nanshi,
            TDItem.zhiyexuanze_nvshi,
            TDItem.zhiyexuanze_nandao,
            TDItem.zhiyexuanze_nvdao
        ];
        TDManager.addEvent(arr[_index], null, "创角");
    }

    private function addNameEvent():void {
        var parm:int = _index % 2 == 0 ? 1 : 0;
        var event:String = RandomName.isIn(_name, parm) ? TDItem.suijimingzi : TDItem.shurumingzi;
        TDManager.addEvent(event, null, "创角");
    }

    private function addAccountType():void {
        //无法获取到accountName
        TDManager.setAccountName("");
    }

    private function randomNameAndMessage():void {
        __createRoleView.charaterExist();
    }

    private function illegalName():void {
        __createRoleView.illegalName();

    }

    override public function listNotificationInterests():Array {
        return [DataEvent.CREATE_SUCCESS,
            DataEvent.CREATE_DUP,
            DataEvent.CREATE_ILLEGAL];
    }

    /**
     * 创建新角色发送命令
     * */
    public function sendNewRoleCmd(name:String = "kenny", type:int = 0, countryID:int = 1):void {

        var cmd:CreateRoleCmd = new CreateRoleCmd();

        cmd.characterName = name;
        cmd.characterType = type;
        if (StaticConfig.wallow == "0")
            cmd.countryId = countryID | 0x80;
        else
            cmd.countryId = countryID;

        StaticConfig.createRoleName = name;
        StaticConfig.createRoleType = type;
        socketConnectionProxy.send(cmd);

    }
}
}
