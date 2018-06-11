package com.game.vo {
import com.game.module.task.struct.TaskNpcStruct;

import com.game.utils.ShellUtils;


public class TaskCfg {
		public var id : uint;
		public var flowID : uint;
		public var name : String;
        /**
         * 基本进度
         * */
        public var step:Array = [];
		/**
		 * 任务大类型：
		 * 1:
		 * 2:
		 * 3:
		 * */
		public var type : uint;

		public var country : uint;
		public var playerLevel : uint;
		public var preTaskId : uint;
		public var groundLimit : uint;
		public var timeLimit : uint;
		public var num : uint;
		public var backup : uint;
		/**
		 * 任务内容类型：
		 * */
		public var klass : uint;

		/**
		 * 发布类型：0：npc;1:物品
		 * */
		public var typePublish : uint;
		public var npcPublishID : uint;
		public var npcFinishID : uint;
		public var describe : String;
		public var toolsPublish : String;
		public var finishCondition : String;
		public var finishDesc : String;
		public var awardExp : uint;
		public var awardTael : uint;
		public var awardCoin : uint;
		public var awardGiftCard : uint;
		public var awardFriend : uint;
		public var awardAchievement : uint;
		public var awardDesc : String;
		public var awardOthers : uint;
		public var awardTools : Array;
		public var isFlash : Boolean = true;


		public function TaskCfg() {
		}

		public function get npcPublish() : TaskNpcStruct {
			var npc : TaskNpcStruct;
			npc = ShellUtils.npcById(this.npcPublishID);
			return npc;
		}

		public function get npcFinish() : TaskNpcStruct {
			var npc : TaskNpcStruct;
			npc = ShellUtils.npcById(this.npcFinishID);
			return npc;
		}
	}
}