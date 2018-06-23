package config {
import config.ceshi.ICeShi;
import config.functionopen.IfunctionOpen;
import config.memorybase.ImemoryBase;
import config.memorybase.ImemoryBaseCfg;
import config.memoryexp.ImemoryExp;
import config.memoryexp.ImemoryExpCfg;
import config.memoryup.ImemoryUp;
import config.stage.Istage;
import config.story.Istory;

// IMPORT
public class ConfigManager extends BaseConfig {
    // CONTENTS
    public var ceshi_ceshi:config.ceshi.ICeShi;
    public var story_story:config.story.Istory;
	public var memoryBase_memoryBase:config.memorybase.ImemoryBase;
	public var memoryExp_memoryExp:config.memoryexp.ImemoryExp;
	public var memoryUp_memoryUp:config.memoryup.ImemoryUp;
	
    public var stage:config.stage.Istage;//关卡配置
    public var functionOpen:config.functionopen.IfunctionOpen;//功能主界面配置

    static var __instance:ConfigManager;

    public static function get instance():ConfigManager {
        if (__instance == null) __instance = new ConfigManager();
        return __instance;
    }

    var bigJson;

    public function init(result) {
        bigJson = result;
        __init();
        bigJson = null;
    }

    public function ConfigManager() {
    }

    private function __init():void {
        // ATTRIBUTES
        ceshi_ceshi = readAndToClass('CeShi');
        story_story = readAndToClass('story');
        stage = readAndToClass('stage');
		
		memoryBase_memoryBase = readAndToClass('memoryBase');
		memoryExp_memoryExp = readAndToClass('memoryExp');
		memoryUp_memoryUp = readAndToClass('memoryUp');
		
		
        functionOpen = readAndToClass('functionOpen');
    }

    override protected function attributeSerialization(version:String):void {
        // ATTRIBUTES
        serialization(version, 'CeShi', ceshi_ceshi);
    }

    override protected function attributeUnSerialization(version:String):void {
        // ATTRIBUTES
        ceshi_ceshi = unSerialization(version, 'CeShi');
    }

    private function readAndToClass(name:String):* {
        var obj:* = bigJson[name];
        return obj;
    }
}
} 
