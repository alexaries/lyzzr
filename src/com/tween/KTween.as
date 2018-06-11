package com.tween {
	import com.tween.KTJob;
	import com.tween.KTManager;

import laya.utils.Handler;

/**
	 * Tween frontend class for ease of use
	 * @author Yusuke Kawasaki
	 * @version 1.0.1
	 * @see com.tween.KTManager
	 * @see com.tween.KTJob
	 */
	public class KTween {
		/**
		 * The global KTManager instance.
		 */
		static public var manager:KTManager = new KTManager();
		/**
		 * KTJob class to create KTJob instances. KTJob is default.
		 */
		static public var jobClass:Class = KTJob;

		/**
		 * Starts a new KTween job specifying the first (beginning) status.
		 * The last (ending) status will be back the current status.
		 * 
		 * @param target   	The target object to be tweened.
		 * @param duration 	The length of the tween in seconds.
		 * @param from 	 	The object which contains the first (beginning) status in each property.
		 * @param ease 	 	The easing equation function. Quad.easeOut is default.
		 * @param callback	The callback function invoked after the tween completed as onClose.
		 * @return			The KTween job instance.
		 */
		static public function from(target:*, duration:Number, from:Object, ease:Function = null, callback:Handler = null):KTJob {
			var job:KTJob = new jobClass(target);
			job.from = from;
			job.duration = duration;
			if (ease != null) job.ease = ease;
			job.onClose = callback;
			queue(job);
			return job;
		}

		/**
		 * Starts a new KTween job specifying the last (ending) status.
		 * The current status is used as the first (beginning) status.
		 * 
		 * @param target   	The target object to be tweened.
		 * @param duration 	The length of the tween in seconds.
		 * @param to 	 	The object which contains the last (ending) status in each property.
		 * @param ease 	 	The easing equation function. Quad.easeOut is default.
		 * @param callback	The callback function invoked after the tween completed as onClose.
		 * @return			The KTween job instance.
		 */
		static public function to(target:*, duration:Number, to:Object, ease:Function = null, callback:Handler = null):KTJob {
			var job:KTJob = new jobClass(target);
			job.to = to;
			job.duration = duration;
			if (ease != null) job.ease = ease;
			job.onClose = callback;
			queue(job);
			return job;
		}

		/**
		 * Starts a new KTween job.
		 * 
		 * @param target   	The target object to be tweened.
		 * @param duration 	The length of the tween in seconds.
		 * @param from 	 	The object which contains the first (beginning) status in each property.
		 * @param to 	 	The object which contains the last (ending) status in each property.
		 * @param ease 	 	The easing equation function. Quad.easeOut is default.
		 * @param callback	The callback function invoked after the tween completed as onClose.
		 * @return			The KTween job instance.
		 */
		static public function fromTo(target:*, duration:Number, from:Object, to:Object, ease:Function = null, callback:Handler = null):KTJob {
			var job:KTJob = new jobClass(target);
			job.from = from;
			job.to = to;
			job.duration = duration;
			if (ease != null) job.ease = ease;
			job.onClose = callback;
			queue(job);
			return job;
		}

		/**
		 * Regists a new tween job to the job queue.
		 *
		 * @param job 		A job to be added to queue.
		 * @param delay 	Delay until job started in seconds.
		 * @throws ArgumentError A Function instance is not allowed for the .from or .to property.
		 **/
		static public function queue(job:KTJob, delay:Number = 0):void {
			if (job.from is Function) {
				throw  ('Function is not allowed for the .from property.');
				return;
			}
			if (job.to is Function) {
				throw ('Function is not allowed for the .to property.');
				return;
			}
			manager.queue(job, delay);
		}

		/**
		 * Terminates all tween jobs immediately
		 * @see com.tween.KTJob#abort()
		 */
		static public function abort():void {
			manager.abort();
		}

		/**
		 * Stops and rollbacks to the first (beginning) status of all tween jobs.
		 * @see com.tween.KTJob#cancel()
		 */
		static public function cancel():void {
			manager.cancel();
		}

		/**
		 * Forces to finish all tween jobs.
		 * @see com.tween.KTJob#complete()
		 */
		static public function complete():void {
			manager.complete();
		}		

		/**
		 * Pauses all tween jobs.
		 * @see com.tween.KTJob#pause()
		 */
		static public function pause():void {
			manager.pause();
		}		

		/**
		 * Proceeds with all tween jobs paused.
		 * @see com.tween.KTJob#resume()
		 */
		static public function resume():void {
			manager.resume();
		}
	}
}
