@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;19;Foundation/CPData.jI;24;Foundation/CPException.jI;21;Foundation/CPString.jI;19;BlendKit/BlendKit.ji;14;NSFoundation.ji;10;NSAppKit.jt;5793;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPData.j", NO);objj_executeFile("Foundation/CPException.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("BlendKit/BlendKit.j", NO);objj_executeFile("NSFoundation.j", YES);objj_executeFile("NSAppKit.j", YES);var FILE = require("file"),
    OS = require("os"),
    SharedConverter = nil;
(NibFormatUndetermined = 0, NibFormatMac = 1, NibFormatIPhone = 2);
ConverterModeLegacy = 0;
ConverterModeNew = 1;
ConverterConversionException = "ConverterConversionException";
{var the_class = objj_allocateClassPair(CPObject, "Converter"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("inputPath"), new objj_ivar("outputPath")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("inputPath"), function $Converter__inputPath(self, _cmd)
{
    return self.inputPath;
}
,["CPString"]), new objj_method(sel_getUid("outputPath"), function $Converter__outputPath(self, _cmd)
{
    return self.outputPath;
}
,["CPString"]), new objj_method(sel_getUid("setOutputPath:"), function $Converter__setOutputPath_(self, _cmd, newValue)
{
    self.outputPath = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("initWithInputPath:outputPath:"), function $Converter__initWithInputPath_outputPath_(self, _cmd, anInputPath, anOutputPath)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Converter").super_class }, "init");
    if (self)
    {
        if (!SharedConverter)
            SharedConverter = self;
        self.inputPath = anInputPath;
        self.outputPath = anOutputPath;
    }
    return self;
}
,["id","CPString","CPString"]), new objj_method(sel_getUid("convert"), function $Converter__convert(self, _cmd)
{
    var inferredFormat = NibFormatMac;
    if (FILE.extension(self.inputPath) !== ".nib" && FILE.isFile(self.inputPath) && (FILE.read(self.inputPath, {charset: "UTF-8"})).indexOf("<archive type=\"com.apple.InterfaceBuilder3.CocoaTouch.XIB\"") !== -1)
        inferredFormat = NibFormatIPhone;
    if (inferredFormat === NibFormatMac)
        CPLog.info("Auto-detected Cocoa nib or xib File");
    else
        CPLog.info("Auto-detected CocoaTouch xib File");
    CPLog.info("Converting xib file to plist...");
    var nibData = self.isa.objj_msgSend1(self, "CPCompliantNibDataAtFilePath:", self.inputPath);
    if (inferredFormat === NibFormatMac)
        var convertedData = self.isa.objj_msgSend1(self, "convertedDataFromMacData:", nibData);
    else
        CPException.isa.objj_msgSend2(CPException, "raise:reason:", ConverterConversionException, "nib2cib does not understand this nib format.");
    if (((___r1 = self.outputPath), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length")))
        FILE.write(self.outputPath, (convertedData == null ? null : convertedData.isa.objj_msgSend0(convertedData, "rawString")), {charset: "UTF-8"});
    CPLog.info("Conversion successful");
    return convertedData;
    var ___r1;
}
,["CPData"]), new objj_method(sel_getUid("CPCompliantNibDataAtFilePath:"), function $Converter__CPCompliantNibDataAtFilePath_(self, _cmd, aFilePath)
{
    var temporaryNibFilePath = "",
        temporaryPlistFilePath = "";
    try    {
        if (((___r1 = self.outputPath), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "length")))
        {
            temporaryNibFilePath = FILE.join("/tmp", FILE.basename(aFilePath) + ".tmp.nib");
            if ((OS.popen(["/usr/bin/ibtool", aFilePath, "--compile", temporaryNibFilePath])).wait() === 1)
                CPException.isa.objj_msgSend2(CPException, "raise:reason:", ConverterConversionException, "Could not compile file: " + aFilePath);
        }
        else
        {
            temporaryNibFilePath = aFilePath;
        }
        var temporaryPlistFilePath = FILE.join("/tmp", FILE.basename(aFilePath) + ".tmp.plist");
        if ((OS.popen(["/usr/bin/plutil", "-convert", "xml1", temporaryNibFilePath, "-o", temporaryPlistFilePath])).wait() === 1)
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", ConverterConversionException, "Could not convert to xml plist for file: " + aFilePath);
        if (!FILE.isReadable(temporaryPlistFilePath))
            CPException.isa.objj_msgSend2(CPException, "raise:reason:", ConverterConversionException, "Unable to convert nib file.");
        var plistContents = FILE.read(temporaryPlistFilePath, {charset: "UTF-8"});
        if (system.engine === "rhino")
            plistContents = String((java.lang.String(plistContents)).replaceAll("\\<key\\>\\s*CF\\$UID\\s*\\<\/key\\>", "<key>CP\\$UID</key>"));
        else
            plistContents = plistContents.replace(/\<key\>\s*CF\$UID\s*\<\/key\>/g, "<key>CP$UID</key>");
        plistContents = plistContents.replace(/<string>[\u0000-\u0008\u000B\u000C\u000E-\u001F]<\/string>/g, function(c)
        {
            CPLog.warn("Warning: converting character 0x" + (c.charCodeAt(8)).toString(16) + " to base64 representation");
            return "<string type=\"base64\">" + CFData.encodeBase64String(c.charAt(8)) + "</string>";
        });
    }
    finally     {
        if (temporaryNibFilePath !== "" && FILE.isWritable(temporaryNibFilePath))
            FILE.remove(temporaryNibFilePath);
        if (temporaryPlistFilePath !== "" && FILE.isWritable(temporaryPlistFilePath))
            FILE.remove(temporaryPlistFilePath);
    }
    return CPData.isa.objj_msgSend1(CPData, "dataWithRawString:", plistContents);
    var ___r1;
}
,["CPData","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedConverter"), function $Converter__sharedConverter(self, _cmd)
{
    return SharedConverter;
}
,["Converter"])]);
}