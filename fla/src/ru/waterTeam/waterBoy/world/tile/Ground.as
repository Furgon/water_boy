package ru.waterTeam.waterBoy.world.tile {
	import ru.waterTeam.waterBoy.ConstantsCollision;
 
	public class Ground extends Tile {
		[Embed(source='../../../../../../assets/ground.png')]
		private const GROUND:Class;
 
		public function Ground(posX:int, posY:int) {
			super(posX, posY, ConstantsCollision.GROUND, GROUND);
		}
	}
}