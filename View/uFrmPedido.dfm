object FrmPedido: TFrmPedido
  Left = 0
  Top = 0
  Caption = 'Pedido'
  ClientHeight = 567
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 523
    Width = 619
    Height = 44
    Align = alBottom
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    TabStop = True
    ExplicitLeft = 3
    ExplicitTop = 526
    object lbTotalPedido: TLabel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 279
      Height = 36
      Align = alLeft
      AutoSize = False
      Caption = ' Total Pedido: 0,00'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
      ExplicitLeft = 148
      ExplicitTop = 3
    end
    object btnNovo: TButton
      AlignWithMargins = True
      Left = 496
      Top = 7
      Width = 119
      Height = 30
      Cursor = crHandPoint
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alRight
      Caption = 'NOVO PEDIDO'
      TabOrder = 0
      OnClick = btnNovoClick
      ExplicitLeft = 367
      ExplicitTop = 6
    end
  end
  object PnlAddProduto: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 0
    Width = 613
    Height = 57
    Margins.Top = 0
    Align = alTop
    BevelInner = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 12
      Top = 8
      Width = 88
      Height = 13
      Caption = 'Informe o Produto'
    end
    object Label4: TLabel
      Left = 430
      Top = 8
      Width = 53
      Height = 13
      Caption = 'R$ Unit'#225'rio'
    end
    object Label5: TLabel
      Left = 525
      Top = 8
      Width = 59
      Height = 13
      Caption = '% Desconto'
    end
    object edtProduto: TEdit
      AlignWithMargins = True
      Left = 12
      Top = 24
      Width = 412
      Height = 21
      Margins.Left = 10
      Margins.Top = 22
      Margins.Bottom = 10
      Align = alLeft
      TabOrder = 0
    end
    object edtUnitario: TMaskEdit
      AlignWithMargins = True
      Left = 430
      Top = 24
      Width = 89
      Height = 21
      Margins.Top = 22
      Margins.Bottom = 10
      Align = alLeft
      Alignment = taRightJustify
      TabOrder = 1
      Text = '0,00'
      ExplicitLeft = 431
      ExplicitTop = 29
    end
    object edtDesconto: TMaskEdit
      AlignWithMargins = True
      Left = 525
      Top = 24
      Width = 80
      Height = 21
      Margins.Top = 22
      Margins.Bottom = 10
      Align = alLeft
      Alignment = taRightJustify
      TabOrder = 2
      Text = '0,00'
    end
  end
  object GridPedProd: TStringGrid
    AlignWithMargins = True
    Left = 3
    Top = 105
    Width = 613
    Height = 415
    TabStop = False
    Align = alClient
    Color = clWhite
    ColCount = 1
    DefaultColWidth = 70
    DefaultRowHeight = 18
    DrawingStyle = gdsGradient
    FixedColor = clSilver
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect, goFixedRowDefAlign]
    TabOrder = 3
    ExplicitLeft = 8
  end
  object Panel2: TPanel
    AlignWithMargins = True
    Left = 3
    Top = 60
    Width = 613
    Height = 42
    Margins.Top = 0
    Margins.Bottom = 0
    Align = alTop
    BevelInner = bvLowered
    Color = clWhite
    ParentBackground = False
    TabOrder = 1
    object btnAdicionar: TButton
      AlignWithMargins = True
      Left = 522
      Top = 8
      Width = 86
      Height = 26
      Cursor = crHandPoint
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alRight
      Caption = 'ADICIONAR'
      TabOrder = 0
      OnClick = btnAdicionarClick
      ExplicitLeft = 519
      ExplicitTop = 9
      ExplicitHeight = 23
    end
    object btnExcluir: TButton
      AlignWithMargins = True
      Left = 430
      Top = 8
      Width = 86
      Height = 26
      Cursor = crHandPoint
      Margins.Top = 6
      Margins.Bottom = 6
      Align = alRight
      Caption = 'EXCLUIR'
      TabOrder = 1
      TabStop = False
      OnClick = btnExcluirClick
      ExplicitLeft = 214
      ExplicitTop = 10
    end
  end
end
