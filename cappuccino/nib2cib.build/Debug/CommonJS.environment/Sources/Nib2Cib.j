@STATIC;1.0;I;23;Foundation/Foundation.jI;15;AppKit/AppKit.jI;19;BlendKit/BlendKit.ji;14;NSFoundation.ji;10;NSAppKit.ji;24;Nib2CibKeyedUnarchiver.ji;11;Converter.jt;30367;objj_executeFile("Foundation/Foundation.j", NO);
objj_executeFile("AppKit/AppKit.j", NO);
objj_executeFile("BlendKit/BlendKit.j", NO);

objj_executeFile("NSFoundation.j", YES);
objj_executeFile("NSAppKit.j", YES);

objj_executeFile("Nib2CibKeyedUnarchiver.j", YES);
objj_executeFile("Converter.j", YES);

var FILE = require("file"),
    OS = require("os"),
    SYS = require("system"),
    FileList = require("jake").FileList,
    stream = require("narwhal/term").stream,
    StaticResource = require("objective-j").StaticResource,

    DefaultTheme = "Aristo",
    BuildTypes = ["Debug", "Release"],
    DefaultFile = "MainMenu",
    AllowedStoredOptionsRe = new RegExp("^(defaultTheme|auxThemes|verbosity|quiet|frameworks|format)$"),
    ArgsRe = /"[^\"]+"|'[^\']+'|\S+/g;


{var the_class = objj_allocateClassPair(CPObject, "Nib2Cib"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("commandLineArgs"), new objj_ivar("parser"), new objj_ivar("nibInfo"), new objj_ivar("appDirectory"), new objj_ivar("resourcesDirectory"), new objj_ivar("infoPlist"), new objj_ivar("userNSClasses")]);
objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithArgs:"), function $Nib2Cib__initWithArgs_(self, _cmd, theArgs)
{ with(self)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("Nib2Cib").super_class }, "init");

    if (self)
    {
        commandLineArgs = theArgs;
        parser = new (require("narwhal/args").Parser)();
        nibInfo = {};
        appDirectory = "";
        resourcesDirectory = "";
        infoPlist = objj_msgSend(CPDictionary, "dictionary");
        userNSClasses = [];
    }

    return self;
}
},["id","CPArray"]), new objj_method(sel_getUid("run"), function $Nib2Cib__run(self, _cmd)
{ with(self)
{
    try
    {
        var options = objj_msgSend(self, "parseOptionsFromArgs:", commandLineArgs);

        objj_msgSend(self, "setLogLevel:", options.quiet ? -1 : options.verbosity);
        objj_msgSend(self, "checkPrerequisites");

        if (options.watch)
            objj_msgSend(self, "watchWithOptions:", options);
        else
            objj_msgSend(self, "convertWithOptions:inputFile:", options, nil);
    }
    catch (anException)
    {
        CPLog.fatal(objj_msgSend(self, "exceptionReason:", anException));
        OS.exit(1);
    }
}
},["void"]), new objj_method(sel_getUid("checkPrerequisites"), function $Nib2Cib__checkPrerequisites(self, _cmd)
{ with(self)
{
    var fontinfo = require("cappuccino/fontinfo").fontinfo,
        info = fontinfo("LucidaGrande", 13);

    if (!info)
        objj_msgSend(self, "failWithMessage:", "fontinfo does not appear to be installed");
}
},["void"]), new objj_method(sel_getUid("convertWithOptions:inputFile:"), function $Nib2Cib__convertWithOptions_inputFile_(self, _cmd, options, inputFile)
{ with(self)
{
    try
    {
        inputFile = inputFile || objj_msgSend(self, "getInputFile:", options.args);

        objj_msgSend(self, "getAppAndResourceDirectoriesFromInputFile:options:", inputFile, options);

        if (options.readStoredOptions)
        {
            options = objj_msgSend(self, "mergeOptionsWithStoredOptions:inputFile:", options, inputFile);
            objj_msgSend(self, "setLogLevel:", options.quiet ? -1 : options.verbosity);
        }

        if (!options.quiet && options.verbosity > 0)
            objj_msgSend(self, "printVersion");

        var outputFile = objj_msgSend(self, "getOutputFileFromInputFile:args:", inputFile, options.args),
            configInfo = objj_msgSend(self, "readConfigFile:inputFile:", options.configFile || "", inputFile);

        infoPlist = configInfo.plist;

        if (infoPlist)
        {
            var systemFontFace = objj_msgSend(infoPlist, "valueForKey:", "CPSystemFontFace");

            if (systemFontFace)
                objj_msgSend(CPFont, "setSystemFontFace:", systemFontFace);

            var systemFontSize = objj_msgSend(infoPlist, "valueForKey:", "CPSystemFontSize");

            if (systemFontSize)
                objj_msgSend(CPFont, "setSystemFontSize:", parseFloat(systemFontSize, 10));
        }
        else
            infoPlist = objj_msgSend(CPDictionary, "dictionary");

        var themeList = objj_msgSend(self, "getThemeList:", options),
            themes = objj_msgSend(self, "loadThemesFromList:", themeList);

        CPLog.info("\n-------------------------------------------------------------");
        CPLog.info("Input         : " + inputFile);
        CPLog.info("Output        : " + outputFile);
        CPLog.info("Format        : " + ["Auto", "Mac", "iPhone"][options.format]);
        CPLog.info("Application   : " + appDirectory);
        CPLog.info("Resources     : " + resourcesDirectory);
        CPLog.info("Frameworks    : " + (options.frameworks || ""));
        CPLog.info("Default theme : " + themeList[0]);
        CPLog.info("Aux themes    : " + themeList.slice(1).join(", "));
        CPLog.info("Config file   : " + (configInfo.path || ""));
        CPLog.info("System Font   : " + objj_msgSend(CPFont, "systemFontSize") + "px " + objj_msgSend(CPFont, "systemFontFace"));
        CPLog.info("-------------------------------------------------------------\n");

        var converter = objj_msgSend(objj_msgSend(Converter, "alloc"), "initWithInputPath:format:themes:", inputFile, options.format, themes);

        objj_msgSend(converter, "setOutputPath:", outputFile);
        objj_msgSend(converter, "setResourcesPath:", resourcesDirectory);

        var loadFrameworksCallback = function()
        {
            objj_msgSend(self, "loadNSClassesFromBundle:", objj_msgSend(CPBundle, "mainBundle"));
            objj_msgSend(converter, "setUserNSClasses:", userNSClasses);
            objj_msgSend(converter, "convert");
        };

        objj_msgSend(self, "loadFrameworks:verbosity:callback:", options.frameworks, options.verbosity, loadFrameworksCallback);

        return YES;
    }
    catch (anException)
    {
        CPLog.fatal(objj_msgSend(self, "exceptionReason:", anException));
        return NO;
    }
}
},["BOOL","JSObject","CPString"]), new objj_method(sel_getUid("watchWithOptions:"), function $Nib2Cib__watchWithOptions_(self, _cmd, options)
{ with(self)
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

    var nibs = new FileList(FILE.join(watchDir, "*.[nx]ib")).items(),
        count = nibs.length;



    while (count--)
    {
        var nib = nibs[count],
            cib = nib.substr(0, nib.length - 4) + ".cib";

        if (FILE.exists(cib) && (FILE.mtime(nib) - FILE.mtime(cib)) <= 0)
            nibInfo[nib] = FILE.mtime(nib);
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

                if (FILE.exists(cib) && (FILE.mtime(nib) - FILE.mtime(cib)) < 0)
                    continue;
            }


            objj_msgSend(self, "setLogLevel:", verbosity);

            var success = objj_msgSend(self, "convertWithOptions:inputFile:", options, nib);

            objj_msgSend(self, "setLogLevel:", 1);

            if (success)
            {
                if (verbosity > 0)
                    stream.print();
                else
                    CPLog.warn("Conversion successful");
            }
        }

        OS.sleep(1);
    }
}
},["void","JSObject"]), new objj_method(sel_getUid("parseOptionsFromArgs:"), function $Nib2Cib__parseOptionsFromArgs_(self, _cmd, theArgs)
{ with(self)
{
    parser.usage("[--watch DIRECTORY] [INPUT_FILE [OUTPUT_FILE]]");

    parser.option("--watch", "watch")
        .set(true)
        .help("Ask nib2cib to watch a directory for changes");

    parser.option("-R", "resourcesDir")
        .set()
        .displayName("directory")
        .help("Set the Resources directory, usually unnecessary as it is inferred from the input path");

    parser.option("--default-theme", "defaultTheme")
        .set()
        .displayName("name")
        .help("Specify a custom default theme which is not set in your Info.plist");

    parser.option("-t", "--theme", "auxThemes")
        .push()
        .displayName("name")
        .help("An additional theme loaded dynamically by your application");

    parser.option("--config", "configFile")
        .set()
        .displayName("path")
        .help("A path to an Info.plist file from which the system font and/or size can be retrieved");

    parser.option("-v", "--verbose", "verbosity")
        .inc()
        .help("Increase verbosity level");

    parser.option("-q", "--quiet", "quiet")
        .set(true)
        .help("No output");

    parser.option("-F", "--framework", "frameworks")
        .push()
        .help("Add a framework to load");

    parser.option("--no-stored-options", "readStoredOptions")
        .set(false)
        .def(true)
        .help("Do not read stored options");

    parser.option("--mac", "format")
        .set(NibFormatMac)
        .def(NibFormatUndetermined)
        .help("Set format to Mac");

    parser.option("--version", "showVersion")
        .action(function() { objj_msgSend(self, "printVersionAndExit"); })
        .help("Show the version of nib2cib and quit");

    parser.helpful();

    var options = parser.parse(theArgs, null, null, true);

    if (options.args.length > 2)
    {
        parser.printUsage(options);
        OS.exit(0);
    }

    return options;
}
},["JSObject","CPArray"]), new objj_method(sel_getUid("mergeOptionsWithStoredOptions:inputFile:"), function $Nib2Cib__mergeOptionsWithStoredOptions_inputFile_(self, _cmd, options, inputFile)
{ with(self)
{

    var userOptions = objj_msgSend(self, "readStoredOptionsAtPath:", FILE.join(SYS.env["HOME"], ".nib2cibconfig")),
        appOptions = objj_msgSend(self, "readStoredOptionsAtPath:", FILE.join(appDirectory, "nib2cib.conf")),
        filename = FILE.basename(inputFile, FILE.extension(inputFile)) + ".conf",
        fileOptions = objj_msgSend(self, "readStoredOptionsAtPath:", FILE.join(FILE.dirname(inputFile), filename));



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
},["JSObject","JSObject","CPString"]), new objj_method(sel_getUid("readStoredOptionsAtPath:"), function $Nib2Cib__readStoredOptionsAtPath_(self, _cmd, path)
{ with(self)
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

            if ((str.charAt(0) === '"' && str.substr(-1) === '"') || (str.charAt(0) === "'" && str.substr(-1) === "'"))
                matches[i] = str.substr(1, str.length - 2);
        }

        return matches;
    }
    else
        return [];
}
},["CPArray","CPString"]), new objj_method(sel_getUid("printOptions:"), function $Nib2Cib__printOptions_(self, _cmd, options)
{ with(self)
{
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
},["void",null]), new objj_method(sel_getUid("mergeOptions:with:"), function $Nib2Cib__mergeOptions_with_(self, _cmd, sourceOptions, targetOptions)
{ with(self)
{
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
},["void","JSObject","JSObject"]), new objj_method(sel_getUid("setLogLevel:"), function $Nib2Cib__setLogLevel_(self, _cmd, level)
{ with(self)
{
    CPLogUnregister(CPLogPrint);

    if (level === 0)
        CPLogRegister(CPLogPrint, "warn", logFormatter);
    else if (level === 1)
        CPLogRegister(CPLogPrint, "info", logFormatter);
    else if (level > 1)
        CPLogRegister(CPLogPrint, null, logFormatter);
}
},["void","int"]), new objj_method(sel_getUid("getInputFile:"), function $Nib2Cib__getInputFile_(self, _cmd, theArgs)
{ with(self)
{
    var inputFile = theArgs[0] || DefaultFile,
        path = "";

    if (!/^.+\.[nx]ib$/.test(inputFile))
    {
        if (path = objj_msgSend(self, "findInputFile:extension:", inputFile, ".xib"))
            inputFile = path;
        else if (path = objj_msgSend(self, "findInputFile:extension:", inputFile, ".nib"))
            inputFile = path;
        else
            objj_msgSend(self, "failWithMessage:", "Cannot find the input file (.xib or .nib): " + FILE.canonical(inputFile));
    }
    else if (path = objj_msgSend(self, "findInputFile:extension:", inputFile, nil))
        inputFile = path;
    else
        objj_msgSend(self, "failWithMessage:", "Could not read the input file: " + FILE.canonical(inputFile));

    return FILE.canonical(inputFile);
}
},["CPString","CPArray"]), new objj_method(sel_getUid("findInputFile:extension:"), function $Nib2Cib__findInputFile_extension_(self, _cmd, inputFile, extension)
{ with(self)
{
    var path = inputFile;

    if (extension)
        path += extension;

    if (FILE.isReadable(path))
        return path;

    if (FILE.basename(FILE.dirname(inputFile)) !== "Resources" && FILE.isDirectory("Resources"))
    {
        path = FILE.resolve(path, FILE.join("Resources", FILE.basename(path)));

        if (FILE.isReadable(path))
            return path;
    }

    return null;
}
},["void","CPString","CPString"]), new objj_method(sel_getUid("getAppAndResourceDirectoriesFromInputFile:options:"), function $Nib2Cib__getAppAndResourceDirectoriesFromInputFile_options_(self, _cmd, inputFile, options)
{ with(self)
{
    appDirectory = resourcesDirectory = "";

    if (options.resourcesDir)
    {
        var path = FILE.canonical(options.resourcesDir);

        if (!FILE.isDirectory(path))
            objj_msgSend(self, "failWithMessage:", "Cannot read resources at: " + path);

        resourcesDirectory = path;
    }

    var parentDir = FILE.dirname(inputFile);

    if (FILE.basename(parentDir) === "Resources")
    {
        appDirectory = FILE.dirname(parentDir);
        resourcesDirectory = resourcesDirectory || parentDir;
    }
    else
    {
        appDirectory = parentDir;

        if (!resourcesDirectory)
        {
            var path = FILE.join(appDirectory, "Resources");

            if (FILE.isDirectory(path))
                resourcesDirectory = path;
        }
    }
}
},["void","CPString","JSObject"]), new objj_method(sel_getUid("getOutputFileFromInputFile:args:"), function $Nib2Cib__getOutputFileFromInputFile_args_(self, _cmd, inputFile, theArgs)
{ with(self)
{
    var outputFile = null;

    if (theArgs.length > 1)
    {
        outputFile = theArgs[1];

        if (!/^.+\.cib$/.test(outputFile))
            outputFile += ".cib";
    }
    else
        outputFile = FILE.join(FILE.dirname(inputFile), FILE.basename(inputFile, FILE.extension(inputFile))) + ".cib";

    outputFile = FILE.canonical(outputFile);

    if (!FILE.isWritable(FILE.dirname(outputFile)))
        objj_msgSend(self, "failWithMessage:", "Cannot write the output file at: " + outputFile);

    return outputFile;
}
},["CPString","CPString","CPArray"]), new objj_method(sel_getUid("loadFrameworks:verbosity:callback:"), function $Nib2Cib__loadFrameworks_verbosity_callback_(self, _cmd, frameworks, verbosity, aCallback)
{ with(self)
{
    if (!frameworks || frameworks.length === 0)
        return aCallback();

    var returnPath = function(path) { return path; };

    frameworks.forEach(function(aFramework)
    {
        objj_msgSend(self, "setLogLevel:", verbosity);

        var frameworkPath = nil;


        if (aFramework.indexOf("/") === -1)
        {
            frameworkPath = objj_msgSend(self, "findInCappBuild:isDirectory:callback:", aFramework, YES, returnPath);

            if (!frameworkPath)
                frameworkPath = objj_msgSend(self, "findInFrameworks:path:isDirectory:callback:", FILE.join(appDirectory, "Frameworks"), aFramework, YES, returnPath);

            if (!frameworkPath)
                frameworkPath = objj_msgSend(self, "findInInstalledFrameworks:isDirectory:callback:", aFramework, YES, returnPath);
        }
        else
            frameworkPath = FILE.canonical(aFramework);

        if (!frameworkPath)
            objj_msgSend(self, "failWithMessage:", "Cannot find the framework \"" + aFramework + "\"");

        CPLog.debug("Loading framework: " + frameworkPath);

        try
        {


            objj_msgSend(self, "setLogLevel:", -1);

            var frameworkBundle = objj_msgSend(objj_msgSend(CPBundle, "alloc"), "initWithPath:", frameworkPath);

            objj_msgSend(frameworkBundle, "loadWithDelegate:", nil);
            objj_msgSend(self, "setLogLevel:", verbosity);

            objj_msgSend(self, "loadNSClassesFromBundle:", frameworkBundle);
        }
        finally
        {
            objj_msgSend(self, "setLogLevel:", verbosity);
        }

        require("browser/timeout").serviceTimeouts();
    });

    aCallback();
}
},["void","CPArray","int","JSObject"]), new objj_method(sel_getUid("loadNSClassesFromBundle:"), function $Nib2Cib__loadNSClassesFromBundle_(self, _cmd, aBundle)
{ with(self)
{

    var nsClasses = objj_msgSend(aBundle, "objectForInfoDictionaryKey:", "NSClasses") || [],
        bundlePath = objj_msgSend(aBundle, "bundlePath");

    for (var i = 0; i < nsClasses.length; ++i)
    {
        if (userNSClasses.indexOf(nsClasses[i]) >= 0)
            continue;

        var path = FILE.join(bundlePath, "NS_" + nsClasses[i] + ".j");

        objj_importFile(path, YES);
        CPLog.debug("Imported NS class: %s", path);

        userNSClasses.push(nsClasses[i]);
    }
}
},["void","CPBundle"]), new objj_method(sel_getUid("getThemeList:"), function $Nib2Cib__getThemeList_(self, _cmd, options)
{ with(self)
{
    var defaultTheme = options.defaultTheme;

    if (!defaultTheme)
        defaultTheme = objj_msgSend(infoPlist, "valueForKey:", "CPDefaultTheme");

    if (!defaultTheme)
        defaultTheme = objj_msgSend(self, "getAppKitDefaultThemeName");

    var themes = objj_msgSend(CPSet, "setWithObject:", defaultTheme);

    if (options.auxThemes)
        objj_msgSend(themes, "addObjectsFromArray:", options.auxThemes);

    var auxThemes = infoPlist.valueForKey("CPAuxiliaryThemes");

    if (auxThemes)
        objj_msgSend(themes, "addObjectsFromArray:", auxThemes);


    objj_msgSend(themes, "removeObject:", defaultTheme);

    var allThemes = objj_msgSend(themes, "allObjects");

    objj_msgSend(allThemes, "insertObject:atIndex:", defaultTheme, 0);

    return allThemes;
}
},["CPArray","JSObject"]), new objj_method(sel_getUid("findInCappBuild:isDirectory:callback:"), function $Nib2Cib__findInCappBuild_isDirectory_callback_(self, _cmd, path, isDirectory, callback)
{ with(self)
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

            if ((isDirectory && FILE.isDirectory(findPath)) || (!isDirectory && FILE.exists(findPath)))
                result = callback(findPath);
        }

        return result;
    }
    else
        return false;
}
},["id","CPString","BOOL","JSObject"]), new objj_method(sel_getUid("findInInstalledFrameworks:isDirectory:callback:"), function $Nib2Cib__findInInstalledFrameworks_isDirectory_callback_(self, _cmd, path, isDirectory, callback)
{ with(self)
{

    return objj_msgSend(self, "findInFrameworks:path:isDirectory:callback:", FILE.canonical(FILE.join(SYS.prefix, "packages/cappuccino/Frameworks")), path, isDirectory, callback);
}
},["id","CPString","BOOL","JSObject"]), new objj_method(sel_getUid("findInFrameworks:path:isDirectory:callback:"), function $Nib2Cib__findInFrameworks_path_isDirectory_callback_(self, _cmd, frameworksPath, path, isDirectory, callback)
{ with(self)
{
    var result = null,
        findPath = FILE.join(frameworksPath, "Debug", path);

    if ((isDirectory && FILE.isDirectory(findPath)) || (!isDirectory && FILE.exists(findPath)))
        result = callback(findPath);

    if (!result)
    {
        findPath = FILE.join(frameworksPath, path);

        if ((isDirectory && FILE.isDirectory(findPath)) || (!isDirectory && FILE.exists(findPath)))
            result = callback(findPath);
    }

    return result;
}
},["id","CPString","CPString","BOOL","JSObject"]), new objj_method(sel_getUid("getAppKitDefaultThemeName"), function $Nib2Cib__getAppKitDefaultThemeName(self, _cmd)
{ with(self)
{
    var callback = function(path) { return objj_msgSend(self, "themeNameFromPropertyList:", path); },
        themeName = objj_msgSend(self, "findInCappBuild:isDirectory:callback:", "AppKit/Info.plist", NO, callback);

    if (!themeName)
        themeName = objj_msgSend(self, "findInInstalledFrameworks:isDirectory:callback:", "AppKit/Info.plist", NO, callback);

    return themeName || DefaultTheme;
}
},["CPString"]), new objj_method(sel_getUid("themeNameFromPropertyList:"), function $Nib2Cib__themeNameFromPropertyList_(self, _cmd, path)
{ with(self)
{
    if (!FILE.isReadable(path))
        return nil;

    var themeName = nil,
        plist = CFPropertyList.readPropertyListFromFile(path);

    if (plist)
        themeName = plist.valueForKey("CPDefaultTheme");

    return themeName;
}
},["CPString","CPString"]), new objj_method(sel_getUid("loadThemesFromList:"), function $Nib2Cib__loadThemesFromList_(self, _cmd, themeList)
{ with(self)
{
    var themes = [];

    for (var i = 0; i < themeList.length; ++i)
        themes.push(objj_msgSend(self, "loadThemeNamed:directory:", themeList[i], resourcesDirectory));

    return themes;
}
},["CPArray","CPArray"]), new objj_method(sel_getUid("loadThemeNamed:directory:"), function $Nib2Cib__loadThemeNamed_directory_(self, _cmd, themeName, themeDir)
{ with(self)
{
    if (/^.+\.blend$/.test(themeName))
        themeName = themeName.substr(0, themeName.length - ".blend".length);

    var blendName = themeName + ".blend",
        themePath = "";

    if (themeDir)
    {
        themePath = FILE.join(FILE.canonical(themeDir), blendName);

        if (!FILE.isDirectory(themePath))
            themePath = themeDir = null;
    }

    if (!themeDir)
    {
        var returnPath = function(path) { return path; };

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
},["CPTheme","CPString","CPString"]), new objj_method(sel_getUid("readThemeWithName:atPath:"), function $Nib2Cib__readThemeWithName_atPath_(self, _cmd, name, path)
{ with(self)
{
    var themeBundle = new CFBundle(path);



    themeBundle.mostEligibleEnvironment = function() { return "Browser"; }
    themeBundle.load();

    var keyedThemes = themeBundle.valueForInfoDictionaryKey("CPKeyedThemes");

    if (!keyedThemes)
        objj_msgSend(self, "failWithMessage:", "Could not find the keyed themes in the theme: " + path);

    var index = keyedThemes.indexOf(name + ".keyedtheme");

    if (index < 0)
        objj_msgSend(self, "failWithMessage:", "Could not find the main theme data (" + name + ".keyedtheme" + ") in the theme: " + path);


    var resourcePath = themeBundle.pathForResource(keyedThemes[index]),
        themeData = new CFMutableData();

    themeData.setRawString(StaticResource.resourceAtURL(new CFURL(resourcePath), true).contents());

    var theme = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", themeData);

    if (!theme)
        objj_msgSend(self, "failWithMessage:", "Could not unarchive the theme at: " + path);

    CPLog.debug("Loaded theme: " + path);
    return theme;
}
},["CPTheme","CPString","CPString"]), new objj_method(sel_getUid("readConfigFile:inputFile:"), function $Nib2Cib__readConfigFile_inputFile_(self, _cmd, configFile, inputFile)
{ with(self)
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
        path = FILE.join(appDirectory, "Info.plist");

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
},["JSObject","CPString","CPString"]), new objj_method(sel_getUid("getModifiedNibsInDirectory:"), function $Nib2Cib__getModifiedNibsInDirectory_(self, _cmd, path)
{ with(self)
{
    var nibs = new FileList(FILE.join(path, "*.[nx]ib")).items(),
        count = nibs.length,
        newNibInfo = {},
        modifiedNibs = [];

    while (count--)
    {
        var nib = nibs[count];

        newNibInfo[nib] = FILE.mtime(nib);

        if (!nibInfo.hasOwnProperty(nib))
            modifiedNibs.push(["add", nib]);
        else
        {
            if (newNibInfo[nib] - nibInfo[nib] !== 0)
                modifiedNibs.push(["mod", nib]);



            delete nibInfo[nib];
        }
    }

    for (var nib in nibInfo)
        if (nibInfo.hasOwnProperty(nib))
            CPLog.info(">> %s: %s", CPLogColorize("Deleted", "warn"), nib);

    nibInfo = newNibInfo;

    return modifiedNibs;
}
},["CPArray","CPString"]), new objj_method(sel_getUid("printVersionAndExit"), function $Nib2Cib__printVersionAndExit(self, _cmd)
{ with(self)
{
    objj_msgSend(self, "printVersion");
    OS.exit(0);
}
},["void"]), new objj_method(sel_getUid("printVersion"), function $Nib2Cib__printVersion(self, _cmd)
{ with(self)
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
},["void"]), new objj_method(sel_getUid("exceptionReason:"), function $Nib2Cib__exceptionReason_(self, _cmd, exception)
{ with(self)
{
    if (typeof(exception) === "string")
        return exception;
    else if (exception.isa && objj_msgSend(exception, "respondsToSelector:", sel_getUid("reason")))
        return objj_msgSend(exception, "reason");
    else
        return "An unknown error occurred";
}
},["CPString","JSObject"]), new objj_method(sel_getUid("failWithMessage:"), function $Nib2Cib__failWithMessage_(self, _cmd, message)
{ with(self)
{
    objj_msgSend(CPException, "raise:reason:", ConverterConversionException, message);
}
},["void","CPString"])]);
}

logFormatter = function(aString, aLevel, aTitle)
{
    if (aLevel === "info")
        return aString;
    else
        return CPLogColorize(aString, aLevel);
}

