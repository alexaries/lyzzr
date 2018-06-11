package config.mission.guide {
    public interface IGuide_root
    {
        // ATTRIBUTES
        function get ids():String;
        function get welcome():int;
        // ELEMENTS
        function get task():Vector.<IGuide_root_task>;
        
    }
} 
