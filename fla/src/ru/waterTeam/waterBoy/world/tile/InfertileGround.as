package ru.waterTeam.waterBoy.world.tile {
	import ru.waterTeam.waterBoy.ConstantsCollision;
 
	public class InfertileGround extends Tile {
		[Embed(source='../../../../../../assets/infertileGround.png')]
		private const INFERTILE_GROUND : Class;
 
		public function InfertileGround(posX:int, posY:int) {
			super(posX, posY, ConstantsCollision.INFERTILE_GROUND, INFERTILE_GROUND);
		}
	}
}