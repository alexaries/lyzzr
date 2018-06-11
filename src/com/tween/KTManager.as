package com.tween {

	import com.tween.KTJob;

import utils.TimerUtil;

/**
	 * Tween job manager class
	 * @author Yusuke Kawasaki
	 * @version 1.0.1
	 * @see com.tween.KTJob
	 */
	public class KTManager {

		private var running:Boolean = false;
		private var firstJob:KTJob;
		private var lastJob:KTJob;
		private var firstAdded:KTJob;
		private var lastAdded:KTJob;

		/**
		 * Constructs a new KTManager instance.
		 **/
		public function KTManager():void {
		}

		/**
		 * Regists a new tween job to the job queue.
		 *
		 * @param job 		A job to be added to queue.
		 * @param delay 	Delay until job started in seconds.
		 **/
		public function queue(job:KTJob, delay:Number = 0):void {
			if (delay > 0) {
				var closure:Function = function ():void {
                    this.queue(job);
				};
                Laya.timer.once( delay * 1000,this,closure);
				return;
			}
			job.init();
			if (lastAdded != null) {
				lastAdded.next = job;
			} else {
				firstAdded = job;
			}
			lastAdded = job;

			if (!running) awake();
		}

		private function awake():void {
			if (running) return;

			running = true;
		}

		private function sleep():void {
			running = false;
		}

		public function enterFrameHandler():void {

            if (!running) return;
			// check new jobs added
			if (firstAdded != null) {
				mergeList();
			}
			
			// check all jobs done
			if (firstJob == null) {
				sleep();
				return;
			}
			
			var curTime:Number = TimerUtil.getTimer();
			var prev:KTJob = null;
			var job:KTJob = firstJob;
			for(job = firstJob;job != null;job = job.next) {
				if (job.finished) {
					if (prev == null) {
						firstJob = job.next;
					} else {
						prev.next = job.next;
					}
					if (job.next == null) {
						lastJob = prev;
					}
					job.close();
				} else {
					job.step(curTime);
					prev = job;
				}
			}
		}

		/**
		 * Terminates all tween jobs immediately.
		 * @see com.tween.KTJob#abort()
		 */
		public function abort():void {
			mergeList();
			var job:KTJob;
			for(job = firstJob;job != null;job = job.next) {
				job.abort();
			}
		}

		/**
		 * Stops and rollbacks to the first (beginning) status of all tween jobs.
		 * @see com.tween.KTJob#cancel()
		 */
		public function cancel():void {
			mergeList();
			var job:KTJob;
			for(job = firstJob;job != null;job = job.next) {
				job.cancel();
			}
		}

		/**
		 * Forces to finish all tween jobs.
		 * @see com.tween.KTJob#complete()
		 */
		public function complete():void {
			mergeList();
			var job:KTJob;
			for(job = firstJob;job != null;job = job.next) {
				job.complete();
			}
		}

		/**
		 * Pauses all tween jobs.
		 * @see com.tween.KTJob#pause()
		 */
		public function pause():void {
			mergeList();
			var job:KTJob;
			for(job = firstJob;job != null;job = job.next) {
				job.pause();
			}
		}

		/**
		 * Proceeds with all tween jobs paused.
		 * @see com.tween.KTJob#resume()
		 */
		public function resume():void {
			// mergeList(); // this isn't needed
			var job:KTJob;
			for(job = firstJob;job != null;job = job.next) {
				job.resume();
			}
		}

		private function mergeList():void {
			if (!firstAdded) return;
			if (lastJob != null) {
				lastJob.next = firstAdded;	
			} else {
				firstJob = firstAdded;
			}
			lastJob = lastAdded;
			firstAdded = null;
			lastAdded = null;
		}
	}
}
