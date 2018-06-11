package config.mission.newTask {
    public interface INewTaskCfg
    {
        // ATTRIBUTES
        function get id():int;
        function get name():String;
        function get type():int;
        function get preTaskId():int;
        function get playerLevel():int;
        function get klass():int;
        function get step():int;
        function get describe():String;
        function get toolsPublish():String;
        function get awardExp():int;
        function get awardTael():int;
        function get awardItem():String;
        
        
    }
} 
