@STATIC;1.0;I;30;Foundation/CPKeyedUnarchiver.ji;18;Nib2CibException.jt;3365;objj_executeFile("Foundation/CPKeyedUnarchiver.j", NO);objj_executeFile("Nib2CibException.j", YES);var FILE = require("file");
{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "Nib2CibKeyedUnarchiver"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("allObjects"), function $Nib2CibKeyedUnarchiver__allObjects(self, _cmd)
{
    return self._objects;
}
,["CPArray"]), new objj_method(sel_getUid("resourceInfoForName:inFramework:"), function $Nib2CibKeyedUnarchiver__resourceInfoForName_inFramework_(self, _cmd, aName, framework)
{
    var nib2cib = objj_msgSend(Nib2Cib, "sharedNib2Cib"),
        frameworks = objj_msgSend(nib2cib, "frameworks");
    if (framework)
    {
        var info = objj_msgSend(frameworks, "valueForKey:", framework);
        if (!info)
            objj_msgSend(CPException, "raise:format:", Nib2CibException, "The framework “%@” specified by the image “%@@%@” cannot be found.", framework, aName, framework);
        else if (!info.resourceDirectory)
            objj_msgSend(CPException, "raise:format:", Nib2CibException, "The framework “%@” specified by the image “%@@%@” has no Resources directory.", framework, aName, framework);
        var path = objj_msgSend(self, "_resourcePathForName:inDirectory:", aName, info.resourceDirectory);
        if (path)
            return {path: path, framework: framework};
    }
    else
    {
        var resourcesDirectory = objj_msgSend(nib2cib, "appResourceDirectory"),
            path = objj_msgSend(self, "_resourcePathForName:inDirectory:", aName, resourcesDirectory);
        if (path)
            return {path: path, framework: framework};
        var enumerator = objj_msgSend(frameworks, "keyEnumerator");
        while (framework = objj_msgSend(enumerator, "nextObject"))
        {
            var info = objj_msgSend(frameworks, "valueForKey:", framework);
            if (!info || !info.resourceDirectory)
                continue;
            path = objj_msgSend(self, "_resourcePathForName:inDirectory:", aName, info.resourceDirectory);
            if (path)
                return {path: path, framework: framework};
        }
    }
    objj_msgSend(CPException, "raise:format:", Nib2CibException, "The image “%@” cannot be found.", aName);
}
,["JSObject","CPString","CPString"]), new objj_method(sel_getUid("_resourcePathForName:inDirectory:"), function $Nib2CibKeyedUnarchiver___resourcePathForName_inDirectory_(self, _cmd, aName, directory)
{
    var pathGroups = [FILE.listPaths(directory)];
    while (pathGroups.length > 0)
    {
        var paths = pathGroups.shift(),
            index = 0,
            count = paths.length;
        for (; index < count; ++index)
        {
            var path = paths[index];
            if (FILE.basename(path) === aName)
                return path;
            else if (FILE.isDirectory(path))
                pathGroups.push(FILE.listPaths(path));
            else if (!FILE.extension(aName) && (FILE.basename(path)).replace(/\.[^.]*$/, "") === aName)
                return path;
        }
    }
    return nil;
}
,["CPString","CPString","CPString"])]);
}FILE.listPaths = function(aPath)
{
    var paths = FILE.list(aPath),
        count = paths.length;
    while (count--)
        paths[count] = FILE.join(aPath, paths[count]);
    return paths;
};
