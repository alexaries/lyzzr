package net.data.sendCmd.setting {
import net.data.BaseCmd;
import net.events.MsgConst;

/**
 * (C->S) 0xCD 设置密码
 */
public class SettingOperatePswdCmd extends BaseCmd {
    public function SettingOperatePswdCmd() {
        this.msgType = MsgConst.SETTING_PSWD;
    }

    public var flag:uint = 0;
    public var pswd:String = "";
    public var question:String = "";
    public var answer:String = "";
    public var pastPswd:String = "";

    override protected function createBody():void {
        try {
            this.bodyBytes.writeByte(flag);
            switch (flag) {
                case 0:
                    this.bodyBytes.writeUTF(pswd);
                    this.bodyBytes.writeUTF(question);
                    this.bodyBytes.writeUTF(answer);
                    break;
                case 1:
                    this.bodyBytes.writeUTF(pswd);
                    this.bodyBytes.writeUTF(answer);
                    break;
                case 2:
                    this.bodyBytes.writeUTF(answer);
                    break;
                case 3:
                    this.bodyBytes.writeUTF(pastPswd);
                    this.bodyBytes.writeUTF(pswd);
                    break;
            }

        }
        catch (e:*) {

        }
    }
}
}