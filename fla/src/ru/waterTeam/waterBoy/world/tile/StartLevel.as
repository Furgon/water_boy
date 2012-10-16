package ru.waterTeam.waterBoy.world.tile {
	import ru.waterTeam.waterBoy.ConstantsCollision;
	import ru.waterTeam.waterBoy.world.WaterWorld;
 
	public class StartLevel extends Tile {
		[Embed(source='../../../../../../assets/start.png')]
		private const START:Class;
 
		public function StartLevel(posX:int, posY:int) {
			super(posX, posY, ConstantsCollision.START, START);
			
			WaterWorld.startPosition(this);
		}
	}
}