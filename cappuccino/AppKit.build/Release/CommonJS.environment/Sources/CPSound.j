@STATIC;1.0;I;21;Foundation/CPObject.jI;22;Foundation/CPRunLoop.jt;6595;objj_executeFile("Foundation/CPObject.j", NO);objj_executeFile("Foundation/CPRunLoop.j", NO);CPSoundLoadStateEmpty = 0;
CPSoundLoadStateLoading = 1;
CPSoundLoadStateCanBePlayed = 2;
CPSoundLoadStateError = 3;
CPSoundPlayBackStatePlay = 0;
CPSoundPlayBackStateStop = 1;
CPSoundPlayBackStatePause = 2;
{var the_class = objj_allocateClassPair(CPObject, "CPSound"),
meta_class = the_class.isa;class_addIvars(the_class, [new objj_ivar("_name"), new objj_ivar("_delegate"), new objj_ivar("_playRequestBeforeLoad"), new objj_ivar("_audioTag"), new objj_ivar("_loadStatus"), new objj_ivar("_playBackStatus")]);objj_registerClassPair(the_class);
class_addMethods(the_class, [new objj_method(sel_getUid("name"), function $CPSound__name(self, _cmd)
{
    return self._name;
}
,["CPString"]), new objj_method(sel_getUid("setName:"), function $CPSound__setName_(self, _cmd, newValue)
{
    self._name = newValue;
}
,["void","CPString"]), new objj_method(sel_getUid("delegate"), function $CPSound__delegate(self, _cmd)
{
    return self._delegate;
}
,["id"]), new objj_method(sel_getUid("setDelegate:"), function $CPSound__setDelegate_(self, _cmd, newValue)
{
    self._delegate = newValue;
}
,["void","id"]), new objj_method(sel_getUid("init"), function $CPSound__init(self, _cmd)
{
    if (self = objj_msgSendSuper({ receiver:self, super_class:objj_getClass("CPSound").super_class }, "init"))
    {
        self._loadStatus = CPSoundLoadStateEmpty;
        self._audioTag = document.createElement("audio");
        self._audioTag.preload = YES;
        self._playRequestBeforeLoad = NO;
        self._audioTag.addEventListener("canplay", function()
        {
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
            objj_msgSend(self, "_soundDidload");
        }, true);
        self._audioTag.addEventListener("ended", function()
        {
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
            objj_msgSend(self, "_soundDidEnd");
        }, true);
        self._audioTag.addEventListener("error", function()
        {
            objj_msgSend(objj_msgSend(CPRunLoop, "currentRunLoop"), "limitDateForMode:", CPDefaultRunLoopMode);
            objj_msgSend(self, "_soundError");
        }, true);
    }
    return self;
}
,["id"]), new objj_method(sel_getUid("initWithContentsOfFile:byReference:"), function $CPSound__initWithContentsOfFile_byReference_(self, _cmd, aFile, byRef)
{
    if (self = objj_msgSend(self, "init"))
    {
        self._loadStatus = CPSoundLoadStateLoading;
        self._audioTag.src = aFile;
    }
    return self;
}
,["id","CPString","BOOL"]), new objj_method(sel_getUid("initWithContentsOfURL:byReference:"), function $CPSound__initWithContentsOfURL_byReference_(self, _cmd, aURL, byRef)
{
    return objj_msgSend(self, "initWithContentsOfFile:byReference:", objj_msgSend(aURL, "absoluteString"), NO);
}
,["id","CPURL","BOOL"]), new objj_method(sel_getUid("initWithData:"), function $CPSound__initWithData_(self, _cmd, someData)
{
    if (self = objj_msgSend(self, "init"))
    {
        self._loadStatus = CPSoundLoadStateLoading;
        self._audioTag.src = objj_msgSend(someData, "rawString");
    }
    return self;
}
,["id","CPData"]), new objj_method(sel_getUid("_soundDidload"), function $CPSound___soundDidload(self, _cmd)
{
    self._loadStatus = CPSoundLoadStateCanBePlayed;
    if (self._playRequestBeforeLoad)
    {
        self._playRequestBeforeLoad = NO;
        objj_msgSend(self, "play");
    }
}
,["void"]), new objj_method(sel_getUid("_soundDidEnd"), function $CPSound___soundDidEnd(self, _cmd)
{
    if (!objj_msgSend(self, "loops"))
        objj_msgSend(self, "stop");
}
,["void"]), new objj_method(sel_getUid("_soundError"), function $CPSound___soundError(self, _cmd)
{
    self._loadStatus = CPSoundLoadStateError;
    CPLog.error("Cannot load sound. Maybe the format of your sound is not compatible with your browser.");
}
,["void"]), new objj_method(sel_getUid("play"), function $CPSound__play(self, _cmd)
{
    if (self._loadStatus === CPSoundLoadStateLoading)
    {
        self._playRequestBeforeLoad = YES;
        return YES;
    }
    if (self._loadStatus !== CPSoundLoadStateCanBePlayed || self._playBackStatus === CPSoundPlayBackStatePlay)
        return NO;
    self._audioTag.play();
    self._playBackStatus = CPSoundPlayBackStatePlay;
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("stop"), function $CPSound__stop(self, _cmd)
{
    if (self._loadStatus !== CPSoundLoadStateCanBePlayed || self._playBackStatus === CPSoundPlayBackStateStop)
        return NO;
    self._audioTag.pause();
    self._audioTag.currentTime = 0.0;
    self._playBackStatus = CPSoundPlayBackStateStop;
    if (self._delegate && objj_msgSend(self._delegate, "respondsToSelector:", sel_getUid("sound:didFinishPlaying:")))
        objj_msgSend(self._delegate, "sound:didFinishPlaying:", self, YES);
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("pause"), function $CPSound__pause(self, _cmd)
{
    if (self._loadStatus !== CPSoundLoadStateCanBePlayed || self._playBackStatus === CPSoundPlayBackStatePause)
        return NO;
    self._audioTag.pause();
    self._playBackStatus = CPSoundPlayBackStatePause;
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("resume"), function $CPSound__resume(self, _cmd)
{
    if (self._loadStatus !== CPSoundLoadStateCanBePlayed || self._playBackStatus !== CPSoundPlayBackStatePause)
        return NO;
    self._audioTag.play();
    self._playBackStatus = CPSoundPlayBackStatePlay;
    return YES;
}
,["BOOL"]), new objj_method(sel_getUid("loops"), function $CPSound__loops(self, _cmd)
{
    return self._audioTag.loop;
}
,["BOOL"]), new objj_method(sel_getUid("setLoops:"), function $CPSound__setLoops_(self, _cmd, shouldLoop)
{
    self._audioTag.loop = shouldLoop;
}
,["void","BOOL"]), new objj_method(sel_getUid("volume"), function $CPSound__volume(self, _cmd)
{
    return self._audioTag.volume;
}
,["double"]), new objj_method(sel_getUid("setVolume:"), function $CPSound__setVolume_(self, _cmd, aVolume)
{
    if (aVolume > 1.0)
        aVolume = 1.0;
    else if (aVolume < 0.0)
        aVolume = 0.0;
    self._audioTag.volume = aVolume;
}
,["void","double"]), new objj_method(sel_getUid("duration"), function $CPSound__duration(self, _cmd)
{
    return self._audioTag.duration;
}
,["double"]), new objj_method(sel_getUid("isPlaying"), function $CPSound__isPlaying(self, _cmd)
{
    return self._playBackStatus === CPSoundPlayBackStatePlay;
}
,["BOOL"])]);
}