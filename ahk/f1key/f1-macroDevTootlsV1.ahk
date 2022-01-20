;https://www.facebook.com/friends/list
Esc::ExitApp
F1::
Send, ^l
ClipNew=document.querySelector('div[aria-label="All Friends"] > div > div:nth-of-type(2) > div > div:nth-of-type(2) > div > div i').click();
Send, %ClipNew%
Send, {enter}
Sleep, 3000

ClipNew=document.querySelector('div[role=menu] > div > div > div > div > div:nth-of-type(4)').click()
Send, %ClipNew%
Send, {enter}
Sleep, 3000

ClipNew=document.querySelector('div[role=dialog] div[aria-label=Confirm]').click()
Send, %ClipNew%
Send, {enter}
Sleep, 3000