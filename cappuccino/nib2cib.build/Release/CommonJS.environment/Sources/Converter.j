@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jI;19;BlendKit/BlendKit.ji;15;Converter+Mac.jt;4667;
objj_executeFile("Foundation/Foundation.j",NO);
objj_executeFile("AppKit/AppKit.j",NO);
objj_executeFile("BlendKit/BlendKit.j",NO);
var _1=require("file"),OS=require("os"),_2=nil;
NibFormatUndetermined=0,NibFormatMac=1,NibFormatIPhone=2;
ConverterModeLegacy=0;
ConverterModeNew=1;
ConverterConversionException="ConverterConversionException";
var _3=objj_allocateClassPair(CPObject,"Converter"),_4=_3.isa;
class_addIvars(_3,[new objj_ivar("inputPath"),new objj_ivar("outputPath"),new objj_ivar("resourcesPath"),new objj_ivar("format"),new objj_ivar("themes"),new objj_ivar("userNSClasses")]);
objj_registerClassPair(_3);
class_addMethods(_3,[new objj_method(sel_getUid("inputPath"),function(_5,_6){
with(_5){
return inputPath;
}
}),new objj_method(sel_getUid("outputPath"),function(_7,_8){
with(_7){
return outputPath;
}
}),new objj_method(sel_getUid("setOutputPath:"),function(_9,_a,_b){
with(_9){
outputPath=_b;
}
}),new objj_method(sel_getUid("resourcesPath"),function(_c,_d){
with(_c){
return resourcesPath;
}
}),new objj_method(sel_getUid("setResourcesPath:"),function(_e,_f,_10){
with(_e){
resourcesPath=_10;
}
}),new objj_method(sel_getUid("format"),function(_11,_12){
with(_11){
return format;
}
}),new objj_method(sel_getUid("themes"),function(_13,_14){
with(_13){
return themes;
}
}),new objj_method(sel_getUid("userNSClasses"),function(_15,_16){
with(_15){
return userNSClasses;
}
}),new objj_method(sel_getUid("setUserNSClasses:"),function(_17,_18,_19){
with(_17){
userNSClasses=_19;
}
}),new objj_method(sel_getUid("initWithInputPath:format:themes:"),function(_1a,_1b,_1c,_1d,_1e){
with(_1a){
_1a=objj_msgSendSuper({receiver:_1a,super_class:objj_getClass("Converter").super_class},"init");
if(_1a){
_2=_1a;
inputPath=_1c;
format=_1d;
themes=_1e;
}
return _1a;
}
}),new objj_method(sel_getUid("convert"),function(_1f,_20){
with(_1f){
if(objj_msgSend(resourcesPath,"length")&&!_1.isReadable(resourcesPath)){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"Could not read Resources at path \""+resourcesPath+"\"");
}
var _21=format;
if(_21===NibFormatUndetermined){
_21=NibFormatMac;
if(_1.extension(inputPath)!==".nib"&&_1.isFile(inputPath)&&_1.read(inputPath,{charset:"UTF-8"}).indexOf("<archive type=\"com.apple.InterfaceBuilder3.CocoaTouch.XIB\"")!==-1){
_21=NibFormatIPhone;
}
if(_21===NibFormatMac){
CPLog.info("Auto-detected Cocoa Nib or Xib File");
}else{
CPLog.info("Auto-detected CocoaTouch Xib File");
}
}
var _22=objj_msgSend(_1f,"CPCompliantNibDataAtFilePath:",inputPath);
if(_21===NibFormatMac){
var _23=objj_msgSend(_1f,"convertedDataFromMacData:resourcesPath:",_22,resourcesPath);
}else{
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"nib2cib does not understand this nib format.");
}
if(!objj_msgSend(outputPath,"length")){
outputPath=inputPath.substr(0,inputPath.length-_1.extension(inputPath).length)+".cib";
}
_1.write(outputPath,objj_msgSend(_23,"rawString"),{charset:"UTF-8"});
CPLog.info(CPLogColorize("Conversion successful","warn"));
}
}),new objj_method(sel_getUid("CPCompliantNibDataAtFilePath:"),function(_24,_25,_26){
with(_24){
CPLog.info("Converting Xib file to plist...");
var _27="",_28="";
try{
_27=_1.join("/tmp",_1.basename(_26)+".tmp.nib");
if(OS.popen(["/usr/bin/ibtool",_26,"--compile",_27]).wait()===1){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"Could not compile file: "+_26);
}
var _28=_1.join("/tmp",_1.basename(_26)+".tmp.plist");
if(OS.popen(["/usr/bin/plutil","-convert","xml1",_27,"-o",_28]).wait()===1){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"Could not convert to xml plist for file: "+_26);
}
if(!_1.isReadable(_28)){
objj_msgSend(CPException,"raise:reason:",ConverterConversionException,"Unable to convert nib file.");
}
var _29=_1.read(_28,{charset:"UTF-8"});
if(system.engine==="rhino"){
_29=String(java.lang.String(_29).replaceAll("\\<key\\>\\s*CF\\$UID\\s*\\</key\\>","<key>CP\\$UID</key>"));
}else{
_29=_29.replace(/\<key\>\s*CF\$UID\s*\<\/key\>/g,"<key>CP$UID</key>");
}
_29=_29.replace(/<string>[\u0000-\u0008\u000B\u000C\u000E-\u001F]<\/string>/g,function(c){
CPLog.warn("Warning: converting character 0x"+c.charCodeAt(8).toString(16)+" to base64 representation");
return "<string type=\"base64\">"+CFData.encodeBase64String(c.charAt(8))+"</string>";
});
}
finally{
if(_27!==""&&_1.isWritable(_27)){
_1.remove(_27);
}
if(_28!==""&&_1.isWritable(_28)){
_1.remove(_28);
}
}
return objj_msgSend(CPData,"dataWithRawString:",_29);
}
})]);
class_addMethods(_4,[new objj_method(sel_getUid("sharedConverter"),function(_2a,_2b){
with(_2a){
return _2;
}
})]);
objj_executeFile("Converter+Mac.j",YES);
