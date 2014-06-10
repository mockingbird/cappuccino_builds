@STATIC;1.0;I;20;Foundation/CPArray.ji;7;CPCib.ji;13;CPResponder.jt;9503;objj_executeFile("Foundation/CPArray.j", NO);objj_executeFile("CPCib.j", YES);objj_executeFile("CPResponder.j", YES);var CPViewControllerCachedCibs;
{var the_class = objj_allocateClassPair(CPResponder, "CPViewController"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_view"), new objj_ivar("_isLoading"), new objj_ivar("_isLazy"), new objj_ivar("_isViewLoaded"), new objj_ivar("_representedObject"), new objj_ivar("_title"), new objj_ivar("_cibName"), new objj_ivar("_cibBundle"), new objj_ivar("_cibExternalNameTable")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("view"), function $CPViewController__view(self, _cmd)
{
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("setView:"), function $CPViewController__setView_(self, _cmd, newValue)
{
    self._view = newValue;
}
,["void","CPView"]), new objj_method(sel_getUid("isViewLoaded"), function $CPViewController__isViewLoaded(self, _cmd)
{
    return self._isViewLoaded;
}
,["BOOL"]), new objj_method(sel_getUid("_setIsViewLoaded:"), function $CPViewController___setIsViewLoaded_(self, _cmd, newValue)
{
    self._isViewLoaded = newValue;
}
,["void","BOOL"]), new objj_method(sel_getUid("representedObject"), function $CPViewController__representedObject(self, _cmd)
{
    return self._representedObject;
}
,["id"]), new objj_method(sel_getUid("setRepresentedObject:"), function $CPViewController__setRepresentedObject_(self, _cmd, newValue)
{
    self._representedObject = newValue;
}
,["void","id"]), new objj_method(sel_getUid("title"), function $CPViewController__title(self, _cmd)
{
    return self._title;
}
,["CPString"]), new objj_method(sel_getUid("setTitle:"), function $CPViewController__setTitle_(self, _cmd, newValue)
{
    self._title = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("cibName"), function $CPViewController__cibName(self, _cmd)
{
    return self._cibName;
}
,["CPString"]), new objj_method(sel_getUid("cibBundle"), function $CPViewController__cibBundle(self, _cmd)
{
    return self._cibBundle;
}
,["CPBundle"]), new objj_method(sel_getUid("cibExternalNameTable"), function $CPViewController__cibExternalNameTable(self, _cmd)
{
    return self._cibExternalNameTable;
}
,["CPDictionary"]), new objj_method(sel_getUid("init"), function $CPViewController__init(self, _cmd)
{
    return objj_msgSend(self, "initWithCibName:bundle:", nil, nil);
}
,["id"]), new objj_method(sel_getUid("initWithCibName:bundle:"), function $CPViewController__initWithCibName_bundle_(self, _cmd, aCibNameOrNil, aCibBundleOrNil)
{
    return objj_msgSend(self, "initWithCibName:bundle:externalNameTable:", aCibNameOrNil, aCibBundleOrNil, nil);
}
,["id","CPString","CPBundle"]), new objj_method(sel_getUid("initWithCibName:bundle:owner:"), function $CPViewController__initWithCibName_bundle_owner_(self, _cmd, aCibNameOrNil, aCibBundleOrNil, anOwner)
{
    return objj_msgSend(self, "initWithCibName:bundle:externalNameTable:", aCibNameOrNil, aCibBundleOrNil, objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", anOwner, CPCibOwner));
}
,["id","CPString","CPBundle","id"]), new objj_method(sel_getUid("initWithCibName:bundle:externalNameTable:"), function $CPViewController__initWithCibName_bundle_externalNameTable_(self, _cmd, aCibNameOrNil, aCibBundleOrNil, anExternalNameTable)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewController").super_class }, "init");
    if (self)
    {
        self._cibName = aCibNameOrNil;
        self._cibBundle = aCibBundleOrNil || objj_msgSend(CPBundle, "mainBundle");
        self._cibExternalNameTable = anExternalNameTable || objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self, CPCibOwner);
        self._isLoading = NO;
        self._isLazy = NO;
    }
    return self;
}
,["id","CPString","CPBundle","CPDictionary"]), new objj_method(sel_getUid("loadView"), function $CPViewController__loadView(self, _cmd)
{
    if (self._view)
        return;
    if (self._cibName)
    {
        var cib = objj_msgSend(CPViewControllerCachedCibs, "objectForKey:", self._cibName);
        if (!cib)
        {
            cib = objj_msgSend(objj_msgSend(CPCib, "alloc"), "initWithCibNamed:bundle:", self._cibName, self._cibBundle);
            objj_msgSend(CPViewControllerCachedCibs, "setObject:forKey:", cib, self._cibName);
        }
        objj_msgSend(cib, "instantiateCibWithExternalNameTable:", self._cibExternalNameTable);
    }
    else
        self._view = objj_msgSend(CPView, "new");
}
,["void"]), new objj_method(sel_getUid("view"), function $CPViewController__view(self, _cmd)
{
    if (!self._view)
    {
        self._isLoading = YES;
        var cibOwner = objj_msgSend(self._cibExternalNameTable, "objectForKey:", CPCibOwner);
        if (objj_msgSend(cibOwner, "respondsToSelector:", sel_getUid("viewControllerWillLoadCib:")))
            objj_msgSend(cibOwner, "viewControllerWillLoadCib:", self);
        objj_msgSend(self, "loadView");
        if (self._view === nil && objj_msgSend(cibOwner, "isKindOfClass:", objj_msgSend(CPDocument, "class")))
            objj_msgSend(self, "setView:", objj_msgSend(cibOwner, "valueForKey:", "view"));
        if (!self._view)
        {
            var reason = objj_msgSend(CPString, "stringWithFormat:", "View for %@ could not be loaded from Cib or no view specified. Override loadView to load the view manually.", self);
            objj_msgSend(CPException, "raise:reason:", CPInternalInconsistencyException, reason);
        }
        if (objj_msgSend(cibOwner, "respondsToSelector:", sel_getUid("viewControllerDidLoadCib:")))
            objj_msgSend(cibOwner, "viewControllerDidLoadCib:", self);
        self._isLoading = NO;
        objj_msgSend(self, "_viewDidLoad");
    }
    else if (self._isLazy)
    {
        self._isLazy = NO;
        objj_msgSend(self, "_viewDidLoad");
    }
    return self._view;
}
,["CPView"]), new objj_method(sel_getUid("_viewDidLoad"), function $CPViewController___viewDidLoad(self, _cmd)
{
    objj_msgSend(self, "willChangeValueForKey:", "isViewLoaded");
    objj_msgSend(self, "viewDidLoad");
    self._isViewLoaded = YES;
    objj_msgSend(self, "didChangeValueForKey:", "isViewLoaded");
}
,["void"]), new objj_method(sel_getUid("viewDidLoad"), function $CPViewController__viewDidLoad(self, _cmd)
{
}
,["void"]), new objj_method(sel_getUid("setView:"), function $CPViewController__setView_(self, _cmd, aView)
{
    var willChangeIsViewLoaded = self._isViewLoaded == NO && aView != nil || self._isViewLoaded == YES && aView == nil;
    if (willChangeIsViewLoaded)
        objj_msgSend(self, "willChangeValueForKey:", "isViewLoaded");
    self._view = aView;
    self._isViewLoaded = aView !== nil;
    if (willChangeIsViewLoaded)
        objj_msgSend(self, "didChangeValueForKey:", "isViewLoaded");
}
,["void","CPView"]), new objj_method(sel_getUid("automaticallyNotifiesObserversOfIsViewLoaded"), function $CPViewController__automaticallyNotifiesObserversOfIsViewLoaded(self, _cmd)
{
    return NO;
}
,["BOOL"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("initialize"), function $CPViewController__initialize(self, _cmd)
{
    if (self !== objj_msgSend(CPViewController, "class"))
        return;
    CPViewControllerCachedCibs = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
}
,["void"])]);
}var CPViewControllerViewKey = "CPViewControllerViewKey",
    CPViewControllerTitleKey = "CPViewControllerTitleKey",
    CPViewControllerCibNameKey = "CPViewControllerCibNameKey",
    CPViewControllerBundleKey = "CPViewControllerBundleKey";
{
var the_class = objj_getClass("CPViewController")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPViewController\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPViewController__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewController").super_class }, "initWithCoder:", aCoder);
    if (self)
    {
        self._view = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewControllerViewKey);
        self._title = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewControllerTitleKey);
        self._cibName = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewControllerCibNameKey);
        var bundlePath = objj_msgSend(aCoder, "decodeObjectForKey:", CPViewControllerBundleKey);
        self._cibBundle = bundlePath ? objj_msgSend(CPBundle, "bundleWithPath:", bundlePath) : objj_msgSend(CPBundle, "mainBundle");
        self._cibExternalNameTable = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", self, CPCibOwner);
        self._isLazy = YES;
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPViewController__encodeWithCoder_(self, _cmd, aCoder)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPViewController").super_class }, "encodeWithCoder:", aCoder);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._view, CPViewControllerViewKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._title, CPViewControllerTitleKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", self._cibName, CPViewControllerCibNameKey);
    objj_msgSend(aCoder, "encodeObject:forKey:", objj_msgSend(self._cibBundle, "bundlePath"), CPViewControllerBundleKey);
}
,["void","CPCoder"])]);
}