package;

import haxe.io.Bytes;
import haxe.io.Path;
import lime.utils.AssetBundle;
import lime.utils.AssetLibrary;
import lime.utils.AssetManifest;
import lime.utils.Assets;

#if sys
import sys.FileSystem;
#end

#if disable_preloader_assets
@:dox(hide) class ManifestResources {
	public static var preloadLibraries:Array<Dynamic>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;

	public static function init (config:Dynamic):Void {
		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();
	}
}
#else
@:access(lime.utils.Assets)


@:keep @:dox(hide) class ManifestResources {


	public static var preloadLibraries:Array<AssetLibrary>;
	public static var preloadLibraryNames:Array<String>;
	public static var rootPath:String;


	public static function init (config:Dynamic):Void {

		preloadLibraries = new Array ();
		preloadLibraryNames = new Array ();

		rootPath = null;

		if (config != null && Reflect.hasField (config, "rootPath")) {

			rootPath = Reflect.field (config, "rootPath");

			if(!StringTools.endsWith (rootPath, "/")) {

				rootPath += "/";

			}

		}

		if (rootPath == null) {

			#if (ios || tvos || webassembly)
			rootPath = "assets/";
			#elseif android
			rootPath = "";
			#elseif (console || sys)
			rootPath = lime.system.System.applicationDirectory;
			#else
			rootPath = "./";
			#end

		}

		#if (openfl && !flash && !display)
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__flixel_fonts_monsterrat_ttf);
		
		#end

		var data, manifest, library, bundle;

		data = '{"name":null,"assets":"aoy4:sizei81222y4:typey5:IMAGEy9:classNamey44:__ASSET__assets_images_clicktostartimage_pngy2:idy39:assets%2Fimages%2FclickToStartImage.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0001_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0001.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0002_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0002.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0003_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0003.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0004_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0004.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0005_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0005.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0006_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0006.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0007_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0007.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0008_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0008.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0009_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0009.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0010_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0010.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0011_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0011.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0012_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0012.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0013_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0013.pnggoR0i10107R1R2R3y51:__ASSET__assets_images_openingmovie_opening0014_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0014.pnggoR0i12780R1R2R3y51:__ASSET__assets_images_openingmovie_opening0015_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0015.pnggoR0i14334R1R2R3y51:__ASSET__assets_images_openingmovie_opening0016_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0016.pnggoR0i14856R1R2R3y51:__ASSET__assets_images_openingmovie_opening0017_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0017.pnggoR0i11058R1R2R3y51:__ASSET__assets_images_openingmovie_opening0018_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0018.pnggoR0i10872R1R2R3y51:__ASSET__assets_images_openingmovie_opening0019_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0019.pnggoR0i11142R1R2R3y51:__ASSET__assets_images_openingmovie_opening0020_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0020.pnggoR0i11440R1R2R3y51:__ASSET__assets_images_openingmovie_opening0021_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0021.pnggoR0i11491R1R2R3y51:__ASSET__assets_images_openingmovie_opening0022_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0022.pnggoR0i11510R1R2R3y51:__ASSET__assets_images_openingmovie_opening0023_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0023.pnggoR0i11605R1R2R3y51:__ASSET__assets_images_openingmovie_opening0024_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0024.pnggoR0i11629R1R2R3y51:__ASSET__assets_images_openingmovie_opening0025_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0025.pnggoR0i11629R1R2R3y51:__ASSET__assets_images_openingmovie_opening0026_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0026.pnggoR0i11548R1R2R3y51:__ASSET__assets_images_openingmovie_opening0027_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0027.pnggoR0i11548R1R2R3y51:__ASSET__assets_images_openingmovie_opening0028_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0028.pnggoR0i11362R1R2R3y51:__ASSET__assets_images_openingmovie_opening0029_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0029.pnggoR0i11362R1R2R3y51:__ASSET__assets_images_openingmovie_opening0030_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0030.pnggoR0i11499R1R2R3y51:__ASSET__assets_images_openingmovie_opening0031_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0031.pnggoR0i11413R1R2R3y51:__ASSET__assets_images_openingmovie_opening0032_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0032.pnggoR0i11431R1R2R3y51:__ASSET__assets_images_openingmovie_opening0033_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0033.pnggoR0i14555R1R2R3y51:__ASSET__assets_images_openingmovie_opening0034_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0034.pnggoR0i15165R1R2R3y51:__ASSET__assets_images_openingmovie_opening0035_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0035.pnggoR0i39272R1R2R3y51:__ASSET__assets_images_openingmovie_opening0036_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0036.pnggoR0i42346R1R2R3y51:__ASSET__assets_images_openingmovie_opening0037_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0037.pnggoR0i78921R1R2R3y51:__ASSET__assets_images_openingmovie_opening0038_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0038.pnggoR0i77459R1R2R3y51:__ASSET__assets_images_openingmovie_opening0039_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0039.pnggoR0i63679R1R2R3y51:__ASSET__assets_images_openingmovie_opening0040_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0040.pnggoR0i63679R1R2R3y51:__ASSET__assets_images_openingmovie_opening0041_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0041.pnggoR0i63679R1R2R3y51:__ASSET__assets_images_openingmovie_opening0042_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0042.pnggoR0i63679R1R2R3y51:__ASSET__assets_images_openingmovie_opening0043_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0043.pnggoR0i11458R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_0_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_0.pnggoR0i11564R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_1_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_1.pnggoR0i11370R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_2_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_2.pnggoR0i11482R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_3_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_3.pnggoR0i11388R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_4_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_4.pnggoR0i11433R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_5_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_5.pnggoR0i11380R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_6_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_6.pnggoR0i11357R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_7_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_7.pnggoR0i11356R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_8_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_8.pnggoR0i11401R1R2R3y48:__ASSET__assets_images_soundtray_soundtray_9_pngR5y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_9.pnggoR0i11383R1R2R3y49:__ASSET__assets_images_soundtray_soundtray_10_pngR5y46:assets%2Fimages%2Fsoundtray%2Fsoundtray_10.pnggoR0i247036R1R2R3y54:__ASSET__assets_images_backgrounds_titlebackground_pngR5y51:assets%2Fimages%2Fbackgrounds%2Ftitlebackground.pnggoR0i570944R1R2R3y60:__ASSET__assets_images_backgrounds_trackselectbackground_pngR5y57:assets%2Fimages%2Fbackgrounds%2Ftrackselectbackground.pnggoR0i721773R1R2R3y56:__ASSET__assets_images_backgrounds_optionsbackground_pngR5y53:assets%2Fimages%2Fbackgrounds%2Foptionsbackground.pnggoR0i26923R1R2R3y47:__ASSET__assets_images_createdfornewgrounds_pngR5y42:assets%2Fimages%2FcreatedForNewgrounds.pnggoR0i26795R1R2R3y48:__ASSET__assets_images_createdfornewgrounds2_pngR5y43:assets%2Fimages%2FcreatedForNewgrounds2.pnggoR0i27103R1R2R3y46:__ASSET__assets_images_barryisbreakdancing_pngR5y41:assets%2Fimages%2FbarryIsBreakdancing.pnggoR0i27531R1R2R3y41:__ASSET__assets_images_madebycredits1_pngR5y36:assets%2Fimages%2FmadeByCredits1.pnggoR0i27251R1R2R3y41:__ASSET__assets_images_madebycredits2_pngR5y36:assets%2Fimages%2FmadeByCredits2.pnggoR0i2841R1R2R3y41:__ASSET__assets_images_pressesctoskip_pngR5y36:assets%2Fimages%2FpressESCtoskip.pnggoR0i2059R1R2R3y42:__ASSET__assets_images_dialoguebox0001_pngR5y37:assets%2Fimages%2FdialogueBox0001.pnggoR0i2640R1R2R3y42:__ASSET__assets_images_dialoguebox0002_pngR5y37:assets%2Fimages%2FdialogueBox0002.pnggoR0i3973R1R2R3y42:__ASSET__assets_images_dialoguebox0003_pngR5y37:assets%2Fimages%2FdialogueBox0003.pnggoR0i5349R1R2R3y42:__ASSET__assets_images_dialoguebox0004_pngR5y37:assets%2Fimages%2FdialogueBox0004.pnggoR0i5260R1R2R3y42:__ASSET__assets_images_dialoguebox0005_pngR5y37:assets%2Fimages%2FdialogueBox0005.pnggoR0i8218R1R2R3y47:__ASSET__assets_images_pressetocontinue0001_pngR5y42:assets%2Fimages%2FpressEtoContinue0001.pnggoR0i8238R1R2R3y47:__ASSET__assets_images_pressetocontinue0002_pngR5y42:assets%2Fimages%2FpressEtoContinue0002.pnggoR0i8237R1R2R3y47:__ASSET__assets_images_pressetocontinue0003_pngR5y42:assets%2Fimages%2FpressEtoContinue0003.pnggoR0i8140R1R2R3y47:__ASSET__assets_images_pressetocontinue0004_pngR5y42:assets%2Fimages%2FpressEtoContinue0004.pnggoR0i8105R1R2R3y47:__ASSET__assets_images_pressetocontinue0005_pngR5y42:assets%2Fimages%2FpressEtoContinue0005.pnggoR0i8155R1R2R3y47:__ASSET__assets_images_pressetocontinue0006_pngR5y42:assets%2Fimages%2FpressEtoContinue0006.pnggoR0i8218R1R2R3y47:__ASSET__assets_images_pressetocontinue0007_pngR5y42:assets%2Fimages%2FpressEtoContinue0007.pnggoR0i8238R1R2R3y47:__ASSET__assets_images_pressetocontinue0008_pngR5y42:assets%2Fimages%2FpressEtoContinue0008.pnggoR0i8237R1R2R3y47:__ASSET__assets_images_pressetocontinue0009_pngR5y42:assets%2Fimages%2FpressEtoContinue0009.pnggoR0i8140R1R2R3y47:__ASSET__assets_images_pressetocontinue0010_pngR5y42:assets%2Fimages%2FpressEtoContinue0010.pnggoR0i8105R1R2R3y47:__ASSET__assets_images_pressetocontinue0011_pngR5y42:assets%2Fimages%2FpressEtoContinue0011.pnggoR0i8155R1R2R3y47:__ASSET__assets_images_pressetocontinue0012_pngR5y42:assets%2Fimages%2FpressEtoContinue0012.pnggoR0i563R1R2R3y37:__ASSET__assets_images_presse0001_pngR5y32:assets%2Fimages%2FpressE0001.pnggoR0i588R1R2R3y37:__ASSET__assets_images_presse0002_pngR5y32:assets%2Fimages%2FpressE0002.pnggoR0i12047R1R2R3y33:__ASSET__assets_images_paused_pngR5y28:assets%2Fimages%2Fpaused.pnggoR0i2693R1R2R3y49:__ASSET__assets_images_cursors_pointer_cursor_pngR5y46:assets%2Fimages%2Fcursors%2Fpointer_cursor.pnggoR0i1795R1R2R3y46:__ASSET__assets_images_cursors_talk_cursor_pngR5y43:assets%2Fimages%2Fcursors%2Ftalk_cursor.pnggoR0i11049R1R2R3y45:__ASSET__assets_images_mainmenu_storymode_pngR5y42:assets%2Fimages%2Fmainmenu%2Fstorymode.pnggoR0i11214R1R2R3y47:__ASSET__assets_images_mainmenu_trackselect_pngR5y44:assets%2Fimages%2Fmainmenu%2Ftrackselect.pnggoR0i4429R1R2R3y46:__ASSET__assets_images_mainmenu_exitoption_pngR5y43:assets%2Fimages%2Fmainmenu%2Fexitoption.pnggoR0i1916887R1y5:MUSICR3y36:__ASSET__assets_music_titleintro_mp3R5y31:assets%2Fmusic%2FtitleIntro.mp3goR0i1089954R1R183R3y35:__ASSET__assets_music_titleloop_mp3R5y30:assets%2Fmusic%2FtitleLoop.mp3goR0i102735R1R183R3y41:__ASSET__assets_music_trackselectloop_mp3R5y36:assets%2Fmusic%2FtrackSelectLoop.mp3goR0i1600643R1R183R3y35:__ASSET__assets_music_testclick_mp3R5y30:assets%2Fmusic%2FTestClick.mp3goR0i26666R1y5:SOUNDR3y35:__ASSET__assets_sounds_fightsfx_mp3R5y30:assets%2Fsounds%2FfightSFX.mp3goR0i7858R1R192R3y42:__ASSET__assets_sounds_optionchangesfx_mp3R5y37:assets%2Fsounds%2FoptionChangeSFX.mp3goR0i15381R1R192R3y39:__ASSET__assets_sounds_statebacksfx_mp3R5y34:assets%2Fsounds%2FstateBackSFX.mp3goR0i12247R1R192R3y42:__ASSET__assets_sounds_dialogueblipsfx_mp3R5y37:assets%2Fsounds%2FdialogueBlipSFX.mp3goR0i10366R1R192R3y40:__ASSET__assets_sounds_volumeblipsfx_mp3R5y35:assets%2Fsounds%2FvolumeBlipSFX.mp3goR0i14127R1R192R3y45:__ASSET__assets_sounds_opendialogueboxsfx_mp3R5y40:assets%2Fsounds%2FopenDialogueBoxSFX.mp3goR0i11620R1R192R3y42:__ASSET__assets_sounds_dialoguenewline_mp3R5y37:assets%2Fsounds%2FdialogueNewLine.mp3goR0i524254R1R2R3y38:__ASSET__assets_images_maps_map001_pngR5y35:assets%2Fimages%2Fmaps%2Fmap001.pnggoR0i31011R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0001_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0001.pnggoR0i31422R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0002_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0002.pnggoR0i31338R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0003_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0003.pnggoR0i31794R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0004_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0004.pnggoR0i31696R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0005_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0005.pnggoR0i31723R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0006_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0006.pnggoR0i31723R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0007_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0007.pnggoR0i31723R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0008_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0008.pnggoR0i31794R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0009_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0009.pnggoR0i31471R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0010_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0010.pnggoR0i31016R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0011_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0011.pnggoR0i30906R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0012_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0012.pnggoR0i31024R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0013_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0013.pnggoR0i31007R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0014_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0014.pnggoR0i31007R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0015_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0015.pnggoR0i31007R1R2R3y73:__ASSET__assets_images_characters_barryanims_barryidle_barry_idle0016_pngR5y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0016.pnggoR0i27297R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0001_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0001.pnggoR0i27376R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0002_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0002.pnggoR0i27376R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0003_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0003.pnggoR0i27310R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0004_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0004.pnggoR0i27310R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0005_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0005.pnggoR0i27445R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0006_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0006.pnggoR0i27445R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0007_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0007.pnggoR0i27453R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0008_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0008.pnggoR0i27453R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0009_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0009.pnggoR0i27647R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0010_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0010.pnggoR0i27647R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0011_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0011.pnggoR0i27647R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0012_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0012.pnggoR0i27647R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0013_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0013.pnggoR0i27647R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0014_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0014.pnggoR0i27647R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0015_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0015.pnggoR0i27647R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0016_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0016.pnggoR0i27466R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0017_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0017.pnggoR0i27466R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0018_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0018.pnggoR0i27466R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0019_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0019.pnggoR0i27461R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0020_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0020.pnggoR0i27461R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0021_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0021.pnggoR0i27526R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0022_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0022.pnggoR0i27286R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0023_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0023.pnggoR0i27286R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0024_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0024.pnggoR0i27245R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0025_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0025.pnggoR0i27245R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0026_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0026.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0027_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0027.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0028_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0028.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0029_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0029.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0030_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0030.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0031_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0031.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0032_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0032.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0033_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0033.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0034_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0034.pnggoR0i27281R1R2R3y69:__ASSET__assets_images_characters_dusteranims_idle_dusteridle0035_pngR5y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0035.pnggoR0i29787R1R2R3y74:__ASSET__assets_images_characters_barryanims_fighting_sketch_anims0001_pngR5y75:assets%2Fimages%2Fcharacters%2FbarryAnims%2FFighting%2Fsketch_anims0001.pnggoR0i29731R1R2R3y74:__ASSET__assets_images_characters_barryanims_fighting_sketch_anims0002_pngR5y75:assets%2Fimages%2Fcharacters%2FbarryAnims%2FFighting%2Fsketch_anims0002.pnggoR0i28928R1R2R3y74:__ASSET__assets_images_characters_barryanims_fighting_sketch_anims0003_pngR5y75:assets%2Fimages%2Fcharacters%2FbarryAnims%2FFighting%2Fsketch_anims0003.pnggoR0i309R1y4:TEXTR3y31:__ASSET__assets_data_chart_jsonR5y26:assets%2Fdata%2Fchart.jsongoR0i39706R1R183R3y33:__ASSET__flixel_sounds_flixel_mp3R5y28:flixel%2Fsounds%2Fflixel.mp3goR0i8220R1R183R3y31:__ASSET__flixel_sounds_beep_mp3R5y26:flixel%2Fsounds%2Fbeep.mp3goR0i15744R1y4:FONTR3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfgoR0i29724R1R324R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfgoR0i222R1R2R3y36:__ASSET__flixel_images_ui_button_pngR5y33:flixel%2Fimages%2Fui%2Fbutton.pnggoR0i484R1R2R3y39:__ASSET__flixel_images_logo_default_pngR5y36:flixel%2Fimages%2Flogo%2Fdefault.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
		manifest = AssetManifest.parse (data, rootPath);
		library = AssetLibrary.fromManifest (manifest);
		Assets.registerLibrary ("default", library);
		

		library = Assets.getLibrary ("default");
		if (library != null) preloadLibraries.push (library);
		else preloadLibraryNames.push ("default");
		

	}


}

#if !display
#if flash

@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_clicktostartimage_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0025_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0026_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0027_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0028_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0029_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0030_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0031_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0032_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0033_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0034_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0035_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0036_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0037_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0038_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0039_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0040_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0041_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0042_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0043_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_6_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_7_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_8_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_9_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_10_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_titlebackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_trackselectbackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_optionsbackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_createdfornewgrounds_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_createdfornewgrounds2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_barryisbreakdancing_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_madebycredits1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_madebycredits2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressesctoskip_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_presse0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_presse0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_paused_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cursors_pointer_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_cursors_talk_cursor_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_storymode_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_trackselect_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_exitoption_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_titleintro_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_titleloop_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_trackselectloop_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_testclick_mp3 extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_fightsfx_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_optionchangesfx_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_statebacksfx_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_dialogueblipsfx_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_volumeblipsfx_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_opendialogueboxsfx_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_dialoguenewline_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_maps_map001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0004_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0005_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0006_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0007_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0008_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0009_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0010_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0011_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0012_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0013_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0014_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0015_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0016_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0017_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0018_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0019_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0020_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0021_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0022_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0023_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0024_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0025_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0026_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0027_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0028_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0029_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0030_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0031_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0032_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0033_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0034_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0035_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_fighting_sketch_anims0001_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_fighting_sketch_anims0002_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_fighting_sketch_anims0003_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_chart_json extends flash.utils.ByteArray { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends flash.text.Font { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends flash.utils.ByteArray { }


#elseif (desktop || cpp)

@:keep @:image("assets/images/clickToStartImage.png") @:noCompletion #if display private #end class __ASSET__assets_images_clicktostartimage_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0001.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0002.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0002_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0003.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0003_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0004.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0004_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0005.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0005_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0006.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0006_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0007.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0007_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0008.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0008_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0009.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0009_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0010.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0010_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0011.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0011_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0012.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0012_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0013.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0013_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0014.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0014_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0015.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0015_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0016.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0016_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0017.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0017_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0018.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0018_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0019.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0019_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0020.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0020_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0021.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0021_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0022.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0022_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0023.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0023_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0024.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0024_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0025.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0025_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0026.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0026_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0027.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0027_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0028.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0028_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0029.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0029_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0030.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0030_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0031.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0031_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0032.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0032_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0033.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0033_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0034.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0034_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0035.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0035_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0036.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0036_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0037.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0037_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0038.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0038_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0039.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0039_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0040.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0040_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0041.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0041_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0042.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0042_png extends lime.graphics.Image {}
@:keep @:image("assets/images/openingMovie/opening0043.png") @:noCompletion #if display private #end class __ASSET__assets_images_openingmovie_opening0043_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_0.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_0_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_1.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_2.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_3.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_3_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_4.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_4_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_5.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_5_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_6.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_6_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_7.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_7_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_8.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_8_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_9.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_9_png extends lime.graphics.Image {}
@:keep @:image("assets/images/soundtray/soundtray_10.png") @:noCompletion #if display private #end class __ASSET__assets_images_soundtray_soundtray_10_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backgrounds/titlebackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_titlebackground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backgrounds/trackselectbackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_trackselectbackground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backgrounds/optionsbackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_optionsbackground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/createdForNewgrounds.png") @:noCompletion #if display private #end class __ASSET__assets_images_createdfornewgrounds_png extends lime.graphics.Image {}
@:keep @:image("assets/images/createdForNewgrounds2.png") @:noCompletion #if display private #end class __ASSET__assets_images_createdfornewgrounds2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/barryIsBreakdancing.png") @:noCompletion #if display private #end class __ASSET__assets_images_barryisbreakdancing_png extends lime.graphics.Image {}
@:keep @:image("assets/images/madeByCredits1.png") @:noCompletion #if display private #end class __ASSET__assets_images_madebycredits1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/madeByCredits2.png") @:noCompletion #if display private #end class __ASSET__assets_images_madebycredits2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressESCtoskip.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressesctoskip_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dialogueBox0001.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dialogueBox0002.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0002_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dialogueBox0003.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0003_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dialogueBox0004.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0004_png extends lime.graphics.Image {}
@:keep @:image("assets/images/dialogueBox0005.png") @:noCompletion #if display private #end class __ASSET__assets_images_dialoguebox0005_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0001.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0002.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0002_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0003.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0003_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0004.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0004_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0005.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0005_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0006.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0006_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0007.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0007_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0008.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0008_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0009.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0009_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0010.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0010_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0011.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0011_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressEtoContinue0012.png") @:noCompletion #if display private #end class __ASSET__assets_images_pressetocontinue0012_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressE0001.png") @:noCompletion #if display private #end class __ASSET__assets_images_presse0001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/pressE0002.png") @:noCompletion #if display private #end class __ASSET__assets_images_presse0002_png extends lime.graphics.Image {}
@:keep @:image("assets/images/paused.png") @:noCompletion #if display private #end class __ASSET__assets_images_paused_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cursors/pointer_cursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_cursors_pointer_cursor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/cursors/talk_cursor.png") @:noCompletion #if display private #end class __ASSET__assets_images_cursors_talk_cursor_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mainmenu/storymode.png") @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_storymode_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mainmenu/trackselect.png") @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_trackselect_png extends lime.graphics.Image {}
@:keep @:image("assets/images/mainmenu/exitoption.png") @:noCompletion #if display private #end class __ASSET__assets_images_mainmenu_exitoption_png extends lime.graphics.Image {}
@:keep @:file("assets/music/titleIntro.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_titleintro_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/titleLoop.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_titleloop_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/trackSelectLoop.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_trackselectloop_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/TestClick.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_testclick_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/fightSFX.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_fightsfx_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/optionChangeSFX.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_optionchangesfx_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/stateBackSFX.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_statebacksfx_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/dialogueBlipSFX.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_dialogueblipsfx_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/volumeBlipSFX.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_volumeblipsfx_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/openDialogueBoxSFX.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_opendialogueboxsfx_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/sounds/dialogueNewLine.mp3") @:noCompletion #if display private #end class __ASSET__assets_sounds_dialoguenewline_mp3 extends haxe.io.Bytes {}
@:keep @:image("assets/images/maps/map001.png") @:noCompletion #if display private #end class __ASSET__assets_images_maps_map001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0001.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0002.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0002_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0003.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0003_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0004.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0004_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0005.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0005_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0006.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0006_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0007.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0007_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0008.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0008_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0009.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0009_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0010.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0010_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0011.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0011_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0012.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0012_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0013.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0013_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0014.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0014_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0015.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0015_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/barryIdle/Barry_Idle0016.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_barryidle_barry_idle0016_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0001.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0002.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0002_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0003.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0003_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0004.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0004_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0005.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0005_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0006.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0006_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0007.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0007_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0008.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0008_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0009.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0009_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0010.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0010_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0011.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0011_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0012.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0012_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0013.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0013_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0014.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0014_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0015.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0015_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0016.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0016_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0017.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0017_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0018.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0018_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0019.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0019_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0020.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0020_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0021.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0021_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0022.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0022_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0023.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0023_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0024.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0024_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0025.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0025_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0026.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0026_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0027.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0027_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0028.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0028_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0029.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0029_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0030.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0030_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0031.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0031_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0032.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0032_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0033.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0033_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0034.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0034_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/dusterAnims/idle/dusterIdle0035.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_dusteranims_idle_dusteridle0035_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/Fighting/sketch_anims0001.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_fighting_sketch_anims0001_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/Fighting/sketch_anims0002.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_fighting_sketch_anims0002_png extends lime.graphics.Image {}
@:keep @:image("assets/images/characters/barryAnims/Fighting/sketch_anims0003.png") @:noCompletion #if display private #end class __ASSET__assets_images_characters_barryanims_fighting_sketch_anims0003_png extends lime.graphics.Image {}
@:keep @:file("assets/data/chart.json") @:noCompletion #if display private #end class __ASSET__assets_data_chart_json extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:font("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/fonts/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/fonts/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat.ttf"; #else ascender = null; descender = null; height = null; numGlyphs = null; underlinePosition = null; underlineThickness = null; unitsPerEM = null; #end name = "Monsterrat"; super (); }}


#end

#if (openfl && !flash)

#if html5
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#else
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_nokiafc22_ttf ()); super (); }}
@:keep @:expose('__ASSET__OPENFL__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__OPENFL__flixel_fonts_monsterrat_ttf extends openfl.text.Font { public function new () { __fromLimeFont (new __ASSET__flixel_fonts_monsterrat_ttf ()); super (); }}

#end

#end
#end

#end