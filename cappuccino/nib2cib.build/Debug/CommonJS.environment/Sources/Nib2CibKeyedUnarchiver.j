@STATIC;1.0;I;30;Foundation/CPKeyedUnarchiver.ji;18;Nib2CibException.jt;3748;objj_executeFile("Foundation/CPKeyedUnarchiver.j", NO);objj_executeFile("Nib2CibException.j", YES);var FILE = require("file");
{var the_class = objj_allocateClassPair(CPKeyedUnarchiver, "Nib2CibKeyedUnarchiver"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("allObjects"), function $Nib2CibKeyedUnarchiver__allObjects(self, _cmd)
{
    return self._objects;
}
,["CPArray"]), new objj_method(sel_getUid("resourceInfoForName:inFramework:"), function $Nib2CibKeyedUnarchiver__resourceInfoForName_inFramework_(self, _cmd, aName, framework)
{
    var nib2cib = (Nib2Cib == null ? null : Nib2Cib.isa.objj_msgSend0(Nib2Cib, "sharedNib2Cib")),
        frameworks = (nib2cib == null ? null : nib2cib.isa.objj_msgSend0(nib2cib, "frameworks"));
    if (framework)
    {
        var info = (frameworks == null ? null : frameworks.isa.objj_msgSend1(frameworks, "valueForKey:", framework));
        if (!info)
            CPException.isa.objj_msgSend(CPException, "raise:format:", Nib2CibException, "The framework “%@” specified by the image “%@@%@” cannot be found.", framework, aName, framework);
        else if (!info.resourceDirectory)
            CPException.isa.objj_msgSend(CPException, "raise:format:", Nib2CibException, "The framework “%@” specified by the image “%@@%@” has no Resources directory.", framework, aName, framework);
        var path = self.isa.objj_msgSend2(self, "_resourcePathForName:inDirectory:", aName, info.resourceDirectory);
        if (path)
            return {path: path, framework: framework};
    }
    else
    {
        var resourcesDirectory = (nib2cib == null ? null : nib2cib.isa.objj_msgSend0(nib2cib, "appResourceDirectory")),
            path = self.isa.objj_msgSend2(self, "_resourcePathForName:inDirectory:", aName, resourcesDirectory);
        if (path)
            return {path: path, framework: framework};
        var enumerator = (frameworks == null ? null : frameworks.isa.objj_msgSend0(frameworks, "keyEnumerator"));
        while (framework = (enumerator == null ? null : enumerator.isa.objj_msgSend0(enumerator, "nextObject")))
        {
            var info = (frameworks == null ? null : frameworks.isa.objj_msgSend1(frameworks, "valueForKey:", framework));
            if (!info || !info.resourceDirectory)
                continue;
            path = self.isa.objj_msgSend2(self, "_resourcePathForName:inDirectory:", aName, info.resourceDirectory);
            if (path)
                return {path: path, framework: framework};
        }
    }
    CPException.isa.objj_msgSend3(CPException, "raise:format:", Nib2CibException, "The image “%@” cannot be found.", aName);
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
