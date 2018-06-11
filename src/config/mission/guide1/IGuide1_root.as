package config.mission.guide1 {
    public interface IGuide1_root
    {
        // ATTRIBUTES
        function get ids():String;
        function get welcome():int;
        // ELEMENTS
        function get task():Vector.<IGuide1_root_task>;
        
    }
} 
