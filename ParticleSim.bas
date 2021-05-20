'                            Extended Keyboard Press Scancodes
'
'  Esc  F1 F2 F3 F4 F5 F6 F7 F8 F9 F10  F11 F12   SysReq ScrL Pause
'   1   59 60 61 62 63 64 65 66 67 68   87  88     0     70    29
'  `~  1! 2@ 3# 4$ 5% 6^ 7& 8* 9( 0) -_ =+ BkSpc  Insert Home PgUp   NumL   /     *    -
'   41 2  3  4  5  6  7  8  9  10 11 12 13  14     82    71    73     69    53    55   74
'  Tab  Q  W  E  R  T  Y  U  I  O  P  [{ ]} \|    Delete End  PgDn   7/Home 8/?  9/PU  +
'   15  16 17 18 19 20 21 22 23 24 25 26 27 43     83    79    81     71    72    73   78
'  CapL  A  S  D  F  G  H  J  K  L  ;: '"  Enter                     4/?-   5    6/-?  E
'   58   30 31 32 33 34 35 36 37 38 39 40   28                        75    76    77   n
'  Shift  Z  X  C  V  B  N  M  ,< .> /?    Shift         ?           1/End  2/?  3/PD  t
'   42    44 45 46 47 48 49 50 51 52 53     54           72           79    80    81   e
'  Ctrl Win Alt    Spacebar    Alt Win Menu Ctrl     ?-  ?   -?      0/Insert    ./Del r
'   29  91  56        57       56  92   93  29       75  80  77       82          83   28
'
'   QB64 codes only! Release codes = Press code + 128. Pause/Break may lock code returns.

Screen 12
colorToDraw = 6
penSize = 20
paused = 1
Color 7
_PaletteColor 7, &H992600
'Main Loop
Do: K$ = InKey$
    scancode% = Inp(&H60)
    If scancode% = 57 Then
        If paused = 0 Then
            paused = 1 ' Pauses the game.
        ElseIf paused = 1 Then
            paused = 0 ' Unpauses the game.
        End If
    End If

    If scancode% = 2 Then
        colorToDraw = 6
    ElseIf scancode% = 3 Then
        colorToDraw = 1
    ElseIf scancode% = 4 Then
        colorToDraw = 2
    ElseIf scancode% = 5 Then
        colorToDraw = 7
    ElseIf scancode% = 6 Then
        colorToDraw = 4
    End If
    a$ = InKey$


    Do While _MouseInput ' To Spawn the particle
        If _MouseButton(1) Then
            For i = _MouseX To _MouseX + penSize Step 1
                For ib = _MouseY To _MouseY + penSize Step 1
                    PSet (i, ib), colorToDraw
                Next
            Next
        ElseIf _MouseButton(2) Then
            For i = _MouseX To _MouseX + penSize Step 1
                For ib = _MouseY To _MouseY + penSize Step 1
                    PSet (i, ib), 0
                Next
            Next
        End If
    Loop

    If paused = 0 Then
        'Draws the particles after running physics calculations
        For pX = 640 To 1 Step -1
            For pY = 480 To 1 Step -1
                If Point(pX, pY) = 6 Then ' If the particle is sand.
                    If Point(pX, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX, pY + 1), 6
                    ElseIf Point(pX - 1, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY + 1), 6
                    ElseIf Point(pX + 1, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY + 1), 6
                    ElseIf Point(pX, pY + 1) = 1 Then
                        PSet (pX, pY), 1
                        PSet (pX, pY + 1), 6
                    ElseIf Point(pX - 1, pY + 1) = 1 Then
                        PSet (pX, pY), 1
                        PSet (pX - 1, pY + 1), 6
                    ElseIf Point(pX + 1, pY + 1) = 1 Then
                        PSet (pX, pY), 1
                        PSet (pX + 1, pY + 1), 6
                    ElseIf Point(pX, pY + 1) = 2 Then
                        PSet (pX, pY), 0
                        PSet (pX, pY + 1), 0
                    End If
                ElseIf Point(pX, pY) = 1 Then ' If the particle is water.
                    If Point(pX, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX, pY + 1), 1
                    ElseIf Point(pX - 1, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY + 1), 1
                    ElseIf Point(pX + 1, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY + 1), 1
                    ElseIf Point(pX - 1, pY) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY), 1
                    ElseIf Point(pX + 1, pY) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY), 1

                        ' The Obsidian Formation Code
                        'ElseIf Point(pX, pY + 1) = 4 Then
                        '    PSet (pX, pY), 0
                        '    PSet (pX, pY + 1), 8
                        'ElseIf Point(pX - 1, pY + 1) = 4 Then
                        '    PSet (pX, pY), 0
                        '    PSet (pX - 1, pY + 1), 8
                        'ElseIf Point(pX + 1, pY + 1) = 4 Then
                        '    PSet (pX, pY), 0
                        '    PSet (pX + 1, pY + 1), 8
                        'ElseIf Point(pX - 1, pY) = 4 Then
                        '    PSet (pX, pY), 0
                        '    PSet (pX - 1, pY), 8
                        'ElseIf Point(pX + 1, pY) = 4 Then
                        '    PSet (pX, pY), 0
                        '    PSet (pX + 1, pY), 8
                    End If
                ElseIf Point(pX, pY) = 2 Then ' If the particle is acid.
                    ' If the particle interacting with is air
                    If Point(pX, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX, pY + 1), 2
                    ElseIf Point(pX - 1, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY + 1), 2
                    ElseIf Point(pX + 1, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY + 1), 2
                    ElseIf Point(pX - 1, pY) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY), 2
                    ElseIf Point(pX + 1, pY) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY), 2

                        ' If the particle interacting with is sand
                    ElseIf Point(pX, pY + 1) = 6 Then
                        PSet (pX, pY), 0
                        PSet (pX, pY + 1), 0
                    ElseIf Point(pX - 1, pY + 1) = 6 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY + 1), 0
                    ElseIf Point(pX + 1, pY + 1) = 6 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY + 1), 0
                    ElseIf Point(pX - 1, pY) = 6 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY), 0
                    ElseIf Point(pX + 1, pY) = 6 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY), 0

                        ' If the particle interacting with is wood
                    ElseIf Point(pX, pY + 1) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX, pY + 1), 0
                    ElseIf Point(pX - 1, pY + 1) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY + 1), 0
                    ElseIf Point(pX + 1, pY + 1) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY + 1), 0
                    ElseIf Point(pX - 1, pY) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY), 0
                    ElseIf Point(pX + 1, pY) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY), 0
                    End If
                ElseIf Point(pX, pY) = 4 Then
                    If Point(pX, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX, pY + 1), 4
                    ElseIf Point(pX - 1, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY + 1), 4
                    ElseIf Point(pX + 1, pY + 1) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY + 1), 4
                    ElseIf Point(pX - 1, pY) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY), 4
                    ElseIf Point(pX + 1, pY) = 0 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY), 4

                    ElseIf Point(pX, pY + 1) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX, pY + 1), 0
                    ElseIf Point(pX - 1, pY + 1) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY + 1), 0
                    ElseIf Point(pX + 1, pY + 1) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY + 1), 0
                    ElseIf Point(pX - 1, pY) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX - 1, pY), 0
                    ElseIf Point(pX + 1, pY) = 7 Then
                        PSet (pX, pY), 0
                        PSet (pX + 1, pY), 0

                    End If
                End If
            Next
        Next
    End If

Loop Until K$ = Chr$(27)
System
