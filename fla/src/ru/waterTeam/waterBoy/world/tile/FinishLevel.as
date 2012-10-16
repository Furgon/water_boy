package ru.waterTeam.waterBoy.world.tile {
	import ru.waterTeam.waterBoy.ConstantsCollision;
 
	public class FinishLevel extends Tile {
		[Embed(source='../../../../../../assets/finish.png')]
		private const FINISH:Class;
 
		public function FinishLevel(posX:int, posY:int) {
			super(posX, posY, ConstantsCollision.FINISH, FINISH);
		}
	}
}