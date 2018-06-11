package config.mission.daily {
    public interface IDaily_root
    {
        // ATTRIBUTES
        function get lv():int;
        // ELEMENTS
        function get act():IDaily_root_act;
        function get act1():IDaily_root_act1;
        function get day():IDaily_root_day;
        function get xuanji():IDaily_root_xuanji;
        function get week():IDaily_root_week;
        function get time():IDaily_root_time;
        function get pk():IDaily_root_pk;
        function get xjcopy():IDaily_root_xjcopy;
        function get copy():IDaily_root_copy;
        function get rank():IDaily_root_rank;
        
    }
} 
