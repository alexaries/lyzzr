package net.proxy {
import laya.events.Event;
import laya.net.Socket;

import net.consts.StaticConfig;
import net.core.SocketBuff;
import net.data.BaseCmd;
import net.data.sendCmd.LoginCmd;
import net.data.sendCmd.ReConnectionCmd;
import net.events.ConnectionNotification;
import net.events.MsgEvent;
import net.events.SocketNotification;

import org.puremvc.as3.interfaces.IProxy;
import org.puremvc.as3.patterns.proxy.Proxy;

import utils.ByteArray;

public class SocketConnectionProxy extends Proxy implements IProxy {
    /**
     * 存放socket数据的buffer,判断数据是否为完整的包,或者可能为多个完整的包拼在一起的
     */
    var socketBuff:SocketBuff = new SocketBuff();
    var _socket:Socket;
    var autoLogin:Boolean = true;
    public var isReConnect:Boolean = false;
    public var kickOff:Boolean = false;//被踢掉

    public var canBeClose:Boolean = true;
    public var server:String = "";
    public var port:int = 0;
    public static var NAME:String = "SocketConnectionProxy";
    public var serverTimeDelay:Number;
    public var startKeepAlive:Number = 0;

    public function SocketConnectionProxy() {
        super(NAME);
    }

    public function reconnect():void {
        if (!socket || socket.connected)
            return;
        if(StaticConfig.PROTOCOL == "https://"){
            socket.connect(this.server,this.port+200,true);
        }else{
            socket.connect(this.server, this.port);
        }
    }

    public function setAutoLogin(autoLogin:Boolean = true) {
        this.autoLogin = autoLogin;
    }

    public function connect(server:String, port:int):Boolean {
        trace("--@--SocketConnectionProxy.connect .... ", server, port);
        setServerInfo(server, port);
        if (socket.connected)
            return false;
        if(StaticConfig.PROTOCOL == "https://"){
            socket.connect(this.server,this.port+200,true);
        }else{
            socket.connect(this.server, this.port);
        }
        return true;
    }

    public function get socket():Socket {
        return _socket;
    }

    public function set socket(value:Socket):void {
        _socket = value;
    }


    public function addListener():void {

        socket.on(Event.OPEN, this, onSocketOpen);
        socket.on(Event.CLOSE, this, onSocketClose);
        socket.on(Event.MESSAGE, this, onMessageReveived);
        socket.on(Event.ERROR, this, onConnectError);
    }

    public function removeAddListener():void {
        socket.off(Event.OPEN, this, onSocketOpen);
        socket.off(Event.CLOSE, this, onSocketClose);
        socket.off(Event.MESSAGE, this, onMessageReveived);
        socket.off(Event.ERROR, this, onConnectError);

    }

    override public function onRegister():void {
        if (!socket) {
            socket = new Socket();
            socket.timeout = 40000;
        }
        addListener();
    }

    override public function onRemove():void {
        super.onRemove();
        removeAddListener();
    }

    public function onSocketClose():void {
        trace('--@--SocketConnectionProxy.closeHandler() .... ', server, port);
        this.sendNotification(SocketNotification.CONNECTION, '--@--SocketConnectionProxy.closeHandler() .... ', ConnectionNotification.CONNECTION_ERROR);
    }

    private function onConnectError():void {
        trace("--@--SocketConnectionProxy.ioErrorHandler() .... ");
        this.sendNotification(SocketNotification.CONNECTION, "--@--SocketConnectionProxy.ioErrorHandler() .... ", ConnectionNotification.IO_ERROR);
    }


    private function onSocketOpen():void {
        trace("--@--SocketConnectionProxy.connectHandler() .... ", server, port);
        if (isReConnect) {
            re_connection();
        } else if (autoLogin) {
            startMsg();
        }
        canBeClose = false;

        this.sendNotification(SocketNotification.CONNECTION, "--@--SocketConnectionProxy.connectHandler() .... ", ConnectionNotification.CONNECTTED);
    }

    private function onMessageReveived(message):void {


        if (typeof message == "string") {
            trace(message);
        }
        else if (message instanceof ArrayBuffer) {
            //  trace(message);
            socketBuff.addSocketData(message);
        }
        socket.input.clear();

        var packList:Array = socketBuff.getPackList();
        for (var i:int = 0; i < packList.length; i++) {
            var msg:Array = packList[i];
            msgHandler(msg[0], msg[1], msg[2]);
        }


    }

    public function msgHandler(ctrlBit:uint, msgType:int, bytes:ByteArray):void {
        var msgEvent:MsgEvent = new MsgEvent(SocketNotification.MSG, bytes, msgType.toString(16));
        //todo 暂不压缩
        /*
         if (ctrlBit == 0xFE) {
         var packLen:uint = bytes.readUnsignedShort();
         var tempBytes:ByteArray = BytesUtil.creatByteArray();
         bytes.readBytes(tempBytes);
         tempBytes.position = 0;
         tempBytes.uncompress();
         msgEvent.msgData = tempBytes;
         }
         else*/
        //
        //
      //  trace("@包头 " + msgType.toString(16));

        facade.notifyObservers(msgEvent);
    }

    public function send(cmd:BaseCmd):void {
        if (!isSocketConnnected()) {
            trace("Socket connection error");
            this.sendNotification(ConnectionNotification.CONNECTION_ERROR);
            return;
        }

        if (StaticConfig.isReconnect) return;
        var bytes:ByteArray = cmd.msgToByteArray();

        this.socket.send(bytes.getArrayBuffer());
     //   trace("SocketConnectionProxy==send==" + JSON.stringify(cmd));
    }

    public function isSocketConnnected():Boolean {
        return (socket && socket.connected);
    }

    public function setServerInfo(server:String = null, port:int = 0):void {
        if (server)
            this.server = server;
        if (port > 0)
            this.port = port;
    }

    public function startMsg():void {
        trace("startMsg");
        /*
         var sslString:String = 'GET / HTTP/1.1\r\nHost: ' + server + ':' + port + '\r\n\r\n';
         //var sslString : String = 'tgw_17_forward\r\nHost: ' + server + ':' + port + '\r\n\r\n';
         var bytes:ByteArray = BytesUtil.creatByteArray();
         bytes.writeUTFBytes(sslString);
         this.socket.send(bytes.getArrayBuffer());
         */
        var loginCmd:LoginCmd = new LoginCmd();
        loginCmd.credit = StaticConfig.credit;
        loginCmd.userId = StaticConfig.userId;
        loginCmd.langId = StaticConfig.langId;
        loginCmd.platform = StaticConfig.platform;


        //loginCmd.userId=83337906;
       // loginCmd.platform="2";
        if (StaticConfig.hashid && StaticConfig.hashid != "")
            loginCmd.openid = StaticConfig.hashid;
        else
            loginCmd.openid = StaticConfig.openid;
        loginCmd.openkey = StaticConfig.openkey;
        loginCmd.serverNo = StaticConfig.channel + "_" + StaticConfig.serverId;
        trace(loginCmd);
        var bytes2:ByteArray = loginCmd.msgToByteArray();
        this.socket.send(bytes2.getArrayBuffer());
        this.socket.flush();
    }

    public function re_connection():void {
        var reConnectionCmd:ReConnectionCmd = new ReConnectionCmd();
        StaticConfig.checkBit = 0xff;
        reConnectionCmd.userId = StaticConfig.userId;
        reConnectionCmd.openkey = StaticConfig.openkey;
        reConnectionCmd.platform = StaticConfig.platform;
        reConnectionCmd.serverNo = StaticConfig.channel + "_" + StaticConfig.serverId;

        trace("re_connection==reConnectionCmd=="+JSON.stringify(reConnectionCmd));
        var bytes2:ByteArray = reConnectionCmd.msgToByteArray();
        this.socket.send(bytes2.getArrayBuffer());
        this.socket.flush();

    }
}
}








