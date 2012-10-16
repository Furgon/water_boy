package ru.waterTeam.waterBoy.world.tile {
	import ru.waterTeam.waterBoy.ConstantsCollision;
 
	public class MenacingTile extends Tile {
		[Embed(source='../../../../../../assets/menacingTile.png')]
		private const MENACING_TILE : Class;
 
		public function MenacingTile(posX:int, posY:int) {
			super(posX, posY, ConstantsCollision.MENACING, MENACING_TILE);
		}
	}
}