package ru.waterTeam.waterBoy.player {
	import flash.events.*;
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author 
	 */
	public class Teleport extends Entity {
		
		private static var disp		: EventDispatcher;
		
		private const WIDTH			: int = 8;
		private const HEIGHT		: int = 8;
		private const GRAVITY		: Number = 0.2;
		private const H_FRICTION	: Number = 0.99;
		private const V_FRICTION	: Number = 0.99;
		private const X_POWER		: int = 10;
		private const Y_POWER		: int = -4;
		[Embed(source = '../../../../../assets/teleport.png')] private const TELEPORT:Class;
		
		private var xSpeed				: Number;
		private var ySpeed				: Number;
		
		private var rightDirectionView	: Boolean;
		
		private var map					: Entity;
		
		private var _update				: Function = defaultUpdate;
		
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
		
		public function Teleport(map : Entity, rightDirectionView : Boolean) {
			setHitbox(WIDTH, HEIGHT, WIDTH/2, HEIGHT/2);
			centerOrigin();
			graphic = new Image(TELEPORT);
			graphic.x -= WIDTH / 2;
			graphic.y -= HEIGHT / 2;
			this.map = map;
			this.rightDirectionView = rightDirectionView;
			
			if (rightDirectionView) xSpeed = X_POWER; else xSpeed = -X_POWER;;
			ySpeed = Y_POWER;
		}
		
		public override function update() : void {
			_update();
		}
		
		private function defaultUpdate():void {
			xSpeed *= H_FRICTION;
			ySpeed *= V_FRICTION;
			
			ySpeed += GRAVITY;
			
			adjustPosition(); //функции проверяющие столкновения по осям x и y
		}
		
		private function emptyUpdate() : void {
		}
		
		private function adjustPosition():void {
			//проверка по оси x
			for (var i:int = 0; i < Math.abs(xSpeed); i++){ //перебираем все значение от 0 до текущей скорости по оси x
				if(!collideWith(map, x + FP.sign(xSpeed), y)) {
					x += FP.sign(xSpeed); //и -1 если отрицательное) игрок не сталкивается с стеной, то перемещаем игрока в этом направлении на 1 px
				} else { //иначе
				//	xSpeed = 0;
				//	ySpeed = 0;
					_update = emptyUpdate;
					dispatchEvent(new PlayerEvents(PlayerEvents.ACTIVATION_TELEPORT));
					return;
					break;
				}
			}
			//проверка по оси y
			for (var j:int = 0; j < Math.abs(ySpeed); j++){ //здесь все аналогично
				if (!collideWith(map, x, y + FP.sign(ySpeed))){
					y += FP.sign(ySpeed);
				} else {
				//	xSpeed = 0;
				//	ySpeed = 0;
					_update = emptyUpdate;
					dispatchEvent(new PlayerEvents(PlayerEvents.ACTIVATION_TELEPORT));
					return;
					break;
				}
			}
		}
	}
}