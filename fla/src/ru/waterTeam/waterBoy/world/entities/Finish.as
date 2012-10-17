package ru.waterTeam.waterBoy.world.entities {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	import ru.waterTeam.waterBoy.Levels;
	import ru.waterTeam.waterBoy.ConstantsCollision;
	
	public class Finish extends Entity {
 
		public function Finish(posX:int, posY:int, width:int, height:int) {
			graphic = new Image(Levels.FINISH);
			setHitbox(width, height);
			type = ConstantsCollision.FINISH;
			x = posX;
			y = posY;
		}
	}
}