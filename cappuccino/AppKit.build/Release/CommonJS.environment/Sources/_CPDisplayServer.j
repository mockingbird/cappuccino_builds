@STATIC;1.0;I;22;Foundation/CPRunLoop.jt;2444;objj_executeFile("Foundation/CPRunLoop.j", NO);var displayObjects = [],
    displayObjectsByUID = {},
    layoutObjects = [],
    layoutObjectsByUID = {},
    runLoop = CPRunLoop.isa.objj_msgSend0(CPRunLoop, "mainRunLoop");
_CPDisplayServerAddDisplayObject = function(anObject)
{
    var UID = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"));
    if (typeof displayObjectsByUID[UID] !== "undefined")
        return;
    var index = displayObjects.length;
    displayObjectsByUID[UID] = index;
    displayObjects[index] = anObject;
}
_CPDisplayServerAddLayoutObject = function(anObject)
{
    var UID = (anObject == null ? null : anObject.isa.objj_msgSend0(anObject, "UID"));
    if (typeof layoutObjectsByUID[UID] !== "undefined")
        return;
    var index = layoutObjects.length;
    layoutObjectsByUID[UID] = index;
    layoutObjects[index] = anObject;
}
{var the_class = objj_allocateClassPair(CPObject, "_CPDisplayServer"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(meta_class, [new objj_method(sel_getUid("run"), function $_CPDisplayServer__run(self, _cmd)
{
    while (layoutObjects.length || displayObjects.length)
    {
        var index = 0;
        for (; index < layoutObjects.length; ++index)
        {
            var object = layoutObjects[index];
            delete layoutObjectsByUID[(object == null ? null : object.isa.objj_msgSend0(object, "UID"))];
            (object == null ? null : object.isa.objj_msgSend0(object, "layoutIfNeeded"));
        }
        layoutObjects = [];
        layoutObjectsByUID = {};
        index = 0;
        for (; index < displayObjects.length; ++index)
        {
            if (layoutObjects.length)
                break;
            var object = displayObjects[index];
            delete displayObjectsByUID[(object == null ? null : object.isa.objj_msgSend0(object, "UID"))];
            (object == null ? null : object.isa.objj_msgSend0(object, "displayIfNeeded"));
        }
        if (index === displayObjects.length)
        {
            displayObjects = [];
            displayObjectsByUID = {};
        }
        else
            displayObjects.splice(0, index);
    }
    (runLoop == null ? null : runLoop.isa.objj_msgSend(runLoop, "performSelector:target:argument:order:modes:", sel_getUid("run"), self, nil, 0, [CPDefaultRunLoopMode]));
}
,["void"])]);
}_CPDisplayServer.isa.objj_msgSend0(_CPDisplayServer, "run");
