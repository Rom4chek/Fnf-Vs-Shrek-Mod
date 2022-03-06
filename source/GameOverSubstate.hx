package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.FlxSubState;
import flixel.math.FlxPoint;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class GameOverSubstate extends MusicBeatSubstate
{

	var weekData:Array<Dynamic> = [
		['Tutorial'],
		['All Star', 'Tiny Mad'],
		['???', '???', '???']
	];
	var bf:Boyfriend;
	var camFollow:FlxObject;
	var warn:FlxSprite;

	public var camHUD:FlxCamera;

	var stageSuffix:String = "";

	public function new(x:Float, y:Float)
	{
		var daStage = PlayState.curStage;
		var daBf:String = '';
		switch (PlayState.SONG.player1)
		{
			case 'bf-pixel':
				stageSuffix = '-pixel';
				daBf = 'bf-pixel-dead';
			default:
				daBf = 'bf';
		}

		super();

		Conductor.songPosition = 0;

		bf = new Boyfriend(x, y, daBf);
		add(bf);

		camHUD = new FlxCamera();

		warn = new FlxSprite(0, 0).loadGraphic(Paths.image('Modchart'));
		if(FlxG.save.data.antialiasing)
			{
				warn.antialiasing = true;
			}
        warn.screenCenter(X);
		if(FlxG.save.data.modChart)
			{
				if (PlayState.deathCounter == 5)
					{
						warned = true;
					}
			}

		camFollow = new FlxObject(bf.getGraphicMidpoint().x, bf.getGraphicMidpoint().y, 1, 1);
		add(camFollow);

		FlxG.sound.play(Paths.sound('fnf_loss_sfx' + stageSuffix));
		Conductor.changeBPM(60);

		// FlxG.camera.followLerp = 1;
		// FlxG.camera.focusOn(FlxPoint.get(FlxG.width / 2, FlxG.height / 2));
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;
		FlxG.cameras.add(camHUD);

		bf.playAnim('firstDeath');
	}

	var startVibin:Bool = false;
	var warned:Bool = false;

	override public function create()
		{
			warn.cameras = [camHUD];
			camHUD.visible = false;
		}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

		if (controls.ACCEPT)
		{
			if(warned)
				{
					if(camHUD.visible == true)
						{
							remove(warn);
							warned = false;
							camHUD.visible = false;
							FlxG.save.data.modChart = false;
						}
				}
			else
				{
					endBullshit();
				}
		}

		if (controls.BACK)
		{
			if(warned)
				{
					if(camHUD.visible == true)
						{
							remove(warn);
							warned = false;
							camHUD.visible = false;
							FlxG.save.data.modChart = true;
						}
				}
			else
				{
					FlxG.sound.music.stop();

					if (PlayState.isStoryMode)
						FlxG.switchState(new StoryMenuState());
					else
						FlxG.switchState(new FreeplayState());
					PlayState.loadRep = false;
				}
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.curFrame == 12)
		{
			FlxG.camera.follow(camFollow, LOCKON, 0.01);
		}

		if (bf.animation.curAnim.name == 'firstDeath' && bf.animation.curAnim.finished)
		{
			FlxG.sound.playMusic(Paths.music('gameOver' + stageSuffix), 0.5);
			startVibin = true;
			switch (PlayState.SONG.song) {
				case 'All Star':
					var random = FlxG.random.int(1, 4);
					var deathSound = FlxG.sound.play(Paths.sound("AllStarDeadLine" + random));
				case 'Tiny Mad':
					var random = FlxG.random.int(1, 4);
					var deathSound = FlxG.sound.play(Paths.sound("TinyMadDeadLine" + random));
			}
			if(FlxG.save.data.modChart)
				{
					if (PlayState.deathCounter == 5)
						{
							add(warn);
							camHUD.visible = true;
						}
				}
		}

		if (FlxG.sound.music.playing)
		{
			Conductor.songPosition = FlxG.sound.music.time;
		}
	}

	override function beatHit()
	{
		super.beatHit();

		if (startVibin && !isEnding)
			{
				bf.playAnim('deathLoop');
			}
		FlxG.log.add('beat');
	}

	var isEnding:Bool = false;

	function endBullshit():Void
	{
		if (!isEnding)
		{
			isEnding = true;
			bf.playAnim('deathConfirm', true);
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.music('gameOverEnd' + stageSuffix), 0.5);
			new FlxTimer().start(0.7, function(tmr:FlxTimer)
			{
				FlxG.camera.fade(FlxColor.BLACK, 2, false, function()
				{
					LoadingState.loadAndSwitchState(new PlayState());
				});
			});
		}
	}
}
