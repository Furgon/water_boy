package ru.waterTeam.waterBoy.utilities {
	import net.flashpunk.FP;
	import ru.waterTeam.waterBoy.player.Player;
 
	public class Camera {
		private const CAMERA_OFFSET	: int = 200;
		private var mapWidth		: int;
		private var mapHeight		: int;
		private var _player			: Player;
 
		public function Camera(mapWidth : int, mapHeight : int) {
			this.mapWidth = mapWidth;
			this.mapHeight = mapHeight;
		}
		
		public function set player(value : Player) : void {
			_player = value;
		}
 
		public function adjustToPlayer():void {
			// Находим координаты камеры, при которых игрок будет находится в центре
			var newCameraX:int = (_player.x + _player.width / 2) - FP.width / 2;
			var newCameraY:int = (_player.y + _player.height / 2) - FP.height / 2;
 
			// проверим находится ли камера в границах карты
			if (newCameraX < 0)
				newCameraX = 0;
			else if (newCameraX + FP.width > mapWidth)
				newCameraX = mapWidth - FP.width;
 
			if (newCameraY < 0)
				newCameraY = 0;
			else if (newCameraY + FP.height > mapHeight)
				newCameraY = mapHeight - FP.height;
 
			// Присваиваем новые координаты камере
			FP.camera.x = newCameraX;
			FP.camera.y = newCameraY;
		}
 
		public function followPlayer():void {
			if (_player) {
				//trace('followPlayer', 'FP.camera.x', FP.camera.x, 'FP.width', FP.width, '_player.x', _player.x, '_player.width', _player.width, 'result', (FP.camera.x + FP.width) - (_player.x + _player.width));
				// Проверяем горизонтальную ось
				if (_player.x - FP.camera.x < CAMERA_OFFSET) {
					// Двигаем камеру влево только если
					// ее координата по оси х больше 0
					if (FP.camera.x > 0) {
						FP.camera.x = _player.x - CAMERA_OFFSET;
					} else {
						FP.camera.x = 0;
					}
				} else if ((FP.camera.x + FP.width) - (_player.x + _player.width) < CAMERA_OFFSET) {
					// Двигаем камеру вправо только если
					// ее координата по оси х < mapWidth
					if (FP.camera.x + FP.width < mapWidth) {
						FP.camera.x = _player.x - FP.width + _player.width + CAMERA_OFFSET;
					} else {
						FP.camera.x = mapWidth - FP.width;
					}
				}
			}
 
			// Проверяем вертикальную ось
			if (_player.y - FP.camera.y < CAMERA_OFFSET) {
				// Двигаем камеру вверх только если
				// ее координаты по оси y больше 0
				if (FP.camera.y > 0) {
					FP.camera.y =  _player.y - CAMERA_OFFSET;
				} else {
					FP.camera.y = 0;
				}
			} else if ((FP.camera.y + FP.height) - (_player.y + _player.height) < CAMERA_OFFSET) {
				// Двигаем камеру вниз только если
				// ее координата по оси y < mapHeight
				if (FP.camera.y + FP.height < mapHeight) {
					FP.camera.y = CAMERA_OFFSET + _player.y + _player.height - FP.height;
				} else {
					FP.camera.y = mapHeight - FP.height;
				}
			}
		}
	}
}