package config.mission.guide {
    public interface IGuide_root_task
    {
        // ATTRIBUTES
        function get win():int;
        function get id():int;
        // ELEMENTS
        function get item():Vector.<IGuide_root_task_item>;
        
    }
} 
