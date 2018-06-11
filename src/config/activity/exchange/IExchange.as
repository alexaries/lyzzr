package config.activity.exchange {
    public interface IExchange
    {
        
        // ELEMENTS
        function get day():IExchange_day;
        function get item():Vector.<IExchange_item>;
        
    }
} 
