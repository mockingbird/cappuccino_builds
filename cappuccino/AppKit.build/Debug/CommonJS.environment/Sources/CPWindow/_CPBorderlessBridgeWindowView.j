@STATIC;1.0;i;15;_CPWindowView.jt;2557;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPBorderlessBridgeWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarBackgroundView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setShowsResizeIndicator:"), function $_CPBorderlessBridgeWindowView__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{
}
,["void","BOOL"]), new objj_method(sel_getUid("tile"), function $_CPBorderlessBridgeWindowView__tile(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBorderlessBridgeWindowView").super_class }, "tile");
    var theWindow = objj_msgSend(self, "window"),
        bounds = objj_msgSend(self, "bounds");
    objj_msgSend(objj_msgSend(theWindow, "contentView"), "setFrame:", CGRectMake(0.0, objj_msgSend(self, "toolbarMaxY"), CGRectGetWidth(bounds), CGRectGetHeight(bounds) - objj_msgSend(self, "toolbarMaxY")));
    if (!objj_msgSend(objj_msgSend(theWindow, "toolbar"), "isVisible"))
    {
        objj_msgSend(self._toolbarBackgroundView, "removeFromSuperview");
        self._toolbarBackgroundView = nil;
        return;
    }
    if (!self._toolbarBackgroundView)
    {
        self._toolbarBackgroundView = objj_msgSend(objj_msgSend(CPView, "alloc"), "initWithFrame:", CGRectMakeZero());
        objj_msgSend(self._toolbarBackgroundView, "setBackgroundColor:", objj_msgSend(self, "valueForThemeAttribute:", "toolbar-background-color"));
        objj_msgSend(self._toolbarBackgroundView, "setAutoresizingMask:", CPViewWidthSizable);
        objj_msgSend(self, "addSubview:positioned:relativeTo:", self._toolbarBackgroundView, CPWindowBelow, nil);
    }
    var frame = CGRectMakeZero(),
        toolbarOffset = objj_msgSend(self, "toolbarOffset");
    frame.origin = CGPointMake(toolbarOffset.width, toolbarOffset.height);
    frame.size = objj_msgSend(self._toolbarView, "frame").size;
    objj_msgSend(self._toolbarBackgroundView, "setFrame:", frame);
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPBorderlessBridgeWindowView__defaultThemeClass(self, _cmd)
{
    return "bordeless-bridge-window-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPBorderlessBridgeWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", objj_msgSend(CPColor, "grayColor"), "toolbar-background-color");
}
,["id"])]);
}