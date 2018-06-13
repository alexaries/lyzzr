package config {
import config.ceshi.ICeShi;
import config.story.Istory;

// IMPORT
public class ConfigManager extends BaseConfig {
    // CONTENTS
    public var ceshi_ceshi:config.ceshi.ICeShi;
	public var story_story:config.story.Istory;
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
		story_story = readAndToClass("story");
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
