unit Ljadwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, pngimage, ExtCtrls, StdCtrls, Grids, DBGrids, ImgList;

type
  TFjadwal = class(TForm)
    Panel1: TPanel;
    txt_cari: TEdit;
    DBGrid1: TDBGrid;
    cmb_cri: TComboBox;
    Panel2: TPanel;
    Image5: TImage;
    Image6: TImage;
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
  Fjadwal: TFjadwal;

implementation

uses Unit12;

{$R *.dfm}

procedure TFjadwal.txt_cariChange(Sender: TObject);
begin
if cmb_cri.Text = 'KODE MK' then
  begin
    with dm.ADO_jadwal do
    begin
      sql.Clear;
      sql.Text:= ('select * from tbjadwal where Kode_matakuliah like '+QuotedStr('%'+txt_cari.Text+'%'));
      Open;
      DBGrid1.DataSource:= dm.Data_jadwal;
    end;
  end
  else if cmb_cri.Text = 'MATA KULIAH' then
  begin
    with dm.ADO_jadwal do
    begin
      sql.Clear;
      sql.Text:= ('select * from tbjadwal where matakuliah like '+QuotedStr('%'+txt_cari.Text+'%'));
      Open;
      DBGrid1.DataSource:= dm.Data_jadwal;
    end;
  end
end;

procedure TFjadwal.Button1Click(Sender: TObject);
begin
close;
end;

procedure TFjadwal.Image3Click(Sender: TObject);
begin
close;
end;

end.
