@STATIC;1.0;i;16;_CPToolbarItem.jt;1096;objj_executeFile("_CPToolbarItem.j", YES);{var the_class = objj_allocateClassPair(CPToolbarItem, "_CPToolbarFlexibleSpaceItem"),
meta_class = the_class.isa;objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("initWithItemIdentifier:"), function $_CPToolbarFlexibleSpaceItem__initWithItemIdentifier_(self, _cmd, anIgnoredIdentifier)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("_CPToolbarFlexibleSpaceItem").super_class }, "initWithItemIdentifier:", CPToolbarFlexibleSpaceItemIdentifier);
    if (self)
    {
        objj_msgSend(self, "setMinSize:", CGSizeMake(32.0, 32.0));
        objj_msgSend(self, "setMaxSize:", CGSizeMake(10000.0, 32.0));
    }
    return self;
}
,["id","CPString"]), new objj_method(sel_getUid("initWithCoder:"), function $_CPToolbarFlexibleSpaceItem__initWithCoder_(self, _cmd, aCoder)
{
    return objj_msgSend(self, "init");
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $_CPToolbarFlexibleSpaceItem__encodeWithCoder_(self, _cmd, aCoder)
{
}
,["void","CPCoder"])]);
}