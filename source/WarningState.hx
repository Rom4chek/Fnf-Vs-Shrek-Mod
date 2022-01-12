
package;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flixel.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class WarningState extends MusicBeatState
{
	override function create()
	{
		super.create();
		var warn:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('Warning'));
		warn.antialiasing = true;
		add(warn);
	}

	public override function update(elapsed){
		
		
		if (FlxG.keys.justPressed.ENTER){
			FlxG.save.data.naughtyness = false;
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.ESCAPE){
			FlxG.save.data.naughtyness = true;
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
	
}