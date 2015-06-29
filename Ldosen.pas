unit Ldosen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, ExtCtrls, pngimage, ImgList;

type
  TFdosen = class(TForm)
    Panel1: TPanel;
    txt_cari: TEdit;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    Panel2: TPanel;
    Image2: TImage;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    ImageList1: TImageList;
    procedure Image3Click(Sender: TObject);
    procedure txt_cariChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fdosen: TFdosen;

implementation

uses Unit12;

{$R *.dfm}

procedure TFdosen.txt_cariChange(Sender: TObject);
begin
if ComboBox1.Text = 'NIP' then
  begin
    with dm.ADO_dosen do
    begin
      sql.Clear;
      sql.Text:= ('select * from tbdosen where nim like '+QuotedStr('%'+txt_cari.Text+'%'));
      Open;
      DBGrid1.DataSource:= dm.Data_dosen;
    end;
  end
else if ComboBox1.Text = 'NAMA' then
  begin
    with dm.ADO_dosen do
    begin
      sql.Clear;
      sql.Text:= ('select * from tbdosen where nama like '+QuotedStr('%'+txt_cari.Text+'%'));
      Open;
      DBGrid1.DataSource:= dm.Data_dosen;
    end;
  end

end;

procedure TFdosen.Button1Click(Sender: TObject);
begin
close;
end;

procedure TFdosen.Image3Click(Sender: TObject);
begin
close;
end;

end.
