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

		data = '{"name":null,"assets":"aoy4:pathy39:assets%2Fimages%2FclickToStartImage.pngy4:sizei81222y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0001.pngR2i9609R3R4R5R7R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0002.pngR2i9609R3R4R5R8R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0003.pngR2i9609R3R4R5R9R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0004.pngR2i9609R3R4R5R10R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0005.pngR2i9609R3R4R5R11R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0006.pngR2i9609R3R4R5R12R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0007.pngR2i9609R3R4R5R13R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0008.pngR2i9609R3R4R5R14R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0009.pngR2i9609R3R4R5R15R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0010.pngR2i9609R3R4R5R16R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0011.pngR2i9609R3R4R5R17R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0012.pngR2i9609R3R4R5R18R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0013.pngR2i9609R3R4R5R19R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0014.pngR2i10107R3R4R5R20R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0015.pngR2i12780R3R4R5R21R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0016.pngR2i14334R3R4R5R22R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0017.pngR2i14856R3R4R5R23R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0018.pngR2i11058R3R4R5R24R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0019.pngR2i10872R3R4R5R25R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0020.pngR2i11142R3R4R5R26R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0021.pngR2i11440R3R4R5R27R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0022.pngR2i11491R3R4R5R28R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0023.pngR2i11510R3R4R5R29R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0024.pngR2i11605R3R4R5R30R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0025.pngR2i11629R3R4R5R31R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0026.pngR2i11629R3R4R5R32R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0027.pngR2i11548R3R4R5R33R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0028.pngR2i11548R3R4R5R34R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0029.pngR2i11362R3R4R5R35R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0030.pngR2i11362R3R4R5R36R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0031.pngR2i11499R3R4R5R37R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0032.pngR2i11413R3R4R5R38R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0033.pngR2i11431R3R4R5R39R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0034.pngR2i14555R3R4R5R40R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0035.pngR2i15165R3R4R5R41R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0036.pngR2i39272R3R4R5R42R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0037.pngR2i42346R3R4R5R43R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0038.pngR2i78921R3R4R5R44R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0039.pngR2i77459R3R4R5R45R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0040.pngR2i63679R3R4R5R46R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0041.pngR2i63679R3R4R5R47R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0042.pngR2i63679R3R4R5R48R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0043.pngR2i63679R3R4R5R49R6tgoR0y31:assets%2Fimages%2FBarryLogo.pngR2i115304R3R4R5R50R6tgoR0y51:assets%2Fimages%2Fbackgrounds%2Ftitlebackground.pngR2i247036R3R4R5R51R6tgoR0y57:assets%2Fimages%2Fbackgrounds%2Ftrackselectbackground.pngR2i570944R3R4R5R52R6tgoR0y54:assets%2Fimages%2Fbackgrounds%2Fmainmenubackground.pngR2i721773R3R4R5R53R6tgoR0y42:assets%2Fimages%2FcreatedForNewgrounds.pngR2i26923R3R4R5R54R6tgoR0y43:assets%2Fimages%2FcreatedForNewgrounds2.pngR2i26795R3R4R5R55R6tgoR2i1916887R3y5:MUSICR5y31:assets%2Fmusic%2FtitleIntro.mp3y9:pathGroupaR57hR6tgoR2i1089954R3R56R5y30:assets%2Fmusic%2FtitleLoop.mp3R58aR59hR6tgoR2i39706R3R56R5y28:flixel%2Fsounds%2Fflixel.mp3R58aR60y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i8220R3R56R5y26:flixel%2Fsounds%2Fbeep.mp3R58aR62y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i6840R3y5:SOUNDR5R63R58aR62R63hgoR2i33629R3R64R5R61R58aR60R61hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R65R66y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i222R3R4R5R71R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i484R3R4R5R72R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_titleintro_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_titleloop_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__manifest_default_json extends null { }


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
@:keep @:file("assets/music/titleIntro.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_titleintro_mp3 extends haxe.io.Bytes {}
@:keep @:file("assets/music/titleLoop.mp3") @:noCompletion #if display private #end class __ASSET__assets_music_titleloop_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/sounds/flixel.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/sounds/beep.mp3") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_mp3 extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/sounds/beep.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_beep_ogg extends haxe.io.Bytes {}
@:keep @:file("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/sounds/flixel.ogg") @:noCompletion #if display private #end class __ASSET__flixel_sounds_flixel_ogg extends haxe.io.Bytes {}
@:keep @:font("export/html5/obj/webfont/nokiafc22.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font {}
@:keep @:font("export/html5/obj/webfont/monsterrat.ttf") @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/images/ui/button.png") @:noCompletion #if display private #end class __ASSET__flixel_images_ui_button_png extends lime.graphics.Image {}
@:keep @:image("/usr/local/lib/haxe/lib/flixel/6,1,0/assets/images/logo/default.png") @:noCompletion #if display private #end class __ASSET__flixel_images_logo_default_png extends lime.graphics.Image {}
@:keep @:file("") @:noCompletion #if display private #end class __ASSET__manifest_default_json extends haxe.io.Bytes {}



#else

@:keep @:expose('__ASSET__flixel_fonts_nokiafc22_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/nokiafc22"; #else ascender = 2048; descender = -512; height = 2816; numGlyphs = 172; underlinePosition = -640; underlineThickness = 256; unitsPerEM = 2048; #end name = "Nokia Cellphone FC Small"; super (); }}
@:keep @:expose('__ASSET__flixel_fonts_monsterrat_ttf') @:noCompletion #if display private #end class __ASSET__flixel_fonts_monsterrat_ttf extends lime.text.Font { public function new () { #if !html5 __fontPath = "flixel/fonts/monsterrat"; #else ascender = 968; descender = -251; height = 1219; numGlyphs = 263; underlinePosition = -150; underlineThickness = 50; unitsPerEM = 1000; #end name = "Monsterrat"; super (); }}


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