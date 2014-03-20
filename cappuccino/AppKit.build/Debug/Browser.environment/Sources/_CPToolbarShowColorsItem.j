@STATIC;1.0;i;16;_CPToolbarItem.jt;1610;objj_executeFile("_CPToolbarItem.j", YES);{var the_class = objj_allocateClassPair(CPToolbarItem, "_CPToolbarShowColorsItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithItemIdentifier:"), function $_CPToolbarShowColorsItem__initWithItemIdentifier_(self, _cmd, anIgnoredIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarShowColorsItem").super_class }, "initWithItemIdentifier:", CPToolbarShowColorsItemIdentifier);
    if (self)
    {
        objj_msgSend(self, "setMinSize:", CGSizeMake(32.0, 32.0));
        objj_msgSend(self, "setMaxSize:", CGSizeMake(32.0, 32.0));
        objj_msgSend(self, "setLabel:", "Colors");
        objj_msgSend(self, "setPaletteLabel:", "Show Colors");
        objj_msgSend(self, "setTarget:", CPApp);
        objj_msgSend(self, "setAction:", sel_getUid("orderFrontColorPanel:"));
        objj_msgSend(self, "setImage:", objj_msgSend(CPImage, "imageNamed:", CPImageNameColorPanel));
        objj_msgSend(self, "setAlternateImage:", objj_msgSend(CPImage, "imageNamed:", CPImageNameColorPanelHighlighted));
        objj_msgSend(self, "setToolTip:", "Show the Colors panel.");
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPToolbarShowColorsItem__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "init");
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPToolbarShowColorsItem__encodeWithCoder_(self, _cmd, aCoder)
{
}
,["void","CPCoder"])]);
}