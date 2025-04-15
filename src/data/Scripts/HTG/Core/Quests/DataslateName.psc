Scriptname HTG:Core:Quests:DataslateName extends HTG:ReferenceAliasExt
import HTG:Quests

; DataslateTracker Property DataslateTracker Auto Const Mandatory

ObjectReference _kTracker
Bool _kRemove

; Event OnInit()
;     Parent.OnInit()
;     ; RegisterForRemoteEvent(DataslateTracker, "OnAliasInit")
;     ; RegisterForRemoteEvent(DataslateTracker, "OnAliasChanged")
; EndEvent

; Event OnAliasShutdown()
;     UnregisterForRemoteEvent(DataslateTracker, "OnAliasInit")
;     UnregisterForRemoteEvent(DataslateTracker, "OnAliasChanged")
; EndEvent

Event OnAliasInit()
    Parent.OnAliasInit()
    ; _SetReference()
    Logger.Log("Initial Value: " + GetRef())
EndEvent

Event OnAliasChanged(ObjectReference akObject, bool abRemove)
    Parent.OnAliasChanged(akObject, abRemove)

    Logger.Log("Current Value: " + GetRef() + "\n" \ 
    + "New Value: " + akObject + "\n" \
    + "Adding Reference: " + !abRemove)
    ; _SetReference()
EndEvent

; Event OnTimer(int aiTimerID)
;     Parent.OnTimer(aiTimerID)
; EndEvent

; Event Alias.OnAliasInit(Alias akSender)
;     _kTracker = (aksender as ReferenceAlias).GetRef()

;     If IsInitialized && GetOwningQuest().IsRunning()
;         Int timerId = SystemUtilities.Timers.SystemTimerIds.MainId
;         If IsInitialRun
;             timerId = SystemUtilities.Timers.SystemTimerIds.InitialRunId
;         EndIf

;         StartTimer(SystemUtilities.Timers.TimerDefaults.Interval, timerId)  
;     EndIf
; ;    ForceRefTo((aksender as ReferenceAlias).GetRef())
; EndEvent

; Event ReferenceAlias.OnAliasChanged(ReferenceAlias akSender, ObjectReference akObject, bool abRemove)
;     _kRemove = abRemove
;     _kTracker = akObject
    
;     If IsInitialized && GetOwningQuest().IsRunning()
;         Int timerId = SystemUtilities.Timers.SystemTimerIds.MainId
;         If IsInitialRun
;             timerId = SystemUtilities.Timers.SystemTimerIds.InitialRunId
;         EndIf

;         StartTimer(SystemUtilities.Timers.TimerDefaults.Interval, timerId)  
;     EndIf
; EndEvent

; Function _InitialRun()
;     _SetReference()
; EndFunction

; Bool Function _Main()
;     _SetReference()
;     return True
; EndFunction

Function _SetReference()
    If _kTracker != None
        If _kRemove
            RemoveFromRef(_kTracker)
            _kRemove = False
        Else
            ForceRefTo(_kTracker)
        EndIf
        _kTracker = None
    EndIf
EndFunction