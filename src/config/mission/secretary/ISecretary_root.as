package config.mission.secretary {
    public interface ISecretary_root
    {
        // ATTRIBUTES
        function get loop_time():int;
        // ELEMENTS
        function get item():Vector.<ISecretary_root_item>;
        
    }
} 
