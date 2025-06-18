Sample Project for FB18178597

This project demonstrates an (effectively) fatal error in SwiftUI in macOS 26.0 Beta (25A5279m) when a `Settings` view containing a `TabView` with `.animation()` on the selected tab binding also contains a `.confirmationDialog()`

See the code in [SettingsView.swift](https://github.com/siracusa/TabViewWithConfirmationFatalAnimation/blob/main/TabViewWithConfirmationFatalAnimation/SettingsView.swift#L36) for more information.

The exception thrown (in an apparently infinite loop) is:

```
The window has been marked as needing another Update Constraints in Window pass, but it has already had more Update Constraints in Window passes than there are views in the window. 
<SwiftUI.AppKitWindow: 0x7f8ca100a200> 0x656 (1622) {{1054, 280}, {900, 841}} en Future marking as needing Update Constraints in Window might be ignored.
The window has been marked as needing another Update Constraints in Window pass, but it has already had more Update Constraints in Window passes than there are views in the window. 
<SwiftUI.AppKitWindow: 0x7f8ca100a200> 0x656 (1622) {{1054, 280}, {900, 841}} en
(
	0   CoreFoundation                      0x00007ff8037be0b6 __exceptionPreprocess + 242
	1   libobjc.A.dylib                     0x00007ff8032a3140 objc_exception_throw + 62
	2   CoreFoundation                      0x00007ff80387ebf4 -[NSException initWithCoder:] + 0
	3   AppKit                              0x00007ff80819f1f2 -[NSWindow(NSDisplayCycle) _postWindowNeedsUpdateConstraints] + 1982
	4   AppKit                              0x00007ff8075c25dd -[NSView _informContainerThatSubviewsNeedUpdateConstraints] + 60
	5   AppKit                              0x00007ff8082dd56e -[NSView setNeedsUpdateConstraints:] + 506
	6   SwiftUI                             0x00007ff9162e20be SwiftUIGlueClass + 4195038
	7   SwiftUI                             0x00007ff9162ef539 SwiftUIGlueClass + 4249433
	8   SwiftUICore                         0x00007ffb164cc656 _IntelligenceSupportMakeSummarySymbol + 4630102
	9   SwiftUICore                         0x00007ffb164cbaa5 _IntelligenceSupportMakeSummarySymbol + 4627109
	10  SwiftUI                             0x00007ff9162e25a7 SwiftUIGlueClass + 4196295
	11  SwiftUI                             0x00007ff9162f01ac SwiftUIGlueClass + 4252620
	12  SwiftUI                             0x00007ff9162f0243 SwiftUIGlueClass + 4252771
	13  CoreFoundation                      0x00007ff8037471f2 __CFSetApplyFunction_block_invoke + 18
	14  CoreFoundation                      0x00007ff803747056 CFBasicHashApply + 114
	15  CoreFoundation                      0x00007ff803746fc2 CFSetApplyFunction + 162
	16  AppKit                              0x00007ff8082d1bbc -[NSView setFrameSize:] + 881
	17  AppKit                              0x00007ff8081f5647 -[NSThemeFrame setFrameSize:] + 442
	18  AppKit                              0x00007ff80830d163 -[NSWindow _oldPlaceWindow:fromServer:] + 996
	19  AppKit                              0x00007ff80830efeb -[NSWindow _setFrameCommon:display:fromServer:] + 2982
	20  SwiftUI                             0x00007ff9163cc1f3 SwiftUIGlueClass + 5153811
	21  SwiftUI                             0x00007ff9162ea097 SwiftUIGlueClass + 4227767
	22  SwiftUI                             0x00007ff9162de65c SwiftUIGlueClass + 4180092
	23  SwiftUI                             0x00007ff9162ea265 SwiftUIGlueClass + 4228229
	24  CoreFoundation                      0x00007ff803765628 __CFNOTIFICATIONCENTER_IS_CALLING_OUT_TO_AN_OBSERVER__ + 137
	25  CoreFoundation                      0x00007ff8037cbfce ___CFXRegistrationPost_block_invoke + 88
	26  CoreFoundation                      0x00007ff8037cbf22 _CFXRegistrationPost + 515
	27  CoreFoundation                      0x00007ff803744b76 _CFXNotificationPost + 763
	28  Foundation                          0x00007ff80542dd02 -[NSNotificationCenter postNotificationName:object:userInfo:] + 82
	29  AppKit                              0x00007ff8086f4182 -[NSWindow(NSConstraintBasedLayoutInternal) layoutIfNeeded] + 300
	30  AppKit                              0x00007ff807610e19 __NSWindowGetDisplayCycleObserverForLayout_block_invoke + 391
	31  AppKit                              0x00007ff807610730 NSDisplayCycleObserverInvoke + 140
	32  AppKit                              0x00007ff807610362 NSDisplayCycleFlush + 878
	33  QuartzCore                          0x00007ff80d36b717 _ZN2CA11Transaction19run_commit_handlersE18CATransactionPhase + 95
	34  QuartzCore                          0x00007ff80d369e1a _ZN2CA11Transaction6commitEv + 384
	35  QuartzCore                          0x00007ff80d560472 _ZN2CA11Transaction25flush_as_runloop_observerEb + 128
	36  AppKit                              0x00007ff807ce5c2b stepTransactionFlush + 196
	37  UpdateCycle                         0x00007ffd11ccada6 _ZN2UC10DriverCore19_continueProcessingEv + 34
	38  CoreFoundation                      0x00007ff80376dc8d __CFRUNLOOP_IS_CALLING_OUT_TO_AN_OBSERVER_CALLBACK_FUNCTION__ + 23
	39  CoreFoundation                      0x00007ff80376dbaa __CFRunLoopDoObservers + 520
	40  CoreFoundation                      0x00007ff803823b6e _CFRunLoopRunSpecificWithOptions + 446
	41  HIToolbox                           0x00007ff81004e52f RunCurrentEventLoopInMode + 287
	42  HIToolbox                           0x00007ff81005153f ReceiveNextEventCommon + 566
	43  HIToolbox                           0x00007ff8101d92f3 _BlockUntilNextEventMatchingListInMode + 37
	44  AppKit                              0x00007ff807a434b8 _DPSBlockUntilNextEventMatchingListInMode + 172
	45  AppKit                              0x00007ff8075b47d9 _DPSNextEvent + 800
	46  AppKit                              0x00007ff808071e3a -[NSApplication(NSEventRouting) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1268
	47  AppKit                              0x00007ff80807190d -[NSApplication(NSEventRouting) nextEventMatchingMask:untilDate:inMode:dequeue:] + 67
	48  AppKit                              0x00007ff8075abe1f -[NSApplication run] + 472
	49  AppKit                              0x00007ff807597535 NSApplicationMain + 810
	50  SwiftUI                             0x00007ff915d4d65b _NSUpdateCycleSetEnabledPreference + 212009
	51  SwiftUI                             0x00007ff916023131 SwiftUIGlueClass + 1315665
	52  SwiftUI                             0x00007ff91623850b SwiftUIGlueClass + 3499819
	53  TabViewWithConfirmationFatalAnimati 0x00000001024df8ae $s37TabViewWithConfirmationFatalAnimation0abcdeF3AppV5$mainyyFZ + 30
	54  TabViewWithConfirmationFatalAnimati 0x00000001024df949 __debug_main_executable_dylib_entry_point + 9
	55  dyld                                0x00007ff80330b6c5 start + 3237
)
FAULT: NSGenericException: The window has been marked as needing another Update Constraints in Window pass, but it has already had more Update Constraints in Window passes than there are views in the window. 
<SwiftUI.AppKitWindow: 0x7f8ca100a200> 0x656 (1622) {{1054, 280}, {900, 841}} en; (user info absent)
The window has been marked as needing another Update Constraints in Window pass, but it has already had more Update Constraints in Window passes than there are views in the window. 
<SwiftUI.AppKitWindow: 0x7f8ca100a200> 0x656 (1622) {{1054, 280}, {900, 841}} en
(
	0   CoreFoundation                      0x00007ff8037be0b6 __exceptionPreprocess + 242
	1   libobjc.A.dylib                     0x00007ff8032a3140 objc_exception_throw + 62
	2   CoreFoundation                      0x00007ff80387ebf4 -[NSException initWithCoder:] + 0
	3   AppKit                              0x00007ff80819f1f2 -[NSWindow(NSDisplayCycle) _postWindowNeedsUpdateConstraints] + 1982
	4   AppKit                              0x00007ff8082dd56e -[NSView setNeedsUpdateConstraints:] + 506
	5   SwiftUI                             0x00007ff9162e20be SwiftUIGlueClass + 4195038
	6   SwiftUI                             0x00007ff9162f9a69 SwiftUIGlueClass + 4291721
	7   SwiftUI                             0x00007ff91630246c SwiftUIGlueClass + 4327052
	8   SwiftUICore                         0x00007ffb15a5eb71 _UIKitAddSubview + 714732
	9   SwiftUICore                         0x00007ffb15bca139 _UIKitAddSubview + 2203060
	10  CoreFoundation                      0x00007ff80376e3e6 __CFRUNLOOP_IS_CALLING_OUT_TO_A_BLOCK__ + 12
	11  CoreFoundation                      0x00007ff80376e317 __CFRunLoopDoBlocks + 400
	12  CoreFoundation                      0x00007ff80376d165 __CFRunLoopRun + 971
	13  CoreFoundation                      0x00007ff803823bcd _CFRunLoopRunSpecificWithOptions + 541
	14  HIToolbox                           0x00007ff81004e52f RunCurrentEventLoopInMode + 287
	15  HIToolbox                           0x00007ff81005153f ReceiveNextEventCommon + 566
	16  HIToolbox                           0x00007ff8101d92f3 _BlockUntilNextEventMatchingListInMode + 37
	17  AppKit                              0x00007ff807a434b8 _DPSBlockUntilNextEventMatchingListInMode + 172
	18  AppKit                              0x00007ff8075b47d9 _DPSNextEvent + 800
	19  AppKit                              0x00007ff808071e3a -[NSApplication(NSEventRouting) _nextEventMatchingEventMask:untilDate:inMode:dequeue:] + 1268
	20  AppKit                              0x00007ff80807190d -[NSApplication(NSEventRouting) nextEventMatchingMask:untilDate:inMode:dequeue:] + 67
	21  AppKit                              0x00007ff8075abe1f -[NSApplication run] + 472
	22  AppKit                              0x00007ff807597535 NSApplicationMain + 810
	23  SwiftUI                             0x00007ff915d4d65b _NSUpdateCycleSetEnabledPreference + 212009
	24  SwiftUI                             0x00007ff916023131 SwiftUIGlueClass + 1315665
	25  SwiftUI                             0x00007ff91623850b SwiftUIGlueClass + 3499819
	26  TabViewWithConfirmationFatalAnimati 0x00000001024df8ae $s37TabViewWithConfirmationFatalAnimation0abcdeF3AppV5$mainyyFZ + 30
	27  TabViewWithConfirmationFatalAnimati 0x00000001024df949 __debug_main_executable_dylib_entry_point + 9
	28  dyld                                0x00007ff80330b6c5 start + 3237
)
The window has been marked as needing another Layout Window pass, but it has already had more Layout Window passes than there are views in the window. 
<SwiftUI.AppKitWindow: 0x7f8ca100a200> 0x656 (1622) {{1054, 280}, {900, 841}} en Future marking as needing Layout Window might be ignored.
```
