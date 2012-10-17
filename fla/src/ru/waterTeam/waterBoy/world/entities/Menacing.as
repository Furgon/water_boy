package ru.waterTeam.waterBoy.world.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	import ru.waterTeam.waterBoy.Levels;
	import ru.waterTeam.waterBoy.ConstantsCollision;
	
	public class Menacing extends Entity {
 
		public function Menacing(posX:int, posY:int) {
			graphic = new Image(Levels.MENACING);
			setHitbox(Levels.SIZE_TILE, Levels.SIZE_TILE);
			type = ConstantsCollision.MENACING;
			x = posX;
			y = posY;
		}
	}
}