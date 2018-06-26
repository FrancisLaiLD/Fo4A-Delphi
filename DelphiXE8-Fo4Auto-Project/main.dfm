object Form1: TForm1
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Fo4A v1.0'
  ClientHeight = 520
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 141
    Top = 13
    Width = 299
    Height = 25
    Caption = 'For supporting Fo4 '#39's gamer '
    Color = clFuchsia
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentColor = False
    ParentFont = False
  end
  object Label6: TLabel
    Left = 176
    Top = 224
    Width = 144
    Height = 16
    Caption = 'Waitting for new function'
  end
  object pagMain: TPageControl
    Left = 1
    Top = 53
    Width = 577
    Height = 457
    ActivePage = tabMainUI
    TabOrder = 0
    object tabMainUI: TTabSheet
      Caption = 'Giao di'#7879'n ch'#432#417'ng tr'#236'nh'
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grpboxMoreInfo: TGroupBox
        Left = 3
        Top = 264
        Width = 558
        Height = 162
        Caption = 'More information'
        TabOrder = 0
      end
      object grpboxQuickSetup: TGroupBox
        Left = 285
        Top = 0
        Width = 276
        Height = 267
        Caption = 'C'#224'i '#273#7863't nhanh'
        TabOrder = 1
      end
      object radgrpAutoFunc: TRadioGroup
        Left = 3
        Top = 0
        Width = 276
        Height = 267
        Caption = 'Ch'#7913'c n'#259'ng auto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemIndex = 0
        Items.Strings = (
          'T'#7841'm d'#7915'ng Auto'
          #272#225' gi'#7843' l'#7853'p v'#7899'i m'#225'y'
          #272#225' gi'#7843' l'#7853'p ng'#7851'u nhi'#234'n'
          #272#225' gi'#7843' l'#7853'p x'#7871'p h'#7841'ng'
          'Updating...')
        ParentFont = False
        TabOrder = 2
      end
    end
    object tabGeneralSetup: TTabSheet
      Caption = 'C'#224'i '#273#7863't chung'
      ImageIndex = 1
      ExplicitLeft = 0
      ExplicitTop = 0
      ExplicitWidth = 0
      ExplicitHeight = 0
      object grpVersionInfo: TGroupBox
        Left = 3
        Top = 264
        Width = 558
        Height = 161
        Caption = 'Th'#244'ng tin phi'#234'n b'#7843'n'
        TabOrder = 0
      end
      object grpRunningSetup: TGroupBox
        Left = 3
        Top = 0
        Width = 558
        Height = 265
        Caption = 'C'#224'i '#273#7863't auto'
        Color = clBtnFace
        ParentBackground = False
        ParentColor = False
        TabOrder = 1
        object lblSTTCurrentTime: TLabel
          Left = 264
          Top = 210
          Width = 112
          Height = 16
          Caption = 'Th'#7901'i gian hi'#7879'n t'#7841'i : '
        end
        object lblCurrentTime: TLabel
          Left = 382
          Top = 210
          Width = 15
          Height = 16
          Caption = '---'
        end
        object lblSTTGameStatus: TLabel
          Left = 193
          Top = 242
          Width = 136
          Height = 16
          Caption = 'Tr'#7841'ng th'#225'i '#273#259'ng nh'#7853'p : '
        end
        object lblGameStatus: TLabel
          Left = 335
          Top = 242
          Width = 15
          Height = 16
          Caption = '---'
        end
        object lblStopAutoByMatch: TLabel
          Left = 227
          Top = 49
          Width = 23
          Height = 16
          Caption = 'tr'#7853'n'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clCaptionText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object lblStopAutoByMin: TLabel
          Left = 202
          Top = 23
          Width = 25
          Height = 16
          Caption = 'ph'#250't'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clCaptionText
          Font.Height = -13
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label4: TLabel
          Left = 6
          Top = 210
          Width = 139
          Height = 16
          Caption = 'Th'#7901'i gian auto '#273#227' ch'#7841'y :'
        end
        object Label5: TLabel
          Left = 151
          Top = 210
          Width = 15
          Height = 16
          Caption = '---'
        end
        object btnQuickOutGame: TButton
          Left = 378
          Top = 237
          Width = 123
          Height = 25
          Caption = 'Tho'#225't game nhanh'
          TabOrder = 0
          OnClick = btnQuickOutGameClick
        end
        object cbxStopAutoByMatch: TCheckBox
          Left = 19
          Top = 50
          Width = 142
          Height = 17
          Caption = 'Ho'#7863'c d'#7915'ng auto sau :'
          TabOrder = 6
          OnClick = cbxStopAutoByMatchClick
        end
        object tedStopAutoByMatch: TEdit
          Left = 162
          Top = 46
          Width = 59
          Height = 24
          Enabled = False
          TabOrder = 7
          TextHint = 's'#7889' tr'#7853'n'
        end
        object cbxOutGarena: TCheckBox
          Left = 349
          Top = 37
          Width = 85
          Height = 14
          Caption = 'Tho'#225't garena'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object cbxShutdownComputer: TCheckBox
          Left = 446
          Top = 37
          Width = 56
          Height = 14
          Caption = 'T'#7855't m'#225'y'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
        end
        object cbxStopAutoByMin: TCheckBox
          Left = 19
          Top = 24
          Width = 112
          Height = 17
          Caption = 'D'#7915'ng auto sau :'
          TabOrder = 3
          OnClick = cbxStopAutoByMinClick
        end
        object tedStopAutoByMin: TEdit
          Left = 137
          Top = 20
          Width = 59
          Height = 24
          Enabled = False
          TabOrder = 4
          TextHint = 's'#7889' ph'#250't'
        end
        object cbxOutGame: TCheckBox
          Left = 264
          Top = 37
          Width = 76
          Height = 14
          Caption = 'Tho'#225't game'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          TabOrder = 5
        end
      end
    end
  end
end
