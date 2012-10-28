package ru.waterTeam.waterBoy.player {
	import flash.events.*;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author 
	 */
	public class Lasso extends Entity {
		
		private static var disp					: EventDispatcher;
		public static const TYPE_COLLISION		: String = "lasso";
		
		public const MAX_DISTANCE				: Number = 150;
		public const SQUARE_MAX_DISTANCE		: Number = MAX_DISTANCE * MAX_DISTANCE;
		public const POWER						: int = 2;
		
		private const WIDTH						: int = 8;
		private const HEIGHT					: int = 8;
		private const X_SPEED					: int = 10;
		private const Y_SPEED					: int = 5;
		[Embed(source = '../../../../../assets/lasso.png')] private const LASSO:Class;
		
		private var xSpeed				: int;
		private var ySpeed				: int = -Y_SPEED;
		
		private var rightDirectionView	: Boolean;
		private var collisionGround		: Boolean = false;
		
		private var map					: Entity;
		
		public function addEventListener(...p_args:Array):void {
			if (disp == null) { disp = new EventDispatcher(); }
			disp.addEventListener.apply(null, p_args);
		}
		
		public function removeEventListener(...p_args:Array):void {
			if (disp == null) { return; }
			disp.removeEventListener.apply(null, p_args);
		}
		
		public function dispatchEvent(...p_args:Array):void {
			if (disp == null) { return; }
			disp.dispatchEvent.apply(null, p_args);
		}
		
		public function Lasso(map : Entity, rightDirectionView : Boolean) {
			graphic = new Image(LASSO);
			setHitbox(WIDTH, HEIGHT);
			type = TYPE_COLLISION;
			
			this.map = map;
			this.rightDirectionView = rightDirectionView;
		}
		
		public override function update():void {
			if (!collisionGround) {
				if (rightDirectionView) xSpeed = X_SPEED; else xSpeed = -X_SPEED;
				ySpeed = -Y_SPEED;
				
				adjustPosition(); //функции проверяющие столкновения по осям x и y
			}
		}
		
		private function adjustPosition():void {
			//проверка по оси x
			for (var i:int = 0; i < Math.abs(xSpeed); i++){ //перебираем все значение от 0 до текущей скорости по оси x
				if(!collideWith(map, x + FP.sign(xSpeed), y)) {
					x += FP.sign(xSpeed); //и -1 если отрицательное) игрок не сталкивается с стеной, то перемещаем игрока в этом направлении на 1 px
				} else { //иначе
					//xSpeed = 0; //не перемещаем
					collisionGround = true;
					dispatchEvent(new PlayerEvents(PlayerEvents.LASSO_COLLISION));
					return;
					break;
				}
			}
			//проверка по оси y
			for (var j:int = 0; j < Math.abs(ySpeed); j++){ //здесь все аналогично
				if (!collideWith(map, x, y + FP.sign(ySpeed))){
					y += FP.sign(ySpeed);
				} else {
					//ySpeed = 0;
					collisionGround = true;
					dispatchEvent(new PlayerEvents(PlayerEvents.LASSO_COLLISION));
					return;
					break;
				}
			}
		}
	}
}