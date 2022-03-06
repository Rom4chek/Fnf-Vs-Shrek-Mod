
package;

import flixel.FlxG;
import flixel.FlxSprite;

class HealthIcon extends FlxSprite
{
	/**
	 * Used for FreeplayState! If you use it elsewhere, prob gonna annoying
	 */
	 public var sprTracker:FlxSprite;
	 public var char:String;
	 public var isPlayer:Bool = false;

	public function new(char:String = 'bf', isPlayer:Bool = false)
	{
		super();
		if(FlxG.save.data.antialiasing)
			{
				antialiasing = true;
			}
		this.char = char;
		switch (char) {
			case 'bf':
				loadGraphic(Paths.image('icons/icon-bf'), true, 150, 150);
				animation.add('bf', [0, 1, 2, 3, 4], 0, false, isPlayer);
			case 'gf':
				loadGraphic(Paths.image('icons/icon-gf'), true, 150, 150);
				animation.add('gf', [0, 1, 2, 3, 4], 0, false, isPlayer);
			case 'shrek'| 'angry-shrek' | 'tired-shrek':
				loadGraphic(Paths.image('icons/icon-shrek'), true, 150, 150);
				animation.add('shrek', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('angry-shrek', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('tired-shrek', [0, 1, 2, 3, 4], 0, false, isPlayer);
			case 'donkey-shrek' | 'donkey-shrek-happy' | 'donkey-shrek-angry' | 'donkey-shrek-tired' | 'donkey-shrek-serious' | 'donkey-shrek-god' | 'donkey-shrek-final':
				loadGraphic(Paths.image('icons/icon-donkeyshrek'), true, 150, 150);
				animation.add('donkey-shrek', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('donkey-shrek-happy', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('donkey-shrek-angry', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('donkey-shrek-tired', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('donkey-shrek-god', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('donkey-shrek-tired', [0, 1, 2, 3, 4], 0, false, isPlayer);
				animation.add('donkey-shrek-final', [0, 1, 2, 3, 4], 0, false, isPlayer);
			case 'donkey':
				loadGraphic(Paths.image('icons/icon-donkey'), true, 150, 150);
				animation.add('donkey', [0, 1, 2, 3, 4], 0, false, isPlayer);
			case 'china-shrek':
				loadGraphic(Paths.image('icons/icon-chinashrek'), true, 150, 150);
				animation.add('china-shrek', [0, 1, 2, 3, 4], 0, false, isPlayer); 
		
		default:
			loadGraphic(Paths.image('iconGrid'), true, 150, 150);

			animation.add('dad', [12, 13], 0, false, isPlayer);
			animation.add('bfdad', [0, 1,], 0, false, isPlayer);
	    	/*animation.add('donkey-shrek', [26, 27], 0, false, isPlayer);
	    	animation.add('donkey-shrek-happy', [26, 27], 0, false, isPlayer);
	    	animation.add('donkey-shrek-angry', [26, 27], 0, false, isPlayer);
	    	animation.add('donkey-shrek-tired', [26, 27], 0, false, isPlayer);
	    	animation.add('donkey-shrek-serious', [26, 27], 0, false, isPlayer);
	      	animation.add('donkey-shrek-god', [26, 27], 0, false, isPlayer);
	    	animation.add('donkey', [28, 29], 0, false, isPlayer);
	    	animation.add('donkey-shrek-final', [26, 27], 0, false, isPlayer);
	    	animation.add('china-shrek', [24, 25], 0, false, isPlayer);*/

		switch(char)
		{
			case 'bf-pixel' | 'senpai' | 'senpai-angry' | 'spirit' | 'gf-pixel':
				antialiasing = false;
		}
	}
	animation.play(char);
	scrollFactor.set();
}

	override function update(elapsed:Float)
	{
		super.update(elapsed);


		if (sprTracker != null)
			setPosition(sprTracker.x + sprTracker.width + 10, sprTracker.y - 30);
	}
}
