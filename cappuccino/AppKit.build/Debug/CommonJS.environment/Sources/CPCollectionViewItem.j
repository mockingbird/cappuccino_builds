@STATIC;1.0;i;18;CPViewController.jt;2401;objj_executeFile("CPViewController.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "CPCollectionViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isSelected"), new objj_ivar("_cachedArchive")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPCollectionViewItem__copy(self, _cmd)
{
    var cibName = objj_msgSend(self, "cibName"),
        copy;
    if (cibName)
    {
        copy = objj_msgSend(objj_msgSend(objj_msgSend(self, "class"), "alloc"), "initWithCibName:bundle:", cibName, objj_msgSend(self, "cibBundle"));
    }
    else
    {
        if (!self._cachedArchive)
            self._cachedArchive = objj_msgSend(CPKeyedArchiver, "archivedDataWithRootObject:", self);
        copy = objj_msgSend(CPKeyedUnarchiver, "unarchiveObjectWithData:", self._cachedArchive);
    }
    objj_msgSend(copy, "setRepresentedObject:", objj_msgSend(self, "representedObject"));
    objj_msgSend(copy, "setSelected:", self._isSelected);
    return copy;
}
,["id"]), new objj_method(sel_getUid("setRepresentedObject:"), function $CPCollectionViewItem__setRepresentedObject_(self, _cmd, anObject)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionViewItem").super_class }, "setRepresentedObject:", anObject);
    var view = objj_msgSend(self, "view");
    if (objj_msgSend(view, "respondsToSelector:", sel_getUid("setRepresentedObject:")))
        objj_msgSend(view, "setRepresentedObject:", objj_msgSend(self, "representedObject"));
}
,["void","id"]), new objj_method(sel_getUid("setSelected:"), function $CPCollectionViewItem__setSelected_(self, _cmd, shouldBeSelected)
{
    shouldBeSelected = !!shouldBeSelected;
    if (self._isSelected === shouldBeSelected)
        return;
    self._isSelected = shouldBeSelected;
    var view = objj_msgSend(self, "view");
    if (objj_msgSend(view, "respondsToSelector:", sel_getUid("setSelected:")))
        objj_msgSend(view, "setSelected:", objj_msgSend(self, "isSelected"));
}
,["void","BOOL"]), new objj_method(sel_getUid("isSelected"), function $CPCollectionViewItem__isSelected(self, _cmd)
{
    return self._isSelected;
}
,["BOOL"]), new objj_method(sel_getUid("collectionView"), function $CPCollectionViewItem__collectionView(self, _cmd)
{
    return objj_msgSend(self._view, "superview");
}
,["CPCollectionView"])]);
}