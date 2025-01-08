Scriptname HTG:Quests:SQ_RegenesysController extends HTG:QuestExt

Event OnQuestInit()
    Parent.OnQuestInit()

    Logger.Log("Controller Initialized.")
EndEvent

Event OnQuestStarted()
    Logger.Log("Controller Started.")
EndEvent