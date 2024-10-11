unit uPedido;

interface

uses System.Generics.Collections, uIPedido, uIProduto, system.UITypes;

type
  TPedido = class(TInterfacedObject, IPedido)
  private
    FProdutos: TList<IProduto>;
    function GetProdutos: TList<IProduto>;
    procedure AdicionarProduto(const AProduto: IProduto);
    procedure RemoverProduto(const AProduto: IProduto);
    function CalcularTotal: Currency;
    property Produtos: TList<IProduto> read GetProdutos;
  end;

implementation

function TPedido.GetProdutos: TList<IProduto>;
begin
  if FProdutos = nil then
    FProdutos := TList<IProduto>.Create;
  Result := FProdutos;
end;

procedure TPedido.AdicionarProduto(const AProduto: IProduto);
begin
  Produtos.Add(AProduto);
end;

procedure TPedido.RemoverProduto(const AProduto: IProduto);
begin
  Produtos.Remove(AProduto);
end;

function TPedido.CalcularTotal: Currency;
var
  Produto: IProduto;
  Total: Currency;
begin
  Total := 0;
  for Produto in Produtos do
    Total := Total + Produto.GetPreco;
  Result := Total;
end;

end.
