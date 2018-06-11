package config.skills.bloodbitsData {
    public interface IBloodbitsData_bloodbit
    {
        // ATTRIBUTES
        function get name():int;
        function get moreInfo():int;
        function get maxlevel():int;
        function get id():int;
        function get rateInfo():String;
        function get mainInfo():String;
        function get degree():int;
        // ELEMENTS
        function get item():Vector.<IBloodbitsData_bloodbit_item>;
        
    }
} 
