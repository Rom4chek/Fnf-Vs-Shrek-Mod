package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.animation.FlxBaseAnimation;
import flixel.graphics.frames.FlxAtlasFrames;

using StringTools;

class Character extends FlxSprite
{
	public var animOffsets:Map<String, Array<Dynamic>>;
	public var debugMode:Bool = false;

	public var isPlayer:Bool = false;
	public var curCharacter:String = 'bf';

	public var holdTimer:Float = 0;

	public function new(x:Float, y:Float, ?character:String = "bf", ?isPlayer:Bool = false)
	{
		super(x, y);

		animOffsets = new Map<String, Array<Dynamic>>();
		curCharacter = character;
		this.isPlayer = isPlayer;

		var tex:FlxAtlasFrames;
		if(FlxG.save.data.antialiasing)
			{
				antialiasing = true;
			}

		switch (curCharacter)
		{
			case 'gf':
				// GIRLFRIEND CODE
				tex = Paths.getSparrowAtlas('characters/GF_assets');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByPrefix('suspence', 'GF scary', 24);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24); 

				addOffset('cheer');
				addOffset('sad', -2, -21);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);
				addOffset('suspence', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-christmas':
				tex = Paths.getSparrowAtlas('characters/gfChristmas');
				frames = tex;
				animation.addByPrefix('cheer', 'GF Cheer', 24, false);
				animation.addByPrefix('singLEFT', 'GF left note', 24, false);
				animation.addByPrefix('singRIGHT', 'GF Right Note', 24, false);
				animation.addByPrefix('singUP', 'GF Up Note', 24, false);
				animation.addByPrefix('singDOWN', 'GF Down Note', 24, false);
				animation.addByIndices('sad', 'gf sad', [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24, false);
				animation.addByIndices('hairBlow', "GF Dancing Beat Hair blowing", [0, 1, 2, 3], "", 24);
				animation.addByIndices('hairFall', "GF Dancing Beat Hair Landing", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11], "", 24, false);
				animation.addByPrefix('scared', 'GF FEAR', 24);

				addOffset('cheer');
				addOffset('sad', -2, -21);
				addOffset('danceLeft', 0, -9);
				addOffset('danceRight', 0, -9);

				addOffset("singUP", 0, 4);
				addOffset("singRIGHT", 0, -20);
				addOffset("singLEFT", 0, -19);
				addOffset("singDOWN", 0, -20);
				addOffset('hairBlow', 45, -8);
				addOffset('hairFall', 0, -9);

				addOffset('scared', -2, -17);

				playAnim('danceRight');

			case 'gf-car':
				tex = Paths.getSparrowAtlas('characters/gfCar');
				frames = tex;
				animation.addByIndices('singUP', 'GF Dancing Beat Hair blowing CAR', [0], "", 24, false);
				animation.addByIndices('danceLeft', 'GF Dancing Beat Hair blowing CAR', [30, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByIndices('danceRight', 'GF Dancing Beat Hair blowing CAR', [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], "", 24,
					false);

				addOffset('danceLeft', 0);
				addOffset('danceRight', 0);

				playAnim('danceRight');

			case 'dad':
				// DAD ANIMATION LOADING CODE
				tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
				frames = tex;
				animation.addByPrefix('idle', 'Dad idle dance', 24, false);
				animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
				animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
				animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
				animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);

				addOffset('idle');
				addOffset("singUP", -6, 50);
				addOffset("singRIGHT", 0, 27);
				addOffset("singLEFT", -10, 10);
				addOffset("singDOWN", 0, -30);

				playAnim('idle');

				case 'bfdad':
					// DAD ANIMATION LOADING CODE
					tex = Paths.getSparrowAtlas('characters/DADDY_DEAREST', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'Dad idle dance', 24, false);
					animation.addByPrefix('singUP', 'Dad Sing Note UP', 24, false);
					animation.addByPrefix('singRIGHT', 'Dad Sing Note RIGHT', 24, false);
					animation.addByPrefix('singDOWN', 'Dad Sing Note DOWN', 24, false);
					animation.addByPrefix('singLEFT', 'Dad Sing Note LEFT', 24, false);
	
					addOffset('idle');
					addOffset("singUP", -6, 50);
					addOffset("singRIGHT", 0, 27);
					addOffset("singLEFT", -10, 10);
					addOffset("singDOWN", 0, -30);
	
					playAnim('idle');

				case 'shrek':
					tex = Paths.getSparrowAtlas('characters/ShrekPhase1', 'shared');
					frames = tex;
					animation.addByPrefix('idle', 'ShrekIDLE', 24, false);
					animation.addByPrefix('comeON', 'SHREK COmeOn', 24, false);
					animation.addByPrefix('yes', 'yes but bored', 24, false);
					animation.addByPrefix('confused', 'Fuck', 24, false);
					animation.addByPrefix('hey', 'ShrekIYEAH', 24, false);
					animation.addByPrefix('shit', 'ShrekSHIT', 24, false);  
					animation.addByPrefix('singUP', 'ShrekUP', 24, false);
					animation.addByPrefix('singRIGHT', 'ShrekRIGHT', 24, false);
					animation.addByPrefix('singDOWN', 'ShrekDOWN', 24, false);
					animation.addByPrefix('singLEFT', 'ShrekLEFT', 24, false);
	
					addOffset('idle', -20, 156);
					addOffset('yes', -35, 105);
					addOffset('confused', -35, 105);
					addOffset('hey', -21, 105);
					addOffset('shit', -21, 165);
					addOffset('comeON', 37, 105);
					addOffset("singUP", 262, 254);
					addOffset("singRIGHT", -126, 97);
					addOffset("singLEFT", 285, 130);
					addOffset("singDOWN", 21, -39);

					playAnim('idle');

					case 'angry-shrek':
						tex = Paths.getSparrowAtlas('characters/ShrekPhase15', 'shared');
						frames = tex;
						animation.addByPrefix('smile', ':(', 24);
						animation.addByPrefix('angry', 'shrekget angry but angry', 24);
						animation.addByPrefix('come', 'AH COME ON SHREK', 24, false);
						animation.addByPrefix('idle', 'ShrekIDLE  ANGRY', 24, false);
						animation.addByPrefix('singUP', 'ShrekUP ANGRY', 24, false);
						animation.addByPrefix('singRIGHT', 'ShrekRIGHT ANGRY', 24, false);
						animation.addByPrefix('singDOWN', 'ShrekDOWN ANGRY', 24, false);
						animation.addByPrefix('singLEFT', 'ShrekLEFT ANGRY', 24, false);
		
						addOffset('idle', -20, 156);
						addOffset('smile', -35, 105);
						addOffset('angry', -35, 105);
						addOffset("singUP", 262, 254);
						addOffset("singRIGHT", -126, 97);
						addOffset("singLEFT", 285, 130);
						addOffset("singDOWN", 21, -39);
						addOffset('come', -35, 105);

						playAnim('idle');

						case 'tired-shrek':
							tex = Paths.getSparrowAtlas('characters/ShrekPhase19', 'shared');
							frames = tex;
							animation.addByPrefix('idle', 'ShrekIDLE  ANGRY', 24, false);
							animation.addByPrefix('win', 'win', 24, false);
							animation.addByPrefix('sad', 'cry', 24);
							animation.addByPrefix('happy', 'strange', 24);
							animation.addByPrefix('singUP', 'ShrekUP ANGRY', 24, false);
							animation.addByPrefix('singRIGHT', 'ShrekRIGHT ANGRY', 24, false);
							animation.addByPrefix('singDOWN', 'ShrekDOWN ANGRY', 24, false);
							animation.addByPrefix('singLEFT', 'ShrekLEFT ANGRY', 24, false);
			
							addOffset('idle', -20, 156);
							addOffset("singUP", 262, 254);
							addOffset('win', 119, 295);
							addOffset("sad", -35, 105);
							addOffset("happy", -35, 105);
							addOffset("singLEFT", 285, 130);
							addOffset("singRIGHT", -126, 97);
							addOffset("singDOWN", 21, -39);

							playAnim('idle');

						case 'donkey-shrek':
							frames = Paths.getSparrowAtlas('characters/ShrekPhase2', 'shared');
							animation.addByPrefix('idle', 'ShrekIDLE', 24, false);
							animation.addByPrefix('hello', 'ShrekHello', 24, false);
							animation.addByPrefix('singUP', 'ShrekUP', 24, false);
							animation.addByPrefix('singDOWN', 'ShrekDOWN', 24, false);
							animation.addByPrefix('singLEFT', 'ShrekLEFT', 24, false);
							animation.addByPrefix('singRIGHT', 'ShrekRIGHT', 24, false);
							animation.addByPrefix('singUP-alt', 'DonkeyUP', 24, false);
							animation.addByPrefix('singDOWN-alt', 'DonkeyDOWN', 24, false);
							animation.addByPrefix('singLEFT-alt', 'DonkeyLEFT', 24, false);
							animation.addByPrefix('singRIGHT-alt', 'DonkeyRIGHT', 24, false);
			
							addOffset('idle', -19, 146);
							addOffset("hello", 83, 345);
							addOffset("singUP", 127, 249);
							addOffset("singRIGHT", -88, 92);
							addOffset("singLEFT", 138, 113);
							addOffset("singDOWN", -88, -64);
							addOffset("singUP-alt", -79, 187);
							addOffset("singRIGHT-alt", -101, 106);
							addOffset("singLEFT-alt", -79, 106);
							addOffset("singDOWN-alt", -79, 106);
			
							playAnim('idle');

							
							case 'donkey-shrek-happy':
								frames = Paths.getSparrowAtlas('characters/ShrekPhase22', 'shared');
								animation.addByPrefix('idle', 'ShrekIDLE happy', 24, false);
								animation.addByPrefix('swamp', 'ShrekSWAMP', 24, false);
								animation.addByPrefix('singUP', 'ShrekUP happy', 24, false);
								animation.addByPrefix('singDOWN', 'ShrekDOWN happy', 24, false);
								animation.addByPrefix('singLEFT', 'ShrekLEFT happy', 24, false);
								animation.addByPrefix('singRIGHT', 'ShrekRIGHT happy', 24, false);
								animation.addByPrefix('singUP-alt', 'DonkeyUP', 24, false);
								animation.addByPrefix('singDOWN-alt', 'DonkeyDOWN', 24, false);
								animation.addByPrefix('singLEFT-alt', 'DonkeyLEFT', 24, false);
								animation.addByPrefix('singRIGHT-alt', 'DonkeyRIGHT', 24, false);
				
								addOffset('idle', -19, 146);
								addOffset("swamp", -68, 95);
								addOffset("singUP", 127, 249);
								addOffset("singRIGHT", -88, 92);
								addOffset("singLEFT", 138, 113);
								addOffset("singDOWN", -88, -64);
								addOffset("singUP-alt", -79, 187);
								addOffset("singRIGHT-alt", -101, 106);
								addOffset("singLEFT-alt", -79, 106);
								addOffset("singDOWN-alt", -79, 106);
				
								playAnim('idle');

								case 'donkey-shrek-angry':
									frames = Paths.getSparrowAtlas('characters/ShrekPhase25', 'shared');
									animation.addByPrefix('idle', 'ShrekIDLE SPAM', 24, false);
									animation.addByPrefix('smile', 'ShrekIDLE smile', 24);
									animation.addByPrefix('dumb', 'ShrekIDLE dumb', 24);
									animation.addByPrefix('singUP', 'ShrekUP SPAM', 24, false);
									animation.addByPrefix('singDOWN', 'ShrekDOWN SPAM', 24, false);
									animation.addByPrefix('singLEFT', 'ShrekLEFT SPAM', 24, false);
									animation.addByPrefix('singRIGHT', 'ShrekRIGHT SPAM', 24, false);
									animation.addByPrefix('singUP-alt', 'DonkeyUP SPAM', 24, false);
									animation.addByPrefix('singDOWN-alt', 'DonkeyDOWN SPAM', 24, false);
									animation.addByPrefix('singLEFT-alt', 'DonkeyLEFT SPAM', 24, false);
									animation.addByPrefix('singRIGHT-alt', 'DonkeyRIGHT SPAM', 24, false);
					
									addOffset('idle', -19, 146);
									addOffset('smile', -88, 95);
									addOffset('dumb', -88, 95);
									addOffset("singUP", 127, 249);
									addOffset("singRIGHT", -88, 92);
									addOffset("singLEFT", 138, 113);
									addOffset("singDOWN", -88, -64);
									addOffset("singUP-alt", -79, 187);
									addOffset("singRIGHT-alt", -101, 106);
									addOffset("singLEFT-alt", -79, 106);
									addOffset("singDOWN-alt", -79, 106);
					
									playAnim('idle');

									case 'donkey-shrek-tired':
										frames = Paths.getSparrowAtlas('characters/ShrekPhase28', 'shared');
										animation.addByPrefix('idle', 'ShrekIDLE Tired', 24, false);
										animation.addByPrefix('serious', 'HehTimeSerious', 24, false);
										animation.addByPrefix('singUP', 'ShrekUP Tired', 24, false);
										animation.addByPrefix('singDOWN', 'ShrekDOWN', 24, false);
										animation.addByPrefix('singLEFT', 'ShrekLEFT', 24, false);
										animation.addByPrefix('singRIGHT', 'ShrekRIGHT Tired', 24, false);
										animation.addByPrefix('singUP-alt', 'DonkeyUP', 24, false);
										animation.addByPrefix('singDOWN-alt', 'DonkeyDOWN', 24, false);
										animation.addByPrefix('singLEFT-alt', 'DonkeyLEFT', 24, false);
										animation.addByPrefix('singRIGHT-alt', 'DonkeyRIGHT', 24, false);
						
										addOffset('idle', -19, 146);
										addOffset("serious", -88, 95);
										addOffset("singUP", 127, 249);
										addOffset("singRIGHT", -88, 92);
										addOffset("singLEFT", 138, 113);
										addOffset("singDOWN", -88, -64);
										addOffset("singUP-alt", -79, 187);
										addOffset("singRIGHT-alt", -101, 106);
										addOffset("singLEFT-alt", -79, 106);
										addOffset("singDOWN-alt", -79, 106);
						
										playAnim('idle');

										case 'donkey-shrek-serious':
											frames = Paths.getSparrowAtlas('characters/ShrekPhase29', 'shared');
											animation.addByPrefix('idle', 'ShrekIDLE ser', 24, false);
											animation.addByPrefix('fool', 'ShrekIDLE donkey fool', 24);
											animation.addByPrefix('what', 'ShrekIDLE what', 24);
											animation.addByPrefix('you', 'Now u', 24, false);
											animation.addByPrefix('singUP', 'ShrekUP ser', 24, false);
											animation.addByPrefix('singDOWN', 'ShrekDOWN ser', 24, false);
											animation.addByPrefix('singLEFT', 'ShrekLEFT ser', 24, false);
											animation.addByPrefix('singRIGHT', 'ShrekRIGHT ser', 24, false);
											animation.addByPrefix('singUP-alt', 'DonkeyUP ser', 24, false);
											animation.addByPrefix('singDOWN-alt', 'DonkeyDOWN ser', 24, false);
											animation.addByPrefix('singLEFT-alt', 'DonkeyLEFT ser', 24, false);
											animation.addByPrefix('singRIGHT-alt', 'DonkeyRIGHT ser', 24, false);
							
											addOffset('idle', -19, 146);
											addOffset("fool", -88, 95);
											addOffset("what", -88, 95);
											addOffset("you", 138, 113);
											addOffset("singUP", 127, 249);
											addOffset("singRIGHT", -88, 92);
											addOffset("singLEFT", 138, 113);
											addOffset("singDOWN", -88, -64);
											addOffset("singUP-alt", -79, 187);
											addOffset("singRIGHT-alt", -101, 106);
											addOffset("singLEFT-alt", -79, 106);
											addOffset("singDOWN-alt", -79, 106);
							
											playAnim('idle');

											case 'donkey-shrek-god':
												frames = Paths.getSparrowAtlas('characters/ShrekPhase299999999', 'shared');
												animation.addByPrefix('idle', 'ShrekIDLE GOD', 24);
												animation.addByPrefix('singUP', 'ShrekUP GOD', 24, false);
												animation.addByPrefix('singDOWN', 'ShrekDOWNGOD', 24, false);
												animation.addByPrefix('singLEFT', 'ShrekLEFT GOD', 24, false);
												animation.addByPrefix('singRIGHT', 'ShrekRIGHT GOD', 24, false);
								
												addOffset('idle', -19, 146);
												addOffset("singUP", -19, 308);
												addOffset("singRIGHT", 235, 146);
												addOffset("singLEFT",-19, 146);
												addOffset("singDOWN", -19, 146);
								
												playAnim('idle');

												case 'donkey':
													frames = Paths.getSparrowAtlas('characters/Donke', 'shared');
													animation.addByPrefix('idle', 'DonkeyIDLE', 24, false);
													animation.addByPrefix('singUP', 'DonkeyUP one', 24, false);
													animation.addByPrefix('singDOWN', 'DonkeyDOWN one', 24, false);
													animation.addByPrefix('singLEFT', 'DonkeyLEFT one', 24, false);
													animation.addByPrefix('singRIGHT', 'DonkeyRIGHT one', 24, false);
									
													addOffset('idle', -19, 146);
													addOffset("singUP", -79, 487);
													addOffset("singRIGHT", -152, 116);
													addOffset("singLEFT", -95, 144);
													addOffset("singDOWN", -88, -45);
									
													playAnim('idle');

													case 'donkey-shrek-final':
														frames = Paths.getSparrowAtlas('characters/ShrekPhase29999999999999999999991', 'shared');
														animation.addByPrefix('idle', 'ShrekIDLE Tired', 24, false);
														animation.addByPrefix('angry', 'ShrekIDLE angry', 24);
														animation.addByPrefix('cool', 'ShrekIDLE cool', 24);
														animation.addByPrefix('singUP', 'ShrekUP Tired', 24, false);
														animation.addByPrefix('singDOWN', 'ShrekDOWN', 24, false);
														animation.addByPrefix('singLEFT', 'ShrekLEFT', 24, false);
														animation.addByPrefix('singRIGHT', 'ShrekRIGHT Tired', 24, false);
														animation.addByPrefix('Bruh', 'BUEEEEEEEEEя', 24, false);
										
														addOffset('idle', -88, 146);
														addOffset('angry', -44, 95);
														addOffset('cool', -88, 95);
														addOffset("singUP", 127, 249);
														addOffset("singRIGHT", -88, 92);
														addOffset("singLEFT", 138, 113);
														addOffset("singDOWN", -89, -63);
														addOffset("Bruh", 13, 150);
										
														playAnim('idle');

														case 'china-shrek':
															frames = Paths.getSparrowAtlas('characters/SHREK_CHINESE', 'shared');
															animation.addByPrefix('idle', 'Idle', 24, false);
															animation.addByPrefix('singUP', 'Up', 24, false);
															animation.addByPrefix('singDOWN', 'Down', 24, false);
															animation.addByPrefix('singLEFT', 'Left', 24, false);
															animation.addByPrefix('singRIGHT', 'Right', 24, false);
											
															addOffset('idle', -19, 102);
															addOffset("singUP", 32, 214);
															addOffset("singRIGHT", -42, 89);
															addOffset("singLEFT", 105, 110);
															addOffset("singDOWN", 15, 59);
											
															playAnim('idle');
	

							case 'shrek-cutscene-one':
								frames = Paths.getSparrowAtlas('characters/ShrekCutsceneOne1', 'shared');
								animation.addByPrefix('CutsceneONE', 'ShrekCUTSCENE ONE', 24, true);
				
								addOffset('CutsceneONE');
							
								playAnim('CutsceneONE');

								case 'shrek-cutscene-two':
									frames = Paths.getSparrowAtlas('characters/ShrekCutscneneOne2', 'shared');
									animation.addByPrefix('CutsceneTWO', 'ShrekCUTSCENE ONEpart two', 24, true);
					
									addOffset('CutsceneTWO');

									playAnim('CutsceneTWO');

									case 'shrek-cutscene-part-two':
										frames = Paths.getSparrowAtlas('characters/ShrekCutscneneTwo', 'shared');
										animation.addByPrefix('ShrekCutscneneTwo', 'ShrekIcutscene2', 24, true);
						
										addOffset('ShrekCutscneneTwo');
	
										playAnim('ShrekCutscneneTwo');

										
									case 'shrek-tinymad-cutscene-one':
										frames = Paths.getSparrowAtlas('characters/TinyMadCutsceneOne1', 'shared');
										animation.addByPrefix('CutsceneONE', 'cutscene1', 24, true);
						
										addOffset('CutsceneONE');
	
										playAnim('CutsceneONE');

										
									case 'shrek-tinymad-cutscene-one-parttwo':
										frames = Paths.getSparrowAtlas('characters/TinyMadCutsceneOne1Part2', 'shared');
										animation.addByPrefix('CutsceneTWO', 'cutsceneoneparttwo', 24, true);
						
										addOffset('CutsceneTWO');
	
										playAnim('CutsceneTWO');

										case 'complaincut':
											frames = Paths.getSparrowAtlas('characters/complainigcutscene', 'shared');
											animation.addByPrefix('Complain', 'complaining', 24, true);
							
											addOffset('Complain');
		
											playAnim('Complain');

											case 'greatplan':
												frames = Paths.getSparrowAtlas('characters/greatplancut', 'shared');
												animation.addByPrefix('Plan', 'plan', 24, true);
								
												addOffset('Plan');
			
												playAnim('Plan');


			case 'bf':
				var tex = Paths.getSparrowAtlas('characters/BOYFRIEND', 'shared');
				frames = tex;

				trace(tex.frames.length);

				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);
				animation.addByPrefix('hey', 'BF HEY', 24, false);
				animation.addByPrefix('fuck', 'BF FUCK', 24, false);

				animation.addByPrefix('firstDeath', "BF dies", 24, false);
				animation.addByIndices('deathLoop', "BF Dead Loop", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], "", 24, false);
				animation.addByPrefix('deathConfirm', "BF Dead confirm", 24, false);

				animation.addByPrefix('scared', 'BF idle shaking', 24);
				animation.addByPrefix('suspenced', 'BF idle scaried', 24);
				animation.addByPrefix('cry', 'BF idle wtf', 24);
				animation.addByPrefix('wtf', 'BF idle cry', 24);
				animation.addByPrefix('smile', 'BF idle happy', 24);
				animation.addByPrefix('angry', 'BF idle dead', 24);
				animation.addByPrefix('tired', 'BF WTF WITH YOU OGRE0', 24);
				animation.addByPrefix('doubleTired', 'BF WTF WITH YOU OGRE DOUBLE', 24);
				animation.addByPrefix('loser', 'BF idle loser0', 24, false);
				animation.addByPrefix('doubleLoser', 'BF idle loser double', 24, false);
				animation.addByPrefix('hit', 'BF hit', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				addOffset("hey", 7, 4);
				addOffset("fuck", 7, 4);
				addOffset('firstDeath', 37, 11);
				addOffset('deathLoop', 37, 5);
				addOffset('deathConfirm', 37, 69);
				addOffset('scared', -4);
				addOffset('hit', 31, 22);
				addOffset('suspenced', -5, -1);
				addOffset('cry', -5, -1);
				addOffset('wtf', -5, -1);
				addOffset('smile', -5, -1);
				addOffset('angry', -5, -1);
				addOffset('loser', 67);
				addOffset('doubleLoser', 91, -1);
				addOffset('tired', -34, 30);
				addOffset('doubleTired', -34, 30);

				playAnim('idle');

				flipX = true;

			case 'bf-car':
				var tex = Paths.getSparrowAtlas('characters/bfCar');
				frames = tex;
				animation.addByPrefix('idle', 'BF idle dance', 24, false);
				animation.addByPrefix('singUP', 'BF NOTE UP0', 24, false);
				animation.addByPrefix('singLEFT', 'BF NOTE LEFT0', 24, false);
				animation.addByPrefix('singRIGHT', 'BF NOTE RIGHT0', 24, false);
				animation.addByPrefix('singDOWN', 'BF NOTE DOWN0', 24, false);
				animation.addByPrefix('singUPmiss', 'BF NOTE UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF NOTE LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF NOTE RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF NOTE DOWN MISS', 24, false);

				addOffset('idle', -5);
				addOffset("singUP", -29, 27);
				addOffset("singRIGHT", -38, -7);
				addOffset("singLEFT", 12, -6);
				addOffset("singDOWN", -10, -50);
				addOffset("singUPmiss", -29, 27);
				addOffset("singRIGHTmiss", -30, 21);
				addOffset("singLEFTmiss", 12, 24);
				addOffset("singDOWNmiss", -11, -19);
				playAnim('idle');

				flipX = true;
			case 'bf-pixel':
				frames = Paths.getSparrowAtlas('characters/bfPixel');
				animation.addByPrefix('idle', 'BF IDLE', 24, false);
				animation.addByPrefix('singUP', 'BF UP NOTE', 24, false);
				animation.addByPrefix('singLEFT', 'BF LEFT NOTE', 24, false);
				animation.addByPrefix('singRIGHT', 'BF RIGHT NOTE', 24, false);
				animation.addByPrefix('singDOWN', 'BF DOWN NOTE', 24, false);
				animation.addByPrefix('singUPmiss', 'BF UP MISS', 24, false);
				animation.addByPrefix('singLEFTmiss', 'BF LEFT MISS', 24, false);
				animation.addByPrefix('singRIGHTmiss', 'BF RIGHT MISS', 24, false);
				animation.addByPrefix('singDOWNmiss', 'BF DOWN MISS', 24, false);

				addOffset('idle');
				addOffset("singUP");
				addOffset("singRIGHT");
				addOffset("singLEFT");
				addOffset("singDOWN");
				addOffset("singUPmiss");
				addOffset("singRIGHTmiss");
				addOffset("singLEFTmiss");
				addOffset("singDOWNmiss");

				setGraphicSize(Std.int(width * 6));
				updateHitbox();

				playAnim('idle');

				width -= 100;
				height -= 100;

				antialiasing = false;

				flipX = true;
			case 'bf-pixel-dead':
				frames = Paths.getSparrowAtlas('characters/bfPixelsDEAD');
				animation.addByPrefix('singUP', "BF Dies pixel", 24, false);
				animation.addByPrefix('firstDeath', "BF Dies pixel", 24, false);
				animation.addByPrefix('deathLoop', "Retry Loop", 24, false);
				animation.addByPrefix('deathConfirm', "RETRY CONFIRM", 24, false);
				animation.play('firstDeath');

				addOffset('firstDeath');
				addOffset('deathLoop', -37);
				addOffset('deathConfirm', -37);
				playAnim('firstDeath');
				// pixel bullshit
				setGraphicSize(Std.int(width * 6));
				updateHitbox();
				antialiasing = false;
				flipX = true;

		}

		dance();

		if (isPlayer)
		{
			flipX = !flipX;

			// Doesn't flip for BF, since his are already in the right place???
			if (!curCharacter.startsWith('bf'))
			{
				// var animArray
				var oldRight = animation.getByName('singRIGHT').frames;
				animation.getByName('singRIGHT').frames = animation.getByName('singLEFT').frames;
				animation.getByName('singLEFT').frames = oldRight;

				// IF THEY HAVE MISS ANIMATIONS??
				if (animation.getByName('singRIGHTmiss') != null)
				{
					var oldMiss = animation.getByName('singRIGHTmiss').frames;
					animation.getByName('singRIGHTmiss').frames = animation.getByName('singLEFTmiss').frames;
					animation.getByName('singLEFTmiss').frames = oldMiss;
				}
			}
		}
	}

	public function loadOffsetFile(character:String)
		{
			var offset:Array<String> = CoolUtil.coolTextFile(Paths.txt('images/characters/' + character + "Offsets", 'shared'));
	
			for (i in 0...offset.length)
			{
				var data:Array<String> = offset[i].split(' ');
				addOffset(data[0], Std.parseInt(data[1]), Std.parseInt(data[2]));
			}
		}

	override function update(elapsed:Float)
	{
		if (!curCharacter.startsWith('bf'))
		{
			if (animation.curAnim.name.startsWith('sing'))
			{
				holdTimer += elapsed;
			}

			var dadVar:Float = 4;

			if (curCharacter == 'dad')
				dadVar = 6.1;
			if (holdTimer >= Conductor.stepCrochet * dadVar * 0.001)
			{
				trace('dance');
				dance();
				holdTimer = 0;
			}
		}

		switch (curCharacter)
		{
			case 'gf':
				if (animation.curAnim.name == 'hairFall' && animation.curAnim.finished)
					playAnim('danceRight');
		}

		super.update(elapsed);
	}

	private var danced:Bool = false;

	/**
	 * FOR GF DANCING SHIT
	 */
	public function dance(forced:Bool = false)
	{
		if (!debugMode)
		{
			switch (curCharacter)
			{
				case 'gf':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-christmas':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'gf-car':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}
				case 'gf-pixel':
					if (!animation.curAnim.name.startsWith('hair'))
					{
						danced = !danced;

						if (danced)
							playAnim('danceRight');
						else
							playAnim('danceLeft');
					}

				case 'spooky':
					danced = !danced;

					if (danced)
						playAnim('danceRight');
					else
						playAnim('danceLeft');
				default:
					playAnim('idle');
			}
		}
	}

	public function playAnim(AnimName:String, Force:Bool = false, Reversed:Bool = false, Frame:Int = 0):Void
	{
		animation.play(AnimName, Force, Reversed, Frame);

		var daOffset = animOffsets.get(AnimName);
		if (animOffsets.exists(AnimName))
		{
			offset.set(daOffset[0], daOffset[1]);
		}
		else
			offset.set(0, 0);

		if (curCharacter == 'gf')
		{
			if (AnimName == 'singLEFT')
			{
				danced = true;
			}
			else if (AnimName == 'singRIGHT')
			{
				danced = false;
			}

			if (AnimName == 'singUP' || AnimName == 'singDOWN')
			{
				danced = !danced;
			}
		}
	}

	public function addOffset(name:String, x:Float = 0, y:Float = 0)
	{
		animOffsets[name] = [x, y];
	}
}
