package ru.waterTeam.waterBoy {
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	import ru.waterTeam.waterBoy.world.WaterWorld;
	/**
	 * ...
	 * @author 
	 */
	public class Main extends Engine {
		private var world			: WaterWorld;
		
		public function Main():void {
			super(800, 640, 60, false); //конструктор
			
			FP.stage = stage;
			FP.screen.color = 0x330000; //цвет фона
			FP.console.enable();
			
			world = new WaterWorld(Levels.LEVEL);
			FP.world = this.world;
		}
	}
	
}