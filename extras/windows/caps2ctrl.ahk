#Requires AutoHotkey 2

ih := InputHook('L1')
CapsLock Up::ih.Stop
CapsLock:: {
 ih.Start(), ih.Wait()
 Send ih.Input = '' ? '{Esc}' : '^' ih.Input
}
