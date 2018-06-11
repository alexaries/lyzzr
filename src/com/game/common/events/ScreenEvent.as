/*******************************************************************************
 * Class name:	ScreenType.as
 * Description:	
 * Author:		caoqingshan
 * Create:		Aug 20, 2013 3:54:33 PM
 * Update:		Aug 20, 2013 3:54:33 PM
 ******************************************************************************/
package com.game.common.events
{
import org.puremvc.as3.patterns.observer.Notification;

//-----------------------------------------------------------------------------
	// import_declaration
	//-----------------------------------------------------------------------------
	
	public class ScreenEvent extends Notification
	{
		//-----------------------------------------------------------------------------
		// Var
		//-----------------------------------------------------------------------------
		public static const ARENA:String = "Arena"; //新斗剑界面
		public static const CHAOS_AREA:String = "CHAOS_AREA";
		public static const CHAOS_FIGHT:String = "CHAOS_FIGHT";
		public static const FIGHT_BOSS:String = "FIGHT_BOSS";
		public static const ENDLESS_TOWER : String = "ENDLESS_TOWER";
		public static const SERVER_WAR : String = "SERVER_WAR";
		public static const TEAM_WAR : String = "TEAM_WAR";
		public static const SERVER_CLAN_FIGHT:String = "SERVER_CLAN_FIGHT";
		public static const CARRER_WAR : String = "CARRER_WAR";
		public static const CLAN_COPY:String = "CLAN_COPY";//帮派副本
		public static const REGISTER_CLAN_COPY:String = "REGISTER_CLAN_COPY";
		public static const SWORDFIGHT:String = "SWORDFIGHT";//蜀山论剑
		//只需要传入view 就可显示在FightContainer
		public static const ENDWAR : String = "ENDWAR";//末日之战
		public static const FIGHTDEMON : String = "FIGHTDEMON";//决战天魔
		public static const DEFWAR : String = "DEFWAR";//墨守成规
		public static const SACRIFICE_VIEW : String = "sacrifice_view";//祭剑活动
		public static const DYNAMIC_SHOW:String = "dynamicShow";
		public static const MARRY:String = "MARRY";//结婚界面
		public static const FAIRY_LAND:String = "FAIRY_LAND";//仙界遗迹
		public static const DARK_DRAGON:String = "DARK_DRAGON";//黯龙王之怒
		public static const JIXUETAI:String = "JIXUETAI";//祭血台
        public static const PETCOMPETITION:String = "PETCOMPETITION";//灵宠争霸
		public static const MIJING:String = "MIJING";//秘境
		public static const CLANSNATCH:String = "CLANSNATCH";//帮派资源战
        public static const SHIP:String = "SHIP";//运镖
		public static const TIANTI:String = "TIANTI";//5v5
        public static const HOME_SYSTEM:String = "HOME_SYSTEM"//家园系统
		public static const FISH:String = "FISH"//钓鱼
		public static const CHARM:String = "CHARM"//钓鱼
			
		


		//-----------------------------------------------------------------------------
		// Constructor
		//-----------------------------------------------------------------------------
		public static const JIUTIAN_XZ:String = "JIUTIAN_XZ";//九天仙阵
		public static const JIUTIANXZ_BOSS:String = "JIUTIANXZ_BOSS";//九天仙阵BOSS
		public function ScreenEvent(type:String,_data:* = null  )
		{
			super(type, _data );
		}
		//-----------------------------------------------------------------------------
		// Methods
		//-----------------------------------------------------------------------------
	}
}