@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jI;19;BlendKit/BlendKit.ji;14;NSFoundation.ji;10;NSAppKit.ji;24;Nib2CibKeyedUnarchiver.ji;11;Converter.jt;19754;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("BlendKit/BlendKit.j",NO);
objj_executeFile("NSFoundation.j",YES);
objj_executeFile("NSAppKit.j",YES);
objj_executeFile("Nib2CibKeyedUnarchiver.j",YES);
objj_executeFile("Converter.j",YES);
var _1=require("file"),OS=require("os"),_2=require("system"),_3=require("jake").FileList,_4=require("narwhal/term").stream,_5=require("objective-j").StaticResource,_6="Aristo",_7=["Debug","Release"],_8="MainMenu",_9=new RegExp("^(defaultTheme|auxThemes|verbosity|quiet|frameworks|format)$"),_a=/"[^\"]+"|'[^\']+'|\S+/g;
var _b=objj_allocateClassPair(CPObject,"Nib2Cib"),_c=_b.isa;
class_addIvars(_b,[new objj_ivar("commandLineArgs"),new objj_ivar("parser"),new objj_ivar("nibInfo"),new objj_ivar("appDirectory"),new objj_ivar("resourcesDirectory"),new objj_ivar("infoPlist"),new objj_ivar("userNSClasses")]);
objj_registerClassPair(_b);
class_addMethods(_b,[new objj_method(sel_getUid("initWithArgs:"),function(_d,_e,_f){
with(_d){
_d=objj_msgSendSuper({receiver:_d,super_class:objj_getClass("Nib2Cib").super_class},"init");
if(_d){
commandLineArgs=_f;
parser=new (require("narwhal/args").Parser)();
nibInfo={};
appDirectory="";
resourcesDirectory="";
infoPlist=objj_msgSend(CPDictionary,"dictionary");
userNSClasses=[];
}
return _d;
}
}),new objj_method(sel_getUid("run"),function(_10,_11){
with(_10){
try{
var _12=objj_msgSend(_10,"parseOptionsFromArgs:",commandLineArgs);
objj_msgSend(_10,"setLogLevel:",_12.quiet?-1:_12.verbosity);
objj_msgSend(_10,"checkPrerequisites");
if(_12.watch){
objj_msgSend(_10,"watchWithOptions:",_12);
}else{
objj_msgSend(_10,"convertWithOptions:inputFile:",_12,nil);
}
}
catch(anException){
CPLog.fatal(objj_msgSend(_10,"exceptionReason:",anException));
OS.exit(1);
}
}
}),new objj_method(sel_getUid("checkPrerequisites"),function(_13,_14){
with(_13){
var _15=require("cappuccino/fontinfo").fontinfo,_16=_15("LucidaGrande",13);
if(!_16){
objj_msgSend(_13,"failWithMessage:","fontinfo does not appear to be installed");
}
}
}),new objj_method(sel_getUid("convertWithOptions:inputFile:"),function(_17,_18,_19,_1a){
with(_17){
try{
_1a=_1a||objj_msgSend(_17,"getInputFile:",_19.args);
objj_msgSend(_17,"getAppAndResourceDirectoriesFromInputFile:options:",_1a,_19);
if(_19.readStoredOptions){
_19=objj_msgSend(_17,"mergeOptionsWithStoredOptions:inputFile:",_19,_1a);
objj_msgSend(_17,"setLogLevel:",_19.quiet?-1:_19.verbosity);
}
if(!_19.quiet&&_19.verbosity>0){
objj_msgSend(_17,"printVersion");
}
var _1b=objj_msgSend(_17,"getOutputFileFromInputFile:args:",_1a,_19.args),_1c=objj_msgSend(_17,"readConfigFile:inputFile:",_19.configFile||"",_1a);
infoPlist=_1c.plist;
if(infoPlist){
var _1d=objj_msgSend(infoPlist,"valueForKey:","CPSystemFontFace");
if(_1d){
objj_msgSend(CPFont,"setSystemFontFace:",_1d);
}
var _1e=objj_msgSend(infoPlist,"valueForKey:","CPSystemFontSize");
if(_1e){
objj_msgSend(CPFont,"setSystemFontSize:",parseFloat(_1e,10));
}
}else{
infoPlist=objj_msgSend(CPDictionary,"dictionary");
}
var _1f=objj_msgSend(_17,"getThemeList:",_19),_20=objj_msgSend(_17,"loadThemesFromList:",_1f);
CPLog.info("\n-------------------------------------------------------------");
CPLog.info("Input         : "+_1a);
CPLog.info("Output        : "+_1b);
CPLog.info("Format        : "+["Auto","Mac","iPhone"][_19.format]);
CPLog.info("Application   : "+appDirectory);
CPLog.info("Resources     : "+resourcesDirectory);
CPLog.info("Frameworks    : "+(_19.frameworks||""));
CPLog.info("Default theme : "+_1f[0]);
CPLog.info("Aux themes    : "+_1f.slice(1).join(", "));
CPLog.info("Config file   : "+(_1c.path||""));
CPLog.info("System Font   : "+objj_msgSend(CPFont,"systemFontSize")+"px "+objj_msgSend(CPFont,"systemFontFace"));
CPLog.info("-------------------------------------------------------------\n");
var _21=objj_msgSend(objj_msgSend(Converter,"alloc"),"initWithInputPath:format:themes:",_1a,_19.format,_20);
objj_msgSend(_21,"setOutputPath:",_1b);
objj_msgSend(_21,"setResourcesPath:",resourcesDirectory);
var _22=function(){
objj_msgSend(_17,"loadNSClassesFromBundle:",objj_msgSend(CPBundle,"mainBundle"));
objj_msgSend(_21,"setUserNSClasses:",userNSClasses);
objj_msgSend(_21,"convert");
};
objj_msgSend(_17,"loadFrameworks:verbosity:callback:",_19.frameworks,_19.verbosity,_22);
return YES;
}
catch(anException){
CPLog.fatal(objj_msgSend(_17,"exceptionReason:",anException));
return NO;
}
}
}),new objj_method(sel_getUid("watchWithOptions:"),function(_23,_24,_25){
with(_23){
var _26=_25.quiet?-1:_25.verbosity,_27=_25.args[0];
if(!_27){
_27=_1.canonical(_1.isDirectory("Resources")?"Resources":".");
}else{
_27=_1.canonical(_27);
if(_1.basename(_27)!=="Resources"){
var _28=_1.join(_27,"Resources");
if(_1.isDirectory(_28)){
_27=_28;
}
}
}
if(!_1.isDirectory(_27)){
objj_msgSend(_23,"failWithMessage:","Cannot find the directory: "+_27);
}
objj_msgSend(_23,"setLogLevel:",1);
var _29=new _3(_1.join(_27,"*.[nx]ib")).items(),_2a=_29.length;
while(_2a--){
var nib=_29[_2a],cib=nib.substr(0,nib.length-4)+".cib";
if(_1.exists(cib)&&(_1.mtime(nib)-_1.mtime(cib))<=0){
nibInfo[nib]=_1.mtime(nib);
}
}
CPLog.info("Watching: "+CPLogColorize(_27,"debug"));
CPLog.info("Press Control-C to stop...");
while(true){
var _2b=objj_msgSend(_23,"getModifiedNibsInDirectory:",_27);
for(var i=0;i<_2b.length;++i){
var _2c=_2b[i][0],nib=_2b[i][1],_2d=_2c==="add"?"Added":"Modified",_2e=_2c==="add"?"info":"debug";
CPLog.info(">> %s: %s",CPLogColorize(_2d,_2e),nib);
if(_2c==="add"){
var cib=nib.substr(0,nib.length-4)+".cib";
if(_1.exists(cib)&&(_1.mtime(nib)-_1.mtime(cib))<0){
continue;
}
}
objj_msgSend(_23,"setLogLevel:",_26);
var _2f=objj_msgSend(_23,"convertWithOptions:inputFile:",_25,nib);
objj_msgSend(_23,"setLogLevel:",1);
if(_2f){
if(_26>0){
_4.print();
}else{
CPLog.warn("Conversion successful");
}
}
}
OS.sleep(1);
}
}
}),new objj_method(sel_getUid("parseOptionsFromArgs:"),function(_30,_31,_32){
with(_30){
parser.usage("[--watch DIRECTORY] [INPUT_FILE [OUTPUT_FILE]]");
parser.option("--watch","watch").set(true).help("Ask nib2cib to watch a directory for changes");
parser.option("-R","resourcesDir").set().displayName("directory").help("Set the Resources directory, usually unnecessary as it is inferred from the input path");
parser.option("--default-theme","defaultTheme").set().displayName("name").help("Specify a custom default theme which is not set in your Info.plist");
parser.option("-t","--theme","auxThemes").push().displayName("name").help("An additional theme loaded dynamically by your application");
parser.option("--config","configFile").set().displayName("path").help("A path to an Info.plist file from which the system font and/or size can be retrieved");
parser.option("-v","--verbose","verbosity").inc().help("Increase verbosity level");
parser.option("-q","--quiet","quiet").set(true).help("No output");
parser.option("-F","--framework","frameworks").push().help("Add a framework to load");
parser.option("--no-stored-options","readStoredOptions").set(false).def(true).help("Do not read stored options");
parser.option("--mac","format").set(NibFormatMac).def(NibFormatUndetermined).help("Set format to Mac");
parser.option("--version","showVersion").action(function(){
objj_msgSend(_30,"printVersionAndExit");
}).help("Show the version of nib2cib and quit");
parser.helpful();
var _33=parser.parse(_32,null,null,true);
if(_33.args.length>2){
parser.printUsage(_33);
OS.exit(0);
}
return _33;
}
}),new objj_method(sel_getUid("mergeOptionsWithStoredOptions:inputFile:"),function(_34,_35,_36,_37){
with(_34){
var _38=objj_msgSend(_34,"readStoredOptionsAtPath:",_1.join(_2.env["HOME"],".nib2cibconfig")),_39=objj_msgSend(_34,"readStoredOptionsAtPath:",_1.join(appDirectory,"nib2cib.conf")),_3a=_1.basename(_37,_1.extension(_37))+".conf",_3b=objj_msgSend(_34,"readStoredOptionsAtPath:",_1.join(_1.dirname(_37),_3a));
_38=objj_msgSend(_34,"parseOptionsFromArgs:",[_36.command].concat(_38));
_39=objj_msgSend(_34,"parseOptionsFromArgs:",[_36.command].concat(_39));
_3b=objj_msgSend(_34,"parseOptionsFromArgs:",[_36.command].concat(_3b));
var _3c=_38;
objj_msgSend(_34,"mergeOptions:with:",_39,_3c);
objj_msgSend(_34,"mergeOptions:with:",_3b,_3c);
objj_msgSend(_34,"mergeOptions:with:",_36,_3c);
_3c.args=_36.args;
return _3c;
}
}),new objj_method(sel_getUid("readStoredOptionsAtPath:"),function(_3d,_3e,_3f){
with(_3d){
_3f=_1.canonical(_3f);
if(!_1.isReadable(_3f)){
return [];
}
var _40=_1.open(_3f,"r"),_41=_40.readLine(),_42=_41.match(_a)||[];
_40.close();
CPLog.debug("Reading stored options: "+_3f);
if(_42){
for(var i=0;i<_42.length;++i){
var str=_42[i];
if((str.charAt(0)==="\""&&str.substr(-1)==="\"")||(str.charAt(0)==="'"&&str.substr(-1)==="'")){
_42[i]=str.substr(1,str.length-2);
}
}
return _42;
}else{
return [];
}
}
}),new objj_method(sel_getUid("printOptions:"),function(_43,_44,_45){
with(_43){
for(option in _45){
var _46=_45[option];
if(_46){
var _47=_46.length!==undefined?_46.length>0:!!_46;
if(_47){
print(option+": "+_46);
}
}
}
}
}),new objj_method(sel_getUid("mergeOptions:with:"),function(_48,_49,_4a,_4b){
with(_48){
for(option in _4a){
if(!_9.test(option)){
continue;
}
if(_4a.hasOwnProperty(option)){
var _4c=_4a[option];
if(_4c){
var _4d=_4c.length!==undefined?_4c.length>0:!!_4c;
if(_4d){
_4b[option]=_4c;
}
}
}
}
}
}),new objj_method(sel_getUid("setLogLevel:"),function(_4e,_4f,_50){
with(_4e){
CPLogUnregister(CPLogPrint);
if(_50===0){
CPLogRegister(CPLogPrint,"warn",logFormatter);
}else{
if(_50===1){
CPLogRegister(CPLogPrint,"info",logFormatter);
}else{
if(_50>1){
CPLogRegister(CPLogPrint,null,logFormatter);
}
}
}
}
}),new objj_method(sel_getUid("getInputFile:"),function(_51,_52,_53){
with(_51){
var _54=_53[0]||_8,_55="";
if(!/^.+\.[nx]ib$/.test(_54)){
if(_55=objj_msgSend(_51,"findInputFile:extension:",_54,".xib")){
_54=_55;
}else{
if(_55=objj_msgSend(_51,"findInputFile:extension:",_54,".nib")){
_54=_55;
}else{
objj_msgSend(_51,"failWithMessage:","Cannot find the input file (.xib or .nib): "+_1.canonical(_54));
}
}
}else{
if(_55=objj_msgSend(_51,"findInputFile:extension:",_54,nil)){
_54=_55;
}else{
objj_msgSend(_51,"failWithMessage:","Could not read the input file: "+_1.canonical(_54));
}
}
return _1.canonical(_54);
}
}),new objj_method(sel_getUid("findInputFile:extension:"),function(_56,_57,_58,_59){
with(_56){
var _5a=_58;
if(_59){
_5a+=_59;
}
if(_1.isReadable(_5a)){
return _5a;
}
if(_1.basename(_1.dirname(_58))!=="Resources"&&_1.isDirectory("Resources")){
_5a=_1.resolve(_5a,_1.join("Resources",_1.basename(_5a)));
if(_1.isReadable(_5a)){
return _5a;
}
}
return null;
}
}),new objj_method(sel_getUid("getAppAndResourceDirectoriesFromInputFile:options:"),function(_5b,_5c,_5d,_5e){
with(_5b){
appDirectory=resourcesDirectory="";
if(_5e.resourcesDir){
var _5f=_1.canonical(_5e.resourcesDir);
if(!_1.isDirectory(_5f)){
objj_msgSend(_5b,"failWithMessage:","Cannot read resources at: "+_5f);
}
resourcesDirectory=_5f;
}
var _60=_1.dirname(_5d);
if(_1.basename(_60)==="Resources"){
appDirectory=_1.dirname(_60);
resourcesDirectory=resourcesDirectory||_60;
}else{
appDirectory=_60;
if(!resourcesDirectory){
var _5f=_1.join(appDirectory,"Resources");
if(_1.isDirectory(_5f)){
resourcesDirectory=_5f;
}
}
}
}
}),new objj_method(sel_getUid("getOutputFileFromInputFile:args:"),function(_61,_62,_63,_64){
with(_61){
var _65=null;
if(_64.length>1){
_65=_64[1];
if(!/^.+\.cib$/.test(_65)){
_65+=".cib";
}
}else{
_65=_1.join(_1.dirname(_63),_1.basename(_63,_1.extension(_63)))+".cib";
}
_65=_1.canonical(_65);
if(!_1.isWritable(_1.dirname(_65))){
objj_msgSend(_61,"failWithMessage:","Cannot write the output file at: "+_65);
}
return _65;
}
}),new objj_method(sel_getUid("loadFrameworks:verbosity:callback:"),function(_66,_67,_68,_69,_6a){
with(_66){
if(!_68||_68.length===0){
return _6a();
}
var _6b=function(_6c){
return _6c;
};
_68.forEach(function(_6d){
objj_msgSend(_66,"setLogLevel:",_69);
var _6e=nil;
if(_6d.indexOf("/")===-1){
_6e=objj_msgSend(_66,"findInCappBuild:isDirectory:callback:",_6d,YES,_6b);
if(!_6e){
_6e=objj_msgSend(_66,"findInFrameworks:path:isDirectory:callback:",_1.join(appDirectory,"Frameworks"),_6d,YES,_6b);
}
if(!_6e){
_6e=objj_msgSend(_66,"findInInstalledFrameworks:isDirectory:callback:",_6d,YES,_6b);
}
}else{
_6e=_1.canonical(_6d);
}
if(!_6e){
objj_msgSend(_66,"failWithMessage:","Cannot find the framework \""+_6d+"\"");
}
CPLog.debug("Loading framework: "+_6e);
try{
objj_msgSend(_66,"setLogLevel:",-1);
var _6f=objj_msgSend(objj_msgSend(CPBundle,"alloc"),"initWithPath:",_6e);
objj_msgSend(_6f,"loadWithDelegate:",nil);
objj_msgSend(_66,"setLogLevel:",_69);
objj_msgSend(_66,"loadNSClassesFromBundle:",_6f);
}
finally{
objj_msgSend(_66,"setLogLevel:",_69);
}
require("browser/timeout").serviceTimeouts();
});
_6a();
}
}),new objj_method(sel_getUid("loadNSClassesFromBundle:"),function(_70,_71,_72){
with(_70){
var _73=objj_msgSend(_72,"objectForInfoDictionaryKey:","NSClasses")||[],_74=objj_msgSend(_72,"bundlePath");
for(var i=0;i<_73.length;++i){
if(userNSClasses.indexOf(_73[i])>=0){
continue;
}
var _75=_1.join(_74,"NS_"+_73[i]+".j");
objj_importFile(_75,YES);
CPLog.debug("Imported NS class: %s",_75);
userNSClasses.push(_73[i]);
}
}
}),new objj_method(sel_getUid("getThemeList:"),function(_76,_77,_78){
with(_76){
var _79=_78.defaultTheme;
if(!_79){
_79=objj_msgSend(infoPlist,"valueForKey:","CPDefaultTheme");
}
if(!_79){
_79=objj_msgSend(_76,"getAppKitDefaultThemeName");
}
var _7a=objj_msgSend(CPSet,"setWithObject:",_79);
if(_78.auxThemes){
objj_msgSend(_7a,"addObjectsFromArray:",_78.auxThemes);
}
var _7b=infoPlist.valueForKey("CPAuxiliaryThemes");
if(_7b){
objj_msgSend(_7a,"addObjectsFromArray:",_7b);
}
objj_msgSend(_7a,"removeObject:",_79);
var _7c=objj_msgSend(_7a,"allObjects");
objj_msgSend(_7c,"insertObject:atIndex:",_79,0);
return _7c;
}
}),new objj_method(sel_getUid("findInCappBuild:isDirectory:callback:"),function(_7d,_7e,_7f,_80,_81){
with(_7d){
var _82=_2.env["CAPP_BUILD"];
if(!_82){
return undefined;
}
_82=_1.canonical(_82);
if(_1.isDirectory(_82)){
var _83=null;
for(var i=0;i<_7.length&&!_83;++i){
var _84=_1.join(_82,_7[i],_7f);
if((_80&&_1.isDirectory(_84))||(!_80&&_1.exists(_84))){
_83=_81(_84);
}
}
return _83;
}else{
return false;
}
}
}),new objj_method(sel_getUid("findInInstalledFrameworks:isDirectory:callback:"),function(_85,_86,_87,_88,_89){
with(_85){
return objj_msgSend(_85,"findInFrameworks:path:isDirectory:callback:",_1.canonical(_1.join(_2.prefix,"packages/cappuccino/Frameworks")),_87,_88,_89);
}
}),new objj_method(sel_getUid("findInFrameworks:path:isDirectory:callback:"),function(_8a,_8b,_8c,_8d,_8e,_8f){
with(_8a){
var _90=null,_91=_1.join(_8c,"Debug",_8d);
if((_8e&&_1.isDirectory(_91))||(!_8e&&_1.exists(_91))){
_90=_8f(_91);
}
if(!_90){
_91=_1.join(_8c,_8d);
if((_8e&&_1.isDirectory(_91))||(!_8e&&_1.exists(_91))){
_90=_8f(_91);
}
}
return _90;
}
}),new objj_method(sel_getUid("getAppKitDefaultThemeName"),function(_92,_93){
with(_92){
var _94=function(_95){
return objj_msgSend(_92,"themeNameFromPropertyList:",_95);
},_96=objj_msgSend(_92,"findInCappBuild:isDirectory:callback:","AppKit/Info.plist",NO,_94);
if(!_96){
_96=objj_msgSend(_92,"findInInstalledFrameworks:isDirectory:callback:","AppKit/Info.plist",NO,_94);
}
return _96||_6;
}
}),new objj_method(sel_getUid("themeNameFromPropertyList:"),function(_97,_98,_99){
with(_97){
if(!_1.isReadable(_99)){
return nil;
}
var _9a=nil,_9b=CFPropertyList.readPropertyListFromFile(_99);
if(_9b){
_9a=_9b.valueForKey("CPDefaultTheme");
}
return _9a;
}
}),new objj_method(sel_getUid("loadThemesFromList:"),function(_9c,_9d,_9e){
with(_9c){
var _9f=[];
for(var i=0;i<_9e.length;++i){
_9f.push(objj_msgSend(_9c,"loadThemeNamed:directory:",_9e[i],resourcesDirectory));
}
return _9f;
}
}),new objj_method(sel_getUid("loadThemeNamed:directory:"),function(_a0,_a1,_a2,_a3){
with(_a0){
if(/^.+\.blend$/.test(_a2)){
_a2=_a2.substr(0,_a2.length-".blend".length);
}
var _a4=_a2+".blend",_a5="";
if(_a3){
_a5=_1.join(_1.canonical(_a3),_a4);
if(!_1.isDirectory(_a5)){
_a5=_a3=null;
}
}
if(!_a3){
var _a6=function(_a7){
return _a7;
};
_a5=objj_msgSend(_a0,"findInCappBuild:isDirectory:callback:",_a4,YES,_a6);
if(!_a5){
_a5=objj_msgSend(_a0,"findInInstalledFrameworks:isDirectory:callback:","AppKit/Resources/"+_a4,YES,_a6);
}
if(!_a5){
var _a8=_1.canonical(_a4);
if(_1.isDirectory(_a8)){
_a5=_a8;
}
}
}
if(!_a5){
objj_msgSend(_a0,"failWithMessage:","Cannot find the theme \""+_a2+"\"");
}
return objj_msgSend(_a0,"readThemeWithName:atPath:",_a2,_a5);
}
}),new objj_method(sel_getUid("readThemeWithName:atPath:"),function(_a9,_aa,_ab,_ac){
with(_a9){
var _ad=new CFBundle(_ac);
_ad.mostEligibleEnvironment=function(){
return "Browser";
};
_ad.load();
var _ae=_ad.valueForInfoDictionaryKey("CPKeyedThemes");
if(!_ae){
objj_msgSend(_a9,"failWithMessage:","Could not find the keyed themes in the theme: "+_ac);
}
var _af=_ae.indexOf(_ab+".keyedtheme");
if(_af<0){
objj_msgSend(_a9,"failWithMessage:","Could not find the main theme data ("+_ab+".keyedtheme"+") in the theme: "+_ac);
}
var _b0=_ad.pathForResource(_ae[_af]),_b1=new CFMutableData();
_b1.setRawString(_5.resourceAtURL(new CFURL(_b0),true).contents());
var _b2=objj_msgSend(CPKeyedUnarchiver,"unarchiveObjectWithData:",_b1);
if(!_b2){
objj_msgSend(_a9,"failWithMessage:","Could not unarchive the theme at: "+_ac);
}
CPLog.debug("Loaded theme: "+_ac);
return _b2;
}
}),new objj_method(sel_getUid("readConfigFile:inputFile:"),function(_b3,_b4,_b5,_b6){
with(_b3){
var _b7=null,_b8;
if(_b5){
_b8=_1.canonical(_b5);
if(!_1.isReadable(_b8)){
objj_msgSend(_b3,"failWithMessage:","Cannot find the config file: "+_b8);
}
_b7=_b8;
}else{
_b8=_1.join(appDirectory,"Info.plist");
if(_1.isReadable(_b8)){
_b7=_b8;
}
}
var _b9=null;
if(_b7){
var _b9=_1.read(_b7);
if(!_b9){
objj_msgSend(_b3,"failWithMessage:","Could not read the Info.plist at: "+_b7);
}
_b9=CFPropertyList.propertyListFromString(_b9);
if(!_b9){
objj_msgSend(_b3,"failWithMessage:","Could not parse the Info.plist at: "+_b7);
}
}
return {path:_b7,plist:_b9};
}
}),new objj_method(sel_getUid("getModifiedNibsInDirectory:"),function(_ba,_bb,_bc){
with(_ba){
var _bd=new _3(_1.join(_bc,"*.[nx]ib")).items(),_be=_bd.length,_bf={},_c0=[];
while(_be--){
var nib=_bd[_be];
_bf[nib]=_1.mtime(nib);
if(!nibInfo.hasOwnProperty(nib)){
_c0.push(["add",nib]);
}else{
if(_bf[nib]-nibInfo[nib]!==0){
_c0.push(["mod",nib]);
}
delete nibInfo[nib];
}
}
for(var nib in nibInfo){
if(nibInfo.hasOwnProperty(nib)){
CPLog.info(">> %s: %s",CPLogColorize("Deleted","warn"),nib);
}
}
nibInfo=_bf;
return _c0;
}
}),new objj_method(sel_getUid("printVersionAndExit"),function(_c1,_c2){
with(_c1){
objj_msgSend(_c1,"printVersion");
OS.exit(0);
}
}),new objj_method(sel_getUid("printVersion"),function(_c3,_c4){
with(_c3){
var _c5=_1.dirname(_1.dirname(_1.canonical(_2.args[0]))),_c6=null;
if(_1.basename(_c5)==="narwhal"){
_c5=_1.join(_c5,"packages","cappuccino");
}
_c5=_1.join(_c5,"lib","nib2cib","Info.plist");
if(_1.isReadable(_c5)){
var _c7=_1.read(_c5);
if(!_c7){
return;
}
_c7=CFPropertyList.propertyListFromString(_c7);
if(!_c7){
return;
}
_c6=_c7.valueForKey("CPBundleVersion");
if(_c6){
_4.print("nib2cib v"+_c6);
}
}
if(!_c6){
_4.print("<No version info available>");
}
}
}),new objj_method(sel_getUid("exceptionReason:"),function(_c8,_c9,_ca){
with(_c8){
if(typeof (_ca)==="string"){
return _ca;
}else{
if(_ca.isa&&objj_msgSend(_ca,"respondsToSelector:",sel_getUid("reason"))){
return objj_msgSend(_ca,"reason");
}else{
return "An unknown error occurred";
}
}
}
}),new objj_method(sel_getUid("failWithMessage:"),function(_cb,_cc,_cd){
with(_cb){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,_cd);
}
})]);
logFormatter=function(_ce,_cf,_d0){
if(_cf==="info"){
return _ce;
}else{
return CPLogColorize(_ce,_cf);
}
};
