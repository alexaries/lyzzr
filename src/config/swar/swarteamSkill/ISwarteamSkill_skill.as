package config.swar.swarteamSkill {
    public interface ISwarteamSkill_skill
    {
        // ATTRIBUTES
        function get name():String;
        function get id():int;
        function get mainInfo():String;
        // ELEMENTS
        function get item():Vector.<ISwarteamSkill_skill_item>;
        
    }
} 
