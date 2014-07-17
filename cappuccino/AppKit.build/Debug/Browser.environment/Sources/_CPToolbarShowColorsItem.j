@STATIC;1.0;i;16;_CPToolbarItem.jt;1952;objj_executeFile("_CPToolbarItem.j", YES);{var the_class = objj_allocateClassPair(CPToolbarItem, "_CPToolbarShowColorsItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithItemIdentifier:"), function $_CPToolbarShowColorsItem__initWithItemIdentifier_(self, _cmd, anIgnoredIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarShowColorsItem").super_class }, "initWithItemIdentifier:", CPToolbarShowColorsItemIdentifier);
    if (self)
    {
        (self == null ? null : self.isa.objj_msgSend1(self, "setMinSize:", CGSizeMake(32.0, 32.0)));
        (self == null ? null : self.isa.objj_msgSend1(self, "setMaxSize:", CGSizeMake(32.0, 32.0)));
        (self == null ? null : self.isa.objj_msgSend1(self, "setLabel:", "Colors"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setPaletteLabel:", "Show Colors"));
        (self == null ? null : self.isa.objj_msgSend1(self, "setTarget:", CPApp));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAction:", sel_getUid("orderFrontColorPanel:")));
        (self == null ? null : self.isa.objj_msgSend1(self, "setImage:", CPImage.isa.objj_msgSend1(CPImage, "imageNamed:", CPImageNameColorPanel)));
        (self == null ? null : self.isa.objj_msgSend1(self, "setAlternateImage:", CPImage.isa.objj_msgSend1(CPImage, "imageNamed:", CPImageNameColorPanelHighlighted)));
        (self == null ? null : self.isa.objj_msgSend1(self, "setToolTip:", "Show the Colors panel."));
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPToolbarShowColorsItem__initWithCoder_(self, _cmd, aCoder)
{
    return self.isa.objj_msgSend0(self, "init");
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPToolbarShowColorsItem__encodeWithCoder_(self, _cmd, aCoder)
{
}
,["void","CPCoder"])]);
}