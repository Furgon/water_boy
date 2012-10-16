package ru.waterTeam.waterBoy.world {
	
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Grid;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	import ru.waterTeam.waterBoy.player.Player;
	import ru.waterTeam.waterBoy.utilities.Camera;
	import ru.waterTeam.waterBoy.world.tile.*;
	import ru.waterTeam.waterBoy.Levels;
	
	/**
	 * ...
	 * @author 
	 */
	 
	public class WaterWorld extends World {

		private var player					: Player;
		private var map						: Entity;
		private var worldCamera				: Camera;
		private var background				: Backdrop;
		
		private var _mapGrid				: Grid;
		private var _mapImage				: Image;
		private var _mapData				: Class;
		//private var mapWidth				: int;
		//private var mapHeight				: int;
		
		public function WaterWorld(mapData : Class) : void {
			super();
			
			_mapData = mapData;
			loadMap(mapData);
			
			background = new Backdrop(Levels.BACKGROUND, true, true);
			
			_mapImage = new Image(_mapGrid.data);
			_mapImage.scale = TileConstants.SIZE_TILE;
			
			map = new Entity(0, 0, _mapImage, _mapGrid);
			
			worldCamera = new Camera(_mapGrid.width, _mapGrid.height);
			resetPlayer();
		}
		
		public function resetPlayer() : void {
			if (player) {
				remove(player);
			}
			
			player = new Player(map);
			add(player);
			worldCamera.player = player;
			worldCamera.adjustToPlayer();
		}
		
		public override function update():void {
			// Перемещаем камеру за игроком
			worldCamera.followPlayer();
			super.update();
		}
		
		public override function begin() : void {
			addGraphic(background, 1);
			add(map);
		}
		
		private function loadMap(mapData : Class) : void {
			var mapXML : XML = FP.getXML(mapData);
			
			_mapGrid = new Grid(mapXML.@width, mapXML.@height, TileConstants.SIZE_TILE, TileConstants.SIZE_TILE, 0, 0);
			_mapGrid.loadFromString(mapXML.Grid, "", "\n");
			
			Player.startPositionX = mapXML.Entities.PlayerStart.@x;
			Player.startPositionY = mapXML.Entities.PlayerStart.@y;
		}
	}
}