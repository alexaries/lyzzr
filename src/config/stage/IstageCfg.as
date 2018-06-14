package config.stage{
    public interface IstageCfg
    {
       //ATTRIBUTES
        function get ID():Number;
        function get stageSign():String;
        function get stageName():String;
        function get functionID():Number;
        function get isStory():Number;
        function get role():Number;
        function get star1Score():Number;
        function get star3Score():Number;
        function get vitality():Number;
        function get attrType1():Number;
        function get attrType2():Number;
        function get professional():Number;
        function get memoryFragment():Number;
        function get firstMemory():Number;
        function get reward():String;
        function get memoryAdvanced():Number;
        function get expert():Number;
        function get story():Number;
        function get endStory():Number;
        function get stageIntroduce():String;
        function get dialogEventIntroduce():String;
        function get dialogEventContent():String;
        function get dialogEventRule():String;
        function get dialogEventFeedback():String;
        function get expertEventIntroduce():String;
        function get expertEventKeyword():String;
        function get expertEventRule():String;
        function get expertEventFeedback():String;
        function get fateEventIntroduce():String;
        function get fateEventKeyword():Number;
        function get fateEventFeedback():String;
    }
}