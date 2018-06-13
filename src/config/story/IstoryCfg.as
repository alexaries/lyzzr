package config.story{
    public interface IstoryCfg
    {
       //ATTRIBUTES
        function get ID():Number;
        function get functionID():Number;
        function get storyName():String;
        function get port():Number;
        function get nextPort():Number;
        function get role():Number;
        function get bg():Number;
        function get roleBust():Number;
        function get dialogType():Number;
        function get dialogContent():String;
        function get dialogHead():Number;
        function get dialogName():String;
        function get telShowPicID():Number;
        function get dialogOption1Content():String;
        function get dialogOption1Reward():String;
        function get dialogOption2Content():String;
        function get dialogOption2Reward():String;
        function get dialogOptionPortID():String;
        function get picOption():String;
        function get picOptionPortID():String;
        function get shockTarget():Number;
        function get aniTarget():String;
        function get aniTargetAtt():String;
        function get aniTargetAttValue():String;
        function get aniTime():String;
        function get mask():Number;
        function get bgMusic():Number;
        function get sound():Number;
    }
}