SetTitleMatchMode, 2
#NoEnv
#Persistent
;#Warn
setworkingdir,%a_scriptdir%
tl1:=""
Gui,1:default
Gui,1: +AlwaysOnTop
Gui,1: -DPIScale
SS_REALSIZECONTROL := 0x40
wa:=a_screenwidth
ha:=a_screenheight
xx:=100
clipboard=
cl=
ex:=""
transform,s,chr,32
gosub,language
rssini=%a_scriptdir%\translate.ini
ifnotexist,%rssini% ;- first run
{
   translateto=pt ;- portuguese
   IniWrite,%translateto%, %rssini% ,Lang1 ,key1
}
Gui,1:Color,Black,Black
Gui, Font,s14 cYellow ,Lucida Console
IniRead, tl1, %rssini%,Lang1 ,key1
global tl1,JS

Insert::
   InputBox, sleepMS, Tempo de espera, formato de milisegundos., , 100, 100
   global sleepVar := sleepMS
Return
F1::
   global JESUS_MEU_SALVADOR_E_SENHOR:= "Romanos 10;9 - Se você confessar com a sua boca que Jesus é Senhor e crer em seu coração que Deus o ressuscitou dentre os mortos, será salvo."
   action(str) {
      languages := ["en","zh","hi","es","fr","ar","bn","pt","id","ru","ja"]
      for index, language in languages
      {
         translated := GoogleTranslate(str, "en", language)
         if WinActive("Mozilla Firefox"){
            Pause
         } else {
            if WinActive("Administrator") {
               Pause
            }
            ControlSend,ahk_parent,%translated%,ahk_exe firefox.exe
            ControlSend,ahk_parent,{ENTER},ahk_exe firefox.exe
            Sleep, sleepVar
         }
      }
   }
   Loop {
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 10;9 - PART A - If you confess with your mouth that Jesus is Lord"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 10;9 - PART B - And believe in your heart that God raised him from the dead, you will be saved."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;9 - Love must be sincere. Hate what is bad; hold on to what is good."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;10 - Dedicate yourself to one another with brotherly love. Prefer to honor others more than yourself."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;11 - Never lack zeal, be fervent in spirit, serve the Lord."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;12 - Rejoice in hope, be patient in tribulation, persevere in prayer."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;13 - Share what you have with the saints in your needs. Practice hospitality."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;14 - Bless those who persecute you; bless, and do not curse them."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;15 - Rejoice with those who rejoice; weep with those who mourn."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;16 - PART A - Have the same attitude towards each other. Do not be proud,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;16 - PART B - But be willing to associate with people of inferior position. Do not be wise in your own eyes."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;17 - Do not repay anyone bad for evil. Try to do what is right in the eyes of all."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;18 - Do everything possible to live in peace with everyone."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;19 - Beloved, never seek revenge, but let God be angry, for it is written: Vengeance is mine; I will repay, says the Lord."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;20 - PART A - On the contrary: If your enemy is hungry, feed him; if he is thirsty, feed him."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;20 - PART B - By doing this, you will pile up hot coals on his head."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 12;21 - Do not let yourself be overcome by evil, but overcome evil with good."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 11;10 - For this reason and because of the angels, the woman must have on her head a sign of authority."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 11;11 - In the Lord, however, the woman is not independent of the man, nor the man independent of the woman."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 11;12 - For just as a woman came from a man, so a man is born from a woman. But everything comes from God."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;2 - Be humble, gentle towards others and patients, on the basis of mutual understanding and with sincere affection."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;26 - Do not sin, letting the anger take hold of you. Before the day is over, make your irritation stop."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;32 - Instead, be kind and understanding to each other, forgiving each other, just as Christ also forgave you."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 11;3 - PART A - But I want you to understand that the head of every man is Christ,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 11;3 - PART B - And the head of a woman is man, and the head of Christ is God."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 11;8 - For the man did not originate from the woman, but the woman from the man;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 11;9 - moreover, man was not created because of woman, but woman because of man."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;10 - An exemplary wife; happy to find her. She is much more valuable than rubies."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;11 - Her husband has complete confidence in her and never lacks anything."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;12 - She only does good, and never evil, every day of her life."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;17 - Give yourself willingly to your work; your arms are strong and vigorous."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;23 - Your husband is respected at the city gate, where he takes a seat among the authorities of his land."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;26 - Speak with wisdom and teach with love."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;27 - Take care of your home business and do not give way to laziness."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;28 - Her children stand up and praise her; her husband also praises her, saying:"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;29 - 'Many women are exemplary, but you overcome them all.'"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;30 - Beauty is deceitful, and beauty is fleeting; but the woman who fears the Lord will be praised."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 31;31 - May she receive the reward she deserves, and her works be praised at the city gate."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Mark 9;22 - PART A - And he has often thrown it into fire, and into water, to destroy it;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Mark 9;22 - PART B - But if you can do anything, have compassion on us, and help us."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Mark 9;23 - And Jesus said to him: If you can believe, everything is possible to him who believes."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Mark 9;24 - And soon the boy's father, crying, with tears, said: I believe, Lord. Help my unbelief."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Mark 9;28 - After Jesus entered the house, his disciples asked him in private: 'Why can't we expel him?'"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Mark 9;29 - He replied: 'This species only goes out through prayer and fasting'."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 10;17 - In fact, faith comes by hearing this message of good news - the good news about Christ."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;6 - PART A - Isn't this the fast I want: loosen the chains of injustice,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;6 - PART B - Untie the yoke, release the oppressed, and break every yoke?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;7 - PART A - Isn't it sharing your food with the hungry, sheltering the helpless poor,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;7 - PART B - Dressing the nude you found, and not refusing help to others?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;8 - PART A - There, his light will burst forth like the dawn, and his healing will come quickly;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;8 - PART B - Your righteousness will go before you, and the glory of the Lord will be behind you."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;9 - PART A - Then you will cry out to the Lord, and he will answer; you will scream for help, and he will say: Here I am."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;9 - PART B - If you eliminate the oppressive yoke, the accusing finger and the falsehood of speaking from your midst"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;10 - PART A - If with self-renunciation you benefit the hungry and satisfy the longing of the afflicted,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;10 - PART B - Then your light will shine in the darkness, and your night will be like noon."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;11 - PART A - The Lord will guide you constantly; it will satisfy your desires in a sun-dried land and strengthen your bones."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;11 - PART B - You will be like a well-watered garden, like a fountain whose waters are never lacking."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;12 - PART A - His people will rebuild the old ruins and restore the old foundations;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;12 - PART B - You’ll be called a wall repairman, a street and home restorer."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;13 PART A - If you watch your feet not to desecrate the Sabbath and not to do what you want on my holy day;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;13 PART B - If you call the Sabbath delightful and honor the holy day of the Lord, and if you honor it,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;13 PART C - Failing to follow your own path, doing what you want and speaking futility,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;14 - PART A - Then you will have your joy in the Lord, and I will cause you to ride on high in the earth"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Isaiah 58;14 - PART B - And feast on the inheritance of Jacob, your father. For it is the Lord who speaks."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 13;8 - Do not owe anything to anyone, except love for one another, for he who loves his neighbor has fulfilled the law."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 13;9 - PART A - For these commandments: You shall not commit adultery, you will not kill, you will not steal, you will not covet,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 13;9 - PART B - and any other commandment, all boil down to this precept: Love your neighbor as yourself."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Romans 13;10 - Love does not do evil against others. Therefore, love is the fulfillment of the law."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "2 Chronicles 7;14 - PART A - If my people, who are called by my name, will humble themselves and pray,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "2 Chronicles 7;14 - PART B - Seek my face and turn away from their evil ways,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "2 Chronicles 7;14 - PART C - From heaven I will listen to them, forgive their sin and heal their land."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 3;16 - PART A - As soon as Jesus was baptized, he left the water. At that moment the heavens opened,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 3;16 - PART B - And he saw the Spirit of God descending like a dove and resting on him."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Luke 11;23 - Whoever is not for me is against me, whoever does not gather with me spreads."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Luke 12;47 - That servant who knows his master's will and does not prepare what he wants, nor does he do it, will receive many lashes."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Lucas 12;48 - PART A - But he who does not know her and practices things worthy of punishment,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Lucas 12;48 - PART B - Will receive few stripes. To whom much has been given, much will be demanded"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Peter 3;15 - PART A - Rather, sanctify Christ as Lord in your heart. Always be prepared to respond to anyone"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Peter 3;15 - PART B - Who asks you for the reason for the hope that is in you."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 10;37 - PART A - Whoever loves his father or mother more than me is not worthy of me;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 10;37 - PART B - Whoever loves his son or daughter more than me is not worthy of me;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 10;38 - And whoever does not take up his cross and follow me is not worthy of me."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 1;1 - In the beginning it was the Word. He was with God, and he was God."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 1;14 - PART A - He who is the Word became flesh and lived among us. We saw his glory,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 1;14 - PART B - Glory as of the Only Begotten One from the Father, full of grace and truth."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 8;3 - Does God twist justice? Does the Almighty twist what is right?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 8;5 - But if you seek God and plead with the Almighty,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 8;6 - if you are upright and pure, he will rise up right now in your behalf and restore you to the place that by justice belongs to you."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 8;8 - Ask previous generations and see what your parents learned,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 8;10 - Will they not instruct you, will they not speak to you? Won't they utter words from understanding?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 8;20 - For the truth is that God does not reject the upright, and does not strengthen the hands of those who do evil."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 6;14 - For if they forgive each other's offenses, the heavenly Father will also forgive them."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 6;15 - But if they do not forgive one another, the heavenly Father will not forgive their offenses."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;46 - If you love those who love you, what reward will you receive? Even publicans do that."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;47 - And if you only greet your brothers, what are you doing more? Even pagans do that."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;43 - You heard what was said: Love your neighbor and hate your enemy."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;44 - But I say to you, Love your enemies and pray for those who persecute them,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;45 - PART A - So that you may become children of your Father who is in heaven. Because he makes his sun shine"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;45 - PART B - On the bad and the good and pour rain on the just and the unjust."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;38 - You heard what was said: An eye for an eye and a tooth for a tooth."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;39 - But I say to you: Do not resist the wicked. If someone injures you on the right cheek, offer the other one as well."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;40 - And if someone wants to sue you and take off your tunic, let him take the cloak too."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;41 - If someone forces you to walk a mile with him, go with him two miles."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 5;42 - Give to those who ask you, and do not turn your back on those who want to borrow something from you."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 6;14 - A desperate man should receive compassion from his friends, even though he has abandoned the fear of the Almighty."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 6;24 - Teach me, and I will be silent; show me where I went wrong."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 5;6 - For suffering does not spring from the dust, and difficulties do not arise from the ground."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 5;7 - Yet man is born into hardship as surely as sparks fly upward."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 5;17 - How happy is the man whom God corrects; therefore, do not disregard the discipline of the Almighty."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Job 5;18 - For he strikes, but he comes to take care of it; it hurts, but your hands heal too."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Acts 3;19 - Repent, then, and turn to God, that your sins may be canceled,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Acts 3;20 - that times of rest may come from the Lord, and that he may send the Christ, who has been appointed to them, Jesus."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 11;9 - Jesus answered, Is there not a twelve hour day? Whoever walks during the day does not stumble, seeing the light of this world."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 11;10 - When he walks at night, he stumbles, because there is no light in him."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 11;25 - PART A - Jesus said to him: I am the resurrection and the life. Whoever believes in me will live, even if he dies."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 11;25 - PART B - You are given eternal life for believing in me and you will never die again. Do you believe this, Marta?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 11;12 - PART A - From the days of John the Baptist until now, the Kingdom of Heaven"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 11;12 - PART B - Is taken by force, and those who use force take possession of it."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 15;32 - Whoever refuses discipline makes light of himself, but whoever hears rebuke gets understanding."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ecclesiastes 2;24 - PART A - For man there is nothing better than eating, drinking and finding pleasure in his work."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ecclesiastes 2;24 - PART AB- And I saw that it also comes from the hand of God."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Thessalonians 5;23 - PART A - May the God of peace himself sanctify them entirely. May all your spirit,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Thessalonians 5;23 - PART B - Soul and body be kept blameless at the coming of our Lord Jesus Christ."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Thessalonians 5;24 - He who calls them is faithful, and will do so."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Psalm 34;19 - The righteous goes through many adversities, but the Lord delivers him from all;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Psalm 34;20 - protect all your bones; none of them will be broken."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Psalm 34;21 - Disgrace will kill the wicked; those who hate the righteous will be condemned."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 2;14 - What good is it, my brothers, for someone to say they have faith, if they have no works? Can faith save you?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 2;15 - If a brother or sister is in need of daily clothes and food"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 2;16 - PART A - And one of you says to him: Go in peace, warm up and eat until you are satisfied,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 2;16 - PART B - But without giving you anything, what good is that?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 2;17 - So also faith, by itself, if it is not accompanied by works, is dead."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 7;21 - PART A - Not everyone who says to me, Lord, Lord, will enter the kingdom of heaven,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 7;21 - PART B - But only one who does the will of my Father who is in heaven."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 7;22 - PART A - Many will say to me on that day, Lord, Lord, did we not prophesy in your name?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 7;22 - PART B - Do we not cast out demons in your name and perform many miracles?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 7:23 - Then I will tell you clearly: I never knew you. Get away from me, you who do evil."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 6;19 - PART A - Do you not know that your body is a sanctuary of the Holy Spirit who dwells in you,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 6;19 - PART B - Which was given to you by God, and that you are not your own?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 6;20 - You were bought at a high price. Therefore, glorify God with your body."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hebrews 5;7 - PART A - During his life on earth, Jesus offered prayers and supplications,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hebrews 5;7 - PART B - in a loud voice and with tears, to one who could save him from death, being heard because of his reverent submission."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Mark 1;35 - At dawn, when it was still dark, Jesus got up, left the house and went to a deserted place, where he was praying."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hosea 6;1 - Come, let us return to the Lord. He has shattered us, but he will bring us healing; he has hurt us, but he will heal our wounds."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hosea 6;2 - After two days he will give us life again; on the third day he will restore us, so that we may live in his presence."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hosea 6;3 - PART A - Let us know the Lord; let us strive to meet you. As sure as the sun rises, it will appear;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hosea 6;3 - PART B - It will come to us like winter rains, like spring rains that water the land."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;1 - PART A - Better is a piece of dry bread but eaten with ease, than having the house"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;1 - PART B - Full of good food, in the midst of constant discussions."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;3 - Gold and silver are purified by fire, but only God is the one who purifies hearts."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;4 - Sinners seek the company of those who speak and do as they do; every liar feels good in the company of other liars."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;5 - PART A - To despise the poor is to insult God, who created all men. The one who rejoices"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;5 - PART B - In the misfortune of others will not be without punishment."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;9 - Friendship makes you forget a lot of bad things. But those who are always arguing are able to separate the best friends."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;13 - For those who pay good with evil, there will always be a curse in their home."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;14 - It is difficult to stop a dispute after it has started; so it is best to avoid it before you get involved in it."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;18 - It is proof of little judgment to stand as guarantor for another person and take responsibility for their debts."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;119 - Sinners like arguments and violence; and whoever exalts himself seeks ruin."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;20 - A wicked spirit will never be happy, such as one whose intentions are dishonest."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;28 - PART A - That is why even a fool is able to pass for clever, when he knows how to be quiet;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 17;28 - PART B - And when you shut up, you can even be taken for smart."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 13;4 -Love is patient, love is kind. Do not envy, do not boast, do not be proud."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 13;5 - Do not mistreat, do not seek your interests, do not be easily angered, do not hold a grudge."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 13;6 - Love is not happy with injustice, but is happy with the truth."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "1 Corinthians 13;7 - Everything suffers, everything believes, everything hopes, everything endures."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 22;37 - Jesus answered, 'Love the Lord your God with all your heart, with all your soul and with all your understanding'"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 22;38 - This is the first and greatest commandment."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 22;39 - And the second is similar to him: Love your neighbor as yourself."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 22;40 - On these two commandments all the Law and the Prophets depend."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 14;12 - PART A - I tell you the truth: He who believes in me will also do the works that I have done."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 14;12 - PART B - It will do even greater things than this, because I am going to the Father."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 14;13 - And I will do whatever you ask in my name, that the Father may be glorified in the Son."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 4;2 - PART A - You covet things, and you don't have them; they kill and envy, but fail to get what they want."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 4;2 - PART B - You live to fight and make wars. They don't, because they don't ask."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 4;3 - When they ask, they do not receive, because they ask for the wrong reasons, to spend on their pleasures."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 13;3 - He who keeps his mouth keeps his life, but he who talks too much ends up ruining himself."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 18;21 - The tongue has power over life and death; those who like to use it will eat its fruit."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 13;24 - He who refuses to punish his son does not love him; whoever loves him does not hesitate to discipline him."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 3;3 - In response, Jesus declared: I tell you the truth: No one can see the Kingdom of God unless he is born again."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 3;4 - Nicodemus asked: How can one be born when one is old? Of course, he cannot enter his mother's womb a second time and be reborn."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 3;5 - Jesus answered: I tell you the truth: No one can enter the Kingdom of God unless he is born of water and the Spirit."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 3;6 - What is born of the flesh is flesh, but what is born of the Spirit is spirit."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 3;7 - Don't be surprised that I said: You must be born again."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 3;8 - PART A - The wind blows wherever it wants. You listen to it, but you cannot say where"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "John 3;8 - PART B - it comes from or where it is going to. So it is with all those born of the Spirit."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;22 - As for the old way of life, you were taught to get rid of the old man, who is corrupted by deceitful desires,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;23 - to be renewed in the way of thinking and"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;24 - to put on the new man, created to be like God in justice and in holiness from the truth."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;25 - Therefore, each of you must abandon the lie and tell the truth to your neighbor, because we are all members of the same body."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;26 - When you are angry, do not sin. Soothe your anger before the sun goes down,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Ephesians 4;27 - and do not give way to the devil."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 25;17 - Do not make frequent visits to your neighbor's house so that he does not tire of you and starts to hate you."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 25;23 - As the north wind brings rain, so a pretended tongue brings an angry look."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Proverbs 25;24 - Better to live in a corner under the roof than to share the house with a quarrelsome woman."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Colossians 2;8 - PART A - Be careful that no one enslaves you to vain and deceptive philosophies, which are based on human"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Colossians 2;8 - PART B - Traditions and the basic principles of this world, and not on Christ."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 9;10 - When Jesus was at home, many tax collectors and sinners went to eat with him and his disciples."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 9;11 - Seeing this, the Pharisees asked his disciples: Why does your teacher eat with tax collectors and sinners?"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 9;12 - Hearing this, Jesus said: It is not the healthy who need a doctor, but the sick."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Matthew 9;13 - You will learn what this means: I desire mercy, not sacrifices. For I have not come to call the righteous, but sinners."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hebrews 11;1 - Now faith is the assurance of what we hope for and the proof of what we do not see."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hebrews 11;6 - PART A - Without faith it is impossible to please God, for whoever approaches him needs"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Hebrews 11;6 - PART B - To believe that he exists and that he rewards those who seek him."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Philippians 2;5 - Let your attitude be the same as that of Christ Jesus,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Philippians 2;6 - Who, although being God, did not consider that being equal to God was something to be attached to;"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Philippians 2;7 - But he emptied himself, becoming a servant, becoming like men."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Philippians 2;8 - And being found in human form, he humbled himself and was obedient to death, and death on the cross."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Philippians 2;9 - That is why God exalted him to the highest position and gave him the name that is above all names,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Philippians 2;10 - So that at the name of Jesus every knee will bow, in heaven, on earth and under the earth,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Philippians 2;11 - And every tongue should confess that Jesus Christ is Lord, for the glory of God the Father."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 1;22 - Be doers of the word, not just listeners, deceiving yourself."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 1;23 - He who hears the word, but does not put it into practice, is like a man who looks at his face in a mirror"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 1;24 - And, after looking at himself, he leaves and soon forgets his appearance."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 1;25 - PART A - But the man who carefully observes the perfect law that brings freedom, and perseveres in the practice of that law, "
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "James 1;25 - PART B - Not forgetting what he heard but practicing it, will be happy in what he does."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Deuteronomy 11;18 - Engrave these words of mine in the heart and mind; tie them as symbols in your hands and pin them to your forehead."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Deuteronomy 11;19 - PART A - Teach them to your children, talking about them when they are sitting at home"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Deuteronomy 11;19 - PART B - And when they are walking along the way, when they lie down and when they get up."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Deuteronomy 11;20 - Write them on the doorfronts of your houses, and on your gates,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Deuteronomy 11;21 - PART A - so that, in the land that the Lord swore to give to his ancestors,"
      action(JESUS_MEU_SALVADOR_E_SENHOR)
      JESUS_MEU_SALVADOR_E_SENHOR:= "Deuteronomy 11;21 - PART B - your days and your children's days are many, as many as the days during which heaven is above the earth."
      action(JESUS_MEU_SALVADOR_E_SENHOR)
   }
   F2::Pause, Toggle, 1

   ;---------------------------------------
   ;;-------- https://www.autohotkey.com/boards/viewtopic.php?p=273621#p273621 ---
   ;- Last edited by teadrinker on Sat Oct 19, 2019 9:58 pm, edited 1 time in total.
   ;MsgBox, % GoogleTranslate("今日の天気はとても良いです")
   ;MsgBox, % GoogleTranslate("Hello, World!", "en", "ru")
   GoogleTranslate(str, from := "auto", to := "en") {
      trans:=""
      static JS := CreateScriptObj(), _ := JS.( GetJScript() ) := JS.("delete ActiveXObject;delete GetObject;")
      json := SendRequest(JS, str, to, from, proxy := "")
      oJSON := JS.("(" . json . ")")
      if !IsObject(oJSON[1]) {
         Loop % oJSON[0].length
            trans .= oJSON[0][A_Index - 1][0]
      }
      else {
         MainTransText := oJSON[0][0][0]
         ;If you want all word meaning translation found add (;) the below line
         return MainTransText
         Loop % oJSON[1].length {
            trans .= "`n+"
            obj := oJSON[1][A_Index-1][1]
            Loop % obj.length {
               txt := obj[A_Index - 1]
               trans .= (MainTransText = txt ? "" : "`n+" txt)
            }
         }
      }
      if !IsObject(oJSON[1])
         MainTransText := trans := Trim(trans, ",+`n ")
      else
         trans := MainTransText . "`n+`n" . Trim(trans, ",+`n ")
      from := oJSON[2]
      trans := Trim(trans, ",+`n ")
      Return trans
   }
   SendRequest(JS, str, tl, sl, proxy) {
      ComObjError(false)
      http := ComObjCreate("WinHttp.WinHttpRequest.5.1")
      ( proxy && http.SetProxy(2, proxy) )
      tl1:=tl
      ;http.open( "POST", "https://translate.google.com/translate_a/single?client=t&sl="
      ;                   "https://translate.google.com/#view=home&op=translate&client=t&sl="  ;- usual in web
      http.open( "POST", "https://translate.google.com/translate_a/single?client=webapp&sl="
      . sl . "&tl=" . tl1 . "&hl=" . tl1
      . "&dt=at&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&ie=UTF-8&oe=UTF-8&otf=0&ssel=0&tsel=0&pc=1&kc=1"
      . "&tk=" . JS.("tk").(str), 1 )
      http.SetRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=utf-8")
      http.SetRequestHeader("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:47.0) Gecko/20100101 Firefox/47.0")
      http.send("q=" . URIEncode(str))
      http.WaitForResponse(-1)
      Return http.responsetext
   }
   URIEncode(str, encoding := "UTF-8") {
      urlstr:=""-
      VarSetCapacity(var, StrPut(str, encoding))
      StrPut(str, &var, encoding)
      While code := NumGet(Var, A_Index - 1, "UChar") {
         bool := (code > 0x7F || code < 0x30 || code = 0x3D)
         UrlStr .= bool ? "%" . Format("{:02X}", code) : Chr(code)
      }
      Return UrlStr
   }
   GetJScript()
   {
      script =
      (
      var TKK = ((function() {
         var a = 561666268;
         var b = 1526272306;
         return 406398 + '.' + (a + b);
      })());
      function b(a, b) {
         for (var d = 0; d < b.length - 2; d += 3) {
            var c = b.charAt(d + 2),
         c = "a" <= c ? c.charCodeAt(0) - 87 : Number(c),
         c = "+" == b.charAt(d + 1) ? a >>> c : a << c;
         a = "+" == b.charAt(d) ? a + c & 4294967295 : a ^ c
      }
      return a
   }
   function tk(a) {
      for (var e = TKK.split("."), h = Number(e[0]) || 0, g = [], d = 0, f = 0; f < a.length; f++) {
         var c = a.charCodeAt(f);
      128 > c ? g[d++] = c : (2048 > c ? g[d++] = c >> 6 | 192 : (55296 == (c & 64512) && f + 1 < a.length && 56320 == (a.charCodeAt(f + 1) & 64512) ?
      (c = 65536 + ((c & 1023) << 10) + (a.charCodeAt(++f) & 1023), g[d++] = c >> 18 | 240,
      g[d++] = c >> 12 & 63 | 128) : g[d++] = c >> 12 | 224, g[d++] = c >> 6 & 63 | 128), g[d++] = c & 63 | 128)
   }
   a = h;
   for (d = 0; d < g.length; d++) a += g[d], a = b(a, "+-a^+6");
      a = b(a, "+-3^+b+-f");
   a ^= Number(e[1]) || 0;
   0 > a && (a = (a & 2147483647) + 2147483648);
   a `%= 1E6;
return a.toString() + "." + (a ^ h)
}
)
Return script
}
CreateScriptObj() {
   static doc
   doc := ComObjCreate("htmlfile")
   doc.write("<meta http-equiv='X-UA-Compatible' content='IE=9'>")
Return ObjBindMethod(doc.parentWindow, "eval")
}
;-----------------------------------------------------------------
;-- some examples to select
language:
   e5x:=""
   e5x=
   (Ltrim join|
   nl_Nederlands
   af_Suid-Afrika
   fy_Fryslân
   eu_Basque
   ca_Catalan
   de_Deutsch
   da_Dansk
   sv_Sverige
   no_Norge
   is_Iceland
   fi_Suomen
   en_English
   pt_Portugues
   es_Español
   it_Italia
   fr_Français
   ru_Rossija
   zh-CN_Chinese
   ja_Nippon
   ko_Korea
   ro_Romania
   bg_Bulgaria
   mk_Macedonia
   el_Greek
   tr_Turkiye
   sq_Albania
   hr_Croatia
   sr_Serbia
   sl_Slovenia
   hu_Hungary
   cs_Czech
   sk_Slovakia
   pl_Poland
   be_Belarus
   uk_Ukraina
   et_Estonia
   lv_Latvija
   lt_Lituania
   az_Azerbaijan
   ka_Georgian
   ar_Arabic
   iw_Hebrew
   hi_Hindi
   id_Indonesia
   ms_Malaysia
   vi_Vietnam
   th_Thai
   ta_Tamil
   ur_Urdu
   sw_Swahili
   bn_Bengal
   %s%
   %s%
   )
return
;====================== END SCRIPT ==================================================