package ru.waterTeam.waterBoy.player {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author 
	 */
	public class Lasso extends Entity {
		
		private const WIDTH			: int = 8;
		private const HEIGHT		: int = 8;
		private const X_SPEED		: int = 10;
		private const Y_SPEED		: int = 5;
		[Embed(source = '../../../../../assets/lasso.png')] private const LASSO:Class;
		
		private var xSpeed			: int;
		private var ySpeed			: int = -Y_SPEED;
		
		private var rightDirectionView : Boolean;
		
		private var map				: Entity;
		
		public function Lasso(map : Entity, rightDirectionView : Boolean) {
			graphic = new Image(LASSO);
			setHitbox(WIDTH, HEIGHT);
			
			this.map = map;
			this.rightDirectionView = rightDirectionView;
		}
		
		public override function update():void {
			if (rightDirectionView) xSpeed = X_SPEED; else xSpeed = -X_SPEED;
			ySpeed = -Y_SPEED;
			
			adjustXPosition(); //функции проверяющие столкновения по осям x и y
			adjustYPosition();
		}
		
		private function adjustXPosition():void {
			for (var i:int = 0; i < Math.abs(xSpeed); i++){ //перебираем все значение от 0 до текущей скорости по оси x
				if(!collideWith(map, x + FP.sign(xSpeed), y)) {
					x += FP.sign(xSpeed); //и -1 если отрицательное) игрок не сталкивается с стеной, то перемещаем игрока в этом направлении на 1 px
				} else { //иначе
					xSpeed = 0; //не перемещаем
					break;
				}
			}
		}
 
		private function adjustYPosition():void {
			for (var i:int = 0; i < Math.abs(ySpeed); i++){ //здесь все аналогично
				if (!collideWith(map, x, y + FP.sign(ySpeed))){
					y += FP.sign(ySpeed);
				} else {
					ySpeed = 0;
					break;
				}
			}
		}
	}
}