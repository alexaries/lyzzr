package net.data.structs.user {
public class UserHeroStruct {
    public var bloodbits:Array;
    public var shenTongbits:Array;
    public var id:int;

    //潜力
    public var potential_1:Number;
    //潜力祝福值
    public var potential_1_value:int;
    //资质
    public var potential_2:Number;
    //资质祝福值
    public var potential_2_value:int;
    //等级
    public var level:int;
    //将领当前升级经验
    public var exp:Number;
    //将领当前修炼经验
    public var practice_exp:Number;
    public var practice_exp_max:Number;

    public var soul:Number;
    public var soul_max:int;

    public var name:String;

//		public var classType:int;
//		public var sex:int ;
    //肖像
//		public var portrait:int;

    public var hp:int;
    //无双技能
    public var skill_main:int;

    //习会无双技能
    public var skill_main_learn:Array;

    //先天技能
    public var skill_perks:int;

    //主动装备技能
    public var skills_in_1:Array;
    //被动装备技能
    public var skills_in_2:Array;
    //学习技能
    public var skill_learn:Array;
    //装备心法
    public var citta_in:Array;
    //学习心法
    public var citta_learn:Array;

    //武器  装备的ID号   				武器,装备,戒指,项链   一定是 11个  后面 是3个宝物
    public var equips:Array;

    public var buffDatas:Array = [];

    public var c_open:int;
    //
    public var talent0_type:int = 0;
    public var talent1_type:int = 0;
    public var talent2_type:int = 0;
    public var talent0_value:int = 0;
    public var talent1_value:int = 0;
    public var talent2_value:int = 0;
    // 仙丹_力量
    public var pills_strength:int = 0;
    // 仙丹_敏捷
    public var pills_quick:int = 0;
    // 仙丹_智力
    public var pills_intelligence:int = 0;
    // 仙丹_意志
    public var pills_willpower:int = 0;
    // 仙丹_耐力
    public var pills_endurance:int = 0;
    // 仙丹_元神力
    public var pills_soul:int = 0;
    //
    public var pills_att:int = 0;
    public var pills_def:int = 0;
    public var pills_critical:int = 0;
    public var pills_pierce:int = 0;
    public var pills_evade:int = 0;
    public var pills_counter:int = 0;
    public var pills_tough:int = 0;
    public var pills_act:int = 0;

    //  隐藏变身法宝效果
    public var hideFashion:Boolean = false;
    public var roleId:int = 0;
    //星辰等级
    public var stars_lv:int = 0;
    //星辰值
    public var stars_val:Number = 0;
    public var stars_gem1:int = 0;
    public var stars_gem2:int = 0;
    public var stars_gem3:int = 0;
    public var stars_gem4:int = 0;
    public var stars_gem5:int = 0;
    public var stars_gem6:int = 0;
    public var stars_gem7:int = 0;
    public var stars_gem8:int = 0;
    public var stars_rank_cur:int = 0;
    public var stars_rank_max:int = 0;

    public var baojuRefine:Vector.<int> = new Vector.<int>(3);//精炼等级
    public var baojuRefineBless:Vector.<int> = new Vector.<int>(3);//精炼祝福值\

    public var xianRefine:Vector.<int> = new Vector.<int>(3);//仙器精炼等级
    public var xianRefineBless:Vector.<int> = new Vector.<int>(3);//仙器精炼祝福值\
    public var skillRefineExp:int = 0;//技能心境经验值
    public var isCareerUpgrade:Boolean;//职业是否进阶
    public var attributeInFsLvVec:Vector.<int> = new Vector.<int>(6);
}
}
