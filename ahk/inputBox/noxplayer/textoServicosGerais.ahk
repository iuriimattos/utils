; use Sublime and click on
; File > Save with Enconding
; Configure and Execute!
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
#InstallKeybdHook
#UseHook
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SendMode Play
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
F12::Reload
F10::
	InputBox, firstInput, First Input, Write the first text:, , 300, 150
	SendInput, %firstInput%, boa noite{!} {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}Por favor divulge meu contato {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}81 9 8370-5242 {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}Tenho experiência como: {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}- Ajudante de pedreito {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}- Pintura predial e em geral {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}- Servicos gerais {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}Minha esposa tem experiênca com faxina, empregada domestica e tem muita experiência com cozinha {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}Moramos em Maranguape 1, Paulista. Na rua 80 {shift down}{ENTER}{shift up}{shift down}{ENTER}{shift up}Estamos desempregados... Deus te abençoe
	Send, {ENTER}