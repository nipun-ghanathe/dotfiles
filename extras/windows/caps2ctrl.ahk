#Requires AutoHotkey 2

SetCapsLockState("Off")

global WaitingForCtrlInput := false
global SentCtrlDownWithKey := false

*CapsLock::
{
	global WaitingForCtrlInput, SentCtrlDownWithKey

	key := ""
	WaitingForCtrlInput := true

	; Capture one key, timeout 1s, allow all keys except Esc
	ih := InputHook("B C L1 T1", "{Esc}")
	ih.Start()
	ih.Wait()

	WaitingForCtrlInput := false

	if (ih.EndReason = "Max") {
		key := ih.Input
		SentCtrlDownWithKey := true
		Send("{Ctrl down}" key)
	}

	KeyWait("CapsLock")
}

*CapsLock up::
{
	global WaitingForCtrlInput, SentCtrlDownWithKey

	if (SentCtrlDownWithKey) {
		Send("{Ctrl up}")
		SentCtrlDownWithKey := false
	}
	else
	{
		if (A_TimeSincePriorHotkey < 120)
		{
			if (WaitingForCtrlInput) {
				Send("{Esc 2}")
			}
			else
			{
				Send("{Esc}")
			}
		}
	}
}
