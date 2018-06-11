package config.faction.clanScienceCfg {
    public interface IClanScienceCfg_science
    {
        // ATTRIBUTES
        function get moreInfo():String;
        function get id():int;
        // ELEMENTS
        function get item():Vector.<IClanScienceCfg_science_item>;
        
    }
} 
