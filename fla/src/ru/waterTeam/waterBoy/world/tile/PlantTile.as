package ru.waterTeam.waterBoy.world.tile {
	import ru.waterTeam.waterBoy.ConstantsCollision;
 
	public class PlantTile extends Tile {
		[Embed(source='../../../../../../assets/plantTile.png')]
		private const PLANT_TILE : Class;
 
		public function PlantTile(posX:int, posY:int) {
			super(posX, posY, ConstantsCollision.PLANT, PLANT_TILE);
		}
	}
}