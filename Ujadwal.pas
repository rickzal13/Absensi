unit Ujadwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, ImgList, Mask;

type
  TForm7 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBGrid1: TDBGrid;
    image: TImageList;
    txt_kode: TEdit;
    Image2: TImage;
    Image1: TImage;
    Panel2: TPanel;
    btn_batal: TButton;
    btn_hapus: TButton;
    btn_tambah: TButton;
    btn_edit: TButton;
    btn_simpan: TButton;
    Label6: TLabel;
    Button1: TButton;
    txt_mk: TEdit;
    txt_cari: TEdit;
    cmb_cri: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure btn_simpanClick(Sender: TObject);
    procedure btn_editClick(Sender: TObject);
    procedure btn_tambahClick(Sender: TObject);
    procedure btn_hapusClick(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Button1Click(Sender: TObject);
    procedure txt_cariChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
    procedure aktif;
    procedure taktif;
  end;

var
  Form7: TForm7;

implementation

uses Unit12;

{$R *.dfm}


procedure TForm7.bersih;
begin
     txt_kode.Clear;
     txt_mk.Clear;


end;
procedure TForm7.btn_batalClick(Sender: TObject);
begin
  bersih;
  taktif;
  btn_tambah.Enabled := true;
end;

procedure TForm7.btn_editClick(Sender: TObject);
begin
        if btn_edit.Caption='Edit' then
    Begin
       btn_edit.Caption:='update';
       aktif;
       btn_simpan.Enabled := false;
       btn_hapus.Enabled := false;
       btn_tambah.Enabled := false;
       txt_kode.SetFocus;
    end
  Else
    begin
     with dm.ADO_jadwal do
    begin
      Edit;
      FieldByName('kode_matakuliah').Value:=txt_kode.Text;
      FieldByName('matakuliah').Value:=txt_mk.Text;
      Post;
    end;
       Application.MessageBox('Data berhasil diUpdate','Info Update',MB_ICONINFORMATION);
       btn_edit.Caption:='Edit';
       Bersih;
       taktif;
       btn_tambah.Enabled := true;
    End;
end;

procedure TForm7.btn_hapusClick(Sender: TObject);
begin
      with dm.ADO_jadwal do
  begin
    Delete;
  end;
  Application.MessageBox('Data berhasil dihapus','Hapus',MB_ICONINFORMATION);
  bersih;
  taktif;
  btn_tambah.Enabled := True;
end;

procedure TForm7.btn_simpanClick(Sender: TObject);
begin

   if (txt_kode.Text<>'')  then// and (txtalmt.Text <>'') and (txthp.Text<>'') then
    with dm.ADO_jadwal do
    begin
      Append;
      FieldByName('kode_matakuliah').Value:=txt_kode.Text;
      FieldByName('matakuliah').Value:=txt_mk.Text;
      Post;
      Application.MessageBox('sukses tersimpan','pesan',MB_ICONINFORMATION);
      bersih;
      taktif;
    end;


end;

procedure TForm7.btn_tambahClick(Sender: TObject);
begin
    aktif;
    btn_edit.Enabled := false;
    btn_hapus.Enabled := false;
end;

procedure TForm7.Button1Click(Sender: TObject);
begin
close;
end;

procedure TForm7.DBGrid1CellClick(Column: TColumn);
begin
      With dm.ADO_jadwal do
  Begin
     txt_kode.Text:=FieldValues['Kode_matakuliah'];
     txt_mk.Text:=FieldValues['matakuliah'];
  End;
  btn_edit.Enabled:=True;
  btn_hapus.Enabled:=True;
  btn_tambah.Enabled := false;
end;

procedure TForm7.txt_cariChange(Sender: TObject);
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

procedure TForm7.FormCreate(Sender: TObject);
begin
    bersih;
    taktif;
end;

procedure Tform7.aktif;
begin
    txt_kode.Enabled := true;
    txt_mk.Enabled := true;
    btn_simpan.Enabled := true;
    btn_edit.Enabled := true;
    btn_hapus.Enabled := true;
    txt_kode.SetFocus;
end;

procedure Tform7.taktif;
begin
    txt_kode.Enabled := False;
    txt_mk.Enabled := False;
    btn_simpan.Enabled := False;
    btn_edit.Enabled := False;
    btn_hapus.Enabled := False;
end;
end.
