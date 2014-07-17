@STATIC;1.0;i;18;CPViewController.jt;2925;objj_executeFile("CPViewController.j", YES);{var the_class = objj_allocateClassPair(CPViewController, "CPCollectionViewItem"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_isSelected"), new objj_ivar("_cachedArchive")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("copy"), function $CPCollectionViewItem__copy(self, _cmd)
{
    var cibName = self.isa.objj_msgSend0(self, "cibName"),
        copy;
    if (cibName)
    {
        copy = ((___r1 = ((___r2 = self.isa.objj_msgSend0(self, "class")), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "alloc"))), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "initWithCibName:bundle:", cibName, self.isa.objj_msgSend0(self, "cibBundle")));
    }
    else
    {
        if (!self._cachedArchive)
            self._cachedArchive = CPKeyedArchiver.isa.objj_msgSend1(CPKeyedArchiver, "archivedDataWithRootObject:", self);
        copy = CPKeyedUnarchiver.isa.objj_msgSend1(CPKeyedUnarchiver, "unarchiveObjectWithData:", self._cachedArchive);
    }
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setRepresentedObject:", self.isa.objj_msgSend0(self, "representedObject")));
    (copy == null ? null : copy.isa.objj_msgSend1(copy, "setSelected:", self._isSelected));
    return copy;
    var ___r1, ___r2;
}
,["id"]), new objj_method(sel_getUid("setRepresentedObject:"), function $CPCollectionViewItem__setRepresentedObject_(self, _cmd, anObject)
{
    objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPCollectionViewItem").super_class }, "setRepresentedObject:", anObject);
    var view = self.isa.objj_msgSend0(self, "view");
    if ((view == null ? null : view.isa.objj_msgSend1(view, "respondsToSelector:", sel_getUid("setRepresentedObject:"))))
        (view == null ? null : view.isa.objj_msgSend1(view, "setRepresentedObject:", self.isa.objj_msgSend0(self, "representedObject")));
}
,["void","id"]), new objj_method(sel_getUid("setSelected:"), function $CPCollectionViewItem__setSelected_(self, _cmd, shouldBeSelected)
{
    shouldBeSelected = !!shouldBeSelected;
    if (self._isSelected === shouldBeSelected)
        return;
    self._isSelected = shouldBeSelected;
    var view = self.isa.objj_msgSend0(self, "view");
    if ((view == null ? null : view.isa.objj_msgSend1(view, "respondsToSelector:", sel_getUid("setSelected:"))))
        (view == null ? null : view.isa.objj_msgSend1(view, "setSelected:", self.isa.objj_msgSend0(self, "isSelected")));
}
,["void","BOOL"]), new objj_method(sel_getUid("isSelected"), function $CPCollectionViewItem__isSelected(self, _cmd)
{
    return self._isSelected;
}
,["BOOL"]), new objj_method(sel_getUid("collectionView"), function $CPCollectionViewItem__collectionView(self, _cmd)
{
    return ((___r1 = self._view), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "superview"));
    var ___r1;
}
,["CPCollectionView"])]);
}