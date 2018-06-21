package config {
import config.ceshi.ICeShi;
import config.functionopen.IfunctionOpen;
import config.stage.Istage;
import config.story.Istory;

// IMPORT
public class ConfigManager extends BaseConfig {
    // CONTENTS
    public var ceshi_ceshi:config.ceshi.ICeShi;
    public var story_story:config.story.Istory;
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

    function __init() {
        // ATTRIBUTES
        ceshi_ceshi = readAndToClass('CeShi');
        story_story = readAndToClass('story');
        stage = readAndToClass('stage');
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

    function readAndToClass(name) {
        var obj = bigJson[name];
        return obj;
    }
}
} 
