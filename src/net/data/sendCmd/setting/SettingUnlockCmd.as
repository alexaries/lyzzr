package net.data.sendCmd.setting {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xCC<br>
 * 密宝锁定与解锁<br>
 * byte    flag 操作类型，0-解锁，(其他)1-锁定<br>
 * string    pwd    密码<br>
 */
public class SettingUnlockCmd extends BaseCmd {
    public function SettingUnlockCmd() {
        this.msgType = MsgConst.SETTING_LOCK;
    }

    public var flag:uint = 0;
    public var pswd:String = "";

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(flag);
            this.bodyBytes.writeUTF(pswd);
        } catch (e:*) {
        }
    }
}
}