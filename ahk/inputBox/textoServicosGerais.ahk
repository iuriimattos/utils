; use Sublime and click on
; File > Save with Enconding
; Configure and Execute!
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
F10::
	InputBox, firstInput, First Input, Write the first text:, , 300, 150
lorem = 
(
%firstInput%, boa noite{!} Pelo amor de DEUS divulge meu contato.

81 9 8370-5242

Tenho experiência como:

- Ajudante de pedreiro ( servente )
- Pintura predial e em geral
- Serviços gerais

Minha esposa tem experiência como, empregada domestica, faxina e tem muita experiencia com cozinha.

Moramos em Maranguape 1, Paulista. Na rua 80.

Estamos desempregados... Deus te abencoe.
)	
	Send, %lorem%
	Send, {ENTER}