package ru.waterTeam.waterBoy {
	
	/**
	 * ...
	 * @author 
	 */
	public class Levels {
		public static const SIZE_TILE		: int = 32;
		
		[Embed(source = '../../../../assets/background.png')] public static const BACKGROUND : Class;
		[Embed(source = '../../../../assets/finish.png')] public static const FINISH : Class;
		[Embed(source = '../../../../assets/menacingTile.png')] public static const MENACING : Class;
		
		[Embed(source = '../../../../levels/firstLevel.oel', mimeType = 'application/octet-stream')] public static const LEVEL : Class;
	}	
}