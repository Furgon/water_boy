package ru.waterTeam.waterBoy.player {
	import flash.events.Event;
	
	/**
	 * ...
	 * @author 
	 */
	public class PlayerEvents extends Event {
		public static const LASSO_COLLISION			: String = "lassoCollision";
		
		public function PlayerEvents(type:String, bubbles:Boolean = false, cancelable:Boolean = false) {
			super(type, bubbles, cancelable);
		}
	}
	
}