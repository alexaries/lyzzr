package config.instance.formation {
    public interface IFormation_copy
    {
        // ATTRIBUTES
        function get name():int;
        function get map():String;
        function get imgID():int;
        function get id():int;
        function get info():int;
        function get goods():String;
        // ELEMENTS
        function get debry():Vector.<IFormation_copy_debry>;
        
    }
} 
