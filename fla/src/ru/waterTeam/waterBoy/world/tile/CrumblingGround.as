package ru.waterTeam.waterBoy.world.tile {
	import ru.waterTeam.waterBoy.ConstantsCollision;
 
	public class CrumblingGround extends Tile {
		[Embed(source='../../../../../../assets/crumblingGround.png')]
		private const CRUMBLING_GROUND : Class;
 
		public function CrumblingGround(posX:int, posY:int) {
			super(posX, posY, ConstantsCollision.CRUMBLING_GROUND, CRUMBLING_GROUND);
		}
	}
}