Scriptname HTG:Core:Terminals:Regenesys_SystemIntroduction extends HTG:TerminalMenuExt

GlobalVariable Property FirstActivation Mandatory Const Auto

Int _acceptItemId = 1

Event OnTerminalMenuEnter(TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    Parent.OnTerminalMenuEnter(akTerminalBase, akTerminalRef)

    If FirstActivation.GetValueInt() == 0
    EndIf
EndEvent

Event OnTerminalMenuItemRun(int auiMenuItemID, TerminalMenu akTerminalBase, ObjectReference akTerminalRef)
    Parent.OnTerminalMenuItemRun(auiMenuItemID, akTerminalBase, akTerminalRef)

    If auiMenuItemID == _acceptItemId
        FirstActivation.SetValueInt(0)
    EndIf
EndEvent