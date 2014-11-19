@STATIC;1.0;i;9;CPArray.ji;14;CPDictionary.ji;10;CPObject.ji;10;CPString.ji;7;CPURL.ji;17;CPURLConnection.ji;14;CPURLRequest.jt;8612;objj_executeFile("CPArray.j", YES);objj_executeFile("CPDictionary.j", YES);objj_executeFile("CPObject.j", YES);objj_executeFile("CPString.j", YES);objj_executeFile("CPURL.j", YES);objj_executeFile("CPURLConnection.j", YES);objj_executeFile("CPURLRequest.j", YES);var setURLResourceValuesForKeysFromProperties = function(aURL, keys, properties)
{
    var resourceType = (properties == null ? null : properties.isa.objj_msgSend1(properties, "objectForKey:", "resourcetype"));
    if (resourceType === CPWebDAVManagerCollectionResourceType)
    {
        (aURL == null ? null : aURL.isa.objj_msgSend2(aURL, "setResourceValue:forKey:", YES, CPURLIsDirectoryKey));
        (aURL == null ? null : aURL.isa.objj_msgSend2(aURL, "setResourceValue:forKey:", NO, CPURLIsRegularFileKey));
    }
    else if (resourceType === CPWebDAVManagerNonCollectionResourceType)
    {
        (aURL == null ? null : aURL.isa.objj_msgSend2(aURL, "setResourceValue:forKey:", NO, CPURLIsDirectoryKey));
        (aURL == null ? null : aURL.isa.objj_msgSend2(aURL, "setResourceValue:forKey:", YES, CPURLIsRegularFileKey));
    }
    var displayName = (properties == null ? null : properties.isa.objj_msgSend1(properties, "objectForKey:", "displayname"));
    if (displayName !== nil)
    {
        (aURL == null ? null : aURL.isa.objj_msgSend2(aURL, "setResourceValue:forKey:", displayName, CPURLNameKey));
        (aURL == null ? null : aURL.isa.objj_msgSend2(aURL, "setResourceValue:forKey:", displayName, CPURLLocalizedNameKey));
    }
};
CPWebDAVManagerCollectionResourceType = 1;
CPWebDAVManagerNonCollectionResourceType = 0;
{var the_class = objj_allocateClassPair(CPObject, "CPWebDAVManager"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_blocksForConnections")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("init"), function $CPWebDAVManager__init(self, _cmd)
{
    self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPWebDAVManager").super_class }, "init");
    if (self)
        self._blocksForConnections = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    return self;
}
,["id"]), new objj_method(sel_getUid("contentsOfDirectoryAtURL:includingPropertiesForKeys:options:block:"), function $CPWebDAVManager__contentsOfDirectoryAtURL_includingPropertiesForKeys_options_block_(self, _cmd, aURL, keys, aMask, aBlock)
{
    var properties = [],
        count = (keys == null ? null : keys.isa.objj_msgSend0(keys, "count"));
    while (count--)
        properties.push(WebDAVPropertiesForURLKeys[keys[count]]);
    var makeContents = function(aURL, response)
    {
        var contents = [],
            URLString = nil,
            URLStrings = (response == null ? null : response.isa.objj_msgSend0(response, "keyEnumerator"));
        while ((URLString = (URLStrings == null ? null : URLStrings.isa.objj_msgSend0(URLStrings, "nextObject"))) !== nil)
        {
            var URL = CPURL.isa.objj_msgSend1(CPURL, "URLWithString:", URLString),
                properties = (response == null ? null : response.isa.objj_msgSend1(response, "objectForKey:", URLString));
            if (!((___r1 = (URL == null ? null : URL.isa.objj_msgSend0(URL, "absoluteString"))), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "isEqual:", (aURL == null ? null : aURL.isa.objj_msgSend0(aURL, "absoluteString")))))
            {
                contents.push(URL);
                setURLResourceValuesForKeysFromProperties(URL, keys, properties);
            }
        }
        return contents;
        var ___r1;
    };
    if (!aBlock)
        return makeContents(aURL, self.isa.objj_msgSend(self, "PROPFIND:properties:depth:block:", aURL, properties, 1, nil));
    self.isa.objj_msgSend(self, "PROPFIND:properties:depth:block:", aURL, properties, 1, function(aURL, response)
    {
        aBlock(aURL, makeContents(aURL, response));
    });
}
,["CPArray","CPURL","CPArray","CPDirectoryEnumerationOptions","Function"]), new objj_method(sel_getUid("PROPFIND:properties:depth:block:"), function $CPWebDAVManager__PROPFIND_properties_depth_block_(self, _cmd, aURL, properties, aDepth, aBlock)
{
    var request = CPURLRequest.isa.objj_msgSend1(CPURLRequest, "requestWithURL:", aURL);
    (request == null ? null : request.isa.objj_msgSend1(request, "setHTTPMethod:", "PROPFIND"));
    (request == null ? null : request.isa.objj_msgSend2(request, "setValue:forHTTPHeaderField:", aDepth, "Depth"));
    var HTTPBody = ["<?xml version=\"1.0\"?><a:propfind xmlns:a=\"DAV:\">"],
        index = 0,
        count = properties.length;
    for (; index < count; ++index)
        HTTPBody.push("<a:prop><a:", properties[index], "/></a:prop>");
    HTTPBody.push("</a:propfind>");
    (request == null ? null : request.isa.objj_msgSend1(request, "setHTTPBody:", HTTPBody.join("")));
    if (!aBlock)
        return parsePROPFINDResponse(((___r1 = CPURLConnection.isa.objj_msgSend2(CPURLConnection, "sendSynchronousRequest:returningResponse:", request, nil)), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "rawString")));
    else
    {
        var connection = CPURLConnection.isa.objj_msgSend2(CPURLConnection, "connectionWithRequest:delegate:", request, self);
        ((___r1 = self._blocksForConnections), ___r1 == null ? null : ___r1.isa.objj_msgSend2(___r1, "setObject:forKey:", aBlock, (connection == null ? null : connection.isa.objj_msgSend0(connection, "UID"))));
    }
    var ___r1;
}
,["CPDictionary","CPURL","CPDictionary","CPString","Function"]), new objj_method(sel_getUid("connection:didReceiveData:"), function $CPWebDAVManager__connection_didReceiveData_(self, _cmd, aURLConnection, aString)
{
    var block = ((___r1 = self._blocksForConnections), ___r1 == null ? null : ___r1.isa.objj_msgSend1(___r1, "objectForKey:", (aURLConnection == null ? null : aURLConnection.isa.objj_msgSend0(aURLConnection, "UID"))));
    block(((___r1 = aURLConnection._request), ___r1 == null ? null : ___r1.isa.objj_msgSend0(___r1, "URL")), parsePROPFINDResponse(aString));
    var ___r1;
}
,["void","CPURLConnection","CPString"])]);
}var WebDAVPropertiesForURLKeys = {};
WebDAVPropertiesForURLKeys[CPURLNameKey] = "displayname";
WebDAVPropertiesForURLKeys[CPURLLocalizedNameKey] = "displayname";
WebDAVPropertiesForURLKeys[CPURLIsRegularFileKey] = "resourcetype";
WebDAVPropertiesForURLKeys[CPURLIsDirectoryKey] = "resourcetype";
var XMLDocumentFromString = function(anXMLString)
{
    if (typeof window["ActiveXObject"] !== "undefined")
    {
        var XMLDocument = new ActiveXObject("Microsoft.XMLDOM");
        XMLDocument.async = false;
        XMLDocument.loadXML(anXMLString);
        return XMLDocument;
    }
    return (new DOMParser()).parseFromString(anXMLString, "text/xml");
};
var parsePROPFINDResponse = function(anXMLString)
{
    var XMLDocument = XMLDocumentFromString(anXMLString),
        responses = XMLDocument.getElementsByTagNameNS("*", "response"),
        responseIndex = 0,
        responseCount = responses.length,
        propertiesForURLs = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
    for (; responseIndex < responseCount; ++responseIndex)
    {
        var response = responses[responseIndex],
            elements = ((response.getElementsByTagNameNS("*", "prop")).item(0)).childNodes,
            index = 0,
            count = elements.length,
            properties = objj_msgSend(objj_msgSend(CPDictionary, "alloc"), "init");
        for (; index < count; ++index)
        {
            var element = elements[index];
            if (element.nodeType === 8 || element.nodeType === 3)
                continue;
            var nodeName = element.nodeName,
                colonIndex = nodeName.lastIndexOf(':');
            if (colonIndex > -1)
                nodeName = nodeName.substr(colonIndex + 1);
            if (nodeName === "resourcetype")
                (properties == null ? null : properties.isa.objj_msgSend2(properties, "setObject:forKey:", element.firstChild ? CPWebDAVManagerCollectionResourceType : CPWebDAVManagerNonCollectionResourceType, nodeName));
            else
                (properties == null ? null : properties.isa.objj_msgSend2(properties, "setObject:forKey:", element.firstChild.nodeValue, nodeName));
        }
        var href = (response.getElementsByTagNameNS("*", "href")).item(0);
        (propertiesForURLs == null ? null : propertiesForURLs.isa.objj_msgSend2(propertiesForURLs, "setObject:forKey:", properties, href.firstChild.nodeValue));
    }
    return propertiesForURLs;
};
var mapURLsAndProperties = function(properties, ignoredURL)
{
};
