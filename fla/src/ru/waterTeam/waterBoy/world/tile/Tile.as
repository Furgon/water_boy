package ru.waterTeam.waterBoy.world.tile {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
 
	public class Tile extends Entity {
		public function Tile(posX:int, posY:int, typeCollision : String, image : Class) {
			graphic = new Image(image);
			setHitbox(TileConstants.SIZE_TILE, TileConstants.SIZE_TILE);
			type = typeCollision;
			x = posX * TileConstants.SIZE_TILE;
			y = posY * TileConstants.SIZE_TILE;
		}
	}
}