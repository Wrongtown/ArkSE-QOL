WM_MOUSEOVER()
{
  ; Currently triggering unset static variable errors here
    global TT_CurrControl, TT_PrevControl, _TT  ; _TT is kept blank for use by the ToolTip command below.
    TT_CurrControl := A_GuiControl
    TT_PrevControl := ""
    _TT := ""
    If (TT_CurrControl <> TT_PrevControl and not InStr(TT_CurrControl, " "))
    {
        ; ToolTip  ; Turn off any previous tooltip.
        SetTimer, DisplayToolTip, 300
        TT_PrevControl := TT_CurrControl
    }
    return

    DisplayToolTip:
    SetTimer, DisplayToolTip, Off
    ToolTip % %TT_CurrControl%_TT  ; The leading percent sign tell it to use an expression.
    SetTimer, RemoveToolTip, 3000
    return

    RemoveToolTip:
    SetTimer, RemoveToolTip, Off
    ToolTip
    return
}
Return