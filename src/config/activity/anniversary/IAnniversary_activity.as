package config.activity.anniversary {
    public interface IAnniversary_activity
    {
        // ATTRIBUTES
        function get end_time():Number;
        function get start_time():Number;
        // ELEMENTS
        function get item():Vector.<IAnniversary_activity_item>;
        
    }
} 
