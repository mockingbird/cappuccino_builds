@STATIC;1.0;I;21;Foundation/CPObject.jI;24;Foundation/CPIndexPath.jt;6752;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPIndexPath.j", NO);{var the_class = objj_allocateClassPair(CPObject, "CPTreeNode"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_representedObject"), new objj_ivar("_parentNode"), new objj_ivar("_childNodes")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("representedObject"), function $CPTreeNode__representedObject(self, _cmd)
{
    return self._representedObject;
}
,["id"]), new objj_method(sel_getUid("parentNode"), function $CPTreeNode__parentNode(self, _cmd)
{
    return self._parentNode;
}
,["CPTreeNode"]), new objj_method(sel_getUid("initWithRepresentedObject:"), function $CPTreeNode__initWithRepresentedObject_(self, _cmd, anObject)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTreeNode").super_class }, "init");
    if (self)
    {
        self._representedObject = anObject;
        self._childNodes = [];
    }
    return self;
}
,["id","id"]), new objj_method(sel_getUid("isLeaf"), function $CPTreeNode__isLeaf(self, _cmd)
{
    return ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count")) <= 0;
    var ___r1;
}
,["BOOL"]), new objj_method(sel_getUid("childNodes"), function $CPTreeNode__childNodes(self, _cmd)
{
    return ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "copy"));
    var ___r1;
}
,["CPArray"]), new objj_method(sel_getUid("mutableChildNodes"), function $CPTreeNode__mutableChildNodes(self, _cmd)
{
    return self.isa.objj_msgSend1(self, "mutableArrayValueForKey:", "childNodes");
}
,["CPMutableArray"]), new objj_method(sel_getUid("insertObject:inChildNodesAtIndex:"), function $CPTreeNode__insertObject_inChildNodesAtIndex_(self, _cmd, aTreeNode, anIndex)
{
    ((___r1 = ((___r2 = aTreeNode._parentNode), ___r2 == null ? null : ___r2.isa.objj_msgSend0(___r2, "mutableChildNodes"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectIdenticalTo:", aTreeNode));
    aTreeNode._parentNode = self;
    ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "insertObject:atIndex:", aTreeNode, anIndex));
    var ___r1, ___r2;
}
,["void","id","CPInteger"]), new objj_method(sel_getUid("removeObjectFromChildNodesAtIndex:"), function $CPTreeNode__removeObjectFromChildNodesAtIndex_(self, _cmd, anIndex)
{
    ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", anIndex))._parentNode = nil;
    ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "removeObjectAtIndex:", anIndex));
    var ___r1;
}
,["void","CPInteger"]), new objj_method(sel_getUid("replaceObjectFromChildNodesAtIndex:withObject:"), function $CPTreeNode__replaceObjectFromChildNodesAtIndex_withObject_(self, _cmd, anIndex, aTreeNode)
{
    var oldTreeNode = ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectAtIndex:", anIndex));
    oldTreeNode._parentNode = nil;
    aTreeNode._parentNode = self;
    ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "replaceObjectAtIndex:withObject:", anIndex, aTreeNode));
    var ___r1;
}
,["void","CPInteger","id"]), new objj_method(sel_getUid("objectInChildNodesAtIndex:"), function $CPTreeNode__objectInChildNodesAtIndex_(self, _cmd, anIndex)
{
    return self._childNodes[anIndex];
}
,["id","CPInteger"]), new objj_method(sel_getUid("sortWithSortDescriptors:recursively:"), function $CPTreeNode__sortWithSortDescriptors_recursively_(self, _cmd, sortDescriptors, shouldSortRecursively)
{
    ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "sortUsingDescriptors:", sortDescriptors));
    if (!shouldSortRecursively)
        return;
    var count = ((___r1 = self._childNodes), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "count"));
    while (count--)
        ((___r1 = self._childNodes[count]), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "sortWithSortDescriptors:recursively:", sortDescriptors, YES));
    var ___r1;
}
,["void","CPArray","BOOL"]), new objj_method(sel_getUid("descendantNodeAtIndexPath:"), function $CPTreeNode__descendantNodeAtIndexPath_(self, _cmd, indexPath)
{
    var index = 0,
        count = (indexPath == null ? null : indexPath.isa.objj_msgSend0(indexPath, "length")),
        node = self;
    for (; index < count; ++index)
        node = (node == null ? null : node.isa.objj_msgSend1(node, "objectInChildNodesAtIndex:", (indexPath == null ? null : indexPath.isa.objj_msgSend1(indexPath, "indexAtPosition:", index))));
    return node;
}
,["CPTreeNode","CPIndexPath"])]);
class_addMethods(meta_class, [new objj_method(sel_getUid("treeNodeWithRepresentedObject:"), function $CPTreeNode__treeNodeWithRepresentedObject_(self, _cmd, anObject)
{
    return ((___r1 = self.isa.objj_msgSend0(self, "alloc")), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "initWithRepresentedObject:", anObject));
    var ___r1;
}
,["id","id"])]);
}var CPTreeNodeRepresentedObjectKey = "CPTreeNodeRepresentedObjectKey",
    CPTreeNodeParentNodeKey = "CPTreeNodeParentNodeKey",
    CPTreeNodeChildNodesKey = "CPTreeNodeChildNodesKey";
{
var the_class = objj_getClass("CPTreeNode")
if(!the_class) throw new SyntaxError("*** Could not find definition for class \"CPTreeNode\"");
var meta_class = the_class.isa;class_addMethods(the_class, [new objj_method(sel_getUid("initWithCoder:"), function $CPTreeNode__initWithCoder_(self, _cmd, aCoder)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPTreeNode").super_class }, "init");
    if (self)
    {
        self._representedObject = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTreeNodeRepresentedObjectKey));
        self._parentNode = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTreeNodeParentNodeKey));
        self._childNodes = (aCoder == null ? null : aCoder.isa.objj_msgSend1(aCoder, "decodeObjectForKey:", CPTreeNodeChildNodesKey));
    }
    return self;
}
,["id","CPCoder"]), new objj_method(sel_getUid("encodeWithCoder:"), function $CPTreeNode__encodeWithCoder_(self, _cmd, aCoder)
{
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._representedObject, CPTreeNodeRepresentedObjectKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeConditionalObject:forKey:", self._parentNode, CPTreeNodeParentNodeKey));
    (aCoder == null ? null : aCoder.isa.objj_msgSend2(aCoder, "encodeObject:forKey:", self._childNodes, CPTreeNodeChildNodesKey));
}
,["void","CPCoder"])]);
}