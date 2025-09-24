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

		data = '{"name":null,"assets":"aoy4:pathy39:assets%2Fimages%2FclickToStartImage.pngy4:sizei81222y4:typey5:IMAGEy2:idR1y7:preloadtgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0001.pngR2i9609R3R4R5R7R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0002.pngR2i9609R3R4R5R8R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0003.pngR2i9609R3R4R5R9R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0004.pngR2i9609R3R4R5R10R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0005.pngR2i9609R3R4R5R11R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0006.pngR2i9609R3R4R5R12R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0007.pngR2i9609R3R4R5R13R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0008.pngR2i9609R3R4R5R14R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0009.pngR2i9609R3R4R5R15R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0010.pngR2i9609R3R4R5R16R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0011.pngR2i9609R3R4R5R17R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0012.pngR2i9609R3R4R5R18R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0013.pngR2i9609R3R4R5R19R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0014.pngR2i10107R3R4R5R20R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0015.pngR2i12780R3R4R5R21R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0016.pngR2i14334R3R4R5R22R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0017.pngR2i14856R3R4R5R23R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0018.pngR2i11058R3R4R5R24R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0019.pngR2i10872R3R4R5R25R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0020.pngR2i11142R3R4R5R26R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0021.pngR2i11440R3R4R5R27R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0022.pngR2i11491R3R4R5R28R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0023.pngR2i11510R3R4R5R29R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0024.pngR2i11605R3R4R5R30R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0025.pngR2i11629R3R4R5R31R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0026.pngR2i11629R3R4R5R32R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0027.pngR2i11548R3R4R5R33R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0028.pngR2i11548R3R4R5R34R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0029.pngR2i11362R3R4R5R35R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0030.pngR2i11362R3R4R5R36R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0031.pngR2i11499R3R4R5R37R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0032.pngR2i11413R3R4R5R38R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0033.pngR2i11431R3R4R5R39R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0034.pngR2i14555R3R4R5R40R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0035.pngR2i15165R3R4R5R41R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0036.pngR2i39272R3R4R5R42R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0037.pngR2i42346R3R4R5R43R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0038.pngR2i78921R3R4R5R44R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0039.pngR2i77459R3R4R5R45R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0040.pngR2i63679R3R4R5R46R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0041.pngR2i63679R3R4R5R47R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0042.pngR2i63679R3R4R5R48R6tgoR0y48:assets%2Fimages%2FopeningMovie%2Fopening0043.pngR2i63679R3R4R5R49R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_0.pngR2i11458R3R4R5R50R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_1.pngR2i11564R3R4R5R51R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_2.pngR2i11370R3R4R5R52R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_3.pngR2i11482R3R4R5R53R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_4.pngR2i11388R3R4R5R54R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_5.pngR2i11433R3R4R5R55R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_6.pngR2i11380R3R4R5R56R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_7.pngR2i11357R3R4R5R57R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_8.pngR2i11356R3R4R5R58R6tgoR0y45:assets%2Fimages%2Fsoundtray%2Fsoundtray_9.pngR2i11401R3R4R5R59R6tgoR0y46:assets%2Fimages%2Fsoundtray%2Fsoundtray_10.pngR2i11383R3R4R5R60R6tgoR0y51:assets%2Fimages%2Fbackgrounds%2Ftitlebackground.pngR2i247036R3R4R5R61R6tgoR0y57:assets%2Fimages%2Fbackgrounds%2Ftrackselectbackground.pngR2i570944R3R4R5R62R6tgoR0y53:assets%2Fimages%2Fbackgrounds%2Foptionsbackground.pngR2i721773R3R4R5R63R6tgoR0y42:assets%2Fimages%2FcreatedForNewgrounds.pngR2i26923R3R4R5R64R6tgoR0y43:assets%2Fimages%2FcreatedForNewgrounds2.pngR2i26795R3R4R5R65R6tgoR0y41:assets%2Fimages%2FbarryIsBreakdancing.pngR2i27103R3R4R5R66R6tgoR0y36:assets%2Fimages%2FmadeByCredits1.pngR2i27531R3R4R5R67R6tgoR0y36:assets%2Fimages%2FmadeByCredits2.pngR2i27251R3R4R5R68R6tgoR0y36:assets%2Fimages%2FpressESCtoskip.pngR2i2841R3R4R5R69R6tgoR0y37:assets%2Fimages%2FdialogueBox0001.pngR2i2059R3R4R5R70R6tgoR0y37:assets%2Fimages%2FdialogueBox0002.pngR2i2640R3R4R5R71R6tgoR0y37:assets%2Fimages%2FdialogueBox0003.pngR2i3973R3R4R5R72R6tgoR0y37:assets%2Fimages%2FdialogueBox0004.pngR2i5349R3R4R5R73R6tgoR0y37:assets%2Fimages%2FdialogueBox0005.pngR2i5260R3R4R5R74R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0001.pngR2i8218R3R4R5R75R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0002.pngR2i8238R3R4R5R76R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0003.pngR2i8237R3R4R5R77R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0004.pngR2i8140R3R4R5R78R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0005.pngR2i8105R3R4R5R79R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0006.pngR2i8155R3R4R5R80R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0007.pngR2i8218R3R4R5R81R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0008.pngR2i8238R3R4R5R82R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0009.pngR2i8237R3R4R5R83R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0010.pngR2i8140R3R4R5R84R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0011.pngR2i8105R3R4R5R85R6tgoR0y42:assets%2Fimages%2FpressEtoContinue0012.pngR2i8155R3R4R5R86R6tgoR0y32:assets%2Fimages%2FpressE0001.pngR2i563R3R4R5R87R6tgoR0y32:assets%2Fimages%2FpressE0002.pngR2i588R3R4R5R88R6tgoR0y28:assets%2Fimages%2Fpaused.pngR2i12047R3R4R5R89R6tgoR0y46:assets%2Fimages%2Fcursors%2Fpointer_cursor.pngR2i2693R3R4R5R90R6tgoR0y43:assets%2Fimages%2Fcursors%2Ftalk_cursor.pngR2i1795R3R4R5R91R6tgoR0y42:assets%2Fimages%2Fmainmenu%2Fstorymode.pngR2i11049R3R4R5R92R6tgoR0y44:assets%2Fimages%2Fmainmenu%2Ftrackselect.pngR2i11214R3R4R5R93R6tgoR0y43:assets%2Fimages%2Fmainmenu%2Fexitoption.pngR2i4429R3R4R5R94R6tgoR2i1916887R3y5:MUSICR5y31:assets%2Fmusic%2FtitleIntro.mp3y9:pathGroupaR96hR6tgoR2i1089954R3R95R5y30:assets%2Fmusic%2FtitleLoop.mp3R97aR98hR6tgoR2i102735R3R95R5y36:assets%2Fmusic%2FtrackSelectLoop.mp3R97aR99hR6tgoR2i1600643R3R95R5y30:assets%2Fmusic%2FTestClick.mp3R97aR100hR6tgoR2i26666R3y5:SOUNDR5y30:assets%2Fsounds%2FfightSFX.mp3R97aR102hR6tgoR2i7858R3R101R5y37:assets%2Fsounds%2FoptionChangeSFX.mp3R97aR103hR6tgoR2i15381R3R101R5y34:assets%2Fsounds%2FstateBackSFX.mp3R97aR104hR6tgoR2i12247R3R101R5y37:assets%2Fsounds%2FdialogueBlipSFX.mp3R97aR105hR6tgoR2i10366R3R101R5y35:assets%2Fsounds%2FvolumeBlipSFX.mp3R97aR106hR6tgoR2i14127R3R101R5y40:assets%2Fsounds%2FopenDialogueBoxSFX.mp3R97aR107hR6tgoR2i11620R3R101R5y37:assets%2Fsounds%2FdialogueNewLine.mp3R97aR108hR6tgoR0y35:assets%2Fimages%2Fmaps%2Fmap001.pngR2i524254R3R4R5R109R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0001.pngR2i31011R3R4R5R110R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0002.pngR2i31422R3R4R5R111R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0003.pngR2i31338R3R4R5R112R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0004.pngR2i31794R3R4R5R113R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0005.pngR2i31696R3R4R5R114R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0006.pngR2i31723R3R4R5R115R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0007.pngR2i31723R3R4R5R116R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0008.pngR2i31723R3R4R5R117R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0009.pngR2i31794R3R4R5R118R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0010.pngR2i31471R3R4R5R119R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0011.pngR2i31016R3R4R5R120R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0012.pngR2i30906R3R4R5R121R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0013.pngR2i31024R3R4R5R122R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0014.pngR2i31007R3R4R5R123R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0015.pngR2i31007R3R4R5R124R6tgoR0y74:assets%2Fimages%2Fcharacters%2FbarryAnims%2FbarryIdle%2FBarry_Idle0016.pngR2i31007R3R4R5R125R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0001.pngR2i27297R3R4R5R126R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0002.pngR2i27376R3R4R5R127R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0003.pngR2i27376R3R4R5R128R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0004.pngR2i27310R3R4R5R129R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0005.pngR2i27310R3R4R5R130R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0006.pngR2i27445R3R4R5R131R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0007.pngR2i27445R3R4R5R132R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0008.pngR2i27453R3R4R5R133R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0009.pngR2i27453R3R4R5R134R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0010.pngR2i27647R3R4R5R135R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0011.pngR2i27647R3R4R5R136R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0012.pngR2i27647R3R4R5R137R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0013.pngR2i27647R3R4R5R138R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0014.pngR2i27647R3R4R5R139R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0015.pngR2i27647R3R4R5R140R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0016.pngR2i27647R3R4R5R141R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0017.pngR2i27466R3R4R5R142R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0018.pngR2i27466R3R4R5R143R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0019.pngR2i27466R3R4R5R144R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0020.pngR2i27461R3R4R5R145R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0021.pngR2i27461R3R4R5R146R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0022.pngR2i27526R3R4R5R147R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0023.pngR2i27286R3R4R5R148R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0024.pngR2i27286R3R4R5R149R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0025.pngR2i27245R3R4R5R150R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0026.pngR2i27245R3R4R5R151R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0027.pngR2i27281R3R4R5R152R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0028.pngR2i27281R3R4R5R153R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0029.pngR2i27281R3R4R5R154R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0030.pngR2i27281R3R4R5R155R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0031.pngR2i27281R3R4R5R156R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0032.pngR2i27281R3R4R5R157R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0033.pngR2i27281R3R4R5R158R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0034.pngR2i27281R3R4R5R159R6tgoR0y70:assets%2Fimages%2Fcharacters%2FdusterAnims%2Fidle%2FdusterIdle0035.pngR2i27281R3R4R5R160R6tgoR0y75:assets%2Fimages%2Fcharacters%2FbarryAnims%2FFighting%2Fsketch_anims0001.pngR2i29787R3R4R5R161R6tgoR0y75:assets%2Fimages%2Fcharacters%2FbarryAnims%2FFighting%2Fsketch_anims0002.pngR2i29731R3R4R5R162R6tgoR0y75:assets%2Fimages%2Fcharacters%2FbarryAnims%2FFighting%2Fsketch_anims0003.pngR2i28928R3R4R5R163R6tgoR0y26:assets%2Fdata%2Fchart.jsonR2i309R3y4:TEXTR5R164R6tgoR2i39706R3R95R5y28:flixel%2Fsounds%2Fflixel.mp3R97aR166y28:flixel%2Fsounds%2Fflixel.ogghR6tgoR2i8220R3R95R5y26:flixel%2Fsounds%2Fbeep.mp3R97aR168y26:flixel%2Fsounds%2Fbeep.ogghR6tgoR2i6840R3R101R5R169R97aR168R169hgoR2i33629R3R101R5R167R97aR166R167hgoR2i15744R3y4:FONTy9:classNamey35:__ASSET__flixel_fonts_nokiafc22_ttfR5y30:flixel%2Ffonts%2Fnokiafc22.ttfR6tgoR2i29724R3R170R171y36:__ASSET__flixel_fonts_monsterrat_ttfR5y31:flixel%2Ffonts%2Fmonsterrat.ttfR6tgoR0y33:flixel%2Fimages%2Fui%2Fbutton.pngR2i222R3R4R5R176R6tgoR0y36:flixel%2Fimages%2Flogo%2Fdefault.pngR2i484R3R4R5R177R6tgh","rootPath":null,"version":2,"libraryArgs":[],"libraryType":null}';
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_titleintro_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_titleloop_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_trackselectloop_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_music_testclick_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_fightsfx_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_optionchangesfx_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_statebacksfx_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_dialogueblipsfx_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_volumeblipsfx_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_opendialogueboxsfx_mp3 extends null { }
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_sounds_dialoguenewline_mp3 extends null { }
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
@:keep @:bind @:noCompletion #if display private #end class __ASSET__assets_data_chart_json extends null { }
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