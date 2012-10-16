package ru.waterTeam.waterBoy.player {
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	import ru.waterTeam.waterBoy.world.WaterWorld;
	
	import ru.waterTeam.waterBoy.ConstantsCollision;
	
	/**
	 * ...
	 * @author 
	 */
	public class Player extends Entity {
		
		private static var _startPositionX		: int = 0;
		private static var _startPositionY		: int = 0;
		
		private const WIDTH			: int = 16;
		private const HEIGHT		: int = 16;
		
		private const POWER			: Number = 0.3;
		private const JUMP_POWER	: Number = 8;
		private const GRAVITY		: Number = 0.2;
		private const H_FRICTION	: Number = 0.95;
		private const V_FRICTION	: Number = 0.99;
		
		private var readyJump		: Boolean = true;
		
		private var xSpeed			: Number = 0;
		private var ySpeed			: Number = 0;
		
		private var map				: Entity;
		
		[Embed(source = '../../../../../assets/player.png')] private const PLAYER:Class;
		
		public static function set startPositionX(value : int) : void {
			_startPositionX = value;
		}
		
		public static function set startPositionY(value : int) : void {
			_startPositionY = value;
		}
		
		public function Player(map : Entity) : void {
			graphic = new Image(PLAYER);
			setHitbox(WIDTH, HEIGHT);
			
			x = _startPositionX;
			y = _startPositionY;
			
			this.map = map;
		}
		
		public override function update():void {
			var pressed:Boolean = false;
			if (Input.check(Key.LEFT)){
				xSpeed -= POWER;
				pressed = true;
			}
			if (Input.check(Key.RIGHT)){
				xSpeed += POWER;
				pressed = true;
			}
			
			//if (collide(ConstantsCollision.GROUND, x, y + 1)){
			if (collideWith(map, x, y + 1)){
				ySpeed = 0;
				if (Input.check(Key.SPACE) && readyJump) {
					readyJump = false;
					ySpeed = -JUMP_POWER;
				}
			} else {
				ySpeed += GRAVITY;
				if(readyJump) {
					if (collideWith(map, x - 1, y)) {			//проверка коллизии слева
						if (Input.check(Key.SPACE)) {
							readyJump = false;
							ySpeed = -JUMP_POWER;
							xSpeed = JUMP_POWER;
						}
					} else if (collideWith(map, x + 1, y)) {	//проверяем коллизию справа
						if (Input.check(Key.SPACE)) {
							readyJump = false;
							ySpeed = -JUMP_POWER;
							xSpeed = -JUMP_POWER;
						}
					}
				}
			}
			
			if (!Input.check(Key.SPACE)) {
				readyJump = true;
			}
			
			if (Math.abs(xSpeed) < 1 && !pressed){
				xSpeed = 0;
			}
 
			xSpeed *= H_FRICTION;
			ySpeed *= V_FRICTION;
			adjustXPosition(); //функции проверяющие столкновения по осям x и y
			adjustYPosition();
			
			checkCollisionMenacingTile();
		}
		
		private function checkCollisionMenacingTile() : void {
			if (collide(ConstantsCollision.MENACING, x, y)) {
				(this.world as WaterWorld).resetPlayer();
			}
		}
		
		private function adjustXPosition():void {
			for (var i:int = 0; i < Math.abs(xSpeed); i++){ //перебираем все значение от 0 до текущей скорости по оси x
				//if (!collide(ConstantsCollision.GROUND, x + FP.sign(xSpeed), y)){ //Если перемещяя игрока на 1 пиксель (FP.sign возвращает 1 если число положительное,)
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
				//if (!collide(ConstantsCollision.GROUND, x, y + FP.sign(ySpeed))){
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