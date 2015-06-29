unit Lmk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, pngimage, ImgList;

type
  TFmk = class(TForm)
    Panel1: TPanel;
    txt_cari: TEdit;
    DBGrid1: TDBGrid;
    cmb_cri: TComboBox;
    Panel2: TPanel;
    Image2: TImage;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    ImageList1: TImageList;
    procedure txt_cariChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fmk: TFmk;

implementation

uses Unit12;

{$R *.dfm}

procedure TFmk.Button1Click(Sender: TObject);
begin
close;
end;

procedure TFmk.txt_cariChange(Sender: TObject);
begin
  if cmb_cri.Text = 'KODE MK' then
  begin
    with dm.ADO_umk do
    begin
      sql.Clear;
      sql.Text:= ('select * from tbmatakuliah where Kode_matakuliah like '+QuotedStr('%'+txt_cari.Text+'%'));
      Open;
      DBGrid1.DataSource:= dm.Data_umk;
    end;
  end
else if cmb_cri.Text = 'MATA KULIAH' then
  begin
    with dm.ADO_umk do
    begin
      sql.Clear;
      sql.Text:= ('select * from tbmatakuliah where matakuliah like '+QuotedStr('%'+txt_cari.Text+'%'));
      Open;
      DBGrid1.DataSource:= dm.Data_umk;
    end;
  end
end;

end.
