package config.instance.explo {
    public interface IExplo_xml_area
    {
        // ATTRIBUTES
        function get itemid():int;
        function get id():int;
        function get title():int;
        function get itemname():int;
        // ELEMENTS
        function get item():Vector.<IExplo_xml_area_item>;
        
    }
} 
