package config.disaster.disaster {
    public interface IDisaster_level_event
    {
        // ATTRIBUTES
        function get name():String;
        function get bmp():String;
        function get img():String;
        function get id():int;
        function get perName():String;
        function get rank():String;
        // ELEMENTS
        function get daily():IDisaster_level_event_daily;
        function get normal():IDisaster_level_event_normal;
        
    }
} 
