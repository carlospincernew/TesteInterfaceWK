unit uIPedido;

interface

uses
  uIProduto, System.Generics.Collections;

type
  IPedido = interface
    ['{C7EC3E53-31B7-4A3B-8F76-452F098F8E37}']
    procedure AdicionarProduto(const AProduto: IProduto);
    procedure RemoverProduto(const AProduto: IProduto);
    function CalcularTotal: Currency;
    function GetProdutos: TList<IProduto>;
    property Produtos: TList<IProduto> read GetProdutos;
  end;

implementation

end.
