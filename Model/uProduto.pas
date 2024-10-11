unit uProduto;

interface

uses
  uIProduto, uAttribute, System.SysUtils;

type
  TProduto = class(TInterfacedObject, IProduto)
  private
    FPreco: Extended;
    FNome: string;
    FDesconto: Extended;
    function GetNome: string;
    function GetPreco: Extended;
  public
    procedure AplicarDesconto(APercDesconto: Extended);
    [DisplayLabel('Descrição Produto', True, 300)]
    property Nome: string read GetNome write FNome;
    [DisplayLabel('Preço', True, 90)]
    property Preco: Extended read GetPreco write FPreco;
    [DisplayLabel('Desconto', True, 90)]
    property Desconto: Extended read FDesconto write FDesconto;
  end;

implementation

{ TProduto }

procedure TProduto.AplicarDesconto(APercDesconto: Extended);
begin
  Desconto := FPreco * (APercDesconto / 100);
  if Desconto < FPreco then
    FPreco := FPreco - Desconto
  else
    raise Exception.Create('Valor de desconto inválido');
end;

function TProduto.GetNome: string;
begin
  Result := FNome
end;

function TProduto.GetPreco: Extended;
begin
  Result := FPreco;
end;

end.
