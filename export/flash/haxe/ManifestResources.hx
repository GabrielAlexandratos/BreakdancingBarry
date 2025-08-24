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

		data = '{"name":null,"assets":"aoy4:sizei81222y4:typey5:IMAGEy9:classNamey44:__ASSET__assets_images_clicktostartimage_pngy2:idy39:assets%2Fimages%2FclickToStartImage.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0001_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0001.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0002_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0002.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0003_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0003.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0004_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0004.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0005_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0005.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0006_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0006.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0007_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0007.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0008_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0008.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0009_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0009.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0010_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0010.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0011_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0011.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0012_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0012.pnggoR0i9609R1R2R3y51:__ASSET__assets_images_openingmovie_opening0013_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0013.pnggoR0i10107R1R2R3y51:__ASSET__assets_images_openingmovie_opening0014_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0014.pnggoR0i12780R1R2R3y51:__ASSET__assets_images_openingmovie_opening0015_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0015.pnggoR0i14334R1R2R3y51:__ASSET__assets_images_openingmovie_opening0016_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0016.pnggoR0i14856R1R2R3y51:__ASSET__assets_images_openingmovie_opening0017_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0017.pnggoR0i11058R1R2R3y51:__ASSET__assets_images_openingmovie_opening0018_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0018.pnggoR0i10872R1R2R3y51:__ASSET__assets_images_openingmovie_opening0019_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0019.pnggoR0i11142R1R2R3y51:__ASSET__assets_images_openingmovie_opening0020_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0020.pnggoR0i11440R1R2R3y51:__ASSET__assets_images_openingmovie_opening0021_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0021.pnggoR0i11491R1R2R3y51:__ASSET__assets_images_openingmovie_opening0022_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0022.pnggoR0i11510R1R2R3y51:__ASSET__assets_images_openingmovie_opening0023_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0023.pnggoR0i11605R1R2R3y51:__ASSET__assets_images_openingmovie_opening0024_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0024.pnggoR0i11629R1R2R3y51:__ASSET__assets_images_openingmovie_opening0025_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0025.pnggoR0i11629R1R2R3y51:__ASSET__assets_images_openingmovie_opening0026_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0026.pnggoR0i11548R1R2R3y51:__ASSET__assets_images_openingmovie_opening0027_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0027.pnggoR0i11548R1R2R3y51:__ASSET__assets_images_openingmovie_opening0028_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0028.pnggoR0i11362R1R2R3y51:__ASSET__assets_images_openingmovie_opening0029_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0029.pnggoR0i11362R1R2R3y51:__ASSET__assets_images_openingmovie_opening0030_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0030.pnggoR0i11499R1R2R3y51:__ASSET__assets_images_openingmovie_opening0031_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0031.pnggoR0i11413R1R2R3y51:__ASSET__assets_images_openingmovie_opening0032_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0032.pnggoR0i11431R1R2R3y51:__ASSET__assets_images_openingmovie_opening0033_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0033.pnggoR0i14555R1R2R3y51:__ASSET__assets_images_openingmovie_opening0034_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0034.pnggoR0i15165R1R2R3y51:__ASSET__assets_images_openingmovie_opening0035_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0035.pnggoR0i39272R1R2R3y51:__ASSET__assets_images_openingmovie_opening0036_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0036.pnggoR0i42346R1R2R3y51:__ASSET__assets_images_openingmovie_opening0037_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0037.pnggoR0i78921R1R2R3y51:__ASSET__assets_images_openingmovie_opening0038_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0038.pnggoR0i77459R1R2R3y51:__ASSET__assets_images_openingmovie_opening0039_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0039.pnggoR0i63679R1R2R3y51:__ASSET__assets_images_openingmovie_opening0040_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0040.pnggoR0i63679R1R2R3y51:__ASSET__assets_images_openingmovie_opening0041_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0041.pnggoR0i63679R1R2R3y51:__ASSET__assets_images_openingmovie_opening0042_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0042.pnggoR0i63679R1R2R3y51:__ASSET__assets_images_openingmovie_opening0043_pngR5y48:assets%2Fimages%2FopeningMovie%2Fopening0043.pnggoR0i115304R1R2R3y36:__ASSET__assets_images_barrylogo_pngR5y31:assets%2Fimages%2FBarryLogo.pnggoR0i247036R1R2R3y54:__ASSET__assets_images_backgrounds_titlebackground_pngR5y51:assets%2Fimages%2Fbackgrounds%2Ftitlebackground.pnggoR0i570944R1R2R3y60:__ASSET__assets_images_backgrounds_trackselectbackground_pngR5y57:assets%2Fimages%2Fbackgrounds%2Ftrackselectbackground.pnggoR0i721773R1R2R3y57:__ASSET__assets_images_backgrounds_mainmenubackground_pngR5y54:assets%2Fimages%2Fbackgrounds%2Fmainmenubackground.pnggoR0i26923R1R2R3y47:__ASSET__assets_images_createdfornewgrounds_pngR5y42:assets%2Fimages%2FcreatedForNewgrounds.pnggoR0i26795R1R2R3y48:__ASSET__assets_images_createdfornewgrounds2_pngR5y43:assets%2Fimages%2FcreatedForNewgrounds2.pnggoR0i27103R1R2R3y46:__ASSET__assets_images_barryisbreakdancing_pngR5y41:assets%2Fimages%2FbarryIsBreakdancing.pnggoR0i27531R1R2R3y41:__ASSET__assets_images_madebycredits1_pngR5y36:assets%2Fimages%2FmadeByCredits1.pnggoR0i27251R1R2R3y41:__ASSET__assets_images_madebycredits2_pngR5y36:assets%2Fimages%2FmadeByCredits2.pnggoR0i1916887R1y5:MUSICR3y36:__ASSET__assets_music_titleintro_mp3R5y31:assets%2Fmusic%2FtitleIntro.mp3goR0i1089954R1R111R3y35:__ASSET__assets_music_titleloop_mp3R5y30:assets%2Fmusic%2FtitleLoop.mp3goR0i39706R1R111R3y33:__ASSET__flixel_sounds_flixel_mp3R5y28:flixel%2Fsounds%2Fflixel.mp3goR0i8220R1R111R3y31:__ASSET__flixel_sounds_beep_mp3R5y26:flixel%2Fsounds%2Fbeep.mp3goR0i15744R1y4:FONTR3y35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfgoR0i29724R1R120R3y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfgoR0i222R1R2R3y36:__ASSET__flixel_images_ui_button_pngR5y33:flixel%2Fimages%2Fui%2Fbutton.pnggoR0i484R1R2R3y39:__ASSET__flixel_images_logo_default_pngR5y36:flixel%2Fimages%2Flogo%2Fdefault.pnggh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_barrylogo_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_titlebackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_trackselectbackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_mainmenubackground_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_createdfornewgrounds_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_createdfornewgrounds2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_barryisbreakdancing_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_madebycredits1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_images_madebycredits2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_titleintro_mp3 extends flash.media.Sound { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_titleloop_mp3 extends flash.media.Sound { }
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
@:keep @:image("assets/images/BarryLogo.png") @:noCompletion #if display private #end class __ASSET__assets_images_barrylogo_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backgrounds/titlebackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_titlebackground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backgrounds/trackselectbackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_trackselectbackground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/backgrounds/mainmenubackground.png") @:noCompletion #if display private #end class __ASSET__assets_images_backgrounds_mainmenubackground_png extends lime.graphics.Image {}
@:keep @:image("assets/images/createdForNewgrounds.png") @:noCompletion #if display private #end class __ASSET__assets_images_createdfornewgrounds_png extends lime.graphics.Image {}
@:keep @:image("assets/images/createdForNewgrounds2.png") @:noCompletion #if display private #end class __ASSET__assets_images_createdfornewgrounds2_png extends lime.graphics.Image {}
@:keep @:image("assets/images/barryIsBreakdancing.png") @:noCompletion #if display private #end class __ASSET__assets_images_barryisbreakdancing_png extends lime.graphics.Image {}
@:keep @:image("assets/images/madeByCredits1.png") @:noCompletion #if display private #end class __ASSET__assets_images_madebycredits1_png extends lime.graphics.Image {}
@:keep @:image("assets/images/madeByCredits2.png") @:noCompletion #if display private #end class __ASSET__assets_images_madebycredits2_png extends lime.graphics.Image {}
@:keep @:file("assets/music/titleIntro.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_titleintro_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/titleLoop.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_titleloop_mp3 extends haxe.io.Bytes {}
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