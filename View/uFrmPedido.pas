unit uFrmPedido;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, uIPedido, uPedido, System.Rtti, uProduto, system.UITypes;

type
  TFrmPedido = class(TForm)
    Panel1: TPanel;
    lbTotalPedido: TLabel;
    PnlAddProduto: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtProduto: TEdit;
    edtUnitario: TMaskEdit;
    GridPedProd: TStringGrid;
    edtDesconto: TMaskEdit;
    Panel2: TPanel;
    btnAdicionar: TButton;
    btnExcluir: TButton;
    btnNovo: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    FProduto: TProduto;
    FPedido: IPedido;
    procedure ClearPedido;
    procedure ClearProduto;
    procedure AdicionaProduto;
    procedure RemoveerProduto;
    Procedure InitGrid();
    procedure ChangeGrid();
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPedido: TFrmPedido;

implementation

uses
  uAttribute, uIProduto;

{$R *.dfm}

procedure TFrmPedido.AdicionaProduto;
begin
  try
    if edtProduto.Text = EmptyStr then
      raise Exception.Create('Nome do produto inválido');

    if StrToFloatDef(edtUnitario.Text, 0) = 0 then
      raise Exception.Create('Valor produto inválido');

    FProduto := TProduto.Create;
    FProduto.Nome := edtProduto.Text;
    FProduto.Preco := StrToFloatDef(edtUnitario.Text, 0);
    if StrToFloatDef(edtDesconto.Text, 0) > 0 then
      FProduto.AplicarDesconto(StrToFloatDef(edtDesconto.Text, 0));

    FPedido.AdicionarProduto(FProduto);
    ChangeGrid;
    ClearProduto;
    edtProduto.SetFocus;
  except
    on E: Exception do
      MessageDlg(E.Message, mtWarning, [mbOK], 0);
  end;
end;

procedure TFrmPedido.ClearPedido;
begin
  ClearProduto;
  InitGrid();
  lbTotalPedido.Caption := 'Total Pedido: 0,00';
end;

procedure TFrmPedido.ClearProduto;
begin
  edtProduto.Text := EmptyStr;
  edtUnitario.Text := '0,00';
  edtDesconto.Text := '0,00';
end;

procedure TFrmPedido.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TFrmPedido.FormShow(Sender: TObject);
begin
  FPedido := TPedido.Create;
  InitGrid();
end;

// Inicializa o Grid
Procedure TFrmPedido.InitGrid();
var
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  iCol: Integer;
  Contexto: TRttiContext;
  TypObj: TRttiType;
begin
  GridPedProd.RowCount := 2;
  GridPedProd.Rows[1].Clear;
  GridPedProd.ColCount := 1;

  TypObj := Contexto.GetType(TProduto.ClassInfo);
  iCol := 0;
  for Prop in TypObj.GetProperties do
  begin
    for Atributo in Prop.GetAttributes do
    begin
      if Atributo is DisplayLabel then
      begin
        if (DisplayLabel(Atributo).Visible) then
        begin
          GridPedProd.Cells[iCol, 0] := DisplayLabel(Atributo).Name;
          inc(iCol);
          GridPedProd.ColCount := iCol;
          GridPedProd.ColWidths[iCol - 1] := DisplayLabel(Atributo).Size;
        end;
        Break;
      end;
    end;
  end;
  edtProduto.SetFocus;
end;

procedure TFrmPedido.RemoveerProduto;
begin
  if (GridPedProd.Row >= 1) and (FPedido.Produtos.Count > 0) then
  begin
    if (MessageDlg('Deseja deletar o produto?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    begin
      FProduto := TProduto(GridPedProd.Objects[0, GridPedProd.Row]);
      FPedido.RemoverProduto(FProduto);
      ChangeGrid;
      edtProduto.SetFocus;
    end;
  end;
end;

procedure TFrmPedido.btnAdicionarClick(Sender: TObject);
begin
  AdicionaProduto;
end;

procedure TFrmPedido.btnNovoClick(Sender: TObject);
begin
  FPedido.Produtos.Clear;
  ClearPedido;
end;

procedure TFrmPedido.btnExcluirClick(Sender: TObject);
begin
  RemoveerProduto;
end;

// Carrega os itens do pedido no grid
procedure TFrmPedido.ChangeGrid();
var
  Prop: TRttiProperty;
  Atributo: TCustomAttribute;
  iCol, iRow: Integer;
  lProduto: IProduto;
  Contexto: TRttiContext;
  TypObj: TRttiType;
begin
  GridPedProd.RowCount := 2;
  GridPedProd.Rows[1].Clear;
  iRow := 1;
  for lProduto in FPedido.Produtos do
  begin
    TypObj := Contexto.GetType(TObject(lProduto).ClassInfo);
    iCol := 0;
    GridPedProd.Objects[iCol, iRow] := TObject(lProduto);
    for Prop in TypObj.GetProperties do
    begin
      for Atributo in Prop.GetAttributes do
      begin
        if Atributo is DisplayLabel then
        begin
          if (DisplayLabel(Atributo).Visible) then
          begin
            case Prop.PropertyType.TypeKind of
              tkFloat:
                GridPedProd.Cells[iCol, iRow] := FormatFloat('###,##0.00', Prop.GetValue(TObject(lProduto)).AsExtended);
            else
              GridPedProd.Cells[iCol, iRow] := Prop.GetValue(TObject(lProduto)).AsVariant;
            end;
            inc(iCol);
          end;
          Break;
        end;
      end;
    end;
    inc(iRow);
    GridPedProd.RowCount := iRow;
  end;
  lbTotalPedido.Caption := 'Total Pedido: ' + FormatFloat('###,##0.00', FPedido.CalcularTotal);
end;

end.
