package config.mission.upgrade {
    public interface IUpgrade_reward
    {
        // ATTRIBUTES
        function get next():int;
        function get lv():int;
        function get gold():int;
        function get reward():String;
        // ELEMENTS
        function get item():Vector.<IUpgrade_reward_item>;
        
    }
} 
