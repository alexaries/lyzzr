package config.mission.new_upgrade {
    public interface INew_upgrade_reward
    {
        // ATTRIBUTES
        function get next():int;
        function get lv():int;
        function get gold():int;
        function get reward():String;
        // ELEMENTS
        function get item():Vector.<INew_upgrade_reward_item>;
        
    }
} 
