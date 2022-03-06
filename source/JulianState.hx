
package;
import flixel.FlxSprite;
import flixel.system.FlxSound;
import flixel.util.FlxTimer;
import flixel.*;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class JulianState extends MusicBeatState
{
	override function create()
	{
		super.create();
		var juj:FlxSprite = new FlxSprite(0, 0).loadGraphic(Paths.image('angyjulian'));
		add(juj);

		FlxG.sound.playMusic(Paths.music('julinMemeMusic'), 1);
	}

	public override function update(elapsed){
		
		
		if (FlxG.keys.justPressed.ENTER){
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.ESCAPE){
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.SPACE){
			FlxG.switchState(new MainMenuState());
		}
		if (FlxG.keys.justPressed.BACKSPACE){
			FlxG.switchState(new MainMenuState());
		}
		super.update(elapsed);
	}
	
}