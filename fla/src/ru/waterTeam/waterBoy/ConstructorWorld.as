package ru.waterTeam.waterBoy {
	import net.flashpunk.World;
	import net.flashpunk.FP;
	
	import ru.waterTeam.waterBoy.world.tile.CrumblingGround;
	import ru.waterTeam.waterBoy.world.tile.FinishLevel;
	import ru.waterTeam.waterBoy.world.tile.Ground;
	import ru.waterTeam.waterBoy.world.tile.InfertileGround;
	import ru.waterTeam.waterBoy.world.tile.MenacingTile;
	import ru.waterTeam.waterBoy.world.tile.PlantTile;
	import ru.waterTeam.waterBoy.world.tile.StartLevel;
	import ru.waterTeam.waterBoy.world.WaterWorld;
	import ru.waterTeam.waterBoy.world.tile.TileConstants;
	
	public class ConstructorWorld {
		
		public static var tiles	: Array;
		
		public static function initTiles() : void {
			tiles = new Array();
			tiles[ConstantsConstruction.GROUND] = Ground;
			tiles[ConstantsConstruction.START] = StartLevel;
			tiles[ConstantsConstruction.FINISH] = FinishLevel;
			tiles[ConstantsConstruction.INFERTILE_GROUND] = InfertileGround;
			tiles[ConstantsConstruction.CRUMBLING_GROUND] = CrumblingGround;
			tiles[ConstantsConstruction.MENACING] = MenacingTile;
			tiles[ConstantsConstruction.PLANT] = PlantTile;
		}
		
		public static function creatWorld(descriptionWorld : Array) : WaterWorld {
			if (!tiles) {
				initTiles();
			}
			var world : WaterWorld = new WaterWorld(descriptionWorld[0].length * TileConstants.SIZE_TILE, descriptionWorld.length * TileConstants.SIZE_TILE);
			for (var i:int = 0; i < descriptionWorld.length; i++) {
				for (var j:int = 0; j < descriptionWorld[i].length; j++) {
					if (descriptionWorld[i][j] != ConstantsConstruction.VACUUM) {
						world.add(new tiles[descriptionWorld[i][j]](j, i));
					}
				}
			}
			return world;
		}
	}
}