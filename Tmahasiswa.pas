unit Tmahasiswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids;

type
  Tflmahasiswa = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Panel2: TPanel;
    Label2: TLabel;
    Button1: TButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  flmahasiswa: Tflmahasiswa;
  e : Integer;
  s : string;
implementation

uses Unit12;

{$R *.dfm}

 end.




