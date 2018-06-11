package com.game.module.achievement.mediator
{
	import com.game.common.events.MenuWindowVO;
	import com.game.common.mvc.BaseMediator;
	import com.game.module.achievement.view.AchievementView;
	import com.game.module.menu.events.MenuEvent;
	import com.game.vo.MenuWinType;
	
	import org.puremvc.as3.interfaces.IMediator;
	
	public class AchievementMediator extends BaseMediator implements IMediator
	{
		public static const NAME:String = "AchievementMediator";
		public function AchievementMediator(viewComponent:Object=null)
		{
			super(NAME, viewComponent);
		}
		
		private function get view():AchievementView {
			return getViewComponent() as AchievementView;
		};
		private function closeClick():void {
			
			trace("AchievementMediator，closeClick ");
			dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.SWORDFIGHT_JOIN, MenuWindowVO.CLOSE)));
		//	dispatch(new MenuEvent(MenuEvent.MENU_CLIK, new MenuWindowVO(MenuWinType.ACHIEVEMENT_VIEW, MenuWindowVO.CLOSE)));
		}
		
		
		
		override public function onRegister():void
		{
			super.onRegister();
			view.closeSignal.getSignal(this).listen(closeClick);
		}
		
	}
}