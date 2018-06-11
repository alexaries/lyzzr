package config.disaster.disaster {
    public interface IDisaster_level
    {
        // ATTRIBUTES
        function get name():String;
        function get id():int;
        // ELEMENTS
        function get event():Vector.<IDisaster_level_event>;
        
    }
} 
