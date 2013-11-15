@STATIC;1.0;I;21;Foundation/CPObject.jI;20;Foundation/CPArray.jI;25;Foundation/CPDictionary.jI;21;Foundation/CPString.jI;22;AppKit/CPApplication.jI;19;BlendKit/BlendKit.ji;24;Nib2CibKeyedUnarchiver.ji;11;Converter.ji;15;Converter+Mac.jt;32607;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("Foundation/CPDictionary.j", NO);objj_executeFile("Foundation/CPString.j", NO);objj_executeFile("AppKit/CPApplication.j", NO);objj_executeFile("BlendKit/BlendKit.j", NO);objj_executeFile("Nib2CibKeyedUnarchiver.j", YES);objj_executeFile("Converter.j", YES);objj_executeFile("Converter+Mac.j", YES);Nib2CibColorizeOutput = YES;
var FILE = require("file"),
    OS = require("os"),
    SYS = require("system"),
    FileList = (require("jake")).FileList,
    stream = (require("narwhal/term")).stream,
    StaticResource = (require("objective-j")).StaticResource,
    DefaultTheme = "Aristo2",
    BuildTypes = ["Debug", "Release"],
    DefaultFile = "MainMenu",
    AllowedStoredOptionsRe = new RegExp("^(defaultTheme|auxThemes|verbosity|quiet|frameworks|format)$"),
    ArgsRe = /"[^\"]+"|'[^\']+'|\S+/g,
    SharedNib2Cib = nil;
{var the_class = objj_allocateClassPair(CPObject, "Nib2Cib"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("commandLineArgs"), new objj_ivar("parser"), new objj_ivar("commandLineOptions"), new objj_ivar("nibInfo"), new objj_ivar("appDirectory"), new objj_ivar("frameworks"), new objj_ivar("appResourceDirectory"), new objj_ivar("infoPlist"), new objj_ivar("userNSClasses"), new objj_ivar("themes")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("appDirectory"), function $Nib2Cib__appDirectory(self, _cmd)
{
    return self.appDirectory;
}
,["CPString"]), new objj_method(sel_getUid("frameworks"), function $Nib2Cib__frameworks(self, _cmd)
{
    return self.frameworks;
}
,["CPDictionary"]), new objj_method(sel_getUid("appResourceDirectory"), function $Nib2Cib__appResourceDirectory(self, _cmd)
{
    return self.appResourceDirectory;
}
,["CPString"]), new objj_method(sel_getUid("infoPlist"), function $Nib2Cib__infoPlist(self, _cmd)
{
    return self.infoPlist;
}
,["CPDictionary"]), new objj_method(sel_getUid("userNSClasses"), function $Nib2Cib__userNSClasses(self, _cmd)
{
    return self.userNSClasses;
}
,["CPArray"]), new objj_method(sel_getUid("themes"), function $Nib2Cib__themes(self, _cmd)
{
    return self.themes;
}
,["CPArray"]), new objj_method(sel_getUid("initWithArgs:"), function $Nib2Cib__initWithArgs_(self, _cmd, theArgs)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Nib2Cib").super_class }, "init");
    if (self)
    {
        if (!SharedNib2Cib)
            SharedNib2Cib = self;
        self.commandLineArgs = theArgs;
        self.parser = new (require("narwhal/args")).Parser();
        self.nibInfo = {};
        self.appDirectory = "";
        self.frameworks = objj_msgSend(CPDictionary, "dictionary");
        self.appResourceDirectory = "";
        self.infoPlist = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        self.userNSClasses = [];
        self.themes = [];
    }
    return self;
}
,["id","CPArray"]), new objj_method(sel_getUid("run"), function $Nib2Cib__run(self, _cmd)
{
    try    {
        self.commandLineOptions = objj_msgSend(self, "parseOptionsFromArgs:", self.commandLineArgs);
        Nib2CibColorizeOutput = !self.commandLineOptions.noColors;
        objj_msgSend(self, "setLogLevel:", self.commandLineOptions.quiet ? -1 : self.commandLineOptions.verbosity);
        objj_msgSend(self, "checkPrerequisites");
        if (self.commandLineOptions.watch)
            objj_msgSend(self, "watchWithOptions:", self.commandLineOptions);
        else
        {
            var success = objj_msgSend(self, "convertWithOptions:inputPath:", self.commandLineOptions, nil);
            if (!success)
                OS.exit(1);
        }
    }
    catch(anException)     {
        objj_msgSend(self, "logError:", objj_msgSend(self, "exceptionReason:", anException));
        OS.exit(1);
    }}
,["void"]), new objj_method(sel_getUid("checkPrerequisites"), function $Nib2Cib__checkPrerequisites(self, _cmd)
{
    var fontinfo = (require("cappuccino/fontinfo")).fontinfo,
        info = fontinfo("LucidaGrande", 13);
    if (!info)
        objj_msgSend(self, "failWithMessage:", "fontinfo does not appear to be installed");
}
,["void"]), new objj_method(sel_getUid("enumerateFrameworks"), function $Nib2Cib__enumerateFrameworks(self, _cmd)
{
    var frameworksDirectory = FILE.join(self.appDirectory, "Frameworks"),
        debugFrameworksDirectory = FILE.join(frameworksDirectory, "Debug");
    [debugFrameworksDirectory, frameworksDirectory].forEach(function(directory)
    {
        if (FILE.isDirectory(directory))
        {
            var frameworkList = FILE.list(directory);
            frameworkList.forEach(function(framework)
            {
                if (framework !== "Debug" && !objj_msgSend(self.frameworks, "containsKey:", framework))
                {
                    var resourceDirectory = FILE.join(directory, framework, "Resources");
                    if (FILE.isDirectory(resourceDirectory))
                        resourceDirectory = FILE.canonical(resourceDirectory);
                    else
                        resourceDirectory = "";
                    objj_msgSend(self.frameworks, "setValue:forKey:", {resourceDirectory: resourceDirectory, loaded: false}, framework);
                }
            });
        }
    });
}
,["void"]), new objj_method(sel_getUid("convertWithOptions:inputPath:"), function $Nib2Cib__convertWithOptions_inputPath_(self, _cmd, options, inputPath)
{
    try    {
        inputPath = inputPath || objj_msgSend(self, "getInputPath:", options.args);
        objj_msgSend(self, "getAppAndResourceDirectoriesFromInputPath:options:", inputPath, options);
        objj_msgSend(self, "enumerateFrameworks");
        if (options.readStoredOptions)
        {
            options = objj_msgSend(self, "mergeOptionsWithStoredOptions:inputPath:", options, inputPath);
            objj_msgSend(self, "setLogLevel:", options.quiet ? -1 : options.verbosity);
        }
        if (!options.quiet && options.verbosity > 0)
            objj_msgSend(self, "printVersion");
        var configInfo = objj_msgSend(self, "readConfigFile:inputPath:", options.configFile || "", inputPath),
            outputPath = objj_msgSend(self, "getOutputPathFromInputPath:args:", inputPath, options.args);
        self.infoPlist = configInfo.plist;
        if (self.infoPlist)
        {
            var systemFontFace = objj_msgSend(self.infoPlist, "valueForKey:", "CPSystemFontFace");
            if (systemFontFace)
                objj_msgSend(CPFont, "setSystemFontFace:", systemFontFace);
            var systemFontSize = objj_msgSend(self.infoPlist, "valueForKey:", "CPSystemFontSize");
            if (systemFontSize)
                objj_msgSend(CPFont, "setSystemFontSize:", parseFloat(systemFontSize, 10));
        }
        else
            self.infoPlist = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        var themeList = objj_msgSend(self, "getThemeList:", options);
        objj_msgSend(self, "loadThemesFromList:", themeList);
        objj_msgSend(self, "loadFrameworks:verbosity:", options.frameworks, options.verbosity);
        objj_msgSend(self, "loadNSClassesFromBundle:", objj_msgSend(CPBundle, "mainBundle"));
        var frameworkList = [];
        objj_msgSend(self.frameworks, "allKeys").forEach(function(name)
        {
            var info = objj_msgSend(self.frameworks, "valueForKey:", name);
            if (info.resourceDirectory)
                name += "*";
            if (info.loaded)
                name += "+";
            frameworkList.push(name);
        });
        CPLog.info("\n-------------------------------------------------------------");
        CPLog.info("Input         : " + inputPath);
        CPLog.info("Output        : " + outputPath);
        CPLog.info("Application   : " + self.appDirectory);
        CPLog.info("Frameworks    : " + (frameworkList.join(", ") || ""));
        CPLog.info("Default theme : " + themeList[0]);
        CPLog.info("Aux themes    : " + (themeList.slice(1)).join(", "));
        CPLog.info("Config file   : " + (configInfo.path || ""));
        CPLog.info("System Font   : " + objj_msgSend(CPFont, "systemFontSize") + "px " + objj_msgSend(CPFont, "systemFontFace"));
        CPLog.info("-------------------------------------------------------------\n");
        var converter = objj_msgSend(objj_msgSend(Converter, "alloc"), "initWithInputPath:outputPath:", inputPath, outputPath);
        objj_msgSend(converter, "convert");
        return YES;
    }
    catch(anException)     {
        objj_msgSend(self, "logError:", objj_msgSend(self, "exceptionReason:", anException));
        return NO;
    }}
,["BOOL","JSObject","CPString"]), new objj_method(sel_getUid("watchWithOptions:"), function $Nib2Cib__watchWithOptions_(self, _cmd, options)
{
    var verbosity = options.quiet ? -1 : options.verbosity,
        watchDir = options.args[0];
    if (!watchDir)
        watchDir = FILE.canonical(FILE.isDirectory("Resources") ? "Resources" : ".");
    else
    {
        watchDir = FILE.canonical(watchDir);
        if (FILE.basename(watchDir) !== "Resources")
        {
            var path = FILE.join(watchDir, "Resources");
            if (FILE.isDirectory(path))
                watchDir = path;
        }
    }
    if (!FILE.isDirectory(watchDir))
        objj_msgSend(self, "failWithMessage:", "Cannot find the directory: " + watchDir);
    objj_msgSend(self, "setLogLevel:", 1);
    var nibs = (new FileList(FILE.join(watchDir, "*.[nx]ib"))).items(),
        count = nibs.length;
    while (count--)
    {
        var nib = nibs[count],
            cib = nib.substr(0, nib.length - 4) + ".cib";
        if (FILE.exists(cib) && FILE.mtime(nib) - FILE.mtime(cib) <= 0)
            self.nibInfo[nib] = FILE.mtime(nib);
    }
    CPLog.info("Watching: " + CPLogColorize(watchDir, "debug"));
    CPLog.info("Press Control-C to stop...");
    while (true)
    {
        var modifiedNibs = objj_msgSend(self, "getModifiedNibsInDirectory:", watchDir);
        for (var i = 0; i < modifiedNibs.length; ++i)
        {
            var action = modifiedNibs[i][0],
                nib = modifiedNibs[i][1],
                label = action === "add" ? "Added" : "Modified",
                level = action === "add" ? "info" : "debug";
            CPLog.info(">> %s: %s", CPLogColorize(label, level), nib);
            if (action === "add")
            {
                var cib = nib.substr(0, nib.length - 4) + ".cib";
                if (FILE.exists(cib) && FILE.mtime(nib) - FILE.mtime(cib) < 0)
                    continue;
            }
            objj_msgSend(self, "setLogLevel:", verbosity);
            var success = objj_msgSend(self, "convertWithOptions:inputPath:", options, nib);
            objj_msgSend(self, "setLogLevel:", 1);
            if (success)
            {
                if (verbosity > 0)
                    stream.print();
                else
                    CPLog.info("Conversion successful");
            }
        }
        OS.sleep(1);
    }
}
,["void","JSObject"]), new objj_method(sel_getUid("parseOptionsFromArgs:"), function $Nib2Cib__parseOptionsFromArgs_(self, _cmd, theArgs)
{
    self.parser.usage("[--watch DIRECTORY] [INPUT_FILE [OUTPUT_FILE]]");
    ((self.parser.option("--watch", "watch")).set(true)).help("Ask nib2cib to watch a directory for changes");
    (((self.parser.option("--default-theme", "defaultTheme")).set()).displayName("name")).help("Specify a custom default theme which is not set in your Info.plist");
    (((self.parser.option("-t", "--theme", "auxThemes")).push()).displayName("name")).help("An additional theme loaded dynamically by your application");
    (((self.parser.option("--config", "configFile")).set()).displayName("path")).help("A path to an Info.plist file from which the system font and/or size can be retrieved");
    ((self.parser.option("-v", "--verbose", "verbosity")).inc()).help("Increase verbosity level");
    ((self.parser.option("-q", "--quiet", "quiet")).set(true)).help("No output");
    ((self.parser.option("-F", "--framework", "frameworks")).push()).help("Add a framework to load");
    (((self.parser.option("--no-stored-options", "readStoredOptions")).set(false)).def(true)).help("Do not read stored options");
    (((self.parser.option("--no-colors", "noColors")).set(true)).def(false)).help("Don't colorize output");
    ((self.parser.option("--version", "showVersion")).action(function()
    {
        objj_msgSend(self, "printVersionAndExit");
    })).help("Show the version of nib2cib and quit");
    (((self.parser.option("-R", "deprecatedResourcesDir")).set()).displayName("resources directory")).help("This option is deprecated.");
    self.parser.helpful();
    var options = self.parser.parse(theArgs, null, null, true);
    if (options.args.length > 2)
    {
        self.parser.printUsage(options);
        OS.exit(0);
    }
    return options;
}
,["JSObject","CPArray"]), new objj_method(sel_getUid("mergeOptionsWithStoredOptions:inputPath:"), function $Nib2Cib__mergeOptionsWithStoredOptions_inputPath_(self, _cmd, options, inputPath)
{
    var userOptions = objj_msgSend(self, "readStoredOptionsAtPath:", FILE.join(SYS.env["HOME"], ".nib2cibconfig")),
        appOptions = objj_msgSend(self, "readStoredOptionsAtPath:", FILE.join(self.appDirectory, "nib2cib.conf")),
        filename = FILE.basename(inputPath, FILE.extension(inputPath)) + ".conf",
        fileOptions = objj_msgSend(self, "readStoredOptionsAtPath:", FILE.join(FILE.dirname(inputPath), filename));
    userOptions = objj_msgSend(self, "parseOptionsFromArgs:", [options.command].concat(userOptions));
    appOptions = objj_msgSend(self, "parseOptionsFromArgs:", [options.command].concat(appOptions));
    fileOptions = objj_msgSend(self, "parseOptionsFromArgs:", [options.command].concat(fileOptions));
    var mergedOptions = userOptions;
    objj_msgSend(self, "mergeOptions:with:", appOptions, mergedOptions);
    objj_msgSend(self, "mergeOptions:with:", fileOptions, mergedOptions);
    objj_msgSend(self, "mergeOptions:with:", options, mergedOptions);
    mergedOptions.args = options.args;
    return mergedOptions;
}
,["JSObject","JSObject","CPString"]), new objj_method(sel_getUid("readStoredOptionsAtPath:"), function $Nib2Cib__readStoredOptionsAtPath_(self, _cmd, path)
{
    path = FILE.canonical(path);
    if (!FILE.isReadable(path))
        return [];
    var file = FILE.open(path, "r"),
        line = file.readLine(),
        matches = line.match(ArgsRe) || [];
    file.close();
    CPLog.debug("Reading stored options: " + path);
    if (matches)
    {
        for (var i = 0; i < matches.length; ++i)
        {
            var str = matches[i];
            if (str.charAt(0) === '"' && str.substr(-1) === '"' || str.charAt(0) === "'" && str.substr(-1) === "'")
                matches[i] = str.substr(1, str.length - 2);
        }
        return matches;
    }
    else
        return [];
}
,["CPArray","CPString"]), new objj_method(sel_getUid("printOptions:"), function $Nib2Cib__printOptions_(self, _cmd, options)
{
    var option;
    for (option in options)
    {
        var value = options[option];
        if (value)
        {
            var show = value.length !== undefined ? value.length > 0 : !!value;
            if (show)
                print(option + ": " + value);
        }
    }
}
,["void",null]), new objj_method(sel_getUid("mergeOptions:with:"), function $Nib2Cib__mergeOptions_with_(self, _cmd, sourceOptions, targetOptions)
{
    var option;
    for (option in sourceOptions)
    {
        if (!AllowedStoredOptionsRe.test(option))
            continue;
        if (sourceOptions.hasOwnProperty(option))
        {
            var value = sourceOptions[option];
            if (value)
            {
                var copy = value.length !== undefined ? value.length > 0 : !!value;
                if (copy)
                    targetOptions[option] = value;
            }
        }
    }
}
,["void","JSObject","JSObject"]), new objj_method(sel_getUid("setLogLevel:"), function $Nib2Cib__setLogLevel_(self, _cmd, level)
{
    CPLogUnregister(CPLogPrint);
    if (level === 0)
        CPLogRegister(CPLogPrint, "warn", logFormatter);
    else if (level === 1)
        CPLogRegister(CPLogPrint, "info", logFormatter);
    else if (level > 1)
        CPLogRegister(CPLogPrint, null, logFormatter);
}
,["void","int"]), new objj_method(sel_getUid("getInputPath:"), function $Nib2Cib__getInputPath_(self, _cmd, theArgs)
{
    var inputPath = theArgs[0] || DefaultFile,
        path = "";
    if (!/^.+\.[nx]ib$/.test(inputPath))
    {
        if (path = objj_msgSend(self, "findInputPath:extension:", inputPath, ".xib"))
            inputPath = path;
        else if (path = objj_msgSend(self, "findInputPath:extension:", inputPath, ".nib"))
            inputPath = path;
        else
            objj_msgSend(self, "failWithMessage:", "Cannot find the input file (.xib or .nib): " + FILE.canonical(inputPath));
    }
    else if (path = objj_msgSend(self, "findInputPath:extension:", inputPath, nil))
        inputPath = path;
    else
        objj_msgSend(self, "failWithMessage:", "Could not read the input file: " + FILE.canonical(inputPath));
    return FILE.canonical(inputPath);
}
,["CPString","CPArray"]), new objj_method(sel_getUid("findInputPath:extension:"), function $Nib2Cib__findInputPath_extension_(self, _cmd, inputPath, extension)
{
    var path = inputPath;
    if (extension)
        path += extension;
    if (FILE.isReadable(path))
        return path;
    if (FILE.basename(FILE.dirname(inputPath)) !== "Resources" && FILE.isDirectory("Resources"))
    {
        path = FILE.resolve(path, FILE.join("Resources", FILE.basename(path)));
        if (FILE.isReadable(path))
            return path;
    }
    return null;
}
,["void","CPString","CPString"]), new objj_method(sel_getUid("getAppAndResourceDirectoriesFromInputPath:options:"), function $Nib2Cib__getAppAndResourceDirectoriesFromInputPath_options_(self, _cmd, aPath, options)
{
    self.appDirectory = "";
    var parentDir = FILE.dirname(aPath),
        match = /^(.+)(\/Resources(?:\/.+)?)$/.exec(parentDir);
    if (match)
    {
        self.appDirectory = match[1];
        self.appResourceDirectory = FILE.join(self.appDirectory, "Resources");
    }
    else
    {
        self.appDirectory = parentDir;
        if (!self.appResourceDirectory)
        {
            var path = FILE.join(self.appDirectory, "Resources");
            if (FILE.isDirectory(path))
                self.appResourceDirectory = path;
        }
    }
}
,["void","CPString","JSObject"]), new objj_method(sel_getUid("getOutputPathFromInputPath:args:"), function $Nib2Cib__getOutputPathFromInputPath_args_(self, _cmd, aPath, theArgs)
{
    var outputPath = null;
    if (theArgs.length > 1)
    {
        outputPath = theArgs[1];
        if (!/^.+\.cib$/.test(outputPath))
            outputPath += ".cib";
    }
    else
        outputPath = FILE.join(FILE.dirname(aPath), FILE.basename(aPath, FILE.extension(aPath))) + ".cib";
    outputPath = FILE.canonical(outputPath);
    if (!FILE.isWritable(FILE.dirname(outputPath)))
        objj_msgSend(self, "failWithMessage:", "Cannot write the output file at: " + outputPath);
    return outputPath;
}
,["CPString","CPString","CPArray"]), new objj_method(sel_getUid("loadFrameworks:verbosity:"), function $Nib2Cib__loadFrameworks_verbosity_(self, _cmd, frameworksToLoad, verbosity)
{
    if (!frameworksToLoad || frameworksToLoad.length === 0)
        return;
    frameworksToLoad.forEach(function(aFramework)
    {
        objj_msgSend(self, "setLogLevel:", verbosity);
        var frameworkPath = nil;
        if (aFramework.indexOf("/") === -1)
        {
            frameworkPath = objj_msgSend(self, "findInFrameworks:path:isDirectory:callback:", FILE.join(self.appDirectory, "Frameworks"), aFramework, YES, function(path)
            {
                return path;
            });
        }
        else
            objj_msgSend(self, "failWithMessage:", "-F should be used only with a framework name that is in the app's Framework directory");
        if (!frameworkPath)
            objj_msgSend(self, "failWithMessage:", "Cannot find the framework \"" + aFramework + "\"");
        CPLog.debug("Loading framework: " + frameworkPath);
        try        {
            objj_msgSend(self, "setLogLevel:", -1);
            var frameworkBundle = objj_msgSend(objj_msgSend(CPBundle, "alloc"), "initWithPath:", frameworkPath);
            objj_msgSend(frameworkBundle, "loadWithDelegate:", nil);
            objj_msgSend(self, "setLogLevel:", verbosity);
            objj_msgSend(self, "loadNSClassesFromBundle:", frameworkBundle);
            var frameworkName = FILE.basename(frameworkPath),
                info = objj_msgSend(self.frameworks, "valueForKey:", frameworkName);
            info.loaded = true;
        }
        finally         {
            objj_msgSend(self, "setLogLevel:", verbosity);
        }
        (require("browser/timeout")).serviceTimeouts();
    });
}
,["void","CPArray","int"]), new objj_method(sel_getUid("loadNSClassesFromBundle:"), function $Nib2Cib__loadNSClassesFromBundle_(self, _cmd, aBundle)
{
    var nsClasses = objj_msgSend(aBundle, "objectForInfoDictionaryKey:", "NSClasses") || [],
        bundlePath = objj_msgSend(aBundle, "bundlePath");
    for (var i = 0; i < nsClasses.length; ++i)
    {
        if (self.userNSClasses.indexOf(nsClasses[i]) >= 0)
            continue;
        var path = FILE.join(bundlePath, "NS_" + nsClasses[i] + ".j");
        objj_importFile(path, YES);
        CPLog.debug("Imported NS class: %s", path);
        self.userNSClasses.push(nsClasses[i]);
    }
}
,["void","CPBundle"]), new objj_method(sel_getUid("getThemeList:"), function $Nib2Cib__getThemeList_(self, _cmd, options)
{
    var defaultTheme = options.defaultTheme;
    if (!defaultTheme)
        defaultTheme = objj_msgSend(self.infoPlist, "valueForKey:", "CPDefaultTheme");
    if (!defaultTheme)
        defaultTheme = objj_msgSend(self, "getAppKitDefaultThemeName");
    var themeList = objj_msgSend(CPSet, "setWithObject:", defaultTheme);
    if (options.auxThemes)
        objj_msgSend(themeList, "addObjectsFromArray:", options.auxThemes);
    var auxThemes = self.infoPlist.valueForKey("CPAuxiliaryThemes");
    if (auxThemes)
        objj_msgSend(themeList, "addObjectsFromArray:", auxThemes);
    objj_msgSend(themeList, "removeObject:", defaultTheme);
    var allThemes = objj_msgSend(themeList, "allObjects");
    objj_msgSend(allThemes, "insertObject:atIndex:", defaultTheme, 0);
    return allThemes;
}
,["CPArray","JSObject"]), new objj_method(sel_getUid("findInCappBuild:isDirectory:callback:"), function $Nib2Cib__findInCappBuild_isDirectory_callback_(self, _cmd, path, isDirectory, callback)
{
    var cappBuild = SYS.env["CAPP_BUILD"];
    if (!cappBuild)
        return undefined;
    cappBuild = FILE.canonical(cappBuild);
    if (FILE.isDirectory(cappBuild))
    {
        var result = null;
        for (var i = 0; i < BuildTypes.length && !result; ++i)
        {
            var findPath = FILE.join(cappBuild, BuildTypes[i], path);
            if (isDirectory && FILE.isDirectory(findPath) || !isDirectory && FILE.exists(findPath))
                result = callback(findPath);
        }
        return result;
    }
    else
        return false;
}
,["id","CPString","BOOL","JSObject"]), new objj_method(sel_getUid("findInInstalledFrameworks:isDirectory:callback:"), function $Nib2Cib__findInInstalledFrameworks_isDirectory_callback_(self, _cmd, path, isDirectory, callback)
{
    return objj_msgSend(self, "findInFrameworks:path:isDirectory:callback:", FILE.canonical(FILE.join(SYS.prefix, "packages/cappuccino/Frameworks")), path, isDirectory, callback);
}
,["id","CPString","BOOL","JSObject"]), new objj_method(sel_getUid("findInFrameworks:path:isDirectory:callback:"), function $Nib2Cib__findInFrameworks_path_isDirectory_callback_(self, _cmd, frameworksPath, path, isDirectory, callback)
{
    var result = null,
        findPath = FILE.join(frameworksPath, "Debug", path);
    if (isDirectory && FILE.isDirectory(findPath) || !isDirectory && FILE.exists(findPath))
        result = callback(findPath);
    if (!result)
    {
        findPath = FILE.join(frameworksPath, path);
        if (isDirectory && FILE.isDirectory(findPath) || !isDirectory && FILE.exists(findPath))
            result = callback(findPath);
    }
    return result;
}
,["id","CPString","CPString","BOOL","JSObject"]), new objj_method(sel_getUid("getAppKitDefaultThemeName"), function $Nib2Cib__getAppKitDefaultThemeName(self, _cmd)
{
    var callback = function(path)
    {
        return objj_msgSend(self, "themeNameFromPropertyList:", path);
    },
        themeName = objj_msgSend(self, "findInCappBuild:isDirectory:callback:", "AppKit/Info.plist", NO, callback);
    if (!themeName)
        themeName = objj_msgSend(self, "findInInstalledFrameworks:isDirectory:callback:", "AppKit/Info.plist", NO, callback);
    return themeName || DefaultTheme;
}
,["CPString"]), new objj_method(sel_getUid("themeNameFromPropertyList:"), function $Nib2Cib__themeNameFromPropertyList_(self, _cmd, path)
{
    if (!FILE.isReadable(path))
        return nil;
    var themeName = nil,
        plist = CFPropertyList.readPropertyListFromFile(path);
    if (plist)
        themeName = plist.valueForKey("CPDefaultTheme");
    return themeName;
}
,["CPString","CPString"]), new objj_method(sel_getUid("loadThemesFromList:"), function $Nib2Cib__loadThemesFromList_(self, _cmd, themeList)
{
    for (var i = 0; i < themeList.length; ++i)
        self.themes.push(objj_msgSend(self, "loadThemeNamed:", themeList[i]));
}
,["void","CPArray"]), new objj_method(sel_getUid("loadThemeNamed:"), function $Nib2Cib__loadThemeNamed_(self, _cmd, themeName)
{
    if (/^.+\.blend$/.test(themeName))
        themeName = themeName.substr(0, themeName.length - ".blend".length);
    var blendName = themeName + ".blend",
        themePath = "",
        themeDir = self.appResourceDirectory;
    if (themeDir)
    {
        themePath = FILE.join(FILE.canonical(themeDir), blendName);
        if (!FILE.isDirectory(themePath))
            themePath = themeDir = null;
    }
    if (!themeDir)
    {
        var returnPath = function(path)
        {
            return path;
        };
        themePath = objj_msgSend(self, "findInCappBuild:isDirectory:callback:", blendName, YES, returnPath);
        if (!themePath)
            themePath = objj_msgSend(self, "findInInstalledFrameworks:isDirectory:callback:", "AppKit/Resources/" + blendName, YES, returnPath);
        if (!themePath)
        {
            var path = FILE.canonical(blendName);
            if (FILE.isDirectory(path))
                themePath = path;
        }
    }
    if (!themePath)
        objj_msgSend(self, "failWithMessage:", "Cannot find the theme \"" + themeName + "\"");
    return objj_msgSend(self, "readThemeWithName:atPath:", themeName, themePath);
}
,["CPTheme","CPString"]), new objj_method(sel_getUid("readThemeWithName:atPath:"), function $Nib2Cib__readThemeWithName_atPath_(self, _cmd, name, path)
{
    var themeBundle = new CFBundle(path);
    themeBundle.mostEligibleEnvironment = function()
    {
        return "Browser";
    };
    themeBundle.load();
    var keyedThemes = themeBundle.valueForInfoDictionaryKey("CPKeyedThemes");
    if (!keyedThemes)
        objj_msgSend(self, "failWithMessage:", "Could not find the keyed themes in the theme: " + path);
    var index = keyedThemes.indexOf(name + ".keyedtheme");
    if (index < 0)
        objj_msgSend(self, "failWithMessage:", "Could not find the main theme data (" + name + ".keyedtheme" + ") in the theme: " + path);
    var resourcePath = themeBundle.pathForResource(keyedThemes[index]),
        themeData = new CFMutableData();
    themeData.setRawString((StaticResource.resourceAtURL(new CFURL(resourcePath), true)).contents());
    var theme = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", themeData);
    if (!theme)
        objj_msgSend(self, "failWithMessage:", "Could not unarchive the theme at: " + path);
    CPLog.debug("Loaded theme: " + path);
    return theme;
}
,["CPTheme","CPString","CPString"]), new objj_method(sel_getUid("readConfigFile:inputPath:"), function $Nib2Cib__readConfigFile_inputPath_(self, _cmd, configFile, inputPath)
{
    var configPath = null,
        path;
    if (configFile)
    {
        path = FILE.canonical(configFile);
        if (!FILE.isReadable(path))
            objj_msgSend(self, "failWithMessage:", "Cannot find the config file: " + path);
        configPath = path;
    }
    else
    {
        path = FILE.join(self.appDirectory, "Info.plist");
        if (FILE.isReadable(path))
            configPath = path;
    }
    var plist = null;
    if (configPath)
    {
        var plist = FILE.read(configPath);
        if (!plist)
            objj_msgSend(self, "failWithMessage:", "Could not read the Info.plist at: " + configPath);
        plist = CFPropertyList.propertyListFromString(plist);
        if (!plist)
            objj_msgSend(self, "failWithMessage:", "Could not parse the Info.plist at: " + configPath);
    }
    return {path: configPath, plist: plist};
}
,["JSObject","CPString","CPString"]), new objj_method(sel_getUid("getModifiedNibsInDirectory:"), function $Nib2Cib__getModifiedNibsInDirectory_(self, _cmd, path)
{
    var nibs = (new FileList(FILE.join(path, "*.[nx]ib"))).items(),
        count = nibs.length,
        newNibInfo = {},
        modifiedNibs = [];
    while (count--)
    {
        var nib = nibs[count];
        newNibInfo[nib] = FILE.mtime(nib);
        if (!self.nibInfo.hasOwnProperty(nib))
            modifiedNibs.push(["add", nib]);
        else
        {
            if (newNibInfo[nib] - self.nibInfo[nib] !== 0)
                modifiedNibs.push(["mod", nib]);
            delete self.nibInfo[nib];
        }
    }
    for (var nib in self.nibInfo)
        if (self.nibInfo.hasOwnProperty(nib))
            CPLog.info(">> %s: %s", CPLogColorize("Deleted", "warn"), nib);
    self.nibInfo = newNibInfo;
    return modifiedNibs;
}
,["CPArray","CPString"]), new objj_method(sel_getUid("printVersionAndExit"), function $Nib2Cib__printVersionAndExit(self, _cmd)
{
    objj_msgSend(self, "printVersion");
    OS.exit(0);
}
,["void"]), new objj_method(sel_getUid("printVersion"), function $Nib2Cib__printVersion(self, _cmd)
{
    var path = FILE.dirname(FILE.dirname(FILE.canonical(SYS.args[0]))),
        version = null;
    if (FILE.basename(path) === "narwhal")
        path = FILE.join(path, "packages", "cappuccino");
    path = FILE.join(path, "lib", "nib2cib", "Info.plist");
    if (FILE.isReadable(path))
    {
        var plist = FILE.read(path);
        if (!plist)
            return;
        plist = CFPropertyList.propertyListFromString(plist);
        if (!plist)
            return;
        version = plist.valueForKey("CPBundleVersion");
        if (version)
            stream.print("nib2cib v" + version);
    }
    if (!version)
        stream.print("<No version info available>");
}
,["void"]), new objj_method(sel_getUid("exceptionReason:"), function $Nib2Cib__exceptionReason_(self, _cmd, exception)
{
    if (typeof exception === "string")
        return exception;
    else if (exception.isa && objj_msgSend(exception, "respondsToSelector:", sel_getUid("reason")))
        return objj_msgSend(exception, "reason");
    else
        return "An unknown error occurred";
}
,["CPString","JSObject"]), new objj_method(sel_getUid("failWithMessage:"), function $Nib2Cib__failWithMessage_(self, _cmd, message)
{
    objj_msgSend(CPException, "raise:reason:", ConverterConversionException, message);
}
,["void","CPString"]), new objj_method(sel_getUid("logError:"), function $Nib2Cib__logError_(self, _cmd, message)
{
    if (Nib2CibColorizeOutput)
        message = CPLogColorize(message, "fatal");
    stream.printError(message);
}
,["void","CPString"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("sharedNib2Cib"), function $Nib2Cib__sharedNib2Cib(self, _cmd)
{
    return SharedNib2Cib;
}
,["Nib2Cib"]), new objj_method(sel_getUid("defaultTheme"), function $Nib2Cib__defaultTheme(self, _cmd)
{
    return objj_msgSend(SharedNib2Cib, "themes")[0];
}
,["CPTheme"])]);
}logFormatter = function(aString, aLevel, aTitle)
{
    if (!Nib2CibColorizeOutput || aLevel === "info")
        return aString;
    else
        return CPLogColorize(aString, aLevel);
}
