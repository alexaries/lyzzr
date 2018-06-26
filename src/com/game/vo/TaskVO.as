package com.game.vo {
public class TaskVO {
		public var id : uint;
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

		public function TaskVO() {
		}
	}
}