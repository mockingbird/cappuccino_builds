@STATIC;1.0;i;15;_CPWindowView.jt;3189;objj_executeFile("_CPWindowView.j", YES);{var the_class = objj_allocateClassPair(_CPWindowView, "_CPBorderlessBridgeWindowView"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_toolbarBackgroundView")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("setShowsResizeIndicator:"), function $_CPBorderlessBridgeWindowView__setShowsResizeIndicator_(self, _cmd, shouldShowResizeIndicator)
{
}
,["void","BOOL"]), new objj_method(sel_getUid("tile"), function $_CPBorderlessBridgeWindowView__tile(self, _cmd)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPBorderlessBridgeWindowView").super_class }, "tile");
    var theWindow = self.isa.objj_msgSend0(self, "window"),
        bounds = self.isa.objj_msgSend0(self, "bounds");
    ((___r1 = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "contentView"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", CGRectMake(0.0, self.isa.objj_msgSend0(self, "toolbarMaxY"), CGRectGetWidth(bounds), CGRectGetHeight(bounds) - self.isa.objj_msgSend0(self, "toolbarMaxY"))));
    if (!((___r1 = (theWindow == null ? null : theWindow.isa.objj_msgSend0(theWindow, "toolbar"))), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "isVisible")))
    {
        ((___r1 = self._toolbarBackgroundView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "removeFromSuperview"));
        self._toolbarBackgroundView = nil;
        return;
    }
    if (!self._toolbarBackgroundView)
    {
        self._toolbarBackgroundView = ((___r1 = CPView.isa.objj_msgSend0(CPView, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithFrame:", CGRectMakeZero()));
        ((___r1 = self._toolbarBackgroundView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setBackgroundColor:", self.isa.objj_msgSend1(self, "valueForThemeAttribute:", "toolbar-background-color")));
        ((___r1 = self._toolbarBackgroundView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setAutoresizingMask:", CPViewWidthSizable));
        self.isa.objj_msgSend3(self, "addSubview:positioned:relativeTo:", self._toolbarBackgroundView, CPWindowBelow, nil);
    }
    var frame = CGRectMakeZero(),
        toolbarOffset = self.isa.objj_msgSend0(self, "toolbarOffset");
    frame.origin = CGPointMake(toolbarOffset.width, toolbarOffset.height);
    frame.size = ((___r1 = self._toolbarView), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "frame")).size;
    ((___r1 = self._toolbarBackgroundView), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "setFrame:", frame));
    var ___r1;
}
,["void"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("defaultThemeClass"), function $_CPBorderlessBridgeWindowView__defaultThemeClass(self, _cmd)
{
    return "bordeless-bridge-window-view";
}
,["CPString"]), new objj_method(sel_getUid("themeAttributes"), function $_CPBorderlessBridgeWindowView__themeAttributes(self, _cmd)
{
    return objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "initWithObjectsAndKeys:", CPColor.isa.objj_msgSend0(CPColor, "grayColor"), "toolbar-background-color");
}
,["CPDictionary"])]);
}