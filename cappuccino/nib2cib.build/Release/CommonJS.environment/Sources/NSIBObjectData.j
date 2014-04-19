@STATIC;1.0;I;25;AppKit/_CPCibObjectData.ji;8;NSCell.jt;3929;objj_executeFile("AppKit/_CPCibObjectData.j", NO);objj_executeFile("NSCell.j", YES);{
var the_class = objj_getClass("_CPCibObjectData")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"_CPCibObjectData\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("NS_initWithCoder:"), function $_CPCibObjectData__NS_initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSend(self, "init");
    if (self)
    {
        self._namesKeys = objj_msgSend(aCoder, "decodeObjectForKey:", "NSNamesKeys");
        self._namesValues = objj_msgSend(aCoder, "decodeObjectForKey:", "NSNamesValues");
        self._classesKeys = objj_msgSend(aCoder, "decodeObjectForKey:", "NSClassesKeys");
        self._classesValues = objj_msgSend(aCoder, "decodeObjectForKey:", "NSClassesValues");
        self._connections = objj_msgSend(aCoder, "decodeObjectForKey:", "NSConnections");
        self._framework = objj_msgSend(aCoder, "decodeObjectForKey:", "NSFramework");
        self._objectsKeys = objj_msgSend(aCoder, "decodeObjectForKey:", "NSObjectsKeys");
        self._objectsValues = objj_msgSend(aCoder, "decodeObjectForKey:", "NSObjectsValues");
        objj_msgSend(self, "removeCellsFromObjectGraph");
        self._fileOwner = objj_msgSend(aCoder, "decodeObjectForKey:", "NSRoot");
        self._visibleWindows = objj_msgSend(aCoder, "decodeObjectForKey:", "NSVisibleWindows");
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("removeCellsFromObjectGraph"), function $_CPCibObjectData__removeCellsFromObjectGraph(self, _cmd)
{
    var count = self._objectsKeys.length,
        parentForCellUIDs = {},
        promotedChildrenForCellUIDs = {};
    while (count--)
    {
        var child = self._objectsKeys[count];
        if (!child)
            continue;
        var parent = self._objectsValues[count];
        if (objj_msgSend(child, "isKindOfClass:", objj_msgSend(NSCell, "class")))
        {
            parentForCellUIDs[objj_msgSend(child, "UID")] = parent;
            continue;
        }
        if (!objj_msgSend(parent, "isKindOfClass:", objj_msgSend(NSCell, "class")))
            continue;
        var parentUID = objj_msgSend(parent, "UID"),
            children = promotedChildrenForCellUIDs[parentUID];
        if (!children)
        {
            children = [];
            promotedChildrenForCellUIDs[parentUID] = children;
        }
        children.push(child);
        self._objectsKeys.splice(count, 1);
        self._objectsValues.splice(count, 1);
    }
    for (var cellUID in promotedChildrenForCellUIDs)
        if (promotedChildrenForCellUIDs.hasOwnProperty(cellUID))
        {
            var children = promotedChildrenForCellUIDs[cellUID],
                parent = parentForCellUIDs[cellUID];
            children.forEach(function(aChild)
            {
                CPLog.debug("NSIBObjectData: promoted " + aChild + " to child of " + parent);
                self._objectsKeys.push(aChild);
                self._objectsValues.push(parent);
            });
        }
    var count = self._objectsKeys.length;
    while (count--)
    {
        var object = self._objectsKeys[count];
        if (objj_msgSend(object, "respondsToSelector:", sel_getUid("swapCellsForParents:")))
            objj_msgSend(object, "swapCellsForParents:", parentForCellUIDs);
    }
}
,["void"])]);
}{var the_class = objj_allocateClassPair(_CPCibObjectData, "NSIBObjectData"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $NSIBObjectData__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "NS_initWithCoder:", aCoder);
}
,["id","CPCoder"]), new objj_method(sel_getUid("classForKeyedArchiver"), function $NSIBObjectData__classForKeyedArchiver(self, _cmd)
{
    return objj_msgSend(_CPCibObjectData, "class");
}
,["Class"])]);
}