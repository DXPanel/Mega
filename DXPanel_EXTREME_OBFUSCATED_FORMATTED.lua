local __1fa5f0b613_e9 = { } local __715c0b1936_d8 = function ( __734285bf2d_153 ) return (
91 + __734285bf2d_153 * 17 ) % 256 end local __c66b14055a_de = function ( __44706b8c72_149
, __72e9b429ce_15d ) return ( __44706b8c72_149 : gsub ( ".." , function ( __7009e3a801_1db
) local __4e4bb731e8_f9 = tonumber ( __7009e3a801_1db , 16 ) return string . char ( ( __4e4bb731e8_f9
- __72e9b429ce_15d ) % 256 ) end ) ) end local __5eac2f04fd_e6 = { [ 1 ] = "bcd8cde5d1dedf"
, [ 2 ] = "d2f0e2efc6ebedf2f1d0e2eff3e6e0e2" , [ 3 ] = "e003fce1f30004f7f1f3" , [ 4 ] = "f31604040df2041115080204"
, [ 5 ] = "f824242003152226191315" , [ 6 ] = "0e22332c2635312d222426142633372a2426" , [ 7 ]
= "2546334645" , [ 8 ] = "3e273b334451484f40032f5246444f334f445c485503515257034459444c4f44454f48030b505856570355585103525103464f4c4851570c"
, [ 9 ] = "6855566059" , [ 10 ] = "547b6a777b6e6a7c" , [ 11 ] = "88788e7789897b8a7f7a504545474e4f4d4f4b484a4c4a4c"
, [ 12 ] = "7a8c9b9b90958e" , [ 13 ] = "aa9ab099abab9daca19c726767696b706d6f6a6c717069716e6c6968"
, [ 14 ] = "9caebdbdb2b7b0bc" , [ 15 ] = "a0bbccc7" , [ 16 ] = "ddcde3ccdeded0dfd4cfa59a9a9ca3a2a2a29f9ba29f9ea1"
, [ 17 ] = "c0f1eae3e1ebea" , [ 18 ] = "ffef05ee0000f201f6f1c7bcbcbec3c3bec2c4c6c0c5c0bf" ,
[ 19 ] = "e70c040d" , [ 20 ] = "21112710222214231813e9dedee6e0e7e6dfe8e7e5e1e5dfe2e8e7" , [
21 ] = "062f322725" , [ 22 ] = "43334932444436453a350b00000a040a05080a02030402" , [ 23 ] =
"272413271516" , [ 24 ] = "374b435461585f52465867675c615a66215d666261" , [ 25 ] = "7778766d726b"
, [ 26 ] = "70383a8872" , [ 27 ] = "" , [ 28 ] = "5c67698f5c67698f5c67698f" , [ 29 ] = "aebdb6abbcb1b7b6"
, [ 30 ] = "9ac7c2c6bacdbe" , [ 31 ] = "badfd6ddcf" , [ 32 ] = "cee3eaf2c1e7eadcefe4e9e2" ,
[ 33 ] = "cd0100fbd8fbedf0" , [ 34 ] = "ff0c0c0902fe0b" , [ 35 ] = "03f7f11d201c1320" , [ 36
] = "14081233312e2a24" , [ 37 ] = "25191742313439353e44" , [ 38 ] = "354659552d4243464d" ,
[ 39 ] = "5d" , [ 40 ] = "4975647068" , [ 41 ] = "6279838260758d7986" , [ 42 ] = "6886939b86987594988e998e9493"
, [ 43 ] = "86a297af9ba87dab9f" , [ 44 ] = "8ab6b9ac8ebcb0" , [ 45 ] = "9cb0a8b9c6bdc49fcdc1"
, [ 46 ] = "adc1b9cad7ced5" , [ 47 ] = "cdddecdfdfe8c1efe3" , [ 48 ] = "ddfafaff" , [ 49 ]
= "e9fd050a" , [ 50 ] = "f105" , [ 51 ] = "0eff0c030a" , [ 52 ] = "b1665eefef1e1d1b181d14"
, [ 53 ] = "3343524f4c4c494e472652414d45" , [ 54 ] = "463a3d5a64653d526a606665" , [ 55 ] =
"465a526370676e225274676f6b776f224b7076677468636567" , [ 56 ] = "67788b87558887878281" , [
57 ] = "6790939789" , [ 58 ] = "f8cc" , [ 59 ] = "28ddd5" , [ 60 ] = "aca0a7b8bbbbc0c5be" ,
[ 61 ] = "a9cadbd7d4dddccdabd7d6dccdd6dcbbd1e2cd" , [ 62 ] = "d7ebdbf1daececdeede2ddb3a8a8"
, [ 63 ] = "e8afeeb5ae" , [ 64 ] = "e408fc0200e7fcfd0007" , [ 65 ] = "1e0e240d1f1f11201510e6dbdb"
, [ 66 ] = "1801150d1e2b22291add201e29291f1e2028dd222f2f2c2ff7dd" , [ 67 ] = "1c3d42ee0f442f373a2f303a33"
, [ 68 ] = "bf977ebf9790bf9766bf9760bf986bbf9769bf9790bf9778bf9778bf9794bf9868bf9781bf9790bf9766bf9863bf9780bf9867bf9863bf9773bf9868bf977bbf9798bf9760ff274e4e4a"
, [ 69 ] = "151e" , [ 70 ] = "67" , [ 71 ] = "5b80858673807577" , [ 72 ] = "71929188" , [ 73
] = "54a799a09997a89998" , [ 74 ] = "98aab1aaa8b9737373" , [ 75 ] = "360fda360ef7360fde360ef7360e0b360eeb360e07360efd360fd6360efb360e0d360e03360ed7"
, [ 76 ] = "471ffc471f18471f0e4720e7471f0c471f1e471f14471fe8471f00471f1c4720f0471f09471f18471fee4720eb471f084720ef4720eb471ffb4720f0471f03471f20471fe887afd6d6d2"
, [ 77 ] = "cadde8e4e1dbd9ecdddccbece7ead9dfdd" , [ 78 ] = "dbeef6f8fdee" , [ 79 ] = "ee0cfb0308"
, [ 80 ] = "ff1d0c1419fa190e10fdf0" , [ 81 ] = "052a302bfd31302b102e1d252a0e01" , [ 82 ] =
"124536410e42413c213f2e363b1f12" , [ 83 ] = "31523f4543" , [ 84 ] = "426350565435585d58625754534135"
, [ 85 ] = "4765744f72655246" , [ 86 ] = "547d727a7e7675527d7d6083766356" , [ 87 ] = "68919489877468"
, [ 88 ] = "87a5ac769f949ca077949c9fac77a8a1879c968578" , [ 89 ] = "98b6bd8db2b8b388b9b2aba9b3b2968a"
, [ 90 ] = "9acdbec999cac3bcbac4c3a79a" , [ 91 ] = "b9dac7d8dab8d5dbd4cab8ab" , [ 92 ] = "bae6e4e7e3dcebdcc9e6ece5dbc9bd"
, [ 93 ] = "c9fcfce9ebf3" , [ 94 ] = "de07fe0612e1020ddbde" , [ 95 ] = "eb1f1e19caec0f1d1e"
, [ 96 ] = "fc302f2adb081c33" , [ 97 ] = "23312d3c3b3a" , [ 98 ] = "1f425051fd2c4f4250fd23464f5051"
, [ 99 ] = "42604f575c4d1f0e16661f1c2317" , [ 100 ] = "537160686d5e311f27773128" , [ 101 ]
= "648271797e6f433038884439" , [ 102 ] = "7593828a8f8055414999574a" , [ 103 ] = "86a4939ba09167525aaa6a5b"
, [ 104 ] = "97b5a4acb1a279636bbb74736c" , [ 105 ] = "a8c6b5bdc2b38b747ccc85897d" , [ 106 ]
= "b9d7c6ced3c49d858ddd979a8e" , [ 107 ] = "beebe3d7e4e5dfdac8e5e5eac6d7e8ea" , [ 108 ] = "cffcf4e8f5f6f0eb"
, [ 109 ] = "d90d0c07ec0af90106d90afdf9e1dc" , [ 110 ] = "f81b0eec0a0c110e" , [ 111 ] = "0a2c29322327232e330a2c29272a2e"
, [ 112 ] = "2020140f" , [ 113 ] = "20413d40" , [ 114 ] = "40614e54524c" , [ 115 ] = "436c636b77446d6a626370"
, [ 116 ] = "5c7e73747b" , [ 117 ] = "64958e87858f8e898e87" , [ 118 ] = "819d92aa96a38494a39aa1a5a4"
, [ 119 ] = "8fa3b0a3a9a7b4" , [ 120 ] = "97c8c1bab8c2c1a0b4c1b4bab8c5" , [ 121 ] = "a7aad6c5d1c9"
, [ 122 ] = "c4e7da" , [ 123 ] = "ccf5f8edebd8cca6f4f5faa6ecf5fbf4ea" , [ 124 ] = "e5060bb7fc05060cfeffb7e609fcb7bf"
, [ 125 ] = "d7" , [ 126 ] = "e2" , [ 127 ] = "1d2f3c402f3cea3c2f342f2d3e2f2eea10393c312f"
, [ 128 ] = "fb414a4d42403f" , [ 129 ] = "392d44" , [ 130 ] = "5841554d5e6b62695a1d456c6c681d24"
, [ 131 ] = "352e7380807d80482e" , [ 132 ] = "5f" , [ 133 ] = "7193939fa59ea4507197956a50"
, [ 134 ] = "61a5a2bab4" , [ 135 ] = "a1a09e9ba097" , [ 136 ] = "90" , [ 137 ] = "c4dde2db"
, [ 138 ] = "cbd5d8" , [ 139 ] = "ddf703fb" , [ 140 ] = "f713080a0cc7f0eb" , [ 141 ] = "0b1d2a2e1d2a"
, [ 142 ] = "1c3d3e2d3238" , [ 143 ] = "1e3b4e3bfa2a434841" , [ 144 ] = "585e" , [ 145 ] =
"4a2b3d" , [ 146 ] = "617f6e767b767b74" , [ 147 ] = "5f93928d3e72907f878c" , [ 148 ] = "70a4a39e4f7194a2a34f899e9d94"
, [ 149 ] = "94b2a1a9aea9aea7609aafaea5" , [ 150 ] = "a4c5b2b8b6717771a0c3b6" , [ 151 ] = "a3d7d6d182a5cec7c3d482b5d6c3c9c7"
, [ 152 ] = "c6e7d4dad893b7d8dfd4ec" , [ 153 ] = "c5f9f8f3a4c7f3f0f0e9e7f8a4d3f6e9" , [ 154
] = "d60a0904b5d90a03fcfa0403" , [ 155 ] = "ef14191a07141ac6f10f1212" , [ 156 ] = "0a2b18292bd709262c251b"
, [ 157 ] = "f9" , [ 158 ] = "1a4e4d48f91f484b403e" , [ 159 ] = "30595c514f0a3e635a4f" , [
160 ] = "3c6d686a6d" , [ 161 ] = "596d80717e756d782c5d816d78758085" , [ 162 ] = "698c948290913d6c8f82903d63868f9091"
, [ 163 ] = "7b8fa293a0978f9a4e6f9b9da39ca2" , [ 164 ] = "85aeb1a6a45f80acaeb4adb3" , [ 165
] = "85" , [ 166 ] = "9291" , [ 167 ] = "a4a2" , [ 168 ] = "b8b3" , [ 169 ] = "c5c4c4" , [
170 ] = "eb14170c0ac5f80a110a08190a09c5f3141c" , [ 171 ] = "fc25281d1bd61c171f221b1af0d6" ,
[ 172 ] = "2e2c2839" , [ 173 ] = "1f3d463d4a3944" , [ 174 ] = "2a5752564a5d525857" , [ 175
] = "4a6c5f67636f671a3f60605f5d6e6d" , [ 176 ] = "5e737a822b51777a6c7f7479722b4d807f7f7a79"
, [ 177 ] = "5d91908b3c688b7d80" , [ 178 ] = "7d8e9b9299" , [ 179 ] = "8e9faca3aa5e91a7b8a3"
, [ 180 ] = "92bebcbfb0b2c3" , [ 181 ] = "a4c5c6c1d5ccd4" , [ 182 ] = "bdd2e3d8d6" , [ 183
] = "d4e7f5e7f6a2cbf0f6e7f4e8e3e5e7" , [ 184 ] = "e7fbf800f8b3d602ff0205" , [ 185 ] = "f60908"
, [ 186 ] = "042716231c1a" , [ 187 ] = "0cf8fdf7f709" , [ 188 ] = "1e46433b" , [ 189 ] = "2d1e292e1a20"
, [ 190 ] = "406b5e5e67" , [ 191 ] = "3c424d424142" , [ 192 ] = "5e947c89" , [ 193 ] = "5d716f647162"
, [ 194 ] = "7fa9b2a2" , [ 195 ] = "7f9386919390" , [ 196 ] = "afd4d1cfcbc4" , [ 197 ] = "a9a6a3b3b5a6"
, [ 198 ] = "d1eaefec" , [ 199 ] = "d7d4c6d4d3c2" , [ 200 ] = "c6" , [ 201 ] = "08192c28f6232c"
, [ 202 ] = "0b0bf709f907" , [ 203 ] = "172626222f" , [ 204 ] = "37392c3a2c3b3a" , [ 205 ]
= "406d5d" , [ 206 ] = "5c6a7d7e7b6a7d727877" , [ 207 ] = "5c8c8381828e887f8d8d" , [ 208 ]
= "7f90a39f" , [ 209 ] = "979a61b499" , [ 210 ] = "2d06cf2d05d12d06d62d05e12d05f72d05022d06d12d05ee2d06d52d05e32d05062d05ce2d05e22d06d62d05fa2d05d46d752d05e22d06d62d05fa2d05d42d05ee2d05026d836d2d05f82d05f22d05fe2d05ce76"
, [ 211 ] = "9fc1d2c7cdccd1" , [ 212 ] = "c1d4e2d4e38fc2d4e3e3d8ddd6e2" , [ 213 ] = "60382360383560390060380b603907603815603801603832603823603815603831603909603807603804603908603832603901603825603909603827"
, [ 214 ] = "d5f6040503000ab1d8e6da" , [ 215 ] = "e51407060b1615" , [ 216 ] = "1c211922" ,
[ 217 ] = "081ce41425322930" , [ 218 ] = "2a433e4b3a47483641f518444349474441f52536433a41" ,
[ 219 ] = "3b2f061506395f595a4b5306062006062a3e063a4b4753" , [ 220 ] = "455c6665174c401760656a6760695c5b175970176b5f5c173b4f176b5c646763586b5c"
, [ 221 ] = "4e7477697c71766f5c776f6f746d" , [ 222 ] = "5b887d92" , [ 223 ] = "7c8f9d93a48f728b988e968f"
, [ 224 ] = "609f5bfed25b609f60ae" , [ 225 ] = "6c6c0e036c6c8fbbb9bcadafc0" , [ 226 ] = "9ebfd0ccc9d2d1c2b0c6d7c2"
, [ 227 ] = "c9b2c6becfdcd3dacb8ebaddcfd2d3d28ee1e3d1d1d3e1e1d4e3dadae78e96dcd3dddc8ec3b797"
} for __747de4a82b_cf = 1 , # __5eac2f04fd_e6 do __1fa5f0b613_e9 [ __747de4a82b_cf ] = __c66b14055a_de
( __5eac2f04fd_e6 [ __747de4a82b_cf ] , __715c0b1936_d8 ( __747de4a82b_cf ) ) end __5eac2f04fd_e6
= nil __c66b14055a_de = nil __715c0b1936_d8 = nil do local __a7a246450d_d4 = os . clock local
__58d76f0e35_d6 = type local __938464555e_d5 = nil if false then __a7a246450d_d4 ( ) __58d76f0e35_d6
( __938464555e_d5 ) end end do local __5bf05b7db5_d7 = 0x5A17 local __627796ba9e_ea = function
( __70300f2a2e_ed , __4e4bb731e8_f9 , __fefa4ee1dc_ff ) local __7009e3a801_1db = ( ( __70300f2a2e_ed
* 1103515245 + __4e4bb731e8_f9 * 12345 + __fefa4ee1dc_ff + 1013904223 ) % 2147483647 ) __7009e3a801_1db
= ( ( __7009e3a801_1db ~ ( __7009e3a801_1db // 2 ) ) ~ ( ( __7009e3a801_1db * 7 ) % 65537 )
) return __7009e3a801_1db end local __786f067aa3_e1 = { } for __dbcfda2f9f_e3 = 1 , 7 do local
__85511ba214_1d7 = __627796ba9e_ea ( __5bf05b7db5_d7 , __dbcfda2f9f_e3 , __dbcfda2f9f_e3 *
13 ) __786f067aa3_e1 [ __dbcfda2f9f_e3 ] = ( ( __85511ba214_1d7 % 997 ) + __dbcfda2f9f_e3 )
% 997 end local __fdeadf6757_d2 = ( __786f067aa3_e1 [ 3 ] or 0 ) ~ ( __786f067aa3_e1 [ 5 ]
or 0 ) local __37b770a284_ec = ( ( __fdeadf6757_d2 % 2 ) == 3 ) if __37b770a284_ec then __786f067aa3_e1
[ 99 ] = nil elseif ( __786f067aa3_e1 [ 1 ] or 0 ) == - 1 then __786f067aa3_e1 [ 1 ] = 0 end
end local __06d62de4c6_d0 = game : GetService ( __1fa5f0b613_e9 [ ( ( ( 1 * 17 + 5 ) % 257
+ 252 ) % 257 * 121 ) % 257 ] ) local __a0143ff92a_d3 = game : GetService ( __1fa5f0b613_e9
[ ( ( ( 2 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) local __d3328ace52_e7 = game :
GetService ( __1fa5f0b613_e9 [ ( ( ( 3 + 23 ) % 257 + 234 ) % 257 ) ] ) local __1391eecc33_e5
= game : GetService ( __1fa5f0b613_e9 [ ( ( ( 4 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] ) local __0cd1150f0e_e0 = game : GetService ( __1fa5f0b613_e9 [ ( ( ( 5 * 31 + 11 ) % 257
+ 246 ) % 257 * 199 ) % 257 ] ) local __193ee19ace_d9 = game : GetService ( __1fa5f0b613_e9
[ ( ( ( 6 + 23 ) % 257 + 234 ) % 257 ) ] ) local __babfcf0faf_d1 = game : GetService ( __1fa5f0b613_e9
[ ( ( ( 7 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) if _G . DXPanelCleanup then pcall
( _G . DXPanelCleanup ) _G . DXPanelCleanup = nil end local __610efd74e5_e4 = __06d62de4c6_d0
. LocalPlayer if not __610efd74e5_e4 then warn ( __1fa5f0b613_e9 [ ( ( ( 8 * 31 + 11 ) % 257
+ 246 ) % 257 * 199 ) % 257 ] ) return end local __a16b2e4424_dc = { ... } local __334204dc57_e2
= type ( __a16b2e4424_dc [ 1 ] ) == __1fa5f0b613_e9 [ ( ( ( 9 + 23 ) % 257 + 234 ) % 257 )
] and __a16b2e4424_dc [ 1 ] or { } local __c23f506ac0_df = type ( __334204dc57_e2 . Hooks )
== __1fa5f0b613_e9 [ ( ( ( 9 + 23 ) % 257 + 234 ) % 257 ) ] and __334204dc57_e2 . Hooks or
{ } local __f71cdfbef1_eb = { [ __1fa5f0b613_e9 [ ( ( ( 10 * 17 + 5 ) % 257 + 252 ) % 257 *
121 ) % 257 ] ] = __1fa5f0b613_e9 [ ( ( ( 11 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , [ __1fa5f0b613_e9 [ ( ( ( 12 + 23 ) % 257 + 234 ) % 257 ) ] ] = __1fa5f0b613_e9 [ ( ( (
13 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , [ __1fa5f0b613_e9 [ ( ( ( 14 * 31 + 11
) % 257 + 246 ) % 257 * 199 ) % 257 ] ] = __1fa5f0b613_e9 [ ( ( ( 13 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] , [ __1fa5f0b613_e9 [ ( ( ( 15 + 23 ) % 257 + 234 ) % 257 ) ] ] = __1fa5f0b613_e9
[ ( ( ( 16 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , [ __1fa5f0b613_e9 [ ( ( ( 17 *
31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ] = __1fa5f0b613_e9 [ ( ( ( 18 + 23 ) % 257 +
234 ) % 257 ) ] , [ __1fa5f0b613_e9 [ ( ( ( 19 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] ] = __1fa5f0b613_e9 [ ( ( ( 20 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , [ __1fa5f0b613_e9
[ ( ( ( 21 + 23 ) % 257 + 234 ) % 257 ) ] ] = __1fa5f0b613_e9 [ ( ( ( 22 * 17 + 5 ) % 257 +
252 ) % 257 * 121 ) % 257 ] , } local __c7e8d544f7_da = { Animate = true , Pulse = true , ShowFloating
= true , AutoLoad = false , ThemeColor = __1fa5f0b613_e9 [ ( ( ( 23 * 31 + 11 ) % 257 + 246
) % 257 * 199 ) % 257 ] , } local __3b64c5c599_dd = __1fa5f0b613_e9 [ ( ( ( 24 + 23 ) % 257
+ 234 ) % 257 ) ] local function __3b97c0a669_114 ( __e453d87ba6_1c3 ) local __fefa4ee1dc_ff
= { } for __72e9b429ce_15d , __85511ba214_1d7 in pairs ( __e453d87ba6_1c3 ) do __fefa4ee1dc_ff
[ __72e9b429ce_15d ] = __85511ba214_1d7 end return __fefa4ee1dc_ff end local function __25c487d903_56
( __68d2495bd1_14d ) if type ( __68d2495bd1_14d ) ~= __1fa5f0b613_e9 [ ( ( ( 25 * 17 + 5 )
% 257 + 252 ) % 257 * 121 ) % 257 ] then return nil end __68d2495bd1_14d = __68d2495bd1_14d
: gsub ( __1fa5f0b613_e9 [ ( ( ( 26 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9
[ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] ) if # __68d2495bd1_14d ~= 6 then return nil end
local __4e39cfb0a4_199 = tonumber ( __68d2495bd1_14d : sub ( 1 , 2 ) , 16 ) local __047a57bf98_142
= tonumber ( __68d2495bd1_14d : sub ( 3 , 4 ) , 16 ) local __4e4bb731e8_f9 = tonumber ( __68d2495bd1_14d
: sub ( 5 , 6 ) , 16 ) if not ( __4e39cfb0a4_199 and __047a57bf98_142 and __4e4bb731e8_f9 )
then return nil end return Color3 . fromRGB ( __4e39cfb0a4_199 , __047a57bf98_142 , __4e4bb731e8_f9
) end local function __996d3464d9_24 ( __fefa4ee1dc_ff ) return string . format ( __1fa5f0b613_e9
[ ( ( ( 28 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , math . floor ( __fefa4ee1dc_ff
. R * 255 + 0.5 ) , math . floor ( __fefa4ee1dc_ff . G * 255 + 0.5 ) , math . floor ( __fefa4ee1dc_ff
. B * 255 + 0.5 ) ) end local __a822508444_db = __3b97c0a669_114 ( __c7e8d544f7_da ) local
__bc7828dcba_e8 = type ( isfile ) == __1fa5f0b613_e9 [ ( ( ( 29 * 31 + 11 ) % 257 + 246 ) %
257 * 199 ) % 257 ] and type ( readfile ) == __1fa5f0b613_e9 [ ( ( ( 29 * 31 + 11 ) % 257 +
246 ) % 257 * 199 ) % 257 ] and type ( writefile ) == __1fa5f0b613_e9 [ ( ( ( 29 * 31 + 11
) % 257 + 246 ) % 257 * 199 ) % 257 ] local function __d25061c2cb_1a9 ( ) if not __bc7828dcba_e8
then return end pcall ( function ( ) writefile ( __3b64c5c599_dd , __0cd1150f0e_e0 : JSONEncode
( __a822508444_db ) ) end ) end do if __bc7828dcba_e8 then pcall ( function ( ) if not isfile
( __3b64c5c599_dd ) then return end local __c6dd84b4cb_11b = __0cd1150f0e_e0 : JSONDecode (
readfile ( __3b64c5c599_dd ) ) if type ( __c6dd84b4cb_11b ) ~= __1fa5f0b613_e9 [ ( ( ( 9 +
23 ) % 257 + 234 ) % 257 ) ] then return end for __091590b945_ce , __a6d38d87d8_15f in ipairs
( { __1fa5f0b613_e9 [ ( ( ( 30 + 23 ) % 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9 [ ( ( ( 31
* 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 32 * 31 + 11 ) % 257
+ 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 33 + 23 ) % 257 + 234 ) % 257 ) ] }
) do if type ( __c6dd84b4cb_11b [ __a6d38d87d8_15f ] ) == __1fa5f0b613_e9 [ ( ( ( 34 * 17 +
5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] then __a822508444_db [ __a6d38d87d8_15f ] = __c6dd84b4cb_11b
[ __a6d38d87d8_15f ] end end if __25c487d903_56 ( __c6dd84b4cb_11b . ThemeColor ) then __a822508444_db
. ThemeColor = __c6dd84b4cb_11b . ThemeColor end end ) end end local __55872a0ac8_17 = { red
= Color3 . fromRGB ( 235 , 30 , 52 ) , redBright = Color3 . fromRGB ( 255 , 70 , 90 ) , redSoft
= Color3 . fromRGB ( 255 , 110 , 125 ) , redDark = Color3 . fromRGB ( 90 , 8 , 18 ) , neon
= Color3 . fromRGB ( 255 , 45 , 75 ) , black = Color3 . fromRGB ( 8 , 8 , 11 ) , black2 = Color3
. fromRGB ( 14 , 10 , 12 ) , sidebar = Color3 . fromRGB ( 12 , 12 , 16 ) , sidebar2 = Color3
. fromRGB ( 16 , 12 , 14 ) , innerBg = Color3 . fromRGB ( 25 , 12 , 17 ) , innerBgHover = Color3
. fromRGB ( 55 , 15 , 25 ) , innerBorder = Color3 . fromRGB ( 75 , 30 , 42 ) , innerBorderHover
= Color3 . fromRGB ( 255 , 70 , 90 ) , switchOff = Color3 . fromRGB ( 35 , 35 , 42 ) , switchBorder
= Color3 . fromRGB ( 85 , 40 , 52 ) , white = Color3 . fromRGB ( 245 , 245 , 248 ) , grey =
Color3 . fromRGB ( 145 , 145 , 155 ) , border = Color3 . fromRGB ( 62 , 43 , 51 ) , good =
Color3 . fromRGB ( 100 , 220 , 125 ) , bad = Color3 . fromRGB ( 255 , 90 , 100 ) , } local
__faa2ce483a_75 local __781ea15839_b5 = { } local function __515bc908c8_14 ( __fefa4ee1dc_ff
) local __44706b8c72_149 , __911dad98de_1a8 , __85511ba214_1d7 = Color3 . toHSV ( __fefa4ee1dc_ff
) return ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , Color3 . fromHSV ( __44706b8c72_149
, __911dad98de_1a8 , math . min ( __85511ba214_1d7 + 0.35 , 1 ) ) ) , ColorSequenceKeypoint
. new ( 0.25 , Color3 . fromHSV ( __44706b8c72_149 , math . max ( __911dad98de_1a8 - 0.35 ,
0 ) , math . min ( __85511ba214_1d7 + 0.55 , 1 ) ) ) , ColorSequenceKeypoint . new ( 0.5 ,
__fefa4ee1dc_ff ) , ColorSequenceKeypoint . new ( 0.75 , Color3 . fromHSV ( __44706b8c72_149
, __911dad98de_1a8 , math . max ( __85511ba214_1d7 - 0.55 , 0.1 ) ) ) , ColorSequenceKeypoint
. new ( 1 , Color3 . fromHSV ( __44706b8c72_149 , __911dad98de_1a8 , math . min ( __85511ba214_1d7
+ 0.35 , 1 ) ) ) , } ) end local function __f85fed92ab_13 ( __fefa4ee1dc_ff ) return ColorSequence
. new ( { ColorSequenceKeypoint . new ( 0 , __fefa4ee1dc_ff ) , ColorSequenceKeypoint . new
( 0.25 , __55872a0ac8_17 . border ) , ColorSequenceKeypoint . new ( 1 , __55872a0ac8_17 . border
) , } ) end local function __cd433c3dc1_40 ( __fefa4ee1dc_ff ) local __44706b8c72_149 , __911dad98de_1a8
= Color3 . toHSV ( __fefa4ee1dc_ff ) local __72e9b429ce_15d = math . min ( __911dad98de_1a8
, 1 ) __55872a0ac8_17 . red = __fefa4ee1dc_ff __55872a0ac8_17 . neon = __fefa4ee1dc_ff __55872a0ac8_17
. redBright = Color3 . fromHSV ( __44706b8c72_149 , math . min ( __911dad98de_1a8 , 0.55 )
, 1 ) __55872a0ac8_17 . redSoft = Color3 . fromHSV ( __44706b8c72_149 , math . min ( __911dad98de_1a8
, 0.35 ) , 1 ) __55872a0ac8_17 . redDark = Color3 . fromHSV ( __44706b8c72_149 , math . min
( __911dad98de_1a8 , 0.9 ) , 0.35 ) __55872a0ac8_17 . innerBorderHover = __55872a0ac8_17 .
redBright __55872a0ac8_17 . innerBg = Color3 . fromHSV ( __44706b8c72_149 , __72e9b429ce_15d
* 0.6 , 0.1 ) __55872a0ac8_17 . innerBgHover = Color3 . fromHSV ( __44706b8c72_149 , __72e9b429ce_15d
* 0.84 , 0.22 ) __55872a0ac8_17 . innerBorder = Color3 . fromHSV ( __44706b8c72_149 , __72e9b429ce_15d
* 0.69 , 0.3 ) __55872a0ac8_17 . switchBorder = Color3 . fromHSV ( __44706b8c72_149 , __72e9b429ce_15d
* 0.6 , 0.33 ) __55872a0ac8_17 . border = Color3 . fromHSV ( __44706b8c72_149 , __72e9b429ce_15d
* 0.36 , 0.25 ) __faa2ce483a_75 = __515bc908c8_14 ( __fefa4ee1dc_ff ) end local function __1f08e28198_79
( __52f8d690a9_13e ) table . insert ( __781ea15839_b5 , __52f8d690a9_13e ) __52f8d690a9_13e
( ) end __cd433c3dc1_40 ( __25c487d903_56 ( __a822508444_db . ThemeColor ) or __25c487d903_56
( __c7e8d544f7_da . ThemeColor ) ) local __81540dc5aa_1 = { } local __cfbeed4503_51 local __6c9252efea_11f
= false local __962f25b7ec_111 = { } local __61477ad64b_108 = { } local __f3814ce17a_a8 = {
} local function __c41ecd2440_1d1 ( __288a6d667b_110 ) table . insert ( __962f25b7ec_111 ,
__288a6d667b_110 ) return __288a6d667b_110 end local function __72a0c2cb89_f1 ( __52f8d690a9_13e
) table . insert ( __61477ad64b_108 , __52f8d690a9_13e ) end local function __18c1d6ca6a_107
( ) if __6c9252efea_11f then return end __6c9252efea_11f = true for __091590b945_ce , __fefa4ee1dc_ff
in ipairs ( __962f25b7ec_111 ) do pcall ( function ( ) __fefa4ee1dc_ff : Disconnect ( ) end
) end table . clear ( __962f25b7ec_111 ) for __091590b945_ce , __e453d87ba6_1c3 in ipairs (
__f3814ce17a_a8 ) do pcall ( function ( ) __e453d87ba6_1c3 : Cancel ( ) end ) end for __091590b945_ce
, __52f8d690a9_13e in ipairs ( __61477ad64b_108 ) do pcall ( __52f8d690a9_13e ) end table .
clear ( __61477ad64b_108 ) if __cfbeed4503_51 then pcall ( function ( ) __cfbeed4503_51 : Destroy
( ) end ) end if _G . DXPanelCleanup == __18c1d6ca6a_107 then _G . DXPanelCleanup = nil end
end _G . DXPanelCleanup = __18c1d6ca6a_107 local function __b691e2a887_76 ( __a0ac7bf68d_105
, __e0a41510d9_196 , __6e05a5b93d_188 ) local __f0067242e1_174 = Instance . new ( __a0ac7bf68d_105
) for __72e9b429ce_15d , __85511ba214_1d7 in pairs ( __e0a41510d9_196 or { } ) do __f0067242e1_174
[ __72e9b429ce_15d ] = __85511ba214_1d7 end __f0067242e1_174 . Parent = __6e05a5b93d_188 return
__f0067242e1_174 end local function __3ed63efcc7_26 ( __f0067242e1_174 , __cf456efecb_19a )
return __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 35 * 31 + 11 ) % 257 + 246 ) % 257 * 199 )
% 257 ] , { CornerRadius = UDim . new ( 0 , __cf456efecb_19a ) } , __f0067242e1_174 ) end local
function __179a4169c0_ac ( __f0067242e1_174 , __335a0e8d4e_10c , __14f493cd41_1c9 , __84b3920a5e_1d3
) return __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 36 + 23 ) % 257 + 234 ) % 257 ) ] , { Color
= __335a0e8d4e_10c , Thickness = __14f493cd41_1c9 or 1 , Transparency = __84b3920a5e_1d3 or
0 , ApplyStrokeMode = Enum . ApplyStrokeMode . Border , } , __f0067242e1_174 ) end local function
__bfadee6497_4f ( __f0067242e1_174 , __4ddcd61f69_10d , __ab324063f9_1a3 ) return __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 37 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Color = __4ddcd61f69_10d
, Rotation = __ab324063f9_1a3 or 0 } , __f0067242e1_174 ) end local function __0f4c731917_c8
( __f0067242e1_174 , __bbd7858916_1cb , __e0a41510d9_196 , __5b74ad149b_1c0 , __c3f3a7017c_121
) local __e453d87ba6_1c3 = __1391eecc33_e5 : Create ( __f0067242e1_174 , TweenInfo . new (
__a822508444_db . Animate and ( __bbd7858916_1cb or 0.2 ) or 0 , __5b74ad149b_1c0 or Enum .
EasingStyle . Quart , __c3f3a7017c_121 or Enum . EasingDirection . Out ) , __e0a41510d9_196
) __e453d87ba6_1c3 : Play ( ) return __e453d87ba6_1c3 end local function __4c855578e9_c9 (
__6e05a5b93d_188 , __e0a41510d9_196 ) local __feba64db64_fc = { BackgroundTransparency = 1
, BorderSizePixel = 0 , Font = Enum . Font . Gotham , TextSize = 11 , TextColor3 = __55872a0ac8_17
. white , TextXAlignment = Enum . TextXAlignment . Left , } for __72e9b429ce_15d , __85511ba214_1d7
in pairs ( __e0a41510d9_196 ) do __feba64db64_fc [ __72e9b429ce_15d ] = __85511ba214_1d7 end
return __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 38 * 31 + 11 ) % 257 + 246 ) % 257 * 199 )
% 257 ] , __feba64db64_fc , __6e05a5b93d_188 ) end local __84c150f49d_17f = setmetatable (
{ } , { __mode = __1fa5f0b613_e9 [ ( ( ( 39 + 23 ) % 257 + 234 ) % 257 ) ] } ) local function
__85c90836e8_17d ( __6e05a5b93d_188 ) __84c150f49d_17f [ __6e05a5b93d_188 ] = ( __84c150f49d_17f
[ __6e05a5b93d_188 ] or 0 ) + 1 return __84c150f49d_17f [ __6e05a5b93d_188 ] end local function
__605563dda1_74 ( __6e05a5b93d_188 , __cf456efecb_19a , __cc905c8f5f_1b7 ) local __c707c41634_166
= { } for __734285bf2d_153 , __911dad98de_1a8 in ipairs ( __cc905c8f5f_1b7 ) do local __a55388a311_13b
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Name = __1fa5f0b613_e9 [ ( ( ( 41 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ..
__734285bf2d_153 , Size = UDim2 . fromScale ( 1 , 1 ) , BackgroundTransparency = 1 , BorderSizePixel
= 0 , ZIndex = __734285bf2d_153 , } , __6e05a5b93d_188 ) __3ed63efcc7_26 ( __a55388a311_13b
, __cf456efecb_19a ) local __f149c5631d_1b9 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 36
+ 23 ) % 257 + 234 ) % 257 ) ] , { Color = __55872a0ac8_17 . neon , Thickness = __911dad98de_1a8
[ 1 ] , Transparency = __911dad98de_1a8 [ 2 ] , ApplyStrokeMode = Enum . ApplyStrokeMode .
Border , } , __a55388a311_13b ) table . insert ( __c707c41634_166 , { Frame = __a55388a311_13b
, Stroke = __f149c5631d_1b9 , Bright = __911dad98de_1a8 [ 2 ] , Dim = __911dad98de_1a8 [ 3
] } ) end return __c707c41634_166 end local function __35e3ca6f7f_a7 ( __f070a73478_146 , __e608de2500_1ab
) __f070a73478_146 . Rotation = 0 local __e453d87ba6_1c3 = __1391eecc33_e5 : Create ( __f070a73478_146
, TweenInfo . new ( __e608de2500_1ab , Enum . EasingStyle . Linear , Enum . EasingDirection
. In , - 1 ) , { Rotation = 360 } ) __e453d87ba6_1c3 : Play ( ) table . insert ( __f3814ce17a_a8
, __e453d87ba6_1c3 ) return __e453d87ba6_1c3 end local __570a4268a2_60 = { } do local __d9848a1e50_1aa
, __615661857c_f0 = { } , nil local function __25be3add2c_1ae ( __bc24c603b0_135 , __8429c20cb3_15e
) for __28f246b84e_1b0 in pairs ( __d9848a1e50_1aa ) do if __28f246b84e_1b0 . Parent and __28f246b84e_1b0
~= __8429c20cb3_15e then __28f246b84e_1b0 . ScrollingEnabled = __bc24c603b0_135 end end end
function __570a4268a2_60 . Begin ( __4deb46734f_184 , __8429c20cb3_15e ) if __615661857c_f0
~= nil then return false end __615661857c_f0 = __4deb46734f_184 __25be3add2c_1ae ( false ,
__8429c20cb3_15e ) return true end function __570a4268a2_60 . End ( __4deb46734f_184 ) if __615661857c_f0
~= __4deb46734f_184 then return end __615661857c_f0 = nil __25be3add2c_1ae ( true ) end function
__570a4268a2_60 . WatchScroll ( __28f246b84e_1b0 ) __d9848a1e50_1aa [ __28f246b84e_1b0 ] =
true local __cb502e879f_1cf = 0 __c41ecd2440_1d1 ( __28f246b84e_1b0 : GetPropertyChangedSignal
( __1fa5f0b613_e9 [ ( ( ( 42 + 23 ) % 257 + 234 ) % 257 ) ] ) : Connect ( function ( ) if __615661857c_f0
== nil then __570a4268a2_60 . Begin ( __28f246b84e_1b0 , __28f246b84e_1b0 ) end if __615661857c_f0
== __28f246b84e_1b0 then __cb502e879f_1cf += 1 local __e453d87ba6_1c3 = __cb502e879f_1cf task
. delay ( 0.15 , function ( ) if __e453d87ba6_1c3 == __cb502e879f_1cf then __570a4268a2_60
. End ( __28f246b84e_1b0 ) end end ) end end ) ) end end do local __c3ff17f77d_112 = { __610efd74e5_e4
: FindFirstChild ( __1fa5f0b613_e9 [ ( ( ( 43 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] ) } pcall ( function ( ) table . insert ( __c3ff17f77d_112 , game : GetService ( __1fa5f0b613_e9
[ ( ( ( 44 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) ) end ) for __091590b945_ce ,
__fefa4ee1dc_ff in ipairs ( __c3ff17f77d_112 ) do for __091590b945_ce , __83aa2c1591_172 in
ipairs ( { __1fa5f0b613_e9 [ ( ( ( 45 + 23 ) % 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9 [ (
( ( 46 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] } ) do local __7faf95c067_176 = __fefa4ee1dc_ff
and __fefa4ee1dc_ff : FindFirstChild ( __83aa2c1591_172 ) if __7faf95c067_176 then pcall (
function ( ) __7faf95c067_176 : Destroy ( ) end ) end end end end __cfbeed4503_51 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 47 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Name = __1fa5f0b613_e9
[ ( ( ( 45 + 23 ) % 257 + 234 ) % 257 ) ] , ResetOnSpawn = false , IgnoreGuiInset = true ,
DisplayOrder = 999 , ZIndexBehavior = Enum . ZIndexBehavior . Sibling , } ) local function
__50b39735c0_cc ( ) local __911dad98de_1a8 = __cfbeed4503_51 . AbsoluteSize if __911dad98de_1a8
. X < 50 or __911dad98de_1a8 . Y < 50 then local __ac224fc6a8_103 = workspace . CurrentCamera
__911dad98de_1a8 = __ac224fc6a8_103 and __ac224fc6a8_103 . ViewportSize or Vector2 . new (
1280 , 720 ) end return __911dad98de_1a8 end local __56d2c7e949_99 = { minW = 340 , minH =
260 , maxW = 850 , maxH = 560 , defW = 600 , defH = 370 } local __70637c3047_84 , __92879fad55_83
local function __cbc1ceee6d_20 ( __2b8f6d2550_1da , __44706b8c72_149 ) local __225225afa6_1d9
= __50b39735c0_cc ( ) local __5896dbea8e_16b = math . min ( __56d2c7e949_99 . maxW , __225225afa6_1d9
. X - 8 ) local __c93b8b1b3e_16a = math . min ( __56d2c7e949_99 . maxH , __225225afa6_1d9 .
Y - 8 ) local __4125b0b587_16e = math . min ( __56d2c7e949_99 . minW , __5896dbea8e_16b ) local
__79750afe81_16d = math . min ( __56d2c7e949_99 . minH , __c93b8b1b3e_16a ) return math . clamp
( __2b8f6d2550_1da , __4125b0b587_16e , __5896dbea8e_16b ) , math . clamp ( __44706b8c72_149
, __79750afe81_16d , __c93b8b1b3e_16a ) end local function __8f27429322_1f ( __7009e3a801_1db
, __106f10f688_1dc ) local __225225afa6_1d9 = __50b39735c0_cc ( ) return math . clamp ( __7009e3a801_1db
, 0 , math . max ( 0 , __225225afa6_1d9 . X - __70637c3047_84 . X ) ) , math . clamp ( __106f10f688_1dc
, 0 , math . max ( 0 , __225225afa6_1d9 . Y - __70637c3047_84 . Y ) ) end do local __160b6a5443_118
, __08cb4a26d5_104 = __cbc1ceee6d_20 ( __56d2c7e949_99 . defW , __56d2c7e949_99 . defH ) __70637c3047_84
= Vector2 . new ( __160b6a5443_118 , __08cb4a26d5_104 ) __92879fad55_83 = Vector2 . new ( (
__50b39735c0_cc ( ) . X - __160b6a5443_118 ) / 2 , ( __50b39735c0_cc ( ) . Y - __08cb4a26d5_104
) / 2 ) end local __4140082906_95 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 )
% 257 + 252 ) % 257 * 121 ) % 257 ] , { Name = __1fa5f0b613_e9 [ ( ( ( 48 + 23 ) % 257 + 234
) % 257 ) ] , Position = UDim2 . fromOffset ( __92879fad55_83 . X , __92879fad55_83 . Y ) ,
Size = UDim2 . fromOffset ( __70637c3047_84 . X , __70637c3047_84 . Y ) , BackgroundTransparency
= 1 , BorderSizePixel = 0 , ZIndex = 1 , } , __cfbeed4503_51 ) local function __8df757f7b9_5
( ) __4140082906_95 . Size = UDim2 . fromOffset ( __70637c3047_84 . X , __70637c3047_84 . Y
) __4140082906_95 . Position = UDim2 . fromOffset ( __92879fad55_83 . X , __92879fad55_83 .
Y ) end local function __ded6c1ccc8_9d ( __85511ba214_1d7 ) local __7009e3a801_1db , __106f10f688_1dc
= __8f27429322_1f ( __85511ba214_1d7 . X , __85511ba214_1d7 . Y ) __92879fad55_83 = Vector2
. new ( __7009e3a801_1db , __106f10f688_1dc ) __4140082906_95 . Position = UDim2 . fromOffset
( __7009e3a801_1db , __106f10f688_1dc ) end local function __b6d941f747_9e ( __2b8f6d2550_1da
, __44706b8c72_149 ) local __160b6a5443_118 , __08cb4a26d5_104 = __cbc1ceee6d_20 ( __2b8f6d2550_1da
, __44706b8c72_149 ) __70637c3047_84 = Vector2 . new ( __160b6a5443_118 , __08cb4a26d5_104
) __4140082906_95 . Size = UDim2 . fromOffset ( __160b6a5443_118 , __08cb4a26d5_104 ) __ded6c1ccc8_9d
( __92879fad55_83 ) if __81540dc5aa_1 . ApplyLayout then __81540dc5aa_1 . ApplyLayout ( ) end
end local function __e723124c2c_49 ( __2b8f6d2550_1da , __44706b8c72_149 , __4e854c34a4_19d
) local __160b6a5443_118 , __08cb4a26d5_104 = __cbc1ceee6d_20 ( __2b8f6d2550_1da , __44706b8c72_149
) __70637c3047_84 = Vector2 . new ( __160b6a5443_118 , __08cb4a26d5_104 ) if __81540dc5aa_1
. ApplyLayout then __81540dc5aa_1 . ApplyLayout ( ) end if __4e854c34a4_19d then local __225225afa6_1d9
= __50b39735c0_cc ( ) __92879fad55_83 = Vector2 . new ( ( __225225afa6_1d9 . X - __160b6a5443_118
) / 2 , ( __225225afa6_1d9 . Y - __08cb4a26d5_104 ) / 2 ) else local __7009e3a801_1db , __106f10f688_1dc
= __8f27429322_1f ( __92879fad55_83 . X , __92879fad55_83 . Y ) __92879fad55_83 = Vector2 .
new ( __7009e3a801_1db , __106f10f688_1dc ) end __0f4c731917_c8 ( __4140082906_95 , 0.25 ,
{ Size = UDim2 . fromOffset ( __70637c3047_84 . X , __70637c3047_84 . Y ) , Position = UDim2
. fromOffset ( __92879fad55_83 . X , __92879fad55_83 . Y ) , } ) end local __63dbc4a987_6f
= __605563dda1_74 ( __4140082906_95 , 16 , { { 3 , 0.70 , 0.82 } , { 7 , 0.82 , 0.90 } , {
12 , 0.90 , 0.95 } , { 18 , 0.95 , 0.98 } , } ) local __245d8cdf06_6e = __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Name = __1fa5f0b613_e9 [ ( (
( 49 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , Size = UDim2 . fromScale ( 1 , 1 ) ,
BackgroundColor3 = __55872a0ac8_17 . black , BorderSizePixel = 0 , Active = true , ZIndex =
10 , } , __4140082906_95 ) __3ed63efcc7_26 ( __245d8cdf06_6e , 16 ) __bfadee6497_4f ( __245d8cdf06_6e
, ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , __55872a0ac8_17 . black2 ) , ColorSequenceKeypoint
. new ( 0.55 , __55872a0ac8_17 . black ) , ColorSequenceKeypoint . new ( 1 , Color3 . fromRGB
( 6 , 6 , 8 ) ) , } ) , 65 ) local __65dec1eb64_70 = __179a4169c0_ac ( __245d8cdf06_6e , __55872a0ac8_17
. neon , 2 , 0 ) local __ddbffb3bdd_71 = __bfadee6497_4f ( __65dec1eb64_70 , __faa2ce483a_75
, 0 ) __35e3ca6f7f_a7 ( __ddbffb3bdd_71 , 5 ) local __fbcd68219c_b9 = __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 38 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { AnchorPoint = Vector2 . new
( 0.5 , 1 ) , Position = UDim2 . new ( 0.5 , 0 , 1 , - 16 ) , Size = UDim2 . fromOffset ( 240
, 30 ) , BackgroundColor3 = __55872a0ac8_17 . black , BackgroundTransparency = 0.05 , Text
= __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] , Font = Enum . Font . GothamMedium
, TextSize = 11 , TextColor3 = __55872a0ac8_17 . white , Visible = false , ZIndex = 300 , }
, __245d8cdf06_6e ) __3ed63efcc7_26 ( __fbcd68219c_b9 , 10 ) local __15115c2ddf_ba = __179a4169c0_ac
( __fbcd68219c_b9 , __55872a0ac8_17 . good , 1.5 , 0 ) local __c263e047e5_1ce = 0 local function
__4ca2c89a3e_78 ( __03c021178f_1c8 , __27aea0e268_145 ) __c263e047e5_1ce += 1 local __cb502e879f_1cf
= __c263e047e5_1ce __fbcd68219c_b9 . Text = __03c021178f_1c8 __15115c2ddf_ba . Color = __27aea0e268_145
and __55872a0ac8_17 . good or __55872a0ac8_17 . bad __fbcd68219c_b9 . Visible = true task .
delay ( 2 , function ( ) if __cb502e879f_1cf == __c263e047e5_1ce and __fbcd68219c_b9 . Parent
then __fbcd68219c_b9 . Visible = false end end ) end local __4ad118686b_a2 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Position =
UDim2 . new ( 0 , 2 , 0 , 4 ) , Size = UDim2 . new ( 0 , 145 , 1 , - 6 ) , BackgroundColor3
= __55872a0ac8_17 . sidebar , BorderSizePixel = 0 , Active = true , ClipsDescendants = true
, ZIndex = 11 , } , __245d8cdf06_6e ) __3ed63efcc7_26 ( __4ad118686b_a2 , 14 ) __bfadee6497_4f
( __4ad118686b_a2 , ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , __55872a0ac8_17
. sidebar2 ) , ColorSequenceKeypoint . new ( 1 , __55872a0ac8_17 . sidebar ) , } ) , 80 ) local
__87dc40a818_a3 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257
* 121 ) % 257 ] , { Position = UDim2 . new ( 1 , - 1 , 0 , 0 ) , Size = UDim2 . new ( 0 , 1
, 1 , 0 ) , BackgroundColor3 = __55872a0ac8_17 . border , BackgroundTransparency = 0.25 , BorderSizePixel
= 0 , ZIndex = 15 , } , __4ad118686b_a2 ) local __50a2bac814_29 = __4c855578e9_c9 ( __4ad118686b_a2
, { Position = UDim2 . new ( 0 , 15 , 0 , 15 ) , Size = UDim2 . new ( 1 , - 30 , 0 , 28 ) ,
Text = __1fa5f0b613_e9 [ ( ( ( 50 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , Font =
Enum . Font . GothamBlack , TextSize = 26 , ZIndex = 20 , } ) local __f71541e0a8_86 = __4c855578e9_c9
( __4ad118686b_a2 , { Position = UDim2 . new ( 0 , 52 , 0 , 18 ) , Size = UDim2 . new ( 1 ,
- 60 , 0 , 22 ) , Text = __1fa5f0b613_e9 [ ( ( ( 51 + 23 ) % 257 + 234 ) % 257 ) ] , Font =
Enum . Font . GothamBold , TextSize = 11 , ZIndex = 20 , } ) local __2da63bbad4_6d = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Visible = false
, Position = UDim2 . new ( 0 , 15 , 0 , 49 ) , Size = UDim2 . fromOffset ( 35 , 2 ) , BackgroundColor3
= __55872a0ac8_17 . red , BorderSizePixel = 0 , ZIndex = 20 , } , __4ad118686b_a2 ) __3ed63efcc7_26
( __2da63bbad4_6d , 2 ) local __a902cd5fd3_6c = __bfadee6497_4f ( __2da63bbad4_6d , ColorSequence
. new ( { ColorSequenceKeypoint . new ( 0 , __55872a0ac8_17 . redBright ) , ColorSequenceKeypoint
. new ( 1 , __55872a0ac8_17 . redDark ) , } ) , 0 ) local __b4f9da2525_7a = __4c855578e9_c9
( __4ad118686b_a2 , { Position = UDim2 . new ( 0 , 15 , 0 , 55 ) , Size = UDim2 . new ( 1 ,
- 30 , 0 , 18 ) , Text = __1fa5f0b613_e9 [ ( ( ( 52 * 17 + 5 ) % 257 + 252 ) % 257 * 121 )
% 257 ] , Font = Enum . Font . GothamMedium , TextSize = 9 , TextColor3 = __55872a0ac8_17 .
good , ZIndex = 20 , } ) task . spawn ( function ( ) while not __6c9252efea_11f and __b4f9da2525_7a
. Parent do __0f4c731917_c8 ( __b4f9da2525_7a , 1.0 , { TextTransparency = 0.55 } , Enum .
EasingStyle . Sine ) task . wait ( 1 ) __0f4c731917_c8 ( __b4f9da2525_7a , 1.0 , { TextTransparency
= 0 } , Enum . EasingStyle . Sine ) task . wait ( 1 ) end end ) local __18aecc7650_b3 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 53 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Position =
UDim2 . new ( 0 , 9 , 0 , 88 ) , Size = UDim2 . new ( 1 , - 18 , 1 , - 98 ) , BackgroundTransparency
= 1 , BorderSizePixel = 0 , ScrollBarThickness = 0 , CanvasSize = UDim2 . new ( ) , AutomaticCanvasSize
= Enum . AutomaticSize . Y , ScrollingDirection = Enum . ScrollingDirection . Y , ClipsDescendants
= true , ZIndex = 20 , } , __4ad118686b_a2 ) __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 54 +
23 ) % 257 + 234 ) % 257 ) ] , { Padding = UDim . new ( 0 , 6 ) , SortOrder = Enum . SortOrder
. LayoutOrder } , __18aecc7650_b3 ) __570a4268a2_60 . WatchScroll ( __18aecc7650_b3 ) local
__4e11720e33_25 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257
* 121 ) % 257 ] , { Position = UDim2 . new ( 0 , 145 , 0 , 4 ) , Size = UDim2 . new ( 1 , -
145 , 1 , - 6 ) , BackgroundTransparency = 1 , BorderSizePixel = 0 , ZIndex = 11 , } , __245d8cdf06_6e
) local __e3fcb644d9_54 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] , { Position = UDim2 . new ( 0 , 15 , 0 , 9 ) , Size = UDim2 . new
( 1 , - 30 , 0 , 38 ) , BackgroundTransparency = 1 , Active = true , ZIndex = 25 , } , __4e11720e33_25
) local __b41cd2fb5c_b8 = __4c855578e9_c9 ( __e3fcb644d9_54 , { Size = UDim2 . new ( 1 , -
55 , 0 , 22 ) , Text = __1fa5f0b613_e9 [ ( ( ( 10 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) %
257 ] , Font = Enum . Font . GothamBold , TextSize = 18 , ZIndex = 30 , } ) __4c855578e9_c9
( __e3fcb644d9_54 , { Position = UDim2 . new ( 0 , 0 , 0 , 21 ) , Size = UDim2 . new ( 1 ,
- 55 , 0 , 14 ) , Text = __1fa5f0b613_e9 [ ( ( ( 55 * 17 + 5 ) % 257 + 252 ) % 257 * 121 )
% 257 ] , TextSize = 10 , TextColor3 = __55872a0ac8_17 . grey , ZIndex = 30 , } ) local __11cc61695c_21
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , { Name = __1fa5f0b613_e9 [ ( ( ( 57 + 23 ) % 257 + 234 ) % 257 ) ] , AnchorPoint = Vector2
. new ( 1 , 0 ) , Position = UDim2 . new ( 1 , 0 , 0 , 2 ) , Size = UDim2 . fromOffset ( 30
, 30 ) , BackgroundColor3 = Color3 . fromRGB ( 24 , 19 , 23 ) , BorderSizePixel = 0 , AutoButtonColor
= false , Text = __1fa5f0b613_e9 [ ( ( ( 58 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ]
, Font = Enum . Font . GothamBold , TextSize = 18 , TextColor3 = __55872a0ac8_17 . grey , ZIndex
= 100 , } , __e3fcb644d9_54 ) __3ed63efcc7_26 ( __11cc61695c_21 , 9 ) local __5155c5ecdf_23
= __179a4169c0_ac ( __11cc61695c_21 , __55872a0ac8_17 . border , 1 , 0.1 ) __c41ecd2440_1d1
( __11cc61695c_21 . MouseEnter : Connect ( function ( ) __0f4c731917_c8 ( __11cc61695c_21 ,
0.15 , { BackgroundColor3 = Color3 . fromRGB ( 70 , 12 , 20 ) , TextColor3 = __55872a0ac8_17
. redBright , Rotation = 90 } ) __0f4c731917_c8 ( __5155c5ecdf_23 , 0.15 , { Color = __55872a0ac8_17
. red } ) end ) ) __c41ecd2440_1d1 ( __11cc61695c_21 . MouseLeave : Connect ( function ( )
__0f4c731917_c8 ( __11cc61695c_21 , 0.15 , { BackgroundColor3 = Color3 . fromRGB ( 24 , 19
, 23 ) , TextColor3 = __55872a0ac8_17 . grey , Rotation = 0 } ) __0f4c731917_c8 ( __5155c5ecdf_23
, 0.15 , { Color = __55872a0ac8_17 . border } ) end ) ) local __cde734ea8f_7f = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Position =
UDim2 . new ( 0 , 15 , 0 , 57 ) , Size = UDim2 . new ( 1 , - 30 , 1 , - 69 ) , BackgroundTransparency
= 1 , ClipsDescendants = true , ZIndex = 15 , } , __4e11720e33_25 ) local __c200064ab0_80 =
{ } local __d73f51d7af_b4 = { } local __5f2acb79bc_164 , __962172dde0_165 function __81540dc5aa_1
. ApplyLayout ( ) local __fae5ecd109_10f = __70637c3047_84 . X < 480 local __79f0c2abb2_1ca
= __70637c3047_84 . Y < 320 local __2b8f6d2550_1da = __fae5ecd109_10f and 56 or 145 if __fae5ecd109_10f
~= __5f2acb79bc_164 then local __cf23219fcb_1b6 = UDim2 . new ( 0 , __2b8f6d2550_1da , 1 ,
- 6 ) local __7213b092cf_191 = UDim2 . new ( 0 , __2b8f6d2550_1da , 0 , 4 ) local __a11e88cb13_1b3
= UDim2 . new ( 1 , - __2b8f6d2550_1da , 1 , - 6 ) if __5f2acb79bc_164 == nil then __4ad118686b_a2
. Size , __4e11720e33_25 . Position , __4e11720e33_25 . Size = __cf23219fcb_1b6 , __7213b092cf_191
, __a11e88cb13_1b3 else __0f4c731917_c8 ( __4ad118686b_a2 , 0.22 , { Size = __cf23219fcb_1b6
} ) __0f4c731917_c8 ( __4e11720e33_25 , 0.22 , { Position = __7213b092cf_191 , Size = __a11e88cb13_1b3
} ) end __5f2acb79bc_164 = __fae5ecd109_10f __f71541e0a8_86 . Visible = not __fae5ecd109_10f
if __fae5ecd109_10f then __50a2bac814_29 . Position = UDim2 . new ( 0 , 0 , 0 , 15 ) __50a2bac814_29
. Size = UDim2 . new ( 1 , 0 , 0 , 28 ) __50a2bac814_29 . TextXAlignment = Enum . TextXAlignment
. Center __2da63bbad4_6d . Position = UDim2 . new ( 0.5 , - 17 , 0 , 49 ) __b4f9da2525_7a .
Text = __1fa5f0b613_e9 [ ( ( ( 59 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] __b4f9da2525_7a
. Position = UDim2 . new ( 0 , 0 , 0 , 55 ) __b4f9da2525_7a . Size = UDim2 . new ( 1 , 0 ,
0 , 18 ) __b4f9da2525_7a . TextXAlignment = Enum . TextXAlignment . Center else __50a2bac814_29
. Position = UDim2 . new ( 0 , 15 , 0 , 15 ) __50a2bac814_29 . Size = UDim2 . new ( 1 , - 30
, 0 , 28 ) __50a2bac814_29 . TextXAlignment = Enum . TextXAlignment . Left __2da63bbad4_6d
. Position = UDim2 . new ( 0 , 15 , 0 , 49 ) __b4f9da2525_7a . Text = __1fa5f0b613_e9 [ ( (
( 52 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] __b4f9da2525_7a . Position = UDim2 . new
( 0 , 15 , 0 , 55 ) __b4f9da2525_7a . Size = UDim2 . new ( 1 , - 30 , 0 , 18 ) __b4f9da2525_7a
. TextXAlignment = Enum . TextXAlignment . Left end end if __79f0c2abb2_1ca ~= __962172dde0_165
then __962172dde0_165 = __79f0c2abb2_1ca __b4f9da2525_7a . Visible = not __79f0c2abb2_1ca local
__01fb387994_1d0 = __79f0c2abb2_1ca and 58 or 88 __18aecc7650_b3 . Position = UDim2 . new (
0 , 9 , 0 , __01fb387994_1d0 ) __18aecc7650_b3 . Size = UDim2 . new ( 1 , - 18 , 1 , - ( __01fb387994_1d0
+ 10 ) ) end for __091590b945_ce , __d9d90366fc_1c4 in pairs ( __d73f51d7af_b4 ) do __d9d90366fc_1c4
. Label . Visible = not __fae5ecd109_10f end end __1f08e28198_79 ( function ( ) __65dec1eb64_70
. Color = __55872a0ac8_17 . neon __ddbffb3bdd_71 . Color = __faa2ce483a_75 for __091590b945_ce
, __19c1476c74_163 in ipairs ( __63dbc4a987_6f ) do __19c1476c74_163 . Stroke . Color = __55872a0ac8_17
. neon end __50a2bac814_29 . TextColor3 = __55872a0ac8_17 . red __2da63bbad4_6d . BackgroundColor3
= __55872a0ac8_17 . red __a902cd5fd3_6c . Color = ColorSequence . new ( { ColorSequenceKeypoint
. new ( 0 , __55872a0ac8_17 . redBright ) , ColorSequenceKeypoint . new ( 1 , __55872a0ac8_17
. redDark ) , } ) __87dc40a818_a3 . BackgroundColor3 = __55872a0ac8_17 . border __b41cd2fb5c_b8
. TextColor3 = __55872a0ac8_17 . white end ) local function __c9689bac6d_27 ( __8f8abf3236_173
) local __331c5c3e98_7e = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 53 * 31 + 11 ) % 257 +
246 ) % 257 * 199 ) % 257 ] , { Name = __8f8abf3236_173 , Size = UDim2 . fromScale ( 1 , 1
) , BackgroundTransparency = 1 , BorderSizePixel = 0 , ScrollBarThickness = 2 , ScrollBarImageColor3
= __55872a0ac8_17 . red , CanvasSize = UDim2 . new ( 0 , 0 , 0 , 0 ) , Visible = false , }
, __cde734ea8f_7f ) __570a4268a2_60 . WatchScroll ( __331c5c3e98_7e ) __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 60 + 23 ) % 257 + 234 ) % 257 ) ] , { PaddingLeft = UDim . new ( 0 , 2 ) , PaddingRight
= UDim . new ( 0 , 8 ) , PaddingBottom = UDim . new ( 0 , 8 ) , } , __331c5c3e98_7e ) local
__1bdd4920b6_64 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 54 + 23 ) % 257 + 234 ) % 257 )
] , { Padding = UDim . new ( 0 , 8 ) , SortOrder = Enum . SortOrder . LayoutOrder } , __331c5c3e98_7e
) __c41ecd2440_1d1 ( __1bdd4920b6_64 : GetPropertyChangedSignal ( __1fa5f0b613_e9 [ ( ( ( 61
* 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) : Connect ( function ( ) __331c5c3e98_7e .
CanvasSize = UDim2 . fromOffset ( 0 , __1bdd4920b6_64 . AbsoluteContentSize . Y + 10 ) end
) ) __1f08e28198_79 ( function ( ) __331c5c3e98_7e . ScrollBarImageColor3 = __55872a0ac8_17
. red end ) __c200064ab0_80 [ __8f8abf3236_173 ] = __331c5c3e98_7e return __331c5c3e98_7e end
local function __bd857bef18_5e ( __6e05a5b93d_188 ) return __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Position = UDim2 . new ( 0 ,
9 , 0.5 , - 9 ) , Size = UDim2 . fromOffset ( 19 , 19 ) , BackgroundTransparency = 1 , ZIndex
= 40 , } , __6e05a5b93d_188 ) end local function __a13759dffb_87 ( __6e05a5b93d_188 , __e0a41510d9_196
, __cf456efecb_19a ) __e0a41510d9_196 . BorderSizePixel = 0 __e0a41510d9_196 . ZIndex = __e0a41510d9_196
. ZIndex or 41 local __a55388a311_13b = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 +
5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __e0a41510d9_196 , __6e05a5b93d_188 ) if __cf456efecb_19a
then __3ed63efcc7_26 ( __a55388a311_13b , __cf456efecb_19a ) end return __a55388a311_13b end
local __b5d7669df4_5c = { } function __b5d7669df4_5c . house ( __6e05a5b93d_188 , __335a0e8d4e_10c
) local __ad85932681_cd = __bd857bef18_5e ( __6e05a5b93d_188 ) local __6aae6ccbac_94 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2
. fromOffset ( 19 , 9 ) , BackgroundTransparency = 1 , ClipsDescendants = true , ZIndex = 41
, } , __ad85932681_cd ) local __7f610b8324_93 = __a13759dffb_87 ( __6aae6ccbac_94 , { AnchorPoint
= Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . new ( 0.5 , 0 , 1 , - 1 ) , Size = UDim2
. fromOffset ( 13 , 13 ) , Rotation = 45 , BackgroundColor3 = __335a0e8d4e_10c , } , 3 ) local
__aacf119ab0_1d = __a13759dffb_87 ( __ad85932681_cd , { Position = UDim2 . new ( 0 , 13 , 0
, 0 ) , Size = UDim2 . fromOffset ( 3 , 6 ) , BackgroundColor3 = __335a0e8d4e_10c , ZIndex
= 39 , } , 1 ) local __c2b33520b8_f = __a13759dffb_87 ( __ad85932681_cd , { Position = UDim2
. new ( 0 , 2 , 0 , 8 ) , Size = UDim2 . fromOffset ( 15 , 11 ) , BackgroundColor3 = __335a0e8d4e_10c
, } , 3 ) __a13759dffb_87 ( __c2b33520b8_f , { AnchorPoint = Vector2 . new ( 0.5 , 1 ) , Position
= UDim2 . new ( 0.5 , 1 , 1 , 0 ) , Size = UDim2 . fromOffset ( 4 , 7 ) , BackgroundColor3
= __55872a0ac8_17 . black , ZIndex = 42 , } , 1 ) __a13759dffb_87 ( __c2b33520b8_f , { Position
= UDim2 . new ( 0 , 3 , 0 , 2 ) , Size = UDim2 . fromOffset ( 4 , 4 ) , BackgroundColor3 =
__55872a0ac8_17 . black , ZIndex = 42 , } , 1 ) return __ad85932681_cd , { __7f610b8324_93
, __aacf119ab0_1d , __c2b33520b8_f } end function __b5d7669df4_5c . gear ( __6e05a5b93d_188
, __335a0e8d4e_10c ) local __ad85932681_cd = __bd857bef18_5e ( __6e05a5b93d_188 ) local __03aa403660_18a
= { } for __734285bf2d_153 = 1 , 8 do table . insert ( __03aa403660_18a , __a13759dffb_87 (
__ad85932681_cd , { AnchorPoint = Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . new ( 0.5
, 0 , 0.5 , 0 ) , Size = UDim2 . fromOffset ( 4 , 18 ) , Rotation = ( __734285bf2d_153 - 1
) * 45 , BackgroundColor3 = __335a0e8d4e_10c , ZIndex = 40 , } , 2 ) ) end table . insert (
__03aa403660_18a , __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint = Vector2 . new ( 0.5
, 0.5 ) , Position = UDim2 . new ( 0.5 , 0 , 0.5 , 0 ) , Size = UDim2 . fromOffset ( 13 , 13
) , BackgroundColor3 = __335a0e8d4e_10c , } , 7 ) ) __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint
= Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . new ( 0.5 , 0 , 0.5 , 0 ) , Size = UDim2
. fromOffset ( 5 , 5 ) , BackgroundColor3 = __55872a0ac8_17 . black , ZIndex = 42 , } ) return
__ad85932681_cd , __03aa403660_18a end function __b5d7669df4_5c . player ( __6e05a5b93d_188
, __335a0e8d4e_10c ) local __ad85932681_cd = __bd857bef18_5e ( __6e05a5b93d_188 ) local __401d84a551_52
= __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint = Vector2 . new ( 0.5 , 0 ) , Position
= UDim2 . new ( 0.5 , 0 , 0 , 1 ) , Size = UDim2 . fromOffset ( 8 , 8 ) , BackgroundColor3
= __335a0e8d4e_10c , } , 4 ) local __c2b33520b8_f = __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint
= Vector2 . new ( 0.5 , 1 ) , Position = UDim2 . new ( 0.5 , 0 , 1 , - 1 ) , Size = UDim2 .
fromOffset ( 15 , 8 ) , BackgroundColor3 = __335a0e8d4e_10c , } , 5 ) return __ad85932681_cd
, { __401d84a551_52 , __c2b33520b8_f } end function __b5d7669df4_5c . sprout ( __6e05a5b93d_188
, __335a0e8d4e_10c ) local __ad85932681_cd = __bd857bef18_5e ( __6e05a5b93d_188 ) local __a403d7d16d_ab
= __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint = Vector2 . new ( 0.5 , 1 ) , Position
= UDim2 . new ( 0.5 , 0 , 1 , - 1 ) , Size = UDim2 . fromOffset ( 2 , 11 ) , BackgroundColor3
= __335a0e8d4e_10c , } , 1 ) local __8a2ec8216a_65 = __a13759dffb_87 ( __ad85932681_cd , {
AnchorPoint = Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . fromOffset ( 5 , 6 ) , Size
= UDim2 . fromOffset ( 9 , 5 ) , Rotation = - 30 , BackgroundColor3 = __335a0e8d4e_10c , }
, 3 ) local __83bf18aabb_66 = __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint = Vector2 .
new ( 0.5 , 0.5 ) , Position = UDim2 . fromOffset ( 14 , 6 ) , Size = UDim2 . fromOffset (
9 , 5 ) , Rotation = 30 , BackgroundColor3 = __335a0e8d4e_10c , } , 3 ) return __ad85932681_cd
, { __a403d7d16d_ab , __8a2ec8216a_65 , __83bf18aabb_66 } end function __b5d7669df4_5c . eye
( __6e05a5b93d_188 , __335a0e8d4e_10c ) local __ad85932681_cd = __bd857bef18_5e ( __6e05a5b93d_188
) local __7945828183_7c = __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint = Vector2 . new
( 0.5 , 0.5 ) , Position = UDim2 . new ( 0.5 , 0 , 0.5 , 0 ) , Size = UDim2 . fromOffset (
19 , 12 ) , BackgroundColor3 = __335a0e8d4e_10c , } , 6 ) __a13759dffb_87 ( __ad85932681_cd
, { AnchorPoint = Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . new ( 0.5 , 0 , 0.5 , 0
) , Size = UDim2 . fromOffset ( 9 , 9 ) , BackgroundColor3 = __55872a0ac8_17 . black , ZIndex
= 42 , } , 5 ) local __cae17d1c92_42 = __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint =
Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . new ( 0.5 , 0 , 0.5 , 0 ) , Size = UDim2 .
fromOffset ( 4 , 4 ) , BackgroundColor3 = __335a0e8d4e_10c , ZIndex = 43 , } , 2 ) return __ad85932681_cd
, { __7945828183_7c , __cae17d1c92_42 } end function __b5d7669df4_5c . info ( __6e05a5b93d_188
, __335a0e8d4e_10c ) local __ad85932681_cd = __bd857bef18_5e ( __6e05a5b93d_188 ) local __6e6135ab37_1e
= __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint = Vector2 . new ( 0.5 , 0.5 ) , Position
= UDim2 . new ( 0.5 , 0 , 0.5 , 0 ) , Size = UDim2 . fromOffset ( 18 , 18 ) , BackgroundColor3
= __335a0e8d4e_10c , } , 9 ) __a13759dffb_87 ( __ad85932681_cd , { AnchorPoint = Vector2 .
new ( 0.5 , 0.5 ) , Position = UDim2 . new ( 0.5 , 0 , 0.5 , 2 ) , Size = UDim2 . fromOffset
( 2 , 7 ) , BackgroundColor3 = __55872a0ac8_17 . black , ZIndex = 42 , } ) __a13759dffb_87
( __ad85932681_cd , { AnchorPoint = Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . new (
0.5 , 0 , 0.5 , - 5 ) , Size = UDim2 . fromOffset ( 3 , 3 ) , BackgroundColor3 = __55872a0ac8_17
. black , ZIndex = 42 , } , 2 ) return __ad85932681_cd , { __6e6135ab37_1e } end local function
__e35f7c64ac_28 ( __8f8abf3236_173 , __50c7ece81b_154 ) local __2536710dd3_15 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Size = UDim2
. new ( 1 , 0 , 0 , 36 ) , BackgroundColor3 = Color3 . fromRGB ( 75 , 12 , 20 ) , BackgroundTransparency
= 1 , BorderSizePixel = 0 , AutoButtonColor = false , Text = __1fa5f0b613_e9 [ ( ( ( 27 + 23
) % 257 + 234 ) % 257 ) ] , LayoutOrder = __85c90836e8_17d ( __18aecc7650_b3 ) , ZIndex = 30
, } , __18aecc7650_b3 ) __3ed63efcc7_26 ( __2536710dd3_15 , 9 ) __bfadee6497_4f ( __2536710dd3_15
, ColorSequence . new ( Color3 . new ( 1 , 1 , 1 ) , Color3 . fromRGB ( 120 , 120 , 130 ) )
, 0 ) local __f8e2e2b773_e = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257
+ 252 ) % 257 * 121 ) % 257 ] , { Visible = false , Position = UDim2 . new ( 0 , 0 , 0.5 ,
- 9 ) , Size = UDim2 . fromOffset ( 3 , 18 ) , BackgroundColor3 = __55872a0ac8_17 . red , BackgroundTransparency
= 1 , BorderSizePixel = 0 , ZIndex = 40 , } , __2536710dd3_15 ) __3ed63efcc7_26 ( __f8e2e2b773_e
, 3 ) local __d0ce1f7a53_5b , __7dbce0bb30_155 , __e84250213e_15a local __9c7f1f2f27_156 =
tostring ( __50c7ece81b_154 ) if __b5d7669df4_5c [ __9c7f1f2f27_156 ] then __d0ce1f7a53_5b
, __7dbce0bb30_155 = __b5d7669df4_5c [ __9c7f1f2f27_156 ] ( __2536710dd3_15 , __55872a0ac8_17
. grey ) elseif __9c7f1f2f27_156 : match ( __1fa5f0b613_e9 [ ( ( ( 62 * 31 + 11 ) % 257 + 246
) % 257 * 199 ) % 257 ] ) or __9c7f1f2f27_156 : match ( __1fa5f0b613_e9 [ ( ( ( 63 + 23 ) %
257 + 234 ) % 257 ) ] ) then __e84250213e_15a = true __d0ce1f7a53_5b = __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 64 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Position = UDim2 . new ( 0 ,
11 , 0.5 , - 9 ) , Size = UDim2 . fromOffset ( 18 , 18 ) , BackgroundTransparency = 1 , Image
= __9c7f1f2f27_156 : match ( __1fa5f0b613_e9 [ ( ( ( 63 + 23 ) % 257 + 234 ) % 257 ) ] ) and
( __1fa5f0b613_e9 [ ( ( ( 65 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] .. __9c7f1f2f27_156
) or __9c7f1f2f27_156 , ImageColor3 = __55872a0ac8_17 . grey , ZIndex = 40 , } , __2536710dd3_15
) else __d0ce1f7a53_5b = __4c855578e9_c9 ( __2536710dd3_15 , { Position = UDim2 . new ( 0 ,
11 , 0 , 0 ) , Size = UDim2 . fromOffset ( 20 , 36 ) , Text = __9c7f1f2f27_156 , Font = Enum
. Font . GothamBold , TextSize = 12 , TextColor3 = __55872a0ac8_17 . grey , ZIndex = 40 , }
) end local __b20eef3bf6_63 = __4c855578e9_c9 ( __2536710dd3_15 , { Position = UDim2 . new
( 0 , 37 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 42 , 0 , 36 ) , Text = __8f8abf3236_173 , Font
= Enum . Font . GothamMedium , TextColor3 = __55872a0ac8_17 . grey , ZIndex = 40 , } ) local
__d9d90366fc_1c4 = { Button = __2536710dd3_15 , Icon = __d0ce1f7a53_5b , Label = __b20eef3bf6_63
, Bar = __f8e2e2b773_e , IsImage = __e84250213e_15a , IconParts = __7dbce0bb30_155 , Active
= false , } __d73f51d7af_b4 [ __8f8abf3236_173 ] = __d9d90366fc_1c4 local function __77672993b4_5d
( __fefa4ee1dc_ff , __9f8d4713cb_159 ) if __d9d90366fc_1c4 . IconParts then for __091590b945_ce
, __e5bfcc50d5_189 in ipairs ( __d9d90366fc_1c4 . IconParts ) do if __9f8d4713cb_159 then __e5bfcc50d5_189
. BackgroundColor3 = __fefa4ee1dc_ff else __0f4c731917_c8 ( __e5bfcc50d5_189 , 0.18 , { BackgroundColor3
= __fefa4ee1dc_ff } ) end end elseif __d9d90366fc_1c4 . IsImage then __0f4c731917_c8 ( __d9d90366fc_1c4
. Icon , 0.18 , { ImageColor3 = __fefa4ee1dc_ff } ) else __0f4c731917_c8 ( __d9d90366fc_1c4
. Icon , 0.18 , { TextColor3 = __fefa4ee1dc_ff } ) end end function __d9d90366fc_1c4 . Paint
( __9f8d4713cb_159 ) local __70300f2a2e_ed = __d9d90366fc_1c4 . Active __0f4c731917_c8 ( __2536710dd3_15
, 0.18 , { BackgroundTransparency = __70300f2a2e_ed and 0.15 or 1 } ) __77672993b4_5d ( __70300f2a2e_ed
and __55872a0ac8_17 . redSoft or __55872a0ac8_17 . grey , __9f8d4713cb_159 ) __0f4c731917_c8
( __b20eef3bf6_63 , 0.18 , { TextColor3 = __70300f2a2e_ed and __55872a0ac8_17 . white or __55872a0ac8_17
. grey } ) __0f4c731917_c8 ( __f8e2e2b773_e , 0.18 , { BackgroundTransparency = __70300f2a2e_ed
and 0 or 1 } ) end __1f08e28198_79 ( function ( ) __f8e2e2b773_e . BackgroundColor3 = __55872a0ac8_17
. red __2536710dd3_15 . BackgroundColor3 = __55872a0ac8_17 . redDark if __d9d90366fc_1c4 .
Active then __77672993b4_5d ( __55872a0ac8_17 . redSoft , true ) end end ) __c41ecd2440_1d1
( __2536710dd3_15 . MouseEnter : Connect ( function ( ) if not __d9d90366fc_1c4 . Active then
__0f4c731917_c8 ( __2536710dd3_15 , 0.15 , { BackgroundTransparency = 0.72 } ) __0f4c731917_c8
( __b20eef3bf6_63 , 0.15 , { TextColor3 = __55872a0ac8_17 . white } ) end end ) ) __c41ecd2440_1d1
( __2536710dd3_15 . MouseLeave : Connect ( function ( ) if not __d9d90366fc_1c4 . Active then
__0f4c731917_c8 ( __2536710dd3_15 , 0.15 , { BackgroundTransparency = 1 } ) __0f4c731917_c8
( __b20eef3bf6_63 , 0.15 , { TextColor3 = __55872a0ac8_17 . grey } ) end end ) ) __c41ecd2440_1d1
( __2536710dd3_15 . Activated : Connect ( function ( ) __81540dc5aa_1 . ActivateTab ( __8f8abf3236_173
) end ) ) return __2536710dd3_15 end function __81540dc5aa_1 . ActivateTab ( __8f8abf3236_173
) for __251b747b45_1c5 , __d9d90366fc_1c4 in pairs ( __d73f51d7af_b4 ) do __d9d90366fc_1c4
. Active = __251b747b45_1c5 == __8f8abf3236_173 __d9d90366fc_1c4 . Paint ( ) if __c200064ab0_80
[ __251b747b45_1c5 ] then __c200064ab0_80 [ __251b747b45_1c5 ] . Visible = __d9d90366fc_1c4
. Active end if __d9d90366fc_1c4 . Active then __b41cd2fb5c_b8 . Text = __251b747b45_1c5 end
end end local function __b4fd8ef090_9b ( __6e05a5b93d_188 , __03c021178f_1c8 ) local __f70d242b1e_58
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Size = UDim2 . new ( 1 , 0 , 0 , 29 ) , BackgroundTransparency = 1 , LayoutOrder = __85c90836e8_17d
( __6e05a5b93d_188 ) , } , __6e05a5b93d_188 ) local __b20eef3bf6_63 = __4c855578e9_c9 ( __f70d242b1e_58
, { Position = UDim2 . new ( 0 , 3 , 0 , 5 ) , Size = UDim2 . new ( 1 , - 6 , 0 , 18 ) , Text
= string . upper ( __03c021178f_1c8 ) , Font = Enum . Font . GothamBold , TextSize = 10 , }
) local __943a5986df_67 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] , { Position = UDim2 . new ( 0 , 3 , 1 , - 1 ) , Size = UDim2 . new
( 1 , - 6 , 0 , 1 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1 ) , BorderSizePixel = 0 ,
} , __f70d242b1e_58 ) local __5b5acebe04_68 = __bfadee6497_4f ( __943a5986df_67 , ColorSequence
. new ( __55872a0ac8_17 . border ) , 0 ) __1f08e28198_79 ( function ( ) __b20eef3bf6_63 . TextColor3
= __55872a0ac8_17 . redSoft __5b5acebe04_68 . Color = ColorSequence . new ( __55872a0ac8_17
. border ) end ) return __f70d242b1e_58 end local function __52c7eab5d7_1a ( __6e05a5b93d_188
, __276778636a_14c , __a0ac7bf68d_105 ) local __f70d242b1e_58 = __b691e2a887_76 ( __a0ac7bf68d_105
or __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2
. new ( 1 , 0 , 0 , __276778636a_14c ) , BackgroundColor3 = __55872a0ac8_17 . innerBg , BorderSizePixel
= 0 , LayoutOrder = __85c90836e8_17d ( __6e05a5b93d_188 ) , ZIndex = 50 , } , __6e05a5b93d_188
) if __a0ac7bf68d_105 == __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 )
% 257 ] then __f70d242b1e_58 . AutoButtonColor = false __f70d242b1e_58 . Text = __1fa5f0b613_e9
[ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] end __3ed63efcc7_26 ( __f70d242b1e_58 , 10 ) __bfadee6497_4f
( __f70d242b1e_58 , ColorSequence . new ( Color3 . new ( 1 , 1 , 1 ) , Color3 . fromRGB ( 200
, 200 , 212 ) ) , 0 ) local __e21544035f_98 = __179a4169c0_ac ( __f70d242b1e_58 , __55872a0ac8_17
. innerBorder , 1.5 , 0 ) local __19438b06d3_0 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( (
40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Visible = false , Position = UDim2 .
new ( 0 , 8 , 0 , 6 ) , Size = UDim2 . new ( 0 , 3 , 1 , - 12 ) , BackgroundColor3 = __55872a0ac8_17
. redBright , BorderSizePixel = 0 , ZIndex = 55 , } , __f70d242b1e_58 ) __3ed63efcc7_26 ( __19438b06d3_0
, 3 ) return __f70d242b1e_58 , __e21544035f_98 , __19438b06d3_0 end local function __0850714e19_5a
( __f0067242e1_174 , __52f8d690a9_13e ) __c41ecd2440_1d1 ( __f0067242e1_174 . MouseEnter :
Connect ( function ( ) __52f8d690a9_13e ( true ) end ) ) __c41ecd2440_1d1 ( __f0067242e1_174
. MouseLeave : Connect ( function ( ) __52f8d690a9_13e ( false ) end ) ) end local function
__52ce491145_9a ( __52f8d690a9_13e , ... ) if not __52f8d690a9_13e then return end local __02ce84df23_175
, __99c98a9609_13a = pcall ( __52f8d690a9_13e , ... ) if not __02ce84df23_175 then warn ( __1fa5f0b613_e9
[ ( ( ( 66 + 23 ) % 257 + 234 ) % 257 ) ] .. tostring ( __99c98a9609_13a ) ) end end local
function __2536710dd3_15 ( __6e05a5b93d_188 , __03c021178f_1c8 , __bd6c121631_102 , __5edb797bb1_11a
) local __f432547e7c_12 , __e21544035f_98 , __19438b06d3_0 = __52c7eab5d7_1a ( __6e05a5b93d_188
, 42 , __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) local __cae17d1c92_42
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Visible = false , Position = UDim2 . new ( 0 , 18 , 0.5 , - 3 ) , Size = UDim2 . fromOffset
( 6 , 6 ) , BackgroundColor3 = __55872a0ac8_17 . redBright , BorderSizePixel = 0 , ZIndex =
55 , } , __f432547e7c_12 ) __3ed63efcc7_26 ( __cae17d1c92_42 , 6 ) __4c855578e9_c9 ( __f432547e7c_12
, { Position = UDim2 . new ( 0 , 16 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 42 , 1 , 0 ) , Text
= __03c021178f_1c8 , Font = Enum . Font . GothamMedium , ZIndex = 60 , } ) local __baf741fee1_150
= false local function __f3dad242d9_186 ( ) local __c4e71f79ad_ee = __5edb797bb1_11a and __55872a0ac8_17
. bad or ( __baf741fee1_150 and __55872a0ac8_17 . redSoft or __55872a0ac8_17 . redBright )
__0f4c731917_c8 ( __f432547e7c_12 , 0.15 , { BackgroundColor3 = __baf741fee1_150 and __55872a0ac8_17
. innerBgHover or __55872a0ac8_17 . innerBg } ) __0f4c731917_c8 ( __e21544035f_98 , 0.15 ,
{ Color = __5edb797bb1_11a and __55872a0ac8_17 . bad or ( __baf741fee1_150 and __55872a0ac8_17
. innerBorderHover or __55872a0ac8_17 . innerBorder ) , Thickness = __baf741fee1_150 and 1.8
or 1.5 , } ) __0f4c731917_c8 ( __19438b06d3_0 , 0.15 , { BackgroundColor3 = __c4e71f79ad_ee
} ) __0f4c731917_c8 ( __cae17d1c92_42 , 0.15 , { BackgroundColor3 = __c4e71f79ad_ee } ) end
__0850714e19_5a ( __f432547e7c_12 , function ( __44706b8c72_149 ) __baf741fee1_150 = __44706b8c72_149
__f3dad242d9_186 ( ) end ) __1f08e28198_79 ( __f3dad242d9_186 ) __c41ecd2440_1d1 ( __f432547e7c_12
. Activated : Connect ( function ( ) task . spawn ( __52ce491145_9a , __bd6c121631_102 ) end
) ) return __f432547e7c_12 end local function __82a06c5cfd_bb ( __6e05a5b93d_188 , __03c021178f_1c8
, __bc24c603b0_135 , __bd6c121631_102 , __5dc7c255b7_f8 ) local __d7ce05eed0_1bf = __bc24c603b0_135
== true local __baf741fee1_150 = false local __f70d242b1e_58 , __320d2f31a4_59 , __19438b06d3_0
= __52c7eab5d7_1a ( __6e05a5b93d_188 , 42 ) __4c855578e9_c9 ( __f70d242b1e_58 , { Position
= UDim2 . new ( 0 , 16 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 150 , 1 , 0 ) , Text = __03c021178f_1c8
, Font = Enum . Font . GothamMedium , TextTruncate = Enum . TextTruncate . AtEnd , ZIndex =
60 , } ) local __b49c726ccf_77 = __4c855578e9_c9 ( __f70d242b1e_58 , { AnchorPoint = Vector2
. new ( 1 , 0.5 ) , Position = UDim2 . new ( 1 , - 62 , 0.5 , 0 ) , Size = UDim2 . fromOffset
( 90 , 14 ) , Text = ( __5dc7c255b7_f8 and not __5dc7c255b7_f8 ( ) ) and __1fa5f0b613_e9 [
( ( ( 67 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] or __1fa5f0b613_e9 [ ( ( ( 27 + 23
) % 257 + 234 ) % 257 ) ] , TextSize = 9 , TextColor3 = __55872a0ac8_17 . bad , TextXAlignment
= Enum . TextXAlignment . Right , ZIndex = 60 , } ) local __f52cf67e09_af = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { AnchorPoint
= Vector2 . new ( 1 , 0.5 ) , Position = UDim2 . new ( 1 , - 12 , 0.5 , 0 ) , Size = UDim2
. fromOffset ( 42 , 22 ) , BackgroundColor3 = __55872a0ac8_17 . switchOff , BorderSizePixel
= 0 , AutoButtonColor = false , Text = __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257
) ] , ZIndex = 70 , } , __f70d242b1e_58 ) __3ed63efcc7_26 ( __f52cf67e09_af , 12 ) local __ee5065121d_b0
= __179a4169c0_ac ( __f52cf67e09_af , __55872a0ac8_17 . switchBorder , 1.4 , 0 ) local __71dbbc158c_61
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { AnchorPoint = Vector2 . new ( 0 , 0.5 ) , Position = UDim2 . new ( 0 , 3 , 0.5 , 0 )
, Size = UDim2 . fromOffset ( 16 , 16 ) , BackgroundColor3 = Color3 . fromRGB ( 190 , 190 ,
195 ) , BorderSizePixel = 0 , ZIndex = 75 , } , __f52cf67e09_af ) __3ed63efcc7_26 ( __71dbbc158c_61
, 20 ) local __c78d3c9470_57 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257
+ 246 ) % 257 * 199 ) % 257 ] , { Size = UDim2 . fromScale ( 1 , 1 ) , BackgroundTransparency
= 1 , Text = __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] , ZIndex = 52 , } ,
__f70d242b1e_58 ) local function __f3dad242d9_186 ( ) __0f4c731917_c8 ( __f70d242b1e_58 , 0.15
, { BackgroundColor3 = ( __baf741fee1_150 and not __d7ce05eed0_1bf ) and __55872a0ac8_17 .
innerBgHover or __55872a0ac8_17 . innerBg } ) __0f4c731917_c8 ( __320d2f31a4_59 , 0.18 , {
Color = __d7ce05eed0_1bf and __55872a0ac8_17 . red or ( __baf741fee1_150 and __55872a0ac8_17
. redBright or __55872a0ac8_17 . innerBorder ) , Thickness = __d7ce05eed0_1bf and 1.7 or (
__baf741fee1_150 and 1.7 or 1.5 ) , } ) __0f4c731917_c8 ( __f52cf67e09_af , 0.18 , { BackgroundColor3
= __d7ce05eed0_1bf and __55872a0ac8_17 . red or __55872a0ac8_17 . switchOff } ) __0f4c731917_c8
( __ee5065121d_b0 , 0.18 , { Color = __d7ce05eed0_1bf and __55872a0ac8_17 . redBright or __55872a0ac8_17
. switchBorder , Thickness = __d7ce05eed0_1bf and 1.6 or 1.4 , } ) __0f4c731917_c8 ( __71dbbc158c_61
, 0.18 , { Position = __d7ce05eed0_1bf and UDim2 . new ( 1 , - 19 , 0.5 , 0 ) or UDim2 . new
( 0 , 3 , 0.5 , 0 ) , BackgroundColor3 = __d7ce05eed0_1bf and Color3 . new ( 1 , 1 , 1 ) or
Color3 . fromRGB ( 190 , 190 , 195 ) , } ) __0f4c731917_c8 ( __19438b06d3_0 , 0.18 , { BackgroundColor3
= __d7ce05eed0_1bf and __55872a0ac8_17 . redSoft or __55872a0ac8_17 . redBright } ) end local
__42649606a0_f3 = { } function __42649606a0_f3 . Get ( ) return __d7ce05eed0_1bf end function
__42649606a0_f3 . Set ( __d87095ec04_1d8 , __62e1954584_1b2 ) __d7ce05eed0_1bf = __d87095ec04_1d8
== true __f3dad242d9_186 ( ) if not __62e1954584_1b2 then task . spawn ( __52ce491145_9a ,
__bd6c121631_102 , __d7ce05eed0_1bf ) end end local function __079ebb9250_109 ( ) if __5dc7c255b7_f8
and not __5dc7c255b7_f8 ( ) then __b49c726ccf_77 . Text = __1fa5f0b613_e9 [ ( ( ( 67 * 17 +
5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] __4ca2c89a3e_78 ( __1fa5f0b613_e9 [ ( ( ( 68 * 31 +
11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , false ) return end __42649606a0_f3 . Set ( not __d7ce05eed0_1bf
) end __c41ecd2440_1d1 ( __c78d3c9470_57 . Activated : Connect ( __079ebb9250_109 ) ) __c41ecd2440_1d1
( __f52cf67e09_af . Activated : Connect ( __079ebb9250_109 ) ) __0850714e19_5a ( __f70d242b1e_58
, function ( __44706b8c72_149 ) __baf741fee1_150 = __44706b8c72_149 __f3dad242d9_186 ( ) end
) __1f08e28198_79 ( __f3dad242d9_186 ) return __f70d242b1e_58 , __42649606a0_f3 end local function
__18995ee73b_a6 ( __6e05a5b93d_188 , __03c021178f_1c8 , __9f3366bf0b_16c , __38af4f80a0_168
, __5bcfe2290a_11d , __527041038c_11c , __838e116fcd_178 , __bc7c9f6097_19f ) local __c779c8d513_96
, __fa4ca19d6a_97 , __19438b06d3_0 = __52c7eab5d7_1a ( __6e05a5b93d_188 , 58 ) __19438b06d3_0
. Size = UDim2 . new ( 0 , 3 , 0 , 22 ) __4c855578e9_c9 ( __c779c8d513_96 , { Position = UDim2
. new ( 0 , 16 , 0 , 6 ) , Size = UDim2 . new ( 1 , - 110 , 0 , 20 ) , Text = __03c021178f_1c8
, Font = Enum . Font . GothamMedium , TextTruncate = Enum . TextTruncate . AtEnd , ZIndex =
60 , } ) local __781bfa13ee_cb = __4c855578e9_c9 ( __c779c8d513_96 , { AnchorPoint = Vector2
. new ( 1 , 0 ) , Position = UDim2 . new ( 1 , - 14 , 0 , 6 ) , Size = UDim2 . fromOffset (
70 , 20 ) , Font = Enum . Font . GothamBold , TextXAlignment = Enum . TextXAlignment . Right
, ZIndex = 60 , } ) local __f8e2e2b773_e = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17
+ 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Position = UDim2 . new ( 0 , 16 , 0 , 40 ) ,
Size = UDim2 . new ( 1 , - 32 , 0 , 6 ) , BackgroundColor3 = __55872a0ac8_17 . switchOff ,
BorderSizePixel = 0 , ZIndex = 60 , } , __c779c8d513_96 ) __3ed63efcc7_26 ( __f8e2e2b773_e
, 3 ) local __742cecb9c6_48 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257
+ 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2 . fromScale ( 0 , 1 ) , BackgroundColor3 = __55872a0ac8_17
. red , BorderSizePixel = 0 , ZIndex = 61 , } , __f8e2e2b773_e ) __3ed63efcc7_26 ( __742cecb9c6_48
, 3 ) local __71dbbc158c_61 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257
+ 252 ) % 257 * 121 ) % 257 ] , { AnchorPoint = Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2
. fromScale ( 0 , 0.5 ) , Size = UDim2 . fromOffset ( 16 , 16 ) , BackgroundColor3 = Color3
. new ( 1 , 1 , 1 ) , BorderSizePixel = 0 , ZIndex = 65 , } , __f8e2e2b773_e ) __3ed63efcc7_26
( __71dbbc158c_61 , 8 ) local __42cb1f15bb_62 = __179a4169c0_ac ( __71dbbc158c_61 , __55872a0ac8_17
. red , 2 , 0 ) local __c78d3c9470_57 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 56 * 31 +
11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Position = UDim2 . new ( 0 , 0 , 0 , 28 ) , Size
= UDim2 . new ( 1 , 0 , 0 , 30 ) , BackgroundTransparency = 1 , Text = __1fa5f0b613_e9 [ (
( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] , ZIndex = 70 , } , __c779c8d513_96 ) __1f08e28198_79
( function ( ) __781bfa13ee_cb . TextColor3 = __55872a0ac8_17 . redSoft __742cecb9c6_48 . BackgroundColor3
= __55872a0ac8_17 . red __42cb1f15bb_62 . Color = __55872a0ac8_17 . red __fa4ca19d6a_97 . Color
= __55872a0ac8_17 . innerBorder __c779c8d513_96 . BackgroundColor3 = __55872a0ac8_17 . innerBg
__19438b06d3_0 . BackgroundColor3 = __55872a0ac8_17 . redBright end ) local __d87095ec04_1d8
= __5bcfe2290a_11d local __d54d9dd305_192 = 10 ^ __527041038c_11c local function __240f582460_1af
( __85511ba214_1d7 , __62e1954584_1b2 ) __85511ba214_1d7 = math . clamp ( __85511ba214_1d7
, __9f3366bf0b_16c , __38af4f80a0_168 ) __85511ba214_1d7 = math . floor ( __85511ba214_1d7
* __d54d9dd305_192 + 0.5 ) / __d54d9dd305_192 __d87095ec04_1d8 = __85511ba214_1d7 local __70300f2a2e_ed
= ( __85511ba214_1d7 - __9f3366bf0b_16c ) / ( __38af4f80a0_168 - __9f3366bf0b_16c ) __742cecb9c6_48
. Size = UDim2 . fromScale ( __70300f2a2e_ed , 1 ) __71dbbc158c_61 . Position = UDim2 . fromScale
( __70300f2a2e_ed , 0.5 ) __781bfa13ee_cb . Text = string . format ( __1fa5f0b613_e9 [ ( (
( 69 + 23 ) % 257 + 234 ) % 257 ) ] .. __527041038c_11c .. __1fa5f0b613_e9 [ ( ( ( 70 * 17
+ 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __85511ba214_1d7 ) if not __62e1954584_1b2 and
not __bc7c9f6097_19f then task . spawn ( __52ce491145_9a , __838e116fcd_178 , __85511ba214_1d7
) end end __240f582460_1af ( __5bcfe2290a_11d , true ) local __67bbc0387c_126 , __d625434dcf_125
= false , nil local function __a0565330b2_141 ( __7009e3a801_1db ) local __2b8f6d2550_1da =
__f8e2e2b773_e . AbsoluteSize . X if __2b8f6d2550_1da <= 0 then return end __240f582460_1af
( __9f3366bf0b_16c + ( __38af4f80a0_168 - __9f3366bf0b_16c ) * math . clamp ( ( __7009e3a801_1db
- __f8e2e2b773_e . AbsolutePosition . X ) / __2b8f6d2550_1da , 0 , 1 ) ) end __c41ecd2440_1d1
( __c78d3c9470_57 . InputBegan : Connect ( function ( __c95102138c_158 ) local __e453d87ba6_1c3
= __c95102138c_158 . UserInputType if __e453d87ba6_1c3 == Enum . UserInputType . MouseButton1
or __e453d87ba6_1c3 == Enum . UserInputType . Touch then if __67bbc0387c_126 or not __570a4268a2_60
. Begin ( __c78d3c9470_57 ) then return end __67bbc0387c_126 = true __d625434dcf_125 = __c95102138c_158
__a0565330b2_141 ( __c95102138c_158 . Position . X ) end end ) ) __c41ecd2440_1d1 ( __a0143ff92a_d3
. InputChanged : Connect ( function ( __c95102138c_158 ) if not __67bbc0387c_126 then return
end local __e453d87ba6_1c3 = __c95102138c_158 . UserInputType if __e453d87ba6_1c3 == Enum .
UserInputType . MouseMovement or ( __e453d87ba6_1c3 == Enum . UserInputType . Touch and __c95102138c_158
== __d625434dcf_125 ) then __a0565330b2_141 ( __c95102138c_158 . Position . X ) end end ) )
__c41ecd2440_1d1 ( __a0143ff92a_d3 . InputEnded : Connect ( function ( __c95102138c_158 ) if
not __67bbc0387c_126 then return end local __e453d87ba6_1c3 = __c95102138c_158 . UserInputType
if __e453d87ba6_1c3 == Enum . UserInputType . MouseButton1 or ( __e453d87ba6_1c3 == Enum .
UserInputType . Touch and __c95102138c_158 == __d625434dcf_125 ) then __67bbc0387c_126 = false
__d625434dcf_125 = nil __570a4268a2_60 . End ( __c78d3c9470_57 ) if __bc7c9f6097_19f then task
. spawn ( __52ce491145_9a , __838e116fcd_178 , __d87095ec04_1d8 ) end end end ) ) return {
Set = __240f582460_1af , Get = function ( ) return __d87095ec04_1d8 end } end local function
__99e54d9c7f_44 ( __6e05a5b93d_188 , __03c021178f_1c8 , __b850a3bf1e_17c ) __b850a3bf1e_17c
= __b850a3bf1e_17c or { } local __94e793893f_171 = __b850a3bf1e_17c . Multi == true local __f80a3af3ee_17a
, __baf741fee1_150 = false , false local __dd689e505b_1ad = __94e793893f_171 and { } or nil
local __ad85932681_cd = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] , { Size = UDim2 . new ( 1 , 0 , 0 , 0 ) , AutomaticSize = Enum . AutomaticSize
. Y , BackgroundTransparency = 1 , LayoutOrder = __85c90836e8_17d ( __6e05a5b93d_188 ) , }
, __6e05a5b93d_188 ) __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 54 + 23 ) % 257 + 234 ) % 257
) ] , { Padding = UDim . new ( 0 , 6 ) , SortOrder = Enum . SortOrder . LayoutOrder } , __ad85932681_cd
) local __401d84a551_52 , __6180592eef_53 , __19438b06d3_0 = __52c7eab5d7_1a ( __ad85932681_cd
, 42 , __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) __4c855578e9_c9
( __401d84a551_52 , { Position = UDim2 . new ( 0 , 16 , 0 , 0 ) , Size = UDim2 . new ( 0.45
, - 32 , 1 , 0 ) , Text = __03c021178f_1c8 , Font = Enum . Font . GothamMedium , TextTruncate
= Enum . TextTruncate . AtEnd , ZIndex = 60 , } ) local __9aedd461b8_7 = __b691e2a887_76 (
__1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { AnchorPoint =
Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . new ( 1 , - 20 , 0.5 , 0 ) , Size = UDim2
. fromOffset ( 16 , 16 ) , BackgroundTransparency = 1 , ZIndex = 60 , } , __401d84a551_52 )
local __aece7d87f8_8 = { } for __091590b945_ce , __ccc41e0dd6_1b1 in ipairs ( { - 1 , 1 } )
do local __6b3525a748_f5 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 +
252 ) % 257 * 121 ) % 257 ] , { AnchorPoint = Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2
. fromOffset ( 8 + __ccc41e0dd6_1b1 * 3 , 9 ) , Size = UDim2 . fromOffset ( 2 , 8 ) , Rotation
= __ccc41e0dd6_1b1 * 45 , BackgroundColor3 = __55872a0ac8_17 . grey , BorderSizePixel = 0 ,
ZIndex = 61 , } , __9aedd461b8_7 ) __3ed63efcc7_26 ( __6b3525a748_f5 , 1 ) table . insert (
__aece7d87f8_8 , __6b3525a748_f5 ) end local __781bfa13ee_cb = __4c855578e9_c9 ( __401d84a551_52
, { AnchorPoint = Vector2 . new ( 1 , 0.5 ) , Position = UDim2 . new ( 1 , - 36 , 0.5 , 0 )
, Size = UDim2 . new ( 0.55 , - 44 , 1 , 0 ) , Font = Enum . Font . GothamBold , TextXAlignment
= Enum . TextXAlignment . Right , TextTruncate = Enum . TextTruncate . AtEnd , ZIndex = 60
, } ) local __776a6a0fc5_69 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257
+ 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2 . new ( 1 , 0 , 0 , 0 ) , AutomaticSize = Enum
. AutomaticSize . Y , BackgroundColor3 = __55872a0ac8_17 . innerBg , BorderSizePixel = 0 ,
Visible = false , LayoutOrder = 2 , ZIndex = 50 , } , __ad85932681_cd ) __3ed63efcc7_26 ( __776a6a0fc5_69
, 10 ) local __3276e1741c_6a = __179a4169c0_ac ( __776a6a0fc5_69 , __55872a0ac8_17 . innerBorder
, 1.2 , 0 ) __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 60 + 23 ) % 257 + 234 ) % 257 ) ] , {
PaddingTop = UDim . new ( 0 , 6 ) , PaddingBottom = UDim . new ( 0 , 6 ) , PaddingLeft = UDim
. new ( 0 , 6 ) , PaddingRight = UDim . new ( 0 , 6 ) , } , __776a6a0fc5_69 ) __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 54 + 23 ) % 257 + 234 ) % 257 ) ] , { Padding = UDim . new ( 0 ,
4 ) , SortOrder = Enum . SortOrder . LayoutOrder } , __776a6a0fc5_69 ) local __f5c55b93c2_1a7
= { } local function __3c44faf2d1_f7 ( ) return not __b850a3bf1e_17c . Available or __b850a3bf1e_17c
. Available ( ) end local function __4c6d015078_17b ( ) local __1294c25a82_1b8 = __b850a3bf1e_17c
. Options if type ( __1294c25a82_1b8 ) == __1fa5f0b613_e9 [ ( ( ( 29 * 31 + 11 ) % 257 + 246
) % 257 * 199 ) % 257 ] then local __02ce84df23_175 , __4e39cfb0a4_199 = pcall ( __1294c25a82_1b8
) __1294c25a82_1b8 = __02ce84df23_175 and __4e39cfb0a4_199 or { } end local __5a7684a4b7_183
= { } if type ( __1294c25a82_1b8 ) == __1fa5f0b613_e9 [ ( ( ( 9 + 23 ) % 257 + 234 ) % 257
) ] then for __091590b945_ce , __85511ba214_1d7 in ipairs ( __1294c25a82_1b8 ) do table . insert
( __5a7684a4b7_183 , typeof ( __85511ba214_1d7 ) == __1fa5f0b613_e9 [ ( ( ( 71 * 31 + 11 )
% 257 + 246 ) % 257 * 199 ) % 257 ] and __85511ba214_1d7 . Name or tostring ( __85511ba214_1d7
) ) end end return __5a7684a4b7_183 end local function __8344daca31_15b ( __8f8abf3236_173
) if __94e793893f_171 then return __dd689e505b_1ad [ __8f8abf3236_173 ] == true end return
__dd689e505b_1ad == __8f8abf3236_173 end local function __c5dfa2d403_143 ( ) if __94e793893f_171
then local __b932bdb1e9_f6 = { } for __72e9b429ce_15d in pairs ( __dd689e505b_1ad ) do table
. insert ( __b932bdb1e9_f6 , __72e9b429ce_15d ) end table . sort ( __b932bdb1e9_f6 ) return
__b932bdb1e9_f6 end return __dd689e505b_1ad end local function __4164f06d35_1c1 ( ) if not
__3c44faf2d1_f7 ( ) then return __1fa5f0b613_e9 [ ( ( ( 67 * 17 + 5 ) % 257 + 252 ) % 257 *
121 ) % 257 ] end if __94e793893f_171 then local __83aa2c1591_172 , __6fe6bf2449_161 = 0 ,
nil for __72e9b429ce_15d in pairs ( __dd689e505b_1ad ) do __83aa2c1591_172 += 1 __6fe6bf2449_161
= __72e9b429ce_15d end if __83aa2c1591_172 == 0 then return __b850a3bf1e_17c . Placeholder
or __1fa5f0b613_e9 [ ( ( ( 72 + 23 ) % 257 + 234 ) % 257 ) ] elseif __83aa2c1591_172 == 1 then
return __6fe6bf2449_161 end return __83aa2c1591_172 .. __1fa5f0b613_e9 [ ( ( ( 73 * 17 + 5
) % 257 + 252 ) % 257 * 121 ) % 257 ] end return __dd689e505b_1ad or __b850a3bf1e_17c . Placeholder
or __1fa5f0b613_e9 [ ( ( ( 74 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] end local function
__b11af3815c_187 ( ) for __091590b945_ce , __4e39cfb0a4_199 in ipairs ( __f5c55b93c2_1a7 )
do if __4e39cfb0a4_199 . Paint then __4e39cfb0a4_199 . Paint ( ) end end end local function
__f3dad242d9_186 ( ) __0f4c731917_c8 ( __401d84a551_52 , 0.15 , { BackgroundColor3 = ( __baf741fee1_150
or __f80a3af3ee_17a ) and __55872a0ac8_17 . innerBgHover or __55872a0ac8_17 . innerBg } ) __0f4c731917_c8
( __6180592eef_53 , 0.15 , { Color = __f80a3af3ee_17a and __55872a0ac8_17 . red or ( __baf741fee1_150
and __55872a0ac8_17 . innerBorderHover or __55872a0ac8_17 . innerBorder ) , Thickness = ( __f80a3af3ee_17a
or __baf741fee1_150 ) and 1.7 or 1.5 , } ) __0f4c731917_c8 ( __19438b06d3_0 , 0.15 , { BackgroundColor3
= ( __f80a3af3ee_17a or __baf741fee1_150 ) and __55872a0ac8_17 . redSoft or __55872a0ac8_17
. redBright } ) __0f4c731917_c8 ( __9aedd461b8_7 , 0.18 , { Rotation = __f80a3af3ee_17a and
180 or 0 } ) for __091590b945_ce , __6b3525a748_f5 in ipairs ( __aece7d87f8_8 ) do __0f4c731917_c8
( __6b3525a748_f5 , 0.18 , { BackgroundColor3 = __f80a3af3ee_17a and __55872a0ac8_17 . redSoft
or __55872a0ac8_17 . grey } ) end __781bfa13ee_cb . Text = __4164f06d35_1c1 ( ) __781bfa13ee_cb
. TextColor3 = ( not __3c44faf2d1_f7 ( ) ) and __55872a0ac8_17 . bad or __55872a0ac8_17 . redSoft
__776a6a0fc5_69 . BackgroundColor3 = __55872a0ac8_17 . innerBg __3276e1741c_6a . Color = __55872a0ac8_17
. innerBorder end local __42649606a0_f3 = { } local function __48a18f4e1a_13d ( ) task . spawn
( __52ce491145_9a , __b850a3bf1e_17c . OnChange , __c5dfa2d403_143 ( ) ) end local function
__b552479210_19c ( ) for __091590b945_ce , __4e39cfb0a4_199 in ipairs ( __f5c55b93c2_1a7 )
do __4e39cfb0a4_199 . Btn : Destroy ( ) end table . clear ( __f5c55b93c2_1a7 ) local __c707c41634_166
= __4c6d015078_17b ( ) if # __c707c41634_166 == 0 then local __1b8229b79f_45 = __4c855578e9_c9
( __776a6a0fc5_69 , { Size = UDim2 . new ( 1 , 0 , 0 , 28 ) , Text = __1fa5f0b613_e9 [ ( (
( 75 + 23 ) % 257 + 234 ) % 257 ) ] , TextColor3 = __55872a0ac8_17 . grey , TextXAlignment
= Enum . TextXAlignment . Center , LayoutOrder = 1 , ZIndex = 55 , } ) table . insert ( __f5c55b93c2_1a7
, { Btn = __1b8229b79f_45 } ) return end for __734285bf2d_153 , __8f8abf3236_173 in ipairs
( __c707c41634_166 ) do local __f432547e7c_12 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 56
* 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Size = UDim2 . new ( 1 , 0 , 0 , 30 ) ,
BackgroundColor3 = __55872a0ac8_17 . innerBgHover , BackgroundTransparency = 1 , BorderSizePixel
= 0 , AutoButtonColor = false , Text = __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257
) ] , LayoutOrder = __734285bf2d_153 , ZIndex = 55 , } , __776a6a0fc5_69 ) __3ed63efcc7_26
( __f432547e7c_12 , 8 ) local __26bbbc9091_10 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40
* 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { AnchorPoint = Vector2 . new ( 0 , 0.5 )
, Position = UDim2 . new ( 0 , 8 , 0.5 , 0 ) , Size = UDim2 . fromOffset ( 16 , 16 ) , BackgroundColor3
= __55872a0ac8_17 . switchOff , BorderSizePixel = 0 , ZIndex = 60 , } , __f432547e7c_12 ) __3ed63efcc7_26
( __26bbbc9091_10 , __94e793893f_171 and 4 or 8 ) local __0d0d63d1c8_11 = __179a4169c0_ac (
__26bbbc9091_10 , __55872a0ac8_17 . switchBorder , 1.4 , 0 ) local __d7be812b61_73 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { AnchorPoint
= Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . fromScale ( 0.5 , 0.5 ) , Size = UDim2 .
fromOffset ( 6 , 6 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1 ) , BackgroundTransparency
= 1 , BorderSizePixel = 0 , ZIndex = 62 , } , __26bbbc9091_10 ) __3ed63efcc7_26 ( __d7be812b61_73
, 3 ) local __b20eef3bf6_63 = __4c855578e9_c9 ( __f432547e7c_12 , { Position = UDim2 . new
( 0 , 32 , 0 , 0 ) , Size = UDim2 . new ( 1 , - 40 , 1 , 0 ) , Text = __8f8abf3236_173 , Font
= Enum . Font . GothamMedium , TextTruncate = Enum . TextTruncate . AtEnd , ZIndex = 60 , }
) local __1defcbb667_1a6 = false local __060397f955_1a5 = { Btn = __f432547e7c_12 } function
__060397f955_1a5 . Paint ( ) local __f97b8fac5d_1ac = __8344daca31_15b ( __8f8abf3236_173 )
__0f4c731917_c8 ( __f432547e7c_12 , 0.12 , { BackgroundTransparency = __f97b8fac5d_1ac and
0.55 or ( __1defcbb667_1a6 and 0.7 or 1 ) , BackgroundColor3 = __55872a0ac8_17 . innerBgHover
} ) __0f4c731917_c8 ( __26bbbc9091_10 , 0.12 , { BackgroundColor3 = __f97b8fac5d_1ac and __55872a0ac8_17
. red or __55872a0ac8_17 . switchOff } ) __0f4c731917_c8 ( __0d0d63d1c8_11 , 0.12 , { Color
= __f97b8fac5d_1ac and __55872a0ac8_17 . redBright or __55872a0ac8_17 . switchBorder } ) __0f4c731917_c8
( __d7be812b61_73 , 0.12 , { BackgroundTransparency = __f97b8fac5d_1ac and 0 or 1 } ) __b20eef3bf6_63
. TextColor3 = __f97b8fac5d_1ac and __55872a0ac8_17 . white or __55872a0ac8_17 . grey end __060397f955_1a5
. Paint ( ) __0850714e19_5a ( __f432547e7c_12 , function ( __44706b8c72_149 ) __1defcbb667_1a6
= __44706b8c72_149 __060397f955_1a5 . Paint ( ) end ) __c41ecd2440_1d1 ( __f432547e7c_12 .
Activated : Connect ( function ( ) if __94e793893f_171 then __dd689e505b_1ad [ __8f8abf3236_173
] = ( not __dd689e505b_1ad [ __8f8abf3236_173 ] ) or nil else __dd689e505b_1ad = __8f8abf3236_173
__f80a3af3ee_17a = false __776a6a0fc5_69 . Visible = false end __b11af3815c_187 ( ) __f3dad242d9_186
( ) __48a18f4e1a_13d ( ) end ) ) table . insert ( __f5c55b93c2_1a7 , __060397f955_1a5 ) end
end function __42649606a0_f3 . Get ( ) return __c5dfa2d403_143 ( ) end function __42649606a0_f3
. Set ( __d87095ec04_1d8 , __62e1954584_1b2 ) if __94e793893f_171 then __dd689e505b_1ad = {
} if type ( __d87095ec04_1d8 ) == __1fa5f0b613_e9 [ ( ( ( 9 + 23 ) % 257 + 234 ) % 257 ) ]
then for __091590b945_ce , __85511ba214_1d7 in ipairs ( __d87095ec04_1d8 ) do __dd689e505b_1ad
[ tostring ( __85511ba214_1d7 ) ] = true end end else __dd689e505b_1ad = __d87095ec04_1d8 ~=
nil and tostring ( __d87095ec04_1d8 ) or nil end __b11af3815c_187 ( ) __f3dad242d9_186 ( )
if not __62e1954584_1b2 then __48a18f4e1a_13d ( ) end end function __42649606a0_f3 . Refresh
( ) if __f80a3af3ee_17a then __b552479210_19c ( ) end __f3dad242d9_186 ( ) end if __b850a3bf1e_17c
. Default ~= nil then __42649606a0_f3 . Set ( __b850a3bf1e_17c . Default , true ) end __c41ecd2440_1d1
( __401d84a551_52 . Activated : Connect ( function ( ) if not __3c44faf2d1_f7 ( ) then __4ca2c89a3e_78
( __1fa5f0b613_e9 [ ( ( ( 76 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , false ) return
end __f80a3af3ee_17a = not __f80a3af3ee_17a if __f80a3af3ee_17a then __b552479210_19c ( ) end
__776a6a0fc5_69 . Visible = __f80a3af3ee_17a __f3dad242d9_186 ( ) end ) ) __0850714e19_5a (
__401d84a551_52 , function ( __44706b8c72_149 ) __baf741fee1_150 = __44706b8c72_149 __f3dad242d9_186
( ) end ) __1f08e28198_79 ( function ( ) __f3dad242d9_186 ( ) __b11af3815c_187 ( ) end ) return
__ad85932681_cd , __42649606a0_f3 end local function __82f4d63a88_a9 ( __df121bde25_14e , __adbb31e2a1_160
) local __c779c8d513_96 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] , { Size = UDim2 . new ( 1 , 0 , 0 , 18 ) , BackgroundTransparency
= 1 } , __df121bde25_14e ) local __cae17d1c92_42 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( (
( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Position = UDim2 . new ( 0 , 2 , 0.5
, - 3 ) , Size = UDim2 . fromOffset ( 6 , 6 ) , BackgroundColor3 = __55872a0ac8_17 . redBright
, BorderSizePixel = 0 , } , __c779c8d513_96 ) __3ed63efcc7_26 ( __cae17d1c92_42 , 6 ) __1f08e28198_79
( function ( ) __cae17d1c92_42 . BackgroundColor3 = __55872a0ac8_17 . redBright end ) __4c855578e9_c9
( __c779c8d513_96 , { Position = UDim2 . new ( 0 , 16 , 0 , 0 ) , Size = UDim2 . new ( 0.4
, - 16 , 1 , 0 ) , Text = __adbb31e2a1_160 , TextColor3 = __55872a0ac8_17 . grey , } ) return
__4c855578e9_c9 ( __c779c8d513_96 , { Position = UDim2 . new ( 0.4 , 0 , 0 , 0 ) , Size = UDim2
. new ( 0.6 , 0 , 1 , 0 ) , Font = Enum . Font . GothamMedium , TextXAlignment = Enum . TextXAlignment
. Right , TextTruncate = Enum . TextTruncate . AtEnd , } ) end function __81540dc5aa_1 . SetThemeColor
( __fefa4ee1dc_ff , __62e1954584_1b2 ) __cd433c3dc1_40 ( __fefa4ee1dc_ff ) __a822508444_db
. ThemeColor = __996d3464d9_24 ( __fefa4ee1dc_ff ) for __091590b945_ce , __52f8d690a9_13e in
ipairs ( __781ea15839_b5 ) do pcall ( __52f8d690a9_13e ) end if not __62e1954584_1b2 then __d25061c2cb_1a9
( ) end end local __934c3f4385_4d = game : GetService ( __1fa5f0b613_e9 [ ( ( ( 77 * 31 + 11
) % 257 + 246 ) % 257 * 199 ) % 257 ] ) local __179d5e5232_4c = __934c3f4385_4d : WaitForChild
( __1fa5f0b613_e9 [ ( ( ( 78 + 23 ) % 257 + 234 ) % 257 ) ] , 10 ) local function __b9ecf011da_144
( __0106e5051d_13f , __8f8abf3236_173 ) local __a55388a311_13b = __179d5e5232_4c and __179d5e5232_4c
: FindFirstChild ( __0106e5051d_13f ) return __a55388a311_13b and __a55388a311_13b : FindFirstChild
( __8f8abf3236_173 ) end local __5f17bf9e0c_3d = __b9ecf011da_144 ( __1fa5f0b613_e9 [ ( ( (
79 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 80 * 31 + 11 )
% 257 + 246 ) % 257 * 199 ) % 257 ] ) local __c2527882a0_39 = __b9ecf011da_144 ( __1fa5f0b613_e9
[ ( ( ( 79 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 81 + 23
) % 257 + 234 ) % 257 ) ] ) local __cff1c61ece_35 = __b9ecf011da_144 ( __1fa5f0b613_e9 [ (
( ( 79 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 82 * 17 + 5
) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local __643caf104f_3b = __b9ecf011da_144 ( __1fa5f0b613_e9
[ ( ( ( 83 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 84 + 23
) % 257 + 234 ) % 257 ) ] ) local __1e9258c81b_38 = __b9ecf011da_144 ( __1fa5f0b613_e9 [ (
( ( 83 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 85 * 17 +
5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local __eda1ac11e5_32 = __b9ecf011da_144 ( __1fa5f0b613_e9
[ ( ( ( 83 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 86 * 31
+ 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) local __4e628e6956_37 = __b9ecf011da_144 ( __1fa5f0b613_e9
[ ( ( ( 21 + 23 ) % 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9 [ ( ( ( 87 + 23 ) % 257 + 234 )
% 257 ) ] ) local __1ca07466b3_34 = __b9ecf011da_144 ( __1fa5f0b613_e9 [ ( ( ( 17 * 31 + 11
) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 88 * 17 + 5 ) % 257 + 252 )
% 257 * 121 ) % 257 ] ) local __6d504f29ba_3a = __b9ecf011da_144 ( __1fa5f0b613_e9 [ ( ( (
17 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 89 * 31 + 11 )
% 257 + 246 ) % 257 * 199 ) % 257 ] ) local __4a2d98f0a8_36 = __b9ecf011da_144 ( __1fa5f0b613_e9
[ ( ( ( 17 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 90 + 23
) % 257 + 234 ) % 257 ) ] ) local __f422f9bac2_3c = __b9ecf011da_144 ( __1fa5f0b613_e9 [ (
( ( 17 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 91 * 17 +
5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local __4ef524f7f3_33 = __b9ecf011da_144 ( __1fa5f0b613_e9
[ ( ( ( 17 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 92 * 31
+ 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) local __9dc45360f7_2a local __ab7fc2ee23_31 local
__e8cd1c860c_3e local __e0d798717e_30 local __4e050e80d6_2c local __77366a23e2_2f local __37c003f672_2b
local __11fc3122f8_2d pcall ( function ( ) __9dc45360f7_2a = require ( __934c3f4385_4d . LocalData
. BackpackData ) end ) pcall ( function ( ) __ab7fc2ee23_31 = require ( __934c3f4385_4d . ProfileData
) end ) pcall ( function ( ) __e8cd1c860c_3e = require ( __934c3f4385_4d . CTRL . TrainCTRL
) end ) pcall ( function ( ) __e0d798717e_30 = require ( __934c3f4385_4d . Config . Ore . Helper
) end ) pcall ( function ( ) __4e050e80d6_2c = require ( __934c3f4385_4d . CTRL . EnemyCTRL
) end ) pcall ( function ( ) __77366a23e2_2f = require ( __934c3f4385_4d . CTRL . HPCTRL )
end ) pcall ( function ( ) __37c003f672_2b = require ( __934c3f4385_4d . Utils . CommunicationUtils
) end ) pcall ( function ( ) if __37c003f672_2b and __37c003f672_2b . TryGetBindableEvent then
__11fc3122f8_2d = __37c003f672_2b . TryGetBindableEvent ( __1fa5f0b613_e9 [ ( ( ( 93 + 23 )
% 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9 [ ( ( ( 94 * 17 + 5 ) % 257 + 252 ) % 257 * 121 )
% 257 ] ) end end ) local __8875afe854_2e = { AutoTrain = false , AutoBestZone = false , TrainZone
= __1fa5f0b613_e9 [ ( ( ( 95 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , AutoStage =
false , Stage = __1fa5f0b613_e9 [ ( ( ( 96 + 23 ) % 257 + 234 ) % 257 ) ] , StageDelay = 0.35
, AutoCollectOre = false , AutoDungeon = false , DungeonInstantKill = false , DungeonStart
= 1 , AutoForge = false , ForgeType = __1fa5f0b613_e9 [ ( ( ( 97 * 17 + 5 ) % 257 + 252 ) %
257 * 121 ) % 257 ] , OreQuality = __1fa5f0b613_e9 [ ( ( ( 98 * 31 + 11 ) % 257 + 246 ) % 257
* 199 ) % 257 ] , MaterialAmount = 4 , ForgeAmount = 1 , } local __af35da53ad_3f = { { Id =
1 , Name = __1fa5f0b613_e9 [ ( ( ( 99 + 23 ) % 257 + 234 ) % 257 ) ] , Rebirth = 0 , Pad =
Vector3 . new ( - 53 , 3 , - 41 ) , Dummy = Vector3 . new ( - 57.88 , 6.94 , - 41.04 ) } ,
{ Id = 2 , Name = __1fa5f0b613_e9 [ ( ( ( 100 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , Rebirth = 2 , Pad = Vector3 . new ( - 53 , 3 , - 20.9 ) , Dummy = Vector3 . new ( - 57.88
, 6.94 , - 20.91 ) } , { Id = 3 , Name = __1fa5f0b613_e9 [ ( ( ( 101 * 31 + 11 ) % 257 + 246
) % 257 * 199 ) % 257 ] , Rebirth = 5 , Pad = Vector3 . new ( - 53 , 3 , 21.4 ) , Dummy = Vector3
. new ( - 57.88 , 6.94 , 21.37 ) } , { Id = 4 , Name = __1fa5f0b613_e9 [ ( ( ( 102 + 23 ) %
257 + 234 ) % 257 ) ] , Rebirth = 9 , Pad = Vector3 . new ( - 53 , 3 , 43.25 ) , Dummy = Vector3
. new ( - 57.88 , 6.94 , 43.25 ) } , { Id = 5 , Name = __1fa5f0b613_e9 [ ( ( ( 103 * 17 + 5
) % 257 + 252 ) % 257 * 121 ) % 257 ] , Rebirth = 12 , Pad = Vector3 . new ( - 80 , 8.6 , 21.29
) , Dummy = Vector3 . new ( - 84.50 , 8.61 , 21.29 ) } , { Id = 6 , Name = __1fa5f0b613_e9
[ ( ( ( 104 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , Rebirth = 15 , Pad = Vector3
. new ( - 80 , 9.1 , - 20.9 ) , Dummy = Vector3 . new ( - 83.92 , 9.11 , - 20.90 ) } , { Id
= 7 , Name = __1fa5f0b613_e9 [ ( ( ( 105 + 23 ) % 257 + 234 ) % 257 ) ] , Rebirth = 18 , Pad
= Vector3 . new ( - 108 , 12.7 , 32.24 ) , Dummy = Vector3 . new ( - 114.22 , 12.73 , 32.24
) } , { Id = 8 , Name = __1fa5f0b613_e9 [ ( ( ( 106 * 17 + 5 ) % 257 + 252 ) % 257 * 121 )
% 257 ] , Rebirth = 21 , Pad = Vector3 . new ( - 106 , 10.6 , - 31 ) , Dummy = Vector3 . new
( - 110.27 , 10.63 , - 30.99 ) } , } local function __e6124ab81c_12a ( ) local __fefa4ee1dc_ff
= __610efd74e5_e4 . Character local __905cc9db5e_151 = __fefa4ee1dc_ff and __fefa4ee1dc_ff
: FindFirstChild ( __1fa5f0b613_e9 [ ( ( ( 107 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] ) local __6f696a2555_152 = __fefa4ee1dc_ff and __fefa4ee1dc_ff : FindFirstChildOfClass (
__1fa5f0b613_e9 [ ( ( ( 108 + 23 ) % 257 + 234 ) % 257 ) ] ) return __fefa4ee1dc_ff , __905cc9db5e_151
, __6f696a2555_152 end local function __eaad9b6346_129 ( ) local __d464cadfca_19b = 0 pcall
( function ( ) local __b3f7a6675b_18c = __ab7fc2ee23_31 and __ab7fc2ee23_31 . GetTotalData
( ) __d464cadfca_19b = tonumber ( __b3f7a6675b_18c and __b3f7a6675b_18c . Eco and __b3f7a6675b_18c
. Eco . rebirth ) or 0 end ) local __ed5aacd4e4_fd = __af35da53ad_3f [ 1 ] for __091590b945_ce
, __aa69e0066b_1dd in ipairs ( __af35da53ad_3f ) do if __d464cadfca_19b >= __aa69e0066b_1dd
. Rebirth then __ed5aacd4e4_fd = __aa69e0066b_1dd end end return __ed5aacd4e4_fd end local
function __98cdb16527_131 ( ) if __8875afe854_2e . TrainZone == __1fa5f0b613_e9 [ ( ( ( 95
* 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] then return __eaad9b6346_129 ( ) end for __091590b945_ce
, __aa69e0066b_1dd in ipairs ( __af35da53ad_3f ) do if __aa69e0066b_1dd . Name == __8875afe854_2e
. TrainZone then return __aa69e0066b_1dd end end return __eaad9b6346_129 ( ) end local function
__ac56f87523_133 ( ) local __c94608ba55_1de = __98cdb16527_131 ( ) local __091590b945_ce ,
__905cc9db5e_151 , __6f696a2555_152 = __e6124ab81c_12a ( ) if __c94608ba55_1de and __905cc9db5e_151
and __6f696a2555_152 and __6f696a2555_152 . Health > 0 then local __0f896c4094_122 = ( __905cc9db5e_151
. Position - __c94608ba55_1de . Pad ) . Magnitude if __0f896c4094_122 > 6 then __905cc9db5e_151
. CFrame = CFrame . lookAt ( __c94608ba55_1de . Pad + Vector3 . new ( 0 , 1.5 , 0 ) , __c94608ba55_1de
. Dummy ) __905cc9db5e_151 . AssemblyLinearVelocity = Vector3 . zero end if __c2527882a0_39
and __610efd74e5_e4 : GetAttribute ( __1fa5f0b613_e9 [ ( ( ( 109 * 17 + 5 ) % 257 + 252 ) %
257 * 121 ) % 257 ] ) ~= __c94608ba55_1de . Id then pcall ( function ( ) __c2527882a0_39 :
FireServer ( __c94608ba55_1de . Id ) end ) end end pcall ( function ( ) if __e8cd1c860c_3e
and __e8cd1c860c_3e . TrainOnce then __e8cd1c860c_3e . TrainOnce ( ) end if __5f17bf9e0c_3d
then __5f17bf9e0c_3d : FireServer ( ) end end ) end local function __603e05d9f2_12c ( ) local
__34fae29dc9_115 = 0 local __27643f2066_100 = workspace : FindFirstChild ( __1fa5f0b613_e9
[ ( ( ( 110 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) if not __27643f2066_100 then
return 0 end for __091590b945_ce , __146bcb55c4_180 in ipairs ( __27643f2066_100 : GetChildren
( ) ) do local __5f8e416b81_195 = __146bcb55c4_180 : FindFirstChildWhichIsA ( __1fa5f0b613_e9
[ ( ( ( 111 + 23 ) % 257 + 234 ) % 257 ) ] , true ) if __5f8e416b81_195 then pcall ( function
( ) __5f8e416b81_195 . MaxActivationDistance = 99999 __5f8e416b81_195 . RequiresLineOfSight
= false if fireproximityprompt then fireproximityprompt ( __5f8e416b81_195 , 0 ) else __5f8e416b81_195
: InputHoldBegin ( ) task . wait ( 0.04 ) __5f8e416b81_195 : InputHoldEnd ( ) end end ) __34fae29dc9_115
+= 1 end end return __34fae29dc9_115 end local function __f93888b110_12f ( __c2fa09b54a_136
) if not __c2fa09b54a_136 then return end local __72117acdb1_1d6 = __c2fa09b54a_136 : GetAttribute
( __1fa5f0b613_e9 [ ( ( ( 112 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) or __c2fa09b54a_136
. Name if not __72117acdb1_1d6 then return end pcall ( function ( ) if __11fc3122f8_2d then
__11fc3122f8_2d : Fire ( __72117acdb1_1d6 , 1e30 ) end if __4e050e80d6_2c and __4e050e80d6_2c
. HurtEnemy then __4e050e80d6_2c . HurtEnemy ( __72117acdb1_1d6 , 1e30 ) end if __4e050e80d6_2c
and __4e050e80d6_2c . DeadEnemyData then __4e050e80d6_2c . DeadEnemyData ( __72117acdb1_1d6
) end if __77366a23e2_2f and __77366a23e2_2f . SetCurrentHP then __77366a23e2_2f . SetCurrentHP
( __c2fa09b54a_136 , 0 ) end __c2fa09b54a_136 : SetAttribute ( __1fa5f0b613_e9 [ ( ( ( 113
* 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , true ) local __6f696a2555_152 = __c2fa09b54a_136
: FindFirstChildOfClass ( __1fa5f0b613_e9 [ ( ( ( 108 + 23 ) % 257 + 234 ) % 257 ) ] ) if __6f696a2555_152
then __6f696a2555_152 . Health = 0 end end ) end local function __1534aed147_132 ( ) if __8875afe854_2e
. Stage == __1fa5f0b613_e9 [ ( ( ( 96 + 23 ) % 257 + 234 ) % 257 ) ] then local __a651162166_18b
= 0 pcall ( function ( ) local __b3f7a6675b_18c = __ab7fc2ee23_31 and __ab7fc2ee23_31 . GetTotalData
( ) __a651162166_18b = tonumber ( __b3f7a6675b_18c and __b3f7a6675b_18c . Stats and __b3f7a6675b_18c
. Stats . StagePass ) or 0 end ) return __1fa5f0b613_e9 [ ( ( ( 114 + 23 ) % 257 + 234 ) %
257 ) ] .. tostring ( math . clamp ( __a651162166_18b + 1 , 1 , 27 ) ) end return tostring
( __8875afe854_2e . Stage ) end local function __c2e3f31515_12b ( ) if __643caf104f_3b then
local __d192433422_1ba = __1534aed147_132 ( ) local __02ce84df23_175 , __0744656da9_182 = pcall
( function ( ) return __643caf104f_3b : InvokeServer ( __d192433422_1ba ) end ) if __02ce84df23_175
and type ( __0744656da9_182 ) == __1fa5f0b613_e9 [ ( ( ( 9 + 23 ) % 257 + 234 ) % 257 ) ] then
for __72117acdb1_1d6 in pairs ( __0744656da9_182 ) do if __1e9258c81b_38 then pcall ( function
( ) __1e9258c81b_38 : InvokeServer ( __72117acdb1_1d6 ) end ) end end if __eda1ac11e5_32 then
pcall ( function ( ) __eda1ac11e5_32 : FireServer ( ) end ) end end end local __a5a3b347d4_137
= workspace : FindFirstChild ( __1fa5f0b613_e9 [ ( ( ( 115 * 17 + 5 ) % 257 + 252 ) % 257 *
121 ) % 257 ] ) if __a5a3b347d4_137 then for __091590b945_ce , __c2fa09b54a_136 in ipairs (
__a5a3b347d4_137 : GetChildren ( ) ) do if __c2fa09b54a_136 : IsA ( __1fa5f0b613_e9 [ ( ( (
116 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) and not __c2fa09b54a_136 : GetAttribute
( __1fa5f0b613_e9 [ ( ( ( 113 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) then __f93888b110_12f
( __c2fa09b54a_136 ) end end end if __8875afe854_2e . AutoCollectOre then __603e05d9f2_12c
( ) end end local function __4cedfeb9ba_12d ( ) if not __610efd74e5_e4 : GetAttribute ( __1fa5f0b613_e9
[ ( ( ( 117 + 23 ) % 257 + 234 ) % 257 ) ] ) then return false end local __a5a3b347d4_137 =
workspace : FindFirstChild ( __1fa5f0b613_e9 [ ( ( ( 115 * 17 + 5 ) % 257 + 252 ) % 257 * 121
) % 257 ] ) local __091590b945_ce , __905cc9db5e_151 = __e6124ab81c_12a ( ) local __aa5dee0499_190
= __905cc9db5e_151 and __905cc9db5e_151 . CFrame or CFrame . new ( 3482 , 23 , - 4 ) local
__e8877f4cab_123 = nil pcall ( function ( ) local __7523cd816c_197 = __610efd74e5_e4 : FindFirstChild
( __1fa5f0b613_e9 [ ( ( ( 118 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local __d391168db6_167
= __7523cd816c_197 and __7523cd816c_197 : FindFirstChild ( __1fa5f0b613_e9 [ ( ( ( 119 * 31
+ 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) local __b92ac109fe_124 = __d391168db6_167 and
__d391168db6_167 : FindFirstChild ( __1fa5f0b613_e9 [ ( ( ( 120 + 23 ) % 257 + 234 ) % 257
) ] ) if __b92ac109fe_124 and getsenv then __e8877f4cab_123 = getsenv ( __b92ac109fe_124 )
end end ) local __271eb2c9b2_128 = nil if __e8877f4cab_123 and debug and debug . getupvalues
and __e8877f4cab_123 . CheckFinishedOnce then pcall ( function ( ) local __1455d641ee_1d5 =
debug . getupvalues ( __e8877f4cab_123 . CheckFinishedOnce ) if type ( __1455d641ee_1d5 ) ==
__1fa5f0b613_e9 [ ( ( ( 9 + 23 ) % 257 + 234 ) % 257 ) ] and type ( __1455d641ee_1d5 [ 1 ]
) == __1fa5f0b613_e9 [ ( ( ( 9 + 23 ) % 257 + 234 ) % 257 ) ] then __271eb2c9b2_128 = __1455d641ee_1d5
[ 1 ] end end ) end local __876745384e_162 = nil if __8875afe854_2e . DungeonInstantKill and
__a5a3b347d4_137 then for __091590b945_ce , __c2fa09b54a_136 in ipairs ( __a5a3b347d4_137 :
GetChildren ( ) ) do if __c2fa09b54a_136 : IsA ( __1fa5f0b613_e9 [ ( ( ( 116 * 31 + 11 ) %
257 + 246 ) % 257 * 199 ) % 257 ] ) and not __c2fa09b54a_136 : GetAttribute ( __1fa5f0b613_e9
[ ( ( ( 113 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) then local __72117acdb1_1d6 =
__c2fa09b54a_136 : GetAttribute ( __1fa5f0b613_e9 [ ( ( ( 112 * 17 + 5 ) % 257 + 252 ) % 257
* 121 ) % 257 ] ) or __c2fa09b54a_136 . Name __876745384e_162 = __c2fa09b54a_136 : GetPivot
( ) pcall ( function ( ) if __271eb2c9b2_128 then __271eb2c9b2_128 . DeadCF = __876745384e_162
or __aa5dee0499_190 end if __11fc3122f8_2d then __11fc3122f8_2d : Fire ( __72117acdb1_1d6 ,
1e30 ) end if __4e050e80d6_2c and __4e050e80d6_2c . HurtEnemy then __4e050e80d6_2c . HurtEnemy
( __72117acdb1_1d6 , 1e30 ) end if __77366a23e2_2f and __77366a23e2_2f . SetCurrentHP then
__77366a23e2_2f . SetCurrentHP ( __c2fa09b54a_136 , 0 ) end __c2fa09b54a_136 : SetAttribute
( __1fa5f0b613_e9 [ ( ( ( 113 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , true ) local
__6f696a2555_152 = __c2fa09b54a_136 : FindFirstChildOfClass ( __1fa5f0b613_e9 [ ( ( ( 108 +
23 ) % 257 + 234 ) % 257 ) ] ) if __6f696a2555_152 then __6f696a2555_152 . Health = 0 end end
) end end end if __271eb2c9b2_128 then if not __271eb2c9b2_128 . DeadCF or typeof ( __271eb2c9b2_128
. DeadCF ) ~= __1fa5f0b613_e9 [ ( ( ( 121 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] then
__271eb2c9b2_128 . DeadCF = __876745384e_162 or __aa5dee0499_190 end end if __e8877f4cab_123
and __e8877f4cab_123 . CheckFinishedOnce then pcall ( function ( ) __e8877f4cab_123 . CheckFinishedOnce
( ) end ) end if __271eb2c9b2_128 and __271eb2c9b2_128 . Round and __271eb2c9b2_128 . Round
>= 30 and __271eb2c9b2_128 . Finished then if __e8877f4cab_123 and __e8877f4cab_123 . ExitDungeon
then pcall ( function ( ) __e8877f4cab_123 . ExitDungeon ( ) end ) elseif __4a2d98f0a8_36 then
pcall ( function ( ) __4a2d98f0a8_36 : FireServer ( ) end ) end end if __8875afe854_2e . AutoCollectOre
then __603e05d9f2_12c ( ) end return true end local function __02f950a883_130 ( ) local __dfefdfcd69_fe
= __9dc45360f7_2a and __9dc45360f7_2a . GetData ( ) if not __dfefdfcd69_fe or not __dfefdfcd69_fe
. have then return { } end local __4e1f5f33e5_139 = { } for __72117acdb1_1d6 , __4dede7f414_15c
in pairs ( __dfefdfcd69_fe . have ) do if __4dede7f414_15c . Type == __1fa5f0b613_e9 [ ( (
( 122 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] then local __9afd9900bd_193 = 0 pcall
( function ( ) if __e0d798717e_30 and __e0d798717e_30 . GetPower then __9afd9900bd_193 = __e0d798717e_30
. GetPower ( __4dede7f414_15c . ID ) or 0 end end ) __4e1f5f33e5_139 [ # __4e1f5f33e5_139 +
1 ] = { uuid = __72117acdb1_1d6 , count = tonumber ( __4dede7f414_15c . Number ) or 1 , power
= __9afd9900bd_193 , } end end table . sort ( __4e1f5f33e5_139 , function ( __70300f2a2e_ed
, __4e4bb731e8_f9 ) if __8875afe854_2e . OreQuality == __1fa5f0b613_e9 [ ( ( ( 98 * 31 + 11
) % 257 + 246 ) % 257 * 199 ) % 257 ] then return __70300f2a2e_ed . power > __4e4bb731e8_f9
. power end return __70300f2a2e_ed . power < __4e4bb731e8_f9 . power end ) return __4e1f5f33e5_139
end local function __6c20397780_12e ( ) if not __4e628e6956_37 then return false , __1fa5f0b613_e9
[ ( ( ( 123 + 23 ) % 257 + 234 ) % 257 ) ] end local __b92196010f_1a1 = math . floor ( tonumber
( __8875afe854_2e . MaterialAmount ) or 4 ) local __3fb94a4f2b_169 = __8875afe854_2e . ForgeType
== __1fa5f0b613_e9 [ ( ( ( 97 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] and 13 or 23 local
__4fa07c1eb2_1c7 = math . clamp ( __b92196010f_1a1 , 4 , __3fb94a4f2b_169 ) local __4e1f5f33e5_139
= __02f950a883_130 ( ) local __234ba09f97_181 = { } local __15804e02c0_10b = 0 for __091590b945_ce
, __aa391c022c_134 in ipairs ( __4e1f5f33e5_139 ) do local __f89d1f9220_1c6 = math . min (
__aa391c022c_134 . count , __4fa07c1eb2_1c7 - __15804e02c0_10b ) if __f89d1f9220_1c6 > 0 then
__234ba09f97_181 [ __aa391c022c_134 . uuid ] = __f89d1f9220_1c6 __15804e02c0_10b += __f89d1f9220_1c6
end if __15804e02c0_10b >= __4fa07c1eb2_1c7 then break end end if __15804e02c0_10b < __4fa07c1eb2_1c7
then return false , __1fa5f0b613_e9 [ ( ( ( 124 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] .. __15804e02c0_10b .. __1fa5f0b613_e9 [ ( ( ( 125 * 31 + 11 ) % 257 + 246 ) % 257 * 199
) % 257 ] .. __4fa07c1eb2_1c7 .. __1fa5f0b613_e9 [ ( ( ( 126 + 23 ) % 257 + 234 ) % 257 ) ]
end local __02ce84df23_175 , __d0f0bfd8f6_1a2 = pcall ( function ( ) return __4e628e6956_37
: InvokeServer ( { ConfigType = __8875afe854_2e . ForgeType , UUIDList = __234ba09f97_181 ,
} ) end ) if not __02ce84df23_175 then return false , tostring ( __d0f0bfd8f6_1a2 ) end if
not __d0f0bfd8f6_1a2 then return false , __1fa5f0b613_e9 [ ( ( ( 127 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] end return true , __8875afe854_2e . ForgeType .. __1fa5f0b613_e9 [
( ( ( 128 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] end task . spawn ( function ( ) while
not __6c9252efea_11f do if __8875afe854_2e . AutoTrain or __8875afe854_2e . AutoBestZone then
__ac56f87523_133 ( ) elseif __8875afe854_2e . AutoStage then __c2e3f31515_12b ( ) task . wait
( math . clamp ( __8875afe854_2e . StageDelay , 0.15 , 2 ) ) elseif __8875afe854_2e . AutoCollectOre
then __603e05d9f2_12c ( ) else if __cff1c61ece_35 and __610efd74e5_e4 : GetAttribute ( __1fa5f0b613_e9
[ ( ( ( 109 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) then pcall ( function ( ) __cff1c61ece_35
: FireServer ( ) end ) end end task . wait ( 0.15 ) end end ) task . spawn ( function ( ) while
not __6c9252efea_11f do if __8875afe854_2e . AutoDungeon then if __610efd74e5_e4 : GetAttribute
( __1fa5f0b613_e9 [ ( ( ( 117 + 23 ) % 257 + 234 ) % 257 ) ] ) then __4cedfeb9ba_12d ( ) task
. wait ( 0.25 ) else if __1ca07466b3_34 then pcall ( function ( ) __1ca07466b3_34 : FireServer
( ) end ) end task . wait ( 0.25 ) if __6d504f29ba_3a then pcall ( function ( ) __6d504f29ba_3a
: InvokeServer ( math . clamp ( tonumber ( __8875afe854_2e . DungeonStart ) or 1 , 1 , 30 )
) end ) end task . wait ( 2.5 ) end else task . wait ( 1.0 ) end end end ) task . spawn ( function
( ) while not __6c9252efea_11f do if __8875afe854_2e . AutoForge then local __da6babc32b_f2
= __8875afe854_2e . ForgeAmount if __da6babc32b_f2 == __1fa5f0b613_e9 [ ( ( ( 129 + 23 ) %
257 + 234 ) % 257 ) ] then while __8875afe854_2e . AutoForge and not __6c9252efea_11f do local
__02ce84df23_175 = __6c20397780_12e ( ) if not __02ce84df23_175 then break end task . wait
( 0.2 ) end else for __091590b945_ce = 1 , tonumber ( __da6babc32b_f2 ) or 1 do if not __8875afe854_2e
. AutoForge or __6c9252efea_11f then break end local __02ce84df23_175 = __6c20397780_12e (
) if not __02ce84df23_175 then break end task . wait ( 0.2 ) end __8875afe854_2e . AutoForge
= false end end task . wait ( 0.15 ) end end ) local function __10b4c7e647_14f ( __8f8abf3236_173
) return function ( ) return type ( __c23f506ac0_df [ __8f8abf3236_173 ] ) == __1fa5f0b613_e9
[ ( ( ( 29 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] end end local function __e661a13eef_101
( __8f8abf3236_173 , ... ) local __52f8d690a9_13e = __c23f506ac0_df [ __8f8abf3236_173 ] if
type ( __52f8d690a9_13e ) ~= __1fa5f0b613_e9 [ ( ( ( 29 * 31 + 11 ) % 257 + 246 ) % 257 * 199
) % 257 ] then return false end local __02ce84df23_175 , __99c98a9609_13a = pcall ( __52f8d690a9_13e
, ... ) if not __02ce84df23_175 then warn ( __1fa5f0b613_e9 [ ( ( ( 130 * 17 + 5 ) % 257 +
252 ) % 257 * 121 ) % 257 ] .. __8f8abf3236_173 .. __1fa5f0b613_e9 [ ( ( ( 131 * 31 + 11 )
% 257 + 246 ) % 257 * 199 ) % 257 ] .. tostring ( __99c98a9609_13a ) ) end return __02ce84df23_175
end local __a268c6cecb_16 = ColorSequence . new ( Color3 . new ( 1 , 1 , 1 ) , Color3 . fromRGB
( 200 , 200 , 212 ) ) do local __331c5c3e98_7e = __c9689bac6d_27 ( __1fa5f0b613_e9 [ ( ( (
10 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) __e35f7c64ac_28 ( __1fa5f0b613_e9 [ ( (
( 10 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __f71cdfbef1_eb [ __1fa5f0b613_e9 [ (
( ( 10 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ] ) __b4fd8ef090_9b ( __331c5c3e98_7e
, __1fa5f0b613_e9 [ ( ( ( 10 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local __1999dff2c9_19
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Size = UDim2 . new ( 1 , 0 , 0 , 0 ) , AutomaticSize = Enum . AutomaticSize . Y , BackgroundColor3
= __55872a0ac8_17 . innerBg , BorderSizePixel = 0 , LayoutOrder = __85c90836e8_17d ( __331c5c3e98_7e
) , ZIndex = 50 , } , __331c5c3e98_7e ) __3ed63efcc7_26 ( __1999dff2c9_19 , 14 ) __bfadee6497_4f
( __1999dff2c9_19 , __a268c6cecb_16 , 0 ) local __534fd6bdf8_1b = __179a4169c0_ac ( __1999dff2c9_19
, __55872a0ac8_17 . neon , 1.6 , 0.15 ) local __6e9e8319b6_1c = __bfadee6497_4f ( __534fd6bdf8_1b
, __faa2ce483a_75 , 0 ) __35e3ca6f7f_a7 ( __6e9e8319b6_1c , 9 ) __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 60 + 23 ) % 257 + 234 ) % 257 ) ] , { PaddingLeft = UDim . new ( 0 , 14 ) , PaddingRight
= UDim . new ( 0 , 14 ) , PaddingTop = UDim . new ( 0 , 14 ) , PaddingBottom = UDim . new (
0 , 14 ) , } , __1999dff2c9_19 ) __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 54 + 23 ) % 257
+ 234 ) % 257 ) ] , { Padding = UDim . new ( 0 , 12 ) , SortOrder = Enum . SortOrder . LayoutOrder
} , __1999dff2c9_19 ) local __fb4a1990bd_55 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40
* 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2 . new ( 1 , 0 , 0 , 64 ) ,
BackgroundTransparency = 1 , LayoutOrder = 1 , } , __1999dff2c9_19 ) local __c31fd90c50_9 =
__b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 64 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ]
, { Size = UDim2 . fromOffset ( 64 , 64 ) , BackgroundColor3 = __55872a0ac8_17 . black , BorderSizePixel
= 0 , ZIndex = 55 , } , __fb4a1990bd_55 ) __3ed63efcc7_26 ( __c31fd90c50_9 , 32 ) local __5ea5e8d920_b
= __179a4169c0_ac ( __c31fd90c50_9 , __55872a0ac8_17 . neon , 2.2 , 0 ) local __eca7f7ee4d_a
= __bfadee6497_4f ( __5ea5e8d920_b , __faa2ce483a_75 , 0 ) __35e3ca6f7f_a7 ( __eca7f7ee4d_a
, 6 ) __4c855578e9_c9 ( __fb4a1990bd_55 , { Position = UDim2 . new ( 0 , 78 , 0 , 2 ) , Size
= UDim2 . new ( 1 , - 160 , 0 , 22 ) , Text = __610efd74e5_e4 . DisplayName , Font = Enum .
Font . GothamBold , TextSize = 16 , TextTruncate = Enum . TextTruncate . AtEnd , ZIndex = 55
, } ) __4c855578e9_c9 ( __fb4a1990bd_55 , { Position = UDim2 . new ( 0 , 78 , 0 , 25 ) , Size
= UDim2 . new ( 1 , - 160 , 0 , 16 ) , Text = __1fa5f0b613_e9 [ ( ( ( 132 + 23 ) % 257 + 234
) % 257 ) ] .. __610efd74e5_e4 . Name , TextColor3 = __55872a0ac8_17 . grey , TextTruncate
= Enum . TextTruncate . AtEnd , ZIndex = 55 , } ) __4c855578e9_c9 ( __fb4a1990bd_55 , { Position
= UDim2 . new ( 0 , 78 , 0 , 45 ) , Size = UDim2 . new ( 1 , - 160 , 0 , 14 ) , Text = __1fa5f0b613_e9
[ ( ( ( 133 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] .. __610efd74e5_e4 . AccountAge
.. __1fa5f0b613_e9 [ ( ( ( 134 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , TextSize =
10 , TextColor3 = __55872a0ac8_17 . grey , ZIndex = 55 , } ) local __aa5e003625_c = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { AnchorPoint
= Vector2 . new ( 1 , 0 ) , Position = UDim2 . new ( 1 , 0 , 0 , 4 ) , Size = UDim2 . fromOffset
( 74 , 20 ) , BackgroundColor3 = Color3 . fromRGB ( 15 , 35 , 20 ) , BorderSizePixel = 0 ,
ZIndex = 55 , } , __fb4a1990bd_55 ) __3ed63efcc7_26 ( __aa5e003625_c , 10 ) __179a4169c0_ac
( __aa5e003625_c , Color3 . fromRGB ( 60 , 160 , 80 ) , 1 , 0.2 ) local __b367450dc2_d = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Position =
UDim2 . new ( 0 , 8 , 0.5 , - 3 ) , Size = UDim2 . fromOffset ( 6 , 6 ) , BackgroundColor3
= __55872a0ac8_17 . good , BorderSizePixel = 0 , ZIndex = 60 , } , __aa5e003625_c ) __3ed63efcc7_26
( __b367450dc2_d , 6 ) __4c855578e9_c9 ( __aa5e003625_c , { Position = UDim2 . new ( 0 , 18
, 0 , 0 ) , Size = UDim2 . new ( 1 , - 24 , 1 , 0 ) , Text = __1fa5f0b613_e9 [ ( ( ( 135 +
23 ) % 257 + 234 ) % 257 ) ] , Font = Enum . Font . GothamBold , TextSize = 9 , TextColor3
= __55872a0ac8_17 . good , ZIndex = 60 , } ) task . spawn ( function ( ) local __02ce84df23_175
, __b7a0c6aa72_113 = pcall ( function ( ) return __06d62de4c6_d0 : GetUserThumbnailAsync (
__610efd74e5_e4 . UserId , Enum . ThumbnailType . HeadShot , Enum . ThumbnailSize . Size180x180
) end ) if __02ce84df23_175 and __c31fd90c50_9 . Parent then __c31fd90c50_9 . Image = __b7a0c6aa72_113
end end ) local __1a179cec97_b7 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) %
257 + 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2 . new ( 1 , 0 , 0 , 56 ) , BackgroundTransparency
= 1 , LayoutOrder = 2 , } , __1999dff2c9_19 ) __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 54
+ 23 ) % 257 + 234 ) % 257 ) ] , { FillDirection = Enum . FillDirection . Horizontal , Padding
= UDim . new ( 0 , 8 ) , SortOrder = Enum . SortOrder . LayoutOrder , } , __1a179cec97_b7 )
local function __83114366e8_b6 ( __adbb31e2a1_160 , __c4e9f2e489_17e ) local __e95c1615a1_b1
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Size = UDim2 . new ( 1 / 3 , - 6 , 1 , 0 ) , BackgroundColor3 = __55872a0ac8_17 . innerBg
, BorderSizePixel = 0 , LayoutOrder = __c4e9f2e489_17e , ZIndex = 55 , } , __1a179cec97_b7
) __3ed63efcc7_26 ( __e95c1615a1_b1 , 10 ) __bfadee6497_4f ( __e95c1615a1_b1 , __a268c6cecb_16
, 90 ) local __e21544035f_98 = __179a4169c0_ac ( __e95c1615a1_b1 , __55872a0ac8_17 . innerBorder
, 1.2 , 0.1 ) local __f8e2e2b773_e = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5
) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Visible = false , AnchorPoint = Vector2 . new ( 0.5
, 0 ) , Position = UDim2 . new ( 0.5 , 0 , 0 , 0 ) , Size = UDim2 . fromOffset ( 22 , 2 ) ,
BackgroundColor3 = __55872a0ac8_17 . red , BorderSizePixel = 0 , ZIndex = 60 , } , __e95c1615a1_b1
) __3ed63efcc7_26 ( __f8e2e2b773_e , 2 ) local __9b3c384d8d_ca = __4c855578e9_c9 ( __e95c1615a1_b1
, { Position = UDim2 . new ( 0 , 0 , 0 , 9 ) , Size = UDim2 . new ( 1 , 0 , 0 , 24 ) , Text
= __1fa5f0b613_e9 [ ( ( ( 136 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , Font = Enum
. Font . GothamBold , TextSize = 17 , TextXAlignment = Enum . TextXAlignment . Center , ZIndex
= 60 , } ) __4c855578e9_c9 ( __e95c1615a1_b1 , { Position = UDim2 . new ( 0 , 0 , 0 , 33 )
, Size = UDim2 . new ( 1 , 0 , 0 , 14 ) , Text = string . upper ( __adbb31e2a1_160 ) , Font
= Enum . Font . GothamMedium , TextSize = 9 , TextColor3 = __55872a0ac8_17 . grey , TextXAlignment
= Enum . TextXAlignment . Center , ZIndex = 60 , } ) __1f08e28198_79 ( function ( ) __e95c1615a1_b1
. BackgroundColor3 = __55872a0ac8_17 . innerBg __e21544035f_98 . Color = __55872a0ac8_17 .
innerBorder __f8e2e2b773_e . BackgroundColor3 = __55872a0ac8_17 . red __9b3c384d8d_ca . TextColor3
= __55872a0ac8_17 . redSoft end ) return __9b3c384d8d_ca end local __dee0541f33_8c = __83114366e8_b6
( __1fa5f0b613_e9 [ ( ( ( 1 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , 1 ) local __954b29e67e_8a
= __83114366e8_b6 ( __1fa5f0b613_e9 [ ( ( ( 137 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , 2 ) local __cf9da37b07_4a = __83114366e8_b6 ( __1fa5f0b613_e9 [ ( ( ( 138 + 23 ) % 257
+ 234 ) % 257 ) ] , 3 ) local __ce772f0c8a_41 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40
* 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2 . new ( 1 , 0 , 0 , 1 ) , BackgroundColor3
= __55872a0ac8_17 . border , BackgroundTransparency = 0.4 , BorderSizePixel = 0 , LayoutOrder
= 3 , } , __1999dff2c9_19 ) local __f536a058b0_aa = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( (
( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2 . new ( 1 , 0 , 0 , 0
) , AutomaticSize = Enum . AutomaticSize . Y , BackgroundTransparency = 1 , LayoutOrder = 4
, } , __1999dff2c9_19 ) __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 54 + 23 ) % 257 + 234 ) %
257 ) ] , { Padding = UDim . new ( 0 , 8 ) , SortOrder = Enum . SortOrder . LayoutOrder } ,
__f536a058b0_aa ) local __a490f042e4_4e = __82f4d63a88_a9 ( __f536a058b0_aa , __1fa5f0b613_e9
[ ( ( ( 139 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local __f64bd2ba54_8b = __82f4d63a88_a9
( __f536a058b0_aa , __1fa5f0b613_e9 [ ( ( ( 140 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] ) local __47fc24cc35_9c = __82f4d63a88_a9 ( __f536a058b0_aa , __1fa5f0b613_e9 [ ( ( ( 141
+ 23 ) % 257 + 234 ) % 257 ) ] ) __a490f042e4_4e . Text = __334204dc57_e2 . GameName or game
. Name __f64bd2ba54_8b . Text = tostring ( game . PlaceId ) __47fc24cc35_9c . Text = ( game
. JobId ~= __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] and string . sub ( game
. JobId , 1 , 8 ) or __1fa5f0b613_e9 [ ( ( ( 142 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] ) if not __334204dc57_e2 . GameName then task . spawn ( function ( ) local __02ce84df23_175
, __80dfd1cb2d_157 = pcall ( function ( ) return __193ee19ace_d9 : GetProductInfo ( game .
PlaceId ) end ) if __02ce84df23_175 and type ( __80dfd1cb2d_157 ) == __1fa5f0b613_e9 [ ( (
( 9 + 23 ) % 257 + 234 ) % 257 ) ] and __80dfd1cb2d_157 . Name and __a490f042e4_4e . Parent
then __a490f042e4_4e . Text = __80dfd1cb2d_157 . Name end end ) end __1f08e28198_79 ( function
( ) __534fd6bdf8_1b . Color = __55872a0ac8_17 . neon __6e9e8319b6_1c . Color = __faa2ce483a_75
__5ea5e8d920_b . Color = __55872a0ac8_17 . neon __eca7f7ee4d_a . Color = __faa2ce483a_75 __1999dff2c9_19
. BackgroundColor3 = __55872a0ac8_17 . innerBg __ce772f0c8a_41 . BackgroundColor3 = __55872a0ac8_17
. border end ) local function __01dba4ac33_1d4 ( ) __dee0541f33_8c . Text = # __06d62de4c6_d0
: GetPlayers ( ) .. __1fa5f0b613_e9 [ ( ( ( 125 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] .. __06d62de4c6_d0 . MaxPlayers end __01dba4ac33_1d4 ( ) task . spawn ( function ( ) local
__3ab4858b0d_140 , __4bdc0685f7_ef = 0 , 0 __c41ecd2440_1d1 ( __d3328ace52_e7 . Heartbeat :
Connect ( function ( __81aa2e24df_127 ) __3ab4858b0d_140 += 1 __4bdc0685f7_ef += __81aa2e24df_127
end ) ) while not __6c9252efea_11f and __1999dff2c9_19 . Parent do task . wait ( 1 ) if __4bdc0685f7_ef
> 0 then __cf9da37b07_4a . Text = tostring ( math . floor ( __3ab4858b0d_140 / __4bdc0685f7_ef
+ 0.5 ) ) __3ab4858b0d_140 , __4bdc0685f7_ef = 0 , 0 end local __02ce84df23_175 , __706094feb2_18f
= pcall ( function ( ) return __babfcf0faf_d1 . Network . ServerStatsItem [ __1fa5f0b613_e9
[ ( ( ( 143 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ] : GetValue ( ) end ) __954b29e67e_8a
. Text = ( __02ce84df23_175 and __706094feb2_18f ) and ( math . floor ( __706094feb2_18f )
.. __1fa5f0b613_e9 [ ( ( ( 144 + 23 ) % 257 + 234 ) % 257 ) ] ) or __1fa5f0b613_e9 [ ( ( (
145 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] __01dba4ac33_1d4 ( ) end end ) end do local
__331c5c3e98_7e = __c9689bac6d_27 ( __1fa5f0b613_e9 [ ( ( ( 15 + 23 ) % 257 + 234 ) % 257 )
] ) __e35f7c64ac_28 ( __1fa5f0b613_e9 [ ( ( ( 15 + 23 ) % 257 + 234 ) % 257 ) ] , __f71cdfbef1_eb
[ __1fa5f0b613_e9 [ ( ( ( 15 + 23 ) % 257 + 234 ) % 257 ) ] ] ) __b4fd8ef090_9b ( __331c5c3e98_7e
, __1fa5f0b613_e9 [ ( ( ( 146 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) __82a06c5cfd_bb
( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 147 + 23 ) % 257 + 234 ) % 257 ) ] , false , function
( __85511ba214_1d7 ) __8875afe854_2e . AutoTrain = __85511ba214_1d7 end ) __82a06c5cfd_bb (
__331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 148 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , false , function ( __85511ba214_1d7 ) __8875afe854_2e . AutoBestZone = __85511ba214_1d7
if __85511ba214_1d7 then __8875afe854_2e . TrainZone = __1fa5f0b613_e9 [ ( ( ( 95 * 31 + 11
) % 257 + 246 ) % 257 * 199 ) % 257 ] end end ) local __8cb4b0f5b1_1d2 = { __1fa5f0b613_e9
[ ( ( ( 95 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] } for __091590b945_ce , __aa69e0066b_1dd
in ipairs ( __af35da53ad_3f ) do table . insert ( __8cb4b0f5b1_1d2 , __aa69e0066b_1dd . Name
) end __99e54d9c7f_44 ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 149 * 31 + 11 ) % 257 + 246
) % 257 * 199 ) % 257 ] , { Options = __8cb4b0f5b1_1d2 , Default = __1fa5f0b613_e9 [ ( ( (
95 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , OnChange = function ( __85511ba214_1d7
) __8875afe854_2e . TrainZone = __85511ba214_1d7 if __85511ba214_1d7 == __1fa5f0b613_e9 [ (
( ( 95 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] then __8875afe854_2e . AutoBestZone
= true end end , } ) __b4fd8ef090_9b ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 150 + 23 )
% 257 + 234 ) % 257 ) ] ) __82a06c5cfd_bb ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 151 *
17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , false , function ( __85511ba214_1d7 ) __8875afe854_2e
. AutoStage = __85511ba214_1d7 end ) local __ccc0ba7384_1bb = { __1fa5f0b613_e9 [ ( ( ( 96
+ 23 ) % 257 + 234 ) % 257 ) ] } for __734285bf2d_153 = 1 , 27 do table . insert ( __ccc0ba7384_1bb
, __1fa5f0b613_e9 [ ( ( ( 114 + 23 ) % 257 + 234 ) % 257 ) ] .. __734285bf2d_153 ) end __99e54d9c7f_44
( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 83 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , { Options = __ccc0ba7384_1bb , Default = __1fa5f0b613_e9 [ ( ( ( 96 + 23 ) % 257 + 234
) % 257 ) ] , OnChange = function ( __85511ba214_1d7 ) __8875afe854_2e . Stage = __85511ba214_1d7
end , } ) __18995ee73b_a6 ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 152 * 31 + 11 ) % 257
+ 246 ) % 257 * 199 ) % 257 ] , 0.15 , 2 , 0.35 , 2 , function ( __85511ba214_1d7 ) __8875afe854_2e
. StageDelay = __85511ba214_1d7 end , true ) __82a06c5cfd_bb ( __331c5c3e98_7e , __1fa5f0b613_e9
[ ( ( ( 153 + 23 ) % 257 + 234 ) % 257 ) ] , false , function ( __85511ba214_1d7 ) __8875afe854_2e
. AutoCollectOre = __85511ba214_1d7 end ) end do local __331c5c3e98_7e = __c9689bac6d_27 (
__1fa5f0b613_e9 [ ( ( ( 17 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) __e35f7c64ac_28
( __1fa5f0b613_e9 [ ( ( ( 17 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __f71cdfbef1_eb
[ __1fa5f0b613_e9 [ ( ( ( 17 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ] ) __b4fd8ef090_9b
( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 17 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] ) __82a06c5cfd_bb ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 154 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] , false , function ( __85511ba214_1d7 ) __8875afe854_2e . AutoDungeon
= __85511ba214_1d7 end ) __82a06c5cfd_bb ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 155 *
31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , false , function ( __85511ba214_1d7 ) __8875afe854_2e
. DungeonInstantKill = __85511ba214_1d7 end ) local __c11450b5bf_1a4 = { } for __734285bf2d_153
= 1 , 30 do table . insert ( __c11450b5bf_1a4 , tostring ( __734285bf2d_153 ) ) end __99e54d9c7f_44
( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 156 + 23 ) % 257 + 234 ) % 257 ) ] , { Options
= __c11450b5bf_1a4 , Default = __1fa5f0b613_e9 [ ( ( ( 157 * 17 + 5 ) % 257 + 252 ) % 257 *
121 ) % 257 ] , OnChange = function ( __85511ba214_1d7 ) __8875afe854_2e . DungeonStart = tonumber
( __85511ba214_1d7 ) or 1 end , } ) end do local __331c5c3e98_7e = __c9689bac6d_27 ( __1fa5f0b613_e9
[ ( ( ( 21 + 23 ) % 257 + 234 ) % 257 ) ] ) __e35f7c64ac_28 ( __1fa5f0b613_e9 [ ( ( ( 21 +
23 ) % 257 + 234 ) % 257 ) ] , __f71cdfbef1_eb [ __1fa5f0b613_e9 [ ( ( ( 21 + 23 ) % 257 +
234 ) % 257 ) ] ] ) __b4fd8ef090_9b ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 21 + 23 ) %
257 + 234 ) % 257 ) ] ) __82a06c5cfd_bb ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 158 * 31
+ 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , false , function ( __85511ba214_1d7 ) __8875afe854_2e
. AutoForge = __85511ba214_1d7 end ) __99e54d9c7f_44 ( __331c5c3e98_7e , __1fa5f0b613_e9 [
( ( ( 159 + 23 ) % 257 + 234 ) % 257 ) ] , { Options = { __1fa5f0b613_e9 [ ( ( ( 97 * 17 +
5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 160 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] } , Default = __1fa5f0b613_e9 [ ( ( ( 97 * 17 + 5 ) % 257 + 252 ) %
257 * 121 ) % 257 ] , OnChange = function ( __85511ba214_1d7 ) __8875afe854_2e . ForgeType
= __85511ba214_1d7 end , } ) __99e54d9c7f_44 ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 161
* 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Options = { __1fa5f0b613_e9 [ ( ( ( 98
* 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 162 + 23 ) % 257
+ 234 ) % 257 ) ] } , Default = __1fa5f0b613_e9 [ ( ( ( 98 * 31 + 11 ) % 257 + 246 ) % 257
* 199 ) % 257 ] , OnChange = function ( __85511ba214_1d7 ) __8875afe854_2e . OreQuality = __85511ba214_1d7
end , } ) __18995ee73b_a6 ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 163 * 17 + 5 ) % 257
+ 252 ) % 257 * 121 ) % 257 ] , 4 , 23 , 4 , 0 , function ( __85511ba214_1d7 ) local __38af4f80a0_168
= __8875afe854_2e . ForgeType == __1fa5f0b613_e9 [ ( ( ( 97 * 17 + 5 ) % 257 + 252 ) % 257
* 121 ) % 257 ] and 13 or 23 __8875afe854_2e . MaterialAmount = math . clamp ( math . floor
( __85511ba214_1d7 + 0.5 ) , 4 , __38af4f80a0_168 ) end , true ) __99e54d9c7f_44 ( __331c5c3e98_7e
, __1fa5f0b613_e9 [ ( ( ( 164 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Options =
{ __1fa5f0b613_e9 [ ( ( ( 157 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9
[ ( ( ( 165 + 23 ) % 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9 [ ( ( ( 166 * 17 + 5 ) % 257 +
252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 167 * 31 + 11 ) % 257 + 246 ) % 257 *
199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 168 + 23 ) % 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9
[ ( ( ( 169 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 129 +
23 ) % 257 + 234 ) % 257 ) ] } , Default = __1fa5f0b613_e9 [ ( ( ( 157 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] , OnChange = function ( __85511ba214_1d7 ) __8875afe854_2e . ForgeAmount
= ( __85511ba214_1d7 == __1fa5f0b613_e9 [ ( ( ( 129 + 23 ) % 257 + 234 ) % 257 ) ] ) and __1fa5f0b613_e9
[ ( ( ( 129 + 23 ) % 257 + 234 ) % 257 ) ] or tonumber ( __85511ba214_1d7 ) end , } ) __2536710dd3_15
( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 170 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , function ( ) local __02ce84df23_175 , __fd8af3508d_170 = __6c20397780_12e ( ) __4ca2c89a3e_78
( __02ce84df23_175 and __fd8af3508d_170 or ( __1fa5f0b613_e9 [ ( ( ( 171 + 23 ) % 257 + 234
) % 257 ) ] .. tostring ( __fd8af3508d_170 ) ) , __02ce84df23_175 ) end ) end do local __331c5c3e98_7e
= __c9689bac6d_27 ( __1fa5f0b613_e9 [ ( ( ( 14 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] ) __e35f7c64ac_28 ( __1fa5f0b613_e9 [ ( ( ( 14 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) %
257 ] , __1fa5f0b613_e9 [ ( ( ( 172 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local
__3517cc49d1_116 = { } local __091590b945_ce __b4fd8ef090_9b ( __331c5c3e98_7e , __1fa5f0b613_e9
[ ( ( ( 173 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) __091590b945_ce , __3517cc49d1_116
. anim = __82a06c5cfd_bb ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 174 + 23 ) % 257 + 234
) % 257 ) ] , __a822508444_db . Animate , function ( __a574a9e368_177 ) __a822508444_db . Animate
= __a574a9e368_177 __d25061c2cb_1a9 ( ) end ) __091590b945_ce , __3517cc49d1_116 . pulse =
__82a06c5cfd_bb ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 175 * 17 + 5 ) % 257 + 252 ) %
257 * 121 ) % 257 ] , __a822508444_db . Pulse , function ( __a574a9e368_177 ) __81540dc5aa_1
. SetPulse ( __a574a9e368_177 ) __a822508444_db . Pulse = __a574a9e368_177 __d25061c2cb_1a9
( ) end ) __091590b945_ce , __3517cc49d1_116 . float = __82a06c5cfd_bb ( __331c5c3e98_7e ,
__1fa5f0b613_e9 [ ( ( ( 176 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __a822508444_db
. ShowFloating , function ( __a574a9e368_177 ) __a822508444_db . ShowFloating = __a574a9e368_177
__81540dc5aa_1 . RefreshFloating ( ) __d25061c2cb_1a9 ( ) end ) __091590b945_ce , __3517cc49d1_116
. autoload = __82a06c5cfd_bb ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 177 + 23 ) % 257 +
234 ) % 257 ) ] , __a822508444_db . AutoLoad , function ( __a574a9e368_177 ) __a822508444_db
. AutoLoad = __a574a9e368_177 __d25061c2cb_1a9 ( ) __e661a13eef_101 ( __1fa5f0b613_e9 [ ( (
( 33 + 23 ) % 257 + 234 ) % 257 ) ] , __a574a9e368_177 ) end ) __b4fd8ef090_9b ( __331c5c3e98_7e
, __1fa5f0b613_e9 [ ( ( ( 178 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local __36a149eee0_1b5
= { Compact = { __56d2c7e949_99 . minW , __56d2c7e949_99 . minH } , Default = { __56d2c7e949_99
. defW , __56d2c7e949_99 . defH } , Large = { __56d2c7e949_99 . maxW , __56d2c7e949_99 . maxH
} , } local __091590b945_ce , __129b91c2ea_1b4 = __99e54d9c7f_44 ( __331c5c3e98_7e , __1fa5f0b613_e9
[ ( ( ( 179 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Options = { __1fa5f0b613_e9
[ ( ( ( 180 + 23 ) % 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9 [ ( ( ( 181 * 17 + 5 ) % 257 +
252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 182 * 31 + 11 ) % 257 + 246 ) % 257 *
199 ) % 257 ] } , Default = __1fa5f0b613_e9 [ ( ( ( 181 * 17 + 5 ) % 257 + 252 ) % 257 * 121
) % 257 ] , OnChange = function ( __85511ba214_1d7 ) local __911dad98de_1a8 = __36a149eee0_1b5
[ __85511ba214_1d7 ] if __911dad98de_1a8 then __e723124c2c_49 ( __911dad98de_1a8 [ 1 ] , __911dad98de_1a8
[ 2 ] , false ) end end , } ) __2536710dd3_15 ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 183
+ 23 ) % 257 + 234 ) % 257 ) ] , function ( ) __e723124c2c_49 ( __56d2c7e949_99 . defW , __56d2c7e949_99
. defH , true ) __129b91c2ea_1b4 . Set ( __1fa5f0b613_e9 [ ( ( ( 181 * 17 + 5 ) % 257 + 252
) % 257 * 121 ) % 257 ] , true ) __81540dc5aa_1 . ActivateTab ( __1fa5f0b613_e9 [ ( ( ( 10
* 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) end ) __b4fd8ef090_9b ( __331c5c3e98_7e ,
__1fa5f0b613_e9 [ ( ( ( 184 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local __501795463a_8e
= { { __1fa5f0b613_e9 [ ( ( ( 185 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9
[ ( ( ( 23 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] } , { __1fa5f0b613_e9 [ ( ( ( 186
+ 23 ) % 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9 [ ( ( ( 187 * 17 + 5 ) % 257 + 252 ) % 257
* 121 ) % 257 ] } , { __1fa5f0b613_e9 [ ( ( ( 188 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) %
257 ] , __1fa5f0b613_e9 [ ( ( ( 189 + 23 ) % 257 + 234 ) % 257 ) ] } , { __1fa5f0b613_e9 [
( ( ( 190 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 191 * 31
+ 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] } , { __1fa5f0b613_e9 [ ( ( ( 192 + 23 ) % 257 +
234 ) % 257 ) ] , __1fa5f0b613_e9 [ ( ( ( 193 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] } , { __1fa5f0b613_e9 [ ( ( ( 194 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9
[ ( ( ( 195 + 23 ) % 257 + 234 ) % 257 ) ] } , { __1fa5f0b613_e9 [ ( ( ( 196 * 17 + 5 ) % 257
+ 252 ) % 257 * 121 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 197 * 31 + 11 ) % 257 + 246 ) % 257
* 199 ) % 257 ] } , { __1fa5f0b613_e9 [ ( ( ( 198 + 23 ) % 257 + 234 ) % 257 ) ] , __1fa5f0b613_e9
[ ( ( ( 199 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] } , } local __98a3648d10_88 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2
. new ( 1 , 0 , 0 , 226 ) , BackgroundColor3 = __55872a0ac8_17 . innerBg , BorderSizePixel
= 0 , LayoutOrder = __85c90836e8_17d ( __331c5c3e98_7e ) , ZIndex = 50 , } , __331c5c3e98_7e
) __3ed63efcc7_26 ( __98a3648d10_88 , 14 ) __bfadee6497_4f ( __98a3648d10_88 , __a268c6cecb_16
, 0 ) local __3bbb14e87c_89 = __179a4169c0_ac ( __98a3648d10_88 , __55872a0ac8_17 . innerBorder
, 1.5 , 0 ) local __45f3d362c3_18d , __7523cd816c_197 , __89f2b264ae_198 = 0 , 0.85 , 0.92
local __57b5668fd4_18e = { } local __12c1e1e01b_fb = { } local __86613a6856_194 = { } local
function __37dae56d2e_117 ( ) return Color3 . fromHSV ( __45f3d362c3_18d , __7523cd816c_197
, __89f2b264ae_198 ) end local __ec0e9d9546_8f = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( (
40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Position = UDim2 . fromOffset ( 14 ,
14 ) , Size = UDim2 . fromOffset ( 42 , 42 ) , BackgroundColor3 = __37dae56d2e_117 ( ) , BorderSizePixel
= 0 , ZIndex = 60 , } , __98a3648d10_88 ) __3ed63efcc7_26 ( __ec0e9d9546_8f , 21 ) local __f0e65016e3_90
= __179a4169c0_ac ( __ec0e9d9546_8f , Color3 . new ( 1 , 1 , 1 ) , 2 , 0.55 ) local __6c09914ee5_46
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Position = UDim2 . new ( 0 , 66 , 0 , 14 ) , Size = UDim2 . new ( 1 , - 66 - 92 , 0 ,
42 ) , BackgroundColor3 = __55872a0ac8_17 . black , BorderSizePixel = 0 , ZIndex = 60 , } ,
__98a3648d10_88 ) __3ed63efcc7_26 ( __6c09914ee5_46 , 10 ) local __b8345a41cd_47 = __179a4169c0_ac
( __6c09914ee5_46 , __55872a0ac8_17 . innerBorder , 1.5 , 0 ) __bfadee6497_4f ( __6c09914ee5_46
, ColorSequence . new ( Color3 . fromRGB ( 235 , 235 , 240 ) , Color3 . new ( 1 , 1 , 1 ) )
, 90 ) __4c855578e9_c9 ( __6c09914ee5_46 , { Position = UDim2 . new ( 0 , 12 , 0 , 0 ) , Size
= UDim2 . fromOffset ( 14 , 42 ) , Text = __1fa5f0b613_e9 [ ( ( ( 200 * 31 + 11 ) % 257 + 246
) % 257 * 199 ) % 257 ] , Font = Enum . Font . GothamBold , TextSize = 15 , TextColor3 = __55872a0ac8_17
. grey , ZIndex = 65 , } ) local __e1524d33d6_5f = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( (
( 201 + 23 ) % 257 + 234 ) % 257 ) ] , { Position = UDim2 . new ( 0 , 28 , 0 , 0 ) , Size =
UDim2 . new ( 1 , - 38 , 1 , 0 ) , BackgroundTransparency = 1 , Text = __996d3464d9_24 ( __37dae56d2e_117
( ) ) , PlaceholderText = __1fa5f0b613_e9 [ ( ( ( 202 * 17 + 5 ) % 257 + 252 ) % 257 * 121
) % 257 ] , Font = Enum . Font . GothamBold , TextSize = 14 , TextColor3 = __55872a0ac8_17
. white , PlaceholderColor3 = __55872a0ac8_17 . grey , TextXAlignment = Enum . TextXAlignment
. Left , ClearTextOnFocus = false , ZIndex = 65 , } , __6c09914ee5_46 ) local __58df713f65_4
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , { AnchorPoint = Vector2 . new ( 1 , 0 ) , Position = UDim2 . new ( 1 , - 14 , 0 , 14 )
, Size = UDim2 . fromOffset ( 70 , 42 ) , BackgroundColor3 = __55872a0ac8_17 . red , BorderSizePixel
= 0 , AutoButtonColor = false , Text = __1fa5f0b613_e9 [ ( ( ( 203 * 31 + 11 ) % 257 + 246
) % 257 * 199 ) % 257 ] , Font = Enum . Font . GothamBold , TextSize = 11 , TextColor3 = Color3
. new ( 1 , 1 , 1 ) , ZIndex = 65 , } , __98a3648d10_88 ) __3ed63efcc7_26 ( __58df713f65_4
, 10 ) local __14fd42354d_6 = __179a4169c0_ac ( __58df713f65_4 , __55872a0ac8_17 . redBright
, 1.2 , 0.35 ) __bfadee6497_4f ( __58df713f65_4 , ColorSequence . new ( Color3 . new ( 1 ,
1 , 1 ) , Color3 . fromRGB ( 190 , 190 , 190 ) ) , 90 ) __4c855578e9_c9 ( __98a3648d10_88 ,
{ Position = UDim2 . fromOffset ( 16 , 66 ) , Size = UDim2 . new ( 1 , - 32 , 0 , 12 ) , Text
= __1fa5f0b613_e9 [ ( ( ( 204 + 23 ) % 257 + 234 ) % 257 ) ] , Font = Enum . Font . GothamBold
, TextSize = 9 , TextColor3 = __55872a0ac8_17 . grey , ZIndex = 60 , } ) local __ebe6427141_8d
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Position = UDim2 . fromOffset ( 14 , 82 ) , Size = UDim2 . new ( 1 , - 28 , 0 , 32 )
, BackgroundTransparency = 1 , ZIndex = 60 , } , __98a3648d10_88 ) __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 54 + 23 ) % 257 + 234 ) % 257 ) ] , { FillDirection = Enum . FillDirection . Horizontal
, Padding = UDim . new ( 0 , 8 ) , VerticalAlignment = Enum . VerticalAlignment . Center ,
SortOrder = Enum . SortOrder . LayoutOrder , } , __ebe6427141_8d ) local function __a8ddc1fc29_72
( __9e7e1f3cd7_1cd , __106f10f688_1dc , __3a6cadb918_179 ) __4c855578e9_c9 ( __98a3648d10_88
, { Position = UDim2 . fromOffset ( 16 , __106f10f688_1dc - 15 ) , Size = UDim2 . new ( 1 ,
- 32 , 0 , 12 ) , Text = string . upper ( __9e7e1f3cd7_1cd ) , Font = Enum . Font . GothamBold
, TextSize = 9 , TextColor3 = __55872a0ac8_17 . grey , ZIndex = 60 , } ) local __9cdd50cbaf_c7
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Position = UDim2 . new ( 0 , 14 , 0 , __106f10f688_1dc ) , Size = UDim2 . new ( 1 , -
28 , 0 , 12 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1 ) , BorderSizePixel = 0 , ZIndex
= 60 , } , __98a3648d10_88 ) __3ed63efcc7_26 ( __9cdd50cbaf_c7 , 6 ) __179a4169c0_ac ( __9cdd50cbaf_c7
, __55872a0ac8_17 . innerBorder , 1 , 0.3 ) local __e8283ca62a_4b = __bfadee6497_4f ( __9cdd50cbaf_c7
, ColorSequence . new ( Color3 . new ( 1 , 1 , 1 ) ) , 0 ) local __71dbbc158c_61 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { AnchorPoint
= Vector2 . new ( 0.5 , 0.5 ) , Position = UDim2 . fromScale ( 0 , 0.5 ) , Size = UDim2 . fromOffset
( 20 , 20 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1 ) , BorderSizePixel = 0 , ZIndex
= 66 , } , __9cdd50cbaf_c7 ) __3ed63efcc7_26 ( __71dbbc158c_61 , 10 ) __179a4169c0_ac ( __71dbbc158c_61
, Color3 . fromRGB ( 20 , 20 , 24 ) , 2.5 , 0.1 ) local __c78d3c9470_57 = __b691e2a887_76 (
__1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { Position = UDim2
. new ( 0 , 14 , 0 , __106f10f688_1dc - 12 ) , Size = UDim2 . new ( 1 , - 28 , 0 , 36 ) , BackgroundTransparency
= 1 , Text = __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] , ZIndex = 70 , } ,
__98a3648d10_88 ) local __7e88d9df8b_fa = { Gradient = __e8283ca62a_4b , Knob = __71dbbc158c_61
} function __7e88d9df8b_fa . Set ( __85511ba214_1d7 ) __71dbbc158c_61 . Position = UDim2 .
fromScale ( math . clamp ( __85511ba214_1d7 , 0 , 1 ) , 0.5 ) end local __67bbc0387c_126 ,
__d625434dcf_125 = false , nil local function __a0565330b2_141 ( __7009e3a801_1db ) local __2b8f6d2550_1da
= __9cdd50cbaf_c7 . AbsoluteSize . X if __2b8f6d2550_1da <= 0 then return end __3a6cadb918_179
( math . clamp ( ( __7009e3a801_1db - __9cdd50cbaf_c7 . AbsolutePosition . X ) / __2b8f6d2550_1da
, 0 , 1 ) , false ) end __c41ecd2440_1d1 ( __c78d3c9470_57 . InputBegan : Connect ( function
( __c95102138c_158 ) local __e453d87ba6_1c3 = __c95102138c_158 . UserInputType if __e453d87ba6_1c3
== Enum . UserInputType . MouseButton1 or __e453d87ba6_1c3 == Enum . UserInputType . Touch
then if __67bbc0387c_126 or not __570a4268a2_60 . Begin ( __c78d3c9470_57 ) then return end
__67bbc0387c_126 , __d625434dcf_125 = true , __c95102138c_158 __a0565330b2_141 ( __c95102138c_158
. Position . X ) end end ) ) __c41ecd2440_1d1 ( __a0143ff92a_d3 . InputChanged : Connect (
function ( __c95102138c_158 ) if not __67bbc0387c_126 then return end local __e453d87ba6_1c3
= __c95102138c_158 . UserInputType if __e453d87ba6_1c3 == Enum . UserInputType . MouseMovement
or ( __e453d87ba6_1c3 == Enum . UserInputType . Touch and __c95102138c_158 == __d625434dcf_125
) then __a0565330b2_141 ( __c95102138c_158 . Position . X ) end end ) ) __c41ecd2440_1d1 (
__a0143ff92a_d3 . InputEnded : Connect ( function ( __c95102138c_158 ) if not __67bbc0387c_126
then return end local __e453d87ba6_1c3 = __c95102138c_158 . UserInputType if __e453d87ba6_1c3
== Enum . UserInputType . MouseButton1 or ( __e453d87ba6_1c3 == Enum . UserInputType . Touch
and __c95102138c_158 == __d625434dcf_125 ) then __67bbc0387c_126 , __d625434dcf_125 = false
, nil __570a4268a2_60 . End ( __c78d3c9470_57 ) __3a6cadb918_179 ( nil , true ) end end ) )
return __7e88d9df8b_fa end local function __6f39d2a990_19e ( ) local __fefa4ee1dc_ff = __37dae56d2e_117
( ) __ec0e9d9546_8f . BackgroundColor3 = __fefa4ee1dc_ff if not __e1524d33d6_5f : IsFocused
( ) then __e1524d33d6_5f . Text = __996d3464d9_24 ( __fefa4ee1dc_ff ) end __12c1e1e01b_fb .
h . Set ( __45f3d362c3_18d ) __12c1e1e01b_fb . s . Set ( __7523cd816c_197 ) __12c1e1e01b_fb
. v . Set ( __89f2b264ae_198 ) __12c1e1e01b_fb . s . Gradient . Color = ColorSequence . new
( Color3 . fromHSV ( __45f3d362c3_18d , 0 , __89f2b264ae_198 ) , Color3 . fromHSV ( __45f3d362c3_18d
, 1 , __89f2b264ae_198 ) ) __12c1e1e01b_fb . v . Gradient . Color = ColorSequence . new ( Color3
. new ( 0 , 0 , 0 ) , Color3 . fromHSV ( __45f3d362c3_18d , __7523cd816c_197 , 1 ) ) local
__68d2495bd1_14d = __996d3464d9_24 ( __fefa4ee1dc_ff ) for __091590b945_ce , __b47c47ed28_1c2
in ipairs ( __86613a6856_194 ) do local __a574a9e368_177 = __b47c47ed28_1c2 . Hex == __996d3464d9_24
( __25c487d903_56 ( __b47c47ed28_1c2 . Hex ) ) and __b47c47ed28_1c2 . Hex == __68d2495bd1_14d
__0f4c731917_c8 ( __b47c47ed28_1c2 . Stroke , 0.15 , { Color = __a574a9e368_177 and Color3
. new ( 1 , 1 , 1 ) or __55872a0ac8_17 . innerBorder , Transparency = __a574a9e368_177 and
0 or 0.2 , Thickness = __a574a9e368_177 and 2.4 or 1.5 } ) end end local function __415177b500_f4
( ) __81540dc5aa_1 . SetThemeColor ( __37dae56d2e_117 ( ) ) end __12c1e1e01b_fb . h = __a8ddc1fc29_72
( __1fa5f0b613_e9 [ ( ( ( 205 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , 138 , function
( __85511ba214_1d7 , __2111e93293_1a0 ) if __2111e93293_1a0 then __415177b500_f4 ( ) else __45f3d362c3_18d
= __85511ba214_1d7 __6f39d2a990_19e ( ) end end ) __12c1e1e01b_fb . s = __a8ddc1fc29_72 ( __1fa5f0b613_e9
[ ( ( ( 206 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , 172 , function ( __85511ba214_1d7
, __2111e93293_1a0 ) if __2111e93293_1a0 then __415177b500_f4 ( ) else __7523cd816c_197 = __85511ba214_1d7
__6f39d2a990_19e ( ) end end ) __12c1e1e01b_fb . v = __a8ddc1fc29_72 ( __1fa5f0b613_e9 [ (
( ( 207 + 23 ) % 257 + 234 ) % 257 ) ] , 206 , function ( __85511ba214_1d7 , __2111e93293_1a0
) if __2111e93293_1a0 then __415177b500_f4 ( ) else __89f2b264ae_198 = math . max ( __85511ba214_1d7
, 0.25 ) __6f39d2a990_19e ( ) end end ) __12c1e1e01b_fb . h . Gradient . Color = ColorSequence
. new ( { ColorSequenceKeypoint . new ( 0 , Color3 . fromHSV ( 0 , 1 , 1 ) ) , ColorSequenceKeypoint
. new ( 0.17 , Color3 . fromHSV ( 0.17 , 1 , 1 ) ) , ColorSequenceKeypoint . new ( 0.33 , Color3
. fromHSV ( 0.33 , 1 , 1 ) ) , ColorSequenceKeypoint . new ( 0.5 , Color3 . fromHSV ( 0.5 ,
1 , 1 ) ) , ColorSequenceKeypoint . new ( 0.67 , Color3 . fromHSV ( 0.67 , 1 , 1 ) ) , ColorSequenceKeypoint
. new ( 0.83 , Color3 . fromHSV ( 0.83 , 1 , 1 ) ) , ColorSequenceKeypoint . new ( 1 , Color3
. fromHSV ( 1 , 1 , 1 ) ) , } ) function __57b5668fd4_18e . Sync ( __fefa4ee1dc_ff ) __45f3d362c3_18d
, __7523cd816c_197 , __89f2b264ae_198 = Color3 . toHSV ( __fefa4ee1dc_ff ) __89f2b264ae_198
= math . max ( __89f2b264ae_198 , 0.25 ) __6f39d2a990_19e ( ) end for __734285bf2d_153 , __a0a586d3ea_185
in ipairs ( __501795463a_8e ) do local __bfcc581ec6_10a = __25c487d903_56 ( __a0a586d3ea_185
[ 2 ] ) local __81c6d6e0de_ae = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) %
257 + 246 ) % 257 * 199 ) % 257 ] , { Size = UDim2 . fromOffset ( 30 , 30 ) , BackgroundColor3
= __bfcc581ec6_10a , AutoButtonColor = false , Text = __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257
+ 234 ) % 257 ) ] , LayoutOrder = __734285bf2d_153 , ZIndex = 65 , } , __ebe6427141_8d ) __3ed63efcc7_26
( __81c6d6e0de_ae , 15 ) local __588946f99d_ad = __179a4169c0_ac ( __81c6d6e0de_ae , __55872a0ac8_17
. innerBorder , 1.5 , 0.2 ) table . insert ( __86613a6856_194 , { Hex = __a0a586d3ea_185 [
2 ] , Stroke = __588946f99d_ad } ) __c41ecd2440_1d1 ( __81c6d6e0de_ae . MouseEnter : Connect
( function ( ) __0f4c731917_c8 ( __81c6d6e0de_ae , 0.12 , { Size = UDim2 . fromOffset ( 34
, 34 ) } ) end ) ) __c41ecd2440_1d1 ( __81c6d6e0de_ae . MouseLeave : Connect ( function ( )
__0f4c731917_c8 ( __81c6d6e0de_ae , 0.12 , { Size = UDim2 . fromOffset ( 30 , 30 ) } ) end
) ) __c41ecd2440_1d1 ( __81c6d6e0de_ae . Activated : Connect ( function ( ) __57b5668fd4_18e
. Sync ( __bfcc581ec6_10a ) __415177b500_f4 ( ) end ) ) end __c41ecd2440_1d1 ( __e1524d33d6_5f
. Focused : Connect ( function ( ) __0f4c731917_c8 ( __b8345a41cd_47 , 0.15 , { Color = __55872a0ac8_17
. redBright , Thickness = 2 } ) __0f4c731917_c8 ( __6c09914ee5_46 , 0.15 , { BackgroundColor3
= Color3 . fromRGB ( 18 , 18 , 24 ) } ) end ) ) __c41ecd2440_1d1 ( __e1524d33d6_5f : GetPropertyChangedSignal
( __1fa5f0b613_e9 [ ( ( ( 208 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) : Connect (
function ( ) local __8a33b06032_106 = string . upper ( __e1524d33d6_5f . Text : gsub ( __1fa5f0b613_e9
[ ( ( ( 209 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9 [ ( ( ( 27 +
23 ) % 257 + 234 ) % 257 ) ] ) ) : sub ( 1 , 6 ) if __8a33b06032_106 ~= __e1524d33d6_5f . Text
then __e1524d33d6_5f . Text = __8a33b06032_106 return end local __fefa4ee1dc_ff = __25c487d903_56
( __8a33b06032_106 ) if __fefa4ee1dc_ff and __e1524d33d6_5f : IsFocused ( ) then __ec0e9d9546_8f
. BackgroundColor3 = __fefa4ee1dc_ff end end ) ) local function __061286ba2a_10e ( ) local
__fefa4ee1dc_ff = __25c487d903_56 ( __e1524d33d6_5f . Text ) if __fefa4ee1dc_ff then __57b5668fd4_18e
. Sync ( __fefa4ee1dc_ff ) __415177b500_f4 ( ) else __4ca2c89a3e_78 ( __1fa5f0b613_e9 [ ( (
( 210 + 23 ) % 257 + 234 ) % 257 ) ] , false ) __0f4c731917_c8 ( __b8345a41cd_47 , 0.1 , {
Color = __55872a0ac8_17 . bad } ) task . delay ( 0.4 , function ( ) if __b8345a41cd_47 . Parent
then __0f4c731917_c8 ( __b8345a41cd_47 , 0.2 , { Color = __55872a0ac8_17 . innerBorder } )
end end ) __6f39d2a990_19e ( ) end end __c41ecd2440_1d1 ( __e1524d33d6_5f . FocusLost : Connect
( function ( __452c545712_138 ) __0f4c731917_c8 ( __b8345a41cd_47 , 0.15 , { Color = __55872a0ac8_17
. innerBorder , Thickness = 1.5 } ) __0f4c731917_c8 ( __6c09914ee5_46 , 0.15 , { BackgroundColor3
= __55872a0ac8_17 . black } ) if __452c545712_138 then __061286ba2a_10e ( ) else __6f39d2a990_19e
( ) end end ) ) __c41ecd2440_1d1 ( __58df713f65_4 . Activated : Connect ( __061286ba2a_10e
) ) __0850714e19_5a ( __58df713f65_4 , function ( __44706b8c72_149 ) __0f4c731917_c8 ( __58df713f65_4
, 0.12 , { BackgroundColor3 = __44706b8c72_149 and __55872a0ac8_17 . redBright or __55872a0ac8_17
. red } ) end ) __1f08e28198_79 ( function ( ) __98a3648d10_88 . BackgroundColor3 = __55872a0ac8_17
. innerBg __3bbb14e87c_89 . Color = __55872a0ac8_17 . innerBorder __b8345a41cd_47 . Color =
__55872a0ac8_17 . innerBorder __58df713f65_4 . BackgroundColor3 = __55872a0ac8_17 . red __14fd42354d_6
. Color = __55872a0ac8_17 . redBright end ) __57b5668fd4_18e . Sync ( __25c487d903_56 ( __a822508444_db
. ThemeColor ) or __55872a0ac8_17 . red ) __b4fd8ef090_9b ( __331c5c3e98_7e , __1fa5f0b613_e9
[ ( ( ( 211 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) __2536710dd3_15 ( __331c5c3e98_7e
, __1fa5f0b613_e9 [ ( ( ( 212 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , function (
) __a822508444_db = __3b97c0a669_114 ( __c7e8d544f7_da ) __3517cc49d1_116 . anim . Set ( __a822508444_db
. Animate , true ) __3517cc49d1_116 . pulse . Set ( __a822508444_db . Pulse , true ) __3517cc49d1_116
. float . Set ( __a822508444_db . ShowFloating , true ) __3517cc49d1_116 . autoload . Set (
__a822508444_db . AutoLoad , true ) __81540dc5aa_1 . SetPulse ( __a822508444_db . Pulse ) __81540dc5aa_1
. SetThemeColor ( __25c487d903_56 ( __a822508444_db . ThemeColor ) , true ) __57b5668fd4_18e
. Sync ( __25c487d903_56 ( __a822508444_db . ThemeColor ) ) __129b91c2ea_1b4 . Set ( __1fa5f0b613_e9
[ ( ( ( 181 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , true ) __e723124c2c_49 ( __56d2c7e949_99
. defW , __56d2c7e949_99 . defH , true ) __81540dc5aa_1 . RefreshFloating ( ) __d25061c2cb_1a9
( ) __4ca2c89a3e_78 ( __1fa5f0b613_e9 [ ( ( ( 213 + 23 ) % 257 + 234 ) % 257 ) ] , true ) end
) __2536710dd3_15 ( __331c5c3e98_7e , __1fa5f0b613_e9 [ ( ( ( 214 * 17 + 5 ) % 257 + 252 )
% 257 * 121 ) % 257 ] , __18c1d6ca6a_107 , true ) end do local __331c5c3e98_7e = __c9689bac6d_27
( __1fa5f0b613_e9 [ ( ( ( 215 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) __e35f7c64ac_28
( __1fa5f0b613_e9 [ ( ( ( 215 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , __1fa5f0b613_e9
[ ( ( ( 216 + 23 ) % 257 + 234 ) % 257 ) ] ) __b4fd8ef090_9b ( __331c5c3e98_7e , __1fa5f0b613_e9
[ ( ( ( 215 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) local __1999dff2c9_19 = __b691e2a887_76
( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Size = UDim2
. new ( 1 , 0 , 0 , 0 ) , AutomaticSize = Enum . AutomaticSize . Y , BackgroundColor3 = __55872a0ac8_17
. innerBg , BorderSizePixel = 0 , LayoutOrder = __85c90836e8_17d ( __331c5c3e98_7e ) , ZIndex
= 50 , } , __331c5c3e98_7e ) __3ed63efcc7_26 ( __1999dff2c9_19 , 14 ) __bfadee6497_4f ( __1999dff2c9_19
, __a268c6cecb_16 , 0 ) local __534fd6bdf8_1b = __179a4169c0_ac ( __1999dff2c9_19 , __55872a0ac8_17
. neon , 1.6 , 0.15 ) local __6e9e8319b6_1c = __bfadee6497_4f ( __534fd6bdf8_1b , __faa2ce483a_75
, 0 ) __35e3ca6f7f_a7 ( __6e9e8319b6_1c , 9 ) __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 60
+ 23 ) % 257 + 234 ) % 257 ) ] , { PaddingLeft = UDim . new ( 0 , 16 ) , PaddingRight = UDim
. new ( 0 , 16 ) , PaddingTop = UDim . new ( 0 , 16 ) , PaddingBottom = UDim . new ( 0 , 16
) , } , __1999dff2c9_19 ) __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 54 + 23 ) % 257 + 234 )
% 257 ) ] , { Padding = UDim . new ( 0 , 6 ) , SortOrder = Enum . SortOrder . LayoutOrder }
, __1999dff2c9_19 ) local __4d03aef00c_6b = __4c855578e9_c9 ( __1999dff2c9_19 , { Size = UDim2
. new ( 1 , 0 , 0 , 28 ) , Text = __1fa5f0b613_e9 [ ( ( ( 217 * 17 + 5 ) % 257 + 252 ) % 257
* 121 ) % 257 ] , Font = Enum . Font . GothamBlack , TextSize = 22 , LayoutOrder = 1 , ZIndex
= 55 , } ) local __943a5986df_67 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 )
% 257 + 252 ) % 257 * 121 ) % 257 ] , { Visible = false , Size = UDim2 . fromOffset ( 42 ,
2 ) , BackgroundColor3 = __55872a0ac8_17 . red , BorderSizePixel = 0 , LayoutOrder = 2 , ZIndex
= 55 , } , __1999dff2c9_19 ) __3ed63efcc7_26 ( __943a5986df_67 , 2 ) __4c855578e9_c9 ( __1999dff2c9_19
, { Size = UDim2 . new ( 1 , 0 , 0 , 16 ) , Text = __1fa5f0b613_e9 [ ( ( ( 218 * 31 + 11 )
% 257 + 246 ) % 257 * 199 ) % 257 ] , TextColor3 = __55872a0ac8_17 . grey , LayoutOrder = 3
, ZIndex = 55 , } ) __4c855578e9_c9 ( __1999dff2c9_19 , { Size = UDim2 . new ( 1 , 0 , 0 ,
18 ) , Text = __1fa5f0b613_e9 [ ( ( ( 219 + 23 ) % 257 + 234 ) % 257 ) ] , Font = Enum . Font
. GothamMedium , LayoutOrder = 4 , ZIndex = 55 , } ) __4c855578e9_c9 ( __1999dff2c9_19 , {
Size = UDim2 . new ( 1 , 0 , 0 , 16 ) , Text = __1fa5f0b613_e9 [ ( ( ( 220 * 17 + 5 ) % 257
+ 252 ) % 257 * 121 ) % 257 ] , TextSize = 10 , TextColor3 = __55872a0ac8_17 . grey , LayoutOrder
= 5 , ZIndex = 55 , } ) __1f08e28198_79 ( function ( ) __4d03aef00c_6b . TextColor3 = __55872a0ac8_17
. red __943a5986df_67 . BackgroundColor3 = __55872a0ac8_17 . red __1999dff2c9_19 . BackgroundColor3
= __55872a0ac8_17 . innerBg __534fd6bdf8_1b . Color = __55872a0ac8_17 . neon __6e9e8319b6_1c
. Color = __faa2ce483a_75 end ) end __81540dc5aa_1 . ApplyLayout ( ) __81540dc5aa_1 . ActivateTab
( __1fa5f0b613_e9 [ ( ( ( 10 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) local function
__7155a6c805_43 ( __7a3cff4445_14b , __b850a3bf1e_17c ) local __67bbc0387c_126 , __86165d63c5_16f
= false , false local __6ecd82ae13_1bc , __c4ad510ead_1bd , __a1f85b0769_1be local function
__2f828f5114_13c ( ) if not __67bbc0387c_126 then return end __67bbc0387c_126 = false __570a4268a2_60
. End ( __7a3cff4445_14b ) if not __86165d63c5_16f and __b850a3bf1e_17c . onClick then __b850a3bf1e_17c
. onClick ( ) end end __c41ecd2440_1d1 ( __7a3cff4445_14b . InputBegan : Connect ( function
( __c95102138c_158 ) if __c95102138c_158 . UserInputType ~= Enum . UserInputType . MouseButton1
and __c95102138c_158 . UserInputType ~= Enum . UserInputType . Touch then return end if __b850a3bf1e_17c
. canStart and not __b850a3bf1e_17c . canStart ( ) then return end if __67bbc0387c_126 or not
__570a4268a2_60 . Begin ( __7a3cff4445_14b ) then return end __67bbc0387c_126 , __86165d63c5_16f
= true , false __6ecd82ae13_1bc = __c95102138c_158 __c4ad510ead_1bd = Vector2 . new ( __c95102138c_158
. Position . X , __c95102138c_158 . Position . Y ) __a1f85b0769_1be = __b850a3bf1e_17c . get
( ) __c95102138c_158 . Changed : Connect ( function ( ) if __c95102138c_158 . UserInputState
== Enum . UserInputState . End then __2f828f5114_13c ( ) end end ) end ) ) __c41ecd2440_1d1
( __a0143ff92a_d3 . InputChanged : Connect ( function ( __c95102138c_158 ) if not __67bbc0387c_126
then return end local __e453d87ba6_1c3 = __c95102138c_158 . UserInputType if __e453d87ba6_1c3
== Enum . UserInputType . MouseMovement or ( __e453d87ba6_1c3 == Enum . UserInputType . Touch
and __c95102138c_158 == __6ecd82ae13_1bc ) then local __badc6727ed_11e = Vector2 . new ( __c95102138c_158
. Position . X , __c95102138c_158 . Position . Y ) - __c4ad510ead_1bd if not __86165d63c5_16f
and __badc6727ed_11e . Magnitude < 5 then return end __86165d63c5_16f = true __b850a3bf1e_17c
. set ( __a1f85b0769_1be + __badc6727ed_11e ) end end ) ) __c41ecd2440_1d1 ( __a0143ff92a_d3
. InputEnded : Connect ( function ( __c95102138c_158 ) if __c95102138c_158 . UserInputType
== Enum . UserInputType . MouseButton1 or ( __c95102138c_158 . UserInputType == Enum . UserInputType
. Touch and __c95102138c_158 == __6ecd82ae13_1bc ) then __2f828f5114_13c ( ) end end ) ) end
local __9f0f3e0b26_b2 = 58 local __5792087cfe_bf = Vector2 . new ( __50b39735c0_cc ( ) . X
- 52 , __50b39735c0_cc ( ) . Y * 0.72 ) local __121e8dbe75_c4 = __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Name = __1fa5f0b613_e9 [ ( (
( 221 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , AnchorPoint = Vector2 . new ( 0.5 ,
0.5 ) , Position = UDim2 . fromOffset ( __5792087cfe_bf . X , __5792087cfe_bf . Y ) , Size
= UDim2 . fromOffset ( __9f0f3e0b26_b2 , __9f0f3e0b26_b2 ) , BackgroundTransparency = 1 , BorderSizePixel
= 0 , ZIndex = 200 , } , __cfbeed4503_51 ) local __2dffcef711_c1 = __605563dda1_74 ( __121e8dbe75_c4
, 16 , { { 3 , 0.65 , 0.80 } , { 7 , 0.80 , 0.90 } , { 12 , 0.90 , 0.96 } , } ) local __0518f232b0_be
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , { Name = __1fa5f0b613_e9 [ ( ( ( 222 + 23 ) % 257 + 234 ) % 257 ) ] , Size = UDim2 . fromScale
( 1 , 1 ) , BackgroundColor3 = Color3 . fromRGB ( 10 , 10 , 14 ) , BorderSizePixel = 0 , AutoButtonColor
= false , Text = __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] , ZIndex = 10 ,
} , __121e8dbe75_c4 ) __3ed63efcc7_26 ( __0518f232b0_be , 16 ) __bfadee6497_4f ( __0518f232b0_be
, ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , Color3 . fromRGB ( 26 , 12 , 16
) ) , ColorSequenceKeypoint . new ( 1 , Color3 . fromRGB ( 8 , 8 , 11 ) ) , } ) , 90 ) local
__a9195c26fb_c5 = __179a4169c0_ac ( __0518f232b0_be , __55872a0ac8_17 . neon , 2 , 0 ) local
__a27042f141_c6 = __bfadee6497_4f ( __a9195c26fb_c5 , __faa2ce483a_75 , 0 ) __35e3ca6f7f_a7
( __a27042f141_c6 , 4 ) local __f760e9b8a3_c2 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 38
* 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { AnchorPoint = Vector2 . new ( 0.5 , 0.5
) , Position = UDim2 . new ( 0.5 , 0 , 0.5 , - 2 ) , Size = UDim2 . fromScale ( 1 , 0.7 ) ,
BackgroundTransparency = 1 , RichText = true , Text = __1fa5f0b613_e9 [ ( ( ( 50 * 31 + 11
) % 257 + 246 ) % 257 * 199 ) % 257 ] , Font = Enum . Font . GothamBlack , TextSize = 24 ,
TextColor3 = __55872a0ac8_17 . white , ZIndex = 12 , } , __0518f232b0_be ) local __14c01d5101_c3
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 36 + 23 ) % 257 + 234 ) % 257 ) ] , { Color = __55872a0ac8_17
. neon , Thickness = 1.4 , Transparency = 0.45 , ApplyStrokeMode = Enum . ApplyStrokeMode .
Contextual , } , __f760e9b8a3_c2 ) local __5e1fcf0d1b_bc = __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , { Visible = false , AnchorPoint
= Vector2 . new ( 0.5 , 1 ) , Position = UDim2 . new ( 0.5 , 0 , 1 , - 8 ) , Size = UDim2 .
fromOffset ( 22 , 2 ) , BackgroundColor3 = Color3 . new ( 1 , 1 , 1 ) , BorderSizePixel = 0
, ZIndex = 12 , } , __0518f232b0_be ) __3ed63efcc7_26 ( __5e1fcf0d1b_bc , 2 ) local __71e3ca89ff_bd
= __bfadee6497_4f ( __5e1fcf0d1b_bc , ColorSequence . new ( __55872a0ac8_17 . red ) , 0 ) local
__bc411ba9bc_c0 = __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257
* 121 ) % 257 ] , { AnchorPoint = Vector2 . new ( 1 , 0 ) , Position = UDim2 . new ( 1 , -
7 , 0 , 7 ) , Size = UDim2 . fromOffset ( 6 , 6 ) , BackgroundColor3 = __55872a0ac8_17 . redBright
, BorderSizePixel = 0 , ZIndex = 12 , } , __0518f232b0_be ) __3ed63efcc7_26 ( __bc411ba9bc_c0
, 6 ) local __50fa0d0224_85 = true __1f08e28198_79 ( function ( ) __a9195c26fb_c5 . Color =
__55872a0ac8_17 . neon __a27042f141_c6 . Color = __faa2ce483a_75 __14c01d5101_c3 . Color =
__55872a0ac8_17 . neon for __091590b945_ce , __19c1476c74_163 in ipairs ( __2dffcef711_c1 )
do __19c1476c74_163 . Stroke . Color = __55872a0ac8_17 . neon end __71e3ca89ff_bd . Color =
ColorSequence . new ( { ColorSequenceKeypoint . new ( 0 , __55872a0ac8_17 . redDark ) , ColorSequenceKeypoint
. new ( 0.5 , __55872a0ac8_17 . redSoft ) , ColorSequenceKeypoint . new ( 1 , __55872a0ac8_17
. redDark ) , } ) __bc411ba9bc_c0 . BackgroundColor3 = __50fa0d0224_85 and __55872a0ac8_17
. redBright or Color3 . fromRGB ( 90 , 90 , 100 ) end ) local function __c5716b6f01_9f ( __85511ba214_1d7
) local __225225afa6_1d9 = __50b39735c0_cc ( ) local __b213670e0d_14a = __9f0f3e0b26_b2 / 2
+ 4 __5792087cfe_bf = Vector2 . new ( math . clamp ( __85511ba214_1d7 . X , __b213670e0d_14a
, math . max ( __b213670e0d_14a , __225225afa6_1d9 . X - __b213670e0d_14a ) ) , math . clamp
( __85511ba214_1d7 . Y , __b213670e0d_14a , math . max ( __b213670e0d_14a , __225225afa6_1d9
. Y - __b213670e0d_14a ) ) ) __121e8dbe75_c4 . Position = UDim2 . fromOffset ( __5792087cfe_bf
. X , __5792087cfe_bf . Y ) end __c41ecd2440_1d1 ( __0518f232b0_be . MouseEnter : Connect (
function ( ) __0f4c731917_c8 ( __121e8dbe75_c4 , 0.18 , { Size = UDim2 . fromOffset ( __9f0f3e0b26_b2
+ 6 , __9f0f3e0b26_b2 + 6 ) } ) __0f4c731917_c8 ( __a9195c26fb_c5 , 0.18 , { Thickness = 2.6
} ) end ) ) __c41ecd2440_1d1 ( __0518f232b0_be . MouseLeave : Connect ( function ( ) __0f4c731917_c8
( __121e8dbe75_c4 , 0.18 , { Size = UDim2 . fromOffset ( __9f0f3e0b26_b2 , __9f0f3e0b26_b2
) } ) __0f4c731917_c8 ( __a9195c26fb_c5 , 0.18 , { Thickness = 2 } ) end ) ) function __81540dc5aa_1
. RefreshFloating ( ) __121e8dbe75_c4 . Visible = __a822508444_db . ShowFloating or not __50fa0d0224_85
end local __bd0920bb76_3 = false local __d4cbf112ae_2 = 0 local __a55032f7f2_7d = 26 local
function __a2cfdbda9f_a0 ( __f80a3af3ee_17a ) __0f4c731917_c8 ( __bc411ba9bc_c0 , 0.2 , { BackgroundColor3
= __f80a3af3ee_17a and __55872a0ac8_17 . redBright or Color3 . fromRGB ( 90 , 90 , 100 ) }
) __0f4c731917_c8 ( __f760e9b8a3_c2 , 0.2 , { TextTransparency = __f80a3af3ee_17a and 0 or
0.4 } ) end local function __fe38305e6f_7b ( ) __50fa0d0224_85 = true __bd0920bb76_3 = true
__d4cbf112ae_2 += 1 local __cb502e879f_1cf = __d4cbf112ae_2 __81540dc5aa_1 . RefreshFloating
( ) __4140082906_95 . Visible = true __4140082906_95 . Size = UDim2 . fromOffset ( __70637c3047_84
. X - __a55032f7f2_7d , __70637c3047_84 . Y - __a55032f7f2_7d ) __4140082906_95 . Position
= UDim2 . fromOffset ( __92879fad55_83 . X + __a55032f7f2_7d / 2 , __92879fad55_83 . Y + __a55032f7f2_7d
/ 2 ) __0f4c731917_c8 ( __4140082906_95 , 0.28 , { Size = UDim2 . fromOffset ( __70637c3047_84
. X , __70637c3047_84 . Y ) , Position = UDim2 . fromOffset ( __92879fad55_83 . X , __92879fad55_83
. Y ) , } , Enum . EasingStyle . Back ) __a2cfdbda9f_a0 ( true ) task . delay ( 0.32 , function
( ) if __cb502e879f_1cf == __d4cbf112ae_2 then __bd0920bb76_3 = false __8df757f7b9_5 ( ) end
end ) end local function __45284e9e50_22 ( ) __50fa0d0224_85 = false __bd0920bb76_3 = true
__d4cbf112ae_2 += 1 local __cb502e879f_1cf = __d4cbf112ae_2 __81540dc5aa_1 . RefreshFloating
( ) __0f4c731917_c8 ( __4140082906_95 , 0.2 , { Size = UDim2 . fromOffset ( __70637c3047_84
. X - __a55032f7f2_7d , __70637c3047_84 . Y - __a55032f7f2_7d ) , Position = UDim2 . fromOffset
( __92879fad55_83 . X + __a55032f7f2_7d / 2 , __92879fad55_83 . Y + __a55032f7f2_7d / 2 ) ,
} , Enum . EasingStyle . Quad , Enum . EasingDirection . In ) __a2cfdbda9f_a0 ( false ) task
. delay ( 0.24 , function ( ) if __cb502e879f_1cf == __d4cbf112ae_2 then __bd0920bb76_3 = false
__4140082906_95 . Visible = false __8df757f7b9_5 ( ) end end ) end local function __691baad763_18
( ) return __50fa0d0224_85 and not __bd0920bb76_3 end __7155a6c805_43 ( __0518f232b0_be , {
get = function ( ) return __5792087cfe_bf end , set = __c5716b6f01_9f , onClick = function
( ) if __50fa0d0224_85 then __45284e9e50_22 ( ) else __fe38305e6f_7b ( ) end end , } ) local
__c227f00bbe_82 = { get = function ( ) return __92879fad55_83 end , set = __ded6c1ccc8_9d ,
canStart = __691baad763_18 , } __7155a6c805_43 ( __e3fcb644d9_54 , __c227f00bbe_82 ) __7155a6c805_43
( __4ad118686b_a2 , __c227f00bbe_82 ) __c41ecd2440_1d1 ( __11cc61695c_21 . Activated : Connect
( function ( ) if __50fa0d0224_85 then __45284e9e50_22 ( ) end end ) ) local __09b2829195_92
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 56 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , { Name = __1fa5f0b613_e9 [ ( ( ( 223 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] , AnchorPoint
= Vector2 . new ( 1 , 1 ) , Position = UDim2 . new ( 1 , - 3 , 1 , - 3 ) , Size = UDim2 . fromOffset
( 26 , 26 ) , BackgroundTransparency = 1 , BorderSizePixel = 0 , AutoButtonColor = false ,
Text = __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] , ZIndex = 100 , } , __245d8cdf06_6e
) local __214cd67f1a_50 = { } for __091590b945_ce , __a0a586d3ea_185 in ipairs ( { { 18 , 18
} , { 18 , 11 } , { 11 , 18 } , { 18 , 4 } , { 4 , 18 } , { 11 , 11 } } ) do local __e7228a105a_119
= __b691e2a887_76 ( __1fa5f0b613_e9 [ ( ( ( 40 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257
] , { Position = UDim2 . fromOffset ( __a0a586d3ea_185 [ 1 ] , __a0a586d3ea_185 [ 2 ] ) , Size
= UDim2 . fromOffset ( 3 , 3 ) , BackgroundColor3 = __55872a0ac8_17 . innerBorder , BorderSizePixel
= 0 , ZIndex = 101 , } , __09b2829195_92 ) __3ed63efcc7_26 ( __e7228a105a_119 , 2 ) table .
insert ( __214cd67f1a_50 , __e7228a105a_119 ) end local __1096b11314_148 , __d266871f39_147
= false , false local function __ece70049d8_81 ( ) local __fefa4ee1dc_ff = ( __1096b11314_148
or __d266871f39_147 ) and __55872a0ac8_17 . redSoft or __55872a0ac8_17 . innerBorder for __091590b945_ce
, __e7228a105a_119 in ipairs ( __214cd67f1a_50 ) do __0f4c731917_c8 ( __e7228a105a_119 , 0.15
, { BackgroundColor3 = __fefa4ee1dc_ff } ) end end __1f08e28198_79 ( __ece70049d8_81 ) __c41ecd2440_1d1
( __09b2829195_92 . MouseEnter : Connect ( function ( ) __1096b11314_148 = true __ece70049d8_81
( ) end ) ) __c41ecd2440_1d1 ( __09b2829195_92 . MouseLeave : Connect ( function ( ) __1096b11314_148
= false __ece70049d8_81 ( ) end ) ) local __748eb27a6a_a4 = __b691e2a887_76 ( __1fa5f0b613_e9
[ ( ( ( 38 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] , { AnchorPoint = Vector2 . new
( 0.5 , 1 ) , Position = UDim2 . new ( 0.5 , 0 , 1 , - 14 ) , Size = UDim2 . fromOffset ( 120
, 24 ) , BackgroundColor3 = __55872a0ac8_17 . black , BackgroundTransparency = 0.1 , Text =
__1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234 ) % 257 ) ] , Font = Enum . Font . GothamBold
, TextSize = 11 , TextColor3 = __55872a0ac8_17 . white , Visible = false , ZIndex = 250 , }
, __245d8cdf06_6e ) __3ed63efcc7_26 ( __748eb27a6a_a4 , 12 ) local __daaac8c9bd_a5 = __179a4169c0_ac
( __748eb27a6a_a4 , __55872a0ac8_17 . red , 1.5 , 0.1 ) __1f08e28198_79 ( function ( ) __daaac8c9bd_a5
. Color = __55872a0ac8_17 . red end ) local __f0770737c0_1cc = 0 local function __eb256a0538_a1
( ) __f0770737c0_1cc += 1 local __cb502e879f_1cf = __f0770737c0_1cc __748eb27a6a_a4 . Text
= string . format ( __1fa5f0b613_e9 [ ( ( ( 224 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257
] , __70637c3047_84 . X , __70637c3047_84 . Y , __70637c3047_84 . X < 480 and __1fa5f0b613_e9
[ ( ( ( 225 + 23 ) % 257 + 234 ) % 257 ) ] or __1fa5f0b613_e9 [ ( ( ( 27 + 23 ) % 257 + 234
) % 257 ) ] ) __748eb27a6a_a4 . Size = UDim2 . fromOffset ( __70637c3047_84 . X < 480 and 150
or 100 , 24 ) __748eb27a6a_a4 . Visible = true task . delay ( 0.9 , function ( ) if __cb502e879f_1cf
== __f0770737c0_1cc and __748eb27a6a_a4 . Parent and not __d266871f39_147 then __748eb27a6a_a4
. Visible = false end end ) end __7155a6c805_43 ( __09b2829195_92 , { get = function ( ) return
__70637c3047_84 end , set = function ( __85511ba214_1d7 ) __d266871f39_147 = true __ece70049d8_81
( ) __b6d941f747_9e ( __85511ba214_1d7 . X , __85511ba214_1d7 . Y ) __eb256a0538_a1 ( ) end
, canStart = __691baad763_18 , } ) __c41ecd2440_1d1 ( __a0143ff92a_d3 . InputEnded : Connect
( function ( __c95102138c_158 ) if __d266871f39_147 and ( __c95102138c_158 . UserInputType
== Enum . UserInputType . MouseButton1 or __c95102138c_158 . UserInputType == Enum . UserInputType
. Touch ) then __d266871f39_147 = false __ece70049d8_81 ( ) __eb256a0538_a1 ( ) end end ) )
function __81540dc5aa_1 . Refit ( ) __b6d941f747_9e ( __70637c3047_84 . X , __70637c3047_84
. Y ) __c5716b6f01_9f ( __5792087cfe_bf ) end __c41ecd2440_1d1 ( __cfbeed4503_51 : GetPropertyChangedSignal
( __1fa5f0b613_e9 [ ( ( ( 226 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) : Connect (
__81540dc5aa_1 . Refit ) ) function __81540dc5aa_1 . SetPulse ( __a574a9e368_177 ) __a822508444_db
. Pulse = __a574a9e368_177 for __091590b945_ce , __e453d87ba6_1c3 in ipairs ( __f3814ce17a_a8
) do if __a574a9e368_177 then __e453d87ba6_1c3 : Play ( ) else __e453d87ba6_1c3 : Pause ( )
end end end local __2e22b0566b_91 = { } for __091590b945_ce , __19c1476c74_163 in ipairs (
__63dbc4a987_6f ) do table . insert ( __2e22b0566b_91 , __19c1476c74_163 ) end for __091590b945_ce
, __19c1476c74_163 in ipairs ( __2dffcef711_c1 ) do table . insert ( __2e22b0566b_91 , __19c1476c74_163
) end task . spawn ( function ( ) local __ca0d6644e6_120 = false while not __6c9252efea_11f
and __cfbeed4503_51 . Parent do if __a822508444_db . Pulse then for __091590b945_ce , __19c1476c74_163
in ipairs ( __2e22b0566b_91 ) do __0f4c731917_c8 ( __19c1476c74_163 . Stroke , 1.2 , { Transparency
= __ca0d6644e6_120 and __19c1476c74_163 . Dim or __19c1476c74_163 . Bright } , Enum . EasingStyle
. Sine ) end end __ca0d6644e6_120 = not __ca0d6644e6_120 task . wait ( 1.2 ) end end ) __c41ecd2440_1d1
( __cfbeed4503_51 . AncestryChanged : Connect ( function ( __091590b945_ce , __6e05a5b93d_188
) if not __6e05a5b93d_188 then __18c1d6ca6a_107 ( ) end end ) ) do local __02ce84df23_175 =
pcall ( function ( ) __cfbeed4503_51 . Parent = game : GetService ( __1fa5f0b613_e9 [ ( ( (
44 * 31 + 11 ) % 257 + 246 ) % 257 * 199 ) % 257 ] ) end ) if not __02ce84df23_175 or not __cfbeed4503_51
. Parent then __cfbeed4503_51 . Parent = __610efd74e5_e4 : WaitForChild ( __1fa5f0b613_e9 [
( ( ( 43 * 17 + 5 ) % 257 + 252 ) % 257 * 121 ) % 257 ] ) end end __81540dc5aa_1 . SetPulse
( __a822508444_db . Pulse ) __81540dc5aa_1 . ApplyLayout ( ) __81540dc5aa_1 . Refit ( ) __81540dc5aa_1
. RefreshFloating ( ) __81540dc5aa_1 . ActivateTab ( __1fa5f0b613_e9 [ ( ( ( 10 * 17 + 5 )
% 257 + 252 ) % 257 * 121 ) % 257 ] ) print ( __1fa5f0b613_e9 [ ( ( ( 227 * 31 + 11 ) % 257
+ 246 ) % 257 * 199 ) % 257 ] )
