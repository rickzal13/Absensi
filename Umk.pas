unit Umk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, DBGrids, ImgList, pngimage, Mask;

type
  TForm8 = class(TForm)
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    cmb_kode: TComboBox;
    cmb_mk: TComboBox;
    cmb_nmdosen: TComboBox;
    cmb_jurusan: TComboBox;
    GroupBox2: TGroupBox;
    DBGrid1: TDBGrid;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    cmb_programstudi: TComboBox;
    txt_ruang: TEdit;
    cmb_hari: TComboBox;
    ImageList2: TImageList;
    txt_kls: TComboBox;
    Panel2: TPanel;
    btn_batal: TButton;
    btn_hapus: TButton;
    btn_tambah: TButton;
    btn_edit: TButton;
    btn_simpan: TButton;
    Label11: TLabel;
    Button1: TButton;
    txt_waktu: TMaskEdit;
    cmb_cari: TComboBox;
    txt_cari: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn_tambahClick(Sender: TObject);
    procedure btn_simpanClick(Sender: TObject);
    procedure cmb_nmdosenDropDown(Sender: TObject);
    procedure cmb_jurusanChange(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btn_editClick(Sender: TObject);
    procedure btn_hapusClick(Sender: TObject);
    procedure cmb_kodeDropDown(Sender: TObject);
    procedure txt_klsDropDown(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cmb_mkDropDown(Sender: TObject);
    procedure btn_batalClick(Sender: TObject);
    procedure txt_cariChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
    procedure aktif;
    procedure taktif;
    procedure pilihjurusan;
  end;

var
  Form8: TForm8;

implementation

uses Unit12, Dabsensi;

{$R *.dfm}

procedure TForm8.bersih;
begin
    cmb_kode.Text := '--Pilih--';
    cmb_mk.Text := '--Pilih--';
    cmb_nmdosen.Text := '--Pilih--';
    cmb_jurusan.Text := '--Pilih--';
    cmb_programstudi.Text := '--Pilih--';
    txt_ruang.Clear;
    txt_kls.Clear;
    txt_waktu.Clear;
    cmb_hari.Text := '--Pilih--';

end;
procedure TForm8.btn_batalClick(Sender: TObject);
begin
      bersih;
 taktif;
 btn_tambah.Enabled := true;
end;

procedure TForm8.btn_editClick(Sender: TObject);
begin
        if btn_edit.Caption='Edit' then
    Begin
       btn_edit.Caption:='update';
       aktif;
       btn_simpan.Enabled := false;
       btn_hapus.Enabled := false;
       btn_tambah.Enabled := false;
    end
  Else
    begin
     with dm.ADO_umk do
    begin
      Edit;
        FieldByName('Kode_matakuliah').Value := cmb_kode.Text;
        FieldByName('matakuliah').Value := cmb_mk.Text;
        FieldByName('nama_dosen').Value := cmb_nmdosen.Text;
        FieldByName('jurusan').Value := cmb_jurusan.Text;
        FieldByName('program_studi').Value := cmb_programstudi.Text;
        FieldByName('ruang').Value :=  txt_ruang.Text;
        FieldByName('kelas').Value := txt_kls.Text;
        FieldByName('hari').Value := cmb_hari.Text;
        FieldByName('waktu').Value := txt_waktu.Text;
      Post;
    end;
       Application.MessageBox('Data berhasil diUpdate','Info Update',MB_ICONINFORMATION);
       btn_edit.Caption:='Edit';
       Bersih;
       taktif;
       btn_tambah.Enabled := true;
    End;
end;

procedure TForm8.btn_hapusClick(Sender: TObject);
begin
      with dm.ADO_umk do
  begin
    Delete;
  end;
  Application.MessageBox('Data berhasil dihapus','Hapus',MB_ICONINFORMATION);
  bersih;
  taktif;
  btn_tambah.Enabled := True;

end;

procedure TForm8.btn_simpanClick(Sender: TObject);
begin
      //if (txtnim.Text<>'')and (txtnama.Text<>'') and (txtlahir.Text<>'')  then// and (txtalmt.Text <>'') and (txthp.Text<>'') then
    with dm.ADO_umk do
    begin
      Append;
        FieldByName('Kode_matakuliah').Value := cmb_kode.Text;
        FieldByName('matakuliah').Value := cmb_mk.Text;
        FieldByName('nama_dosen').Value := cmb_nmdosen.Text;
        FieldByName('jurusan').Value := cmb_jurusan.Text;
        FieldByName('program_studi').Value := cmb_programstudi.Text;
        FieldByName('ruang').Value :=  txt_ruang.Text;
        FieldByName('kelas').Value := txt_kls.Text;
        FieldByName('hari').Value := cmb_hari.Text;
        FieldByName('waktu').Value := txt_waktu.Text;
        Post;
        Application.MessageBox('sukses tersimpan','pesan',MB_ICONINFORMATION);
        bersih;
        taktif;
    end;
end;

procedure TForm8.btn_tambahClick(Sender: TObject);
begin
    aktif;
    btn_edit.Enabled := false;
end;

procedure TForm8.Button1Click(Sender: TObject);
begin
//form11.Timer6.Enabled := true;
close;
end;

procedure TForm8.cmb_jurusanChange(Sender: TObject);
begin
    cmb_programstudi.Clear;
    pilihjurusan;
end;

procedure TForm8.cmb_kodeDropDown(Sender: TObject);
begin
     cmb_kode.Clear;
    with dm.ADO_jadwal do
    begin
      SQL.Clear;
      SQL.Add('select * from tbjadwal');
      Open;
      while not Eof do
      begin
        cmb_kode.Items.Add(FieldByName('kode_matakuliah').Value);
        Next;
      end;
    end;
end;

procedure TForm8.cmb_mkDropDown(Sender: TObject);
begin
     cmb_mk.Clear;
    with dm.ADO_jadwal do
    begin
      SQL.Clear;
      SQL.Add('select * from tbjadwal');
      Open;
      while not Eof do
      begin
        cmb_mk.Items.Add(FieldByName('matakuliah').Value);
        Next;
      end;
    end;

end;

procedure TForm8.cmb_nmdosenDropDown(Sender: TObject);
begin
    cmb_nmdosen.Clear;
    with dm.ADO_dosen do
    begin
      SQL.Clear;
      SQL.Add('select * from tbdosen');
      Open;
      while not Eof do
      begin
        cmb_nmdosen.Items.Add(FieldByName('nama').Value);
        Next;
      end;
    end;


end;

procedure TForm8.txt_klsDropDown(Sender: TObject);
begin
    txt_kls.Clear;
    with dm.ADO_kelas do
    begin
      SQL.Clear;
      SQL.Add('select * from tbkelas');
      Open;
      while not Eof do
      begin
        txt_kls.Items.Add(FieldByName('kelas').Value);
        Next;
      end;
    end;
end;

procedure TForm8.DBGrid1CellClick(Column: TColumn);
begin
      With dm.ADO_umk do
  Begin
        cmb_kode.Text := FieldValues['Kode_matakuliah'];
        cmb_mk.Text := FieldValues['matakuliah'];
        cmb_nmdosen.Text := FieldValues['nama_dosen'];
        cmb_jurusan.Text := FieldValues['jurusan'];
        cmb_programstudi.Text := FieldValues['program_studi'];
        txt_ruang.Text := FieldValues['ruang'];
        txt_kls.Text := FieldValues['kelas'];
        cmb_hari.Text := FieldValues['hari'];
        txt_waktu.Text := FieldValues['waktu'];
  End;
  btn_edit.Enabled:=True;
  btn_hapus.Enabled:=True;
  btn_tambah.Enabled := false;
end;

procedure TForm8.txt_cariChange(Sender: TObject);
begin
if cmb_cari.Text = 'KODE MK' then
  begin
    with dm.ADO_umk do
    begin
      sql.Clear;
      sql.Text:= ('select * from tbmatakuliah where Kode_matakuliah like '+QuotedStr('%'+txt_cari.Text+'%'));
      Open;
      DBGrid1.DataSource:= dm.Data_umk;
    end;
  end
else if cmb_cari.Text = 'MATA KULIAH' then
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

procedure TForm8.FormCreate(Sender: TObject);
begin
    bersih;
    taktif;
end;

procedure TForm8.pilihjurusan;
begin
// cmbjurusan.Clear;
  if cmb_jurusan.Text='TEKNIK SIPIL' then
  begin
     cmb_programstudi.Items.Add('KONSTRUKSI GEDUNG');
     cmb_programstudi.Items.Add('KONSTRUKSI SIPIL');

    // cmbprogramstudi.Clear;
  end
 else if cmb_jurusan.Text='TEKNIK ELEKTRO' then
   begin
     cmb_programstudi.Items.Add('TEKNIK LISTRIK');
     cmb_programstudi.Items.Add('TEKNIK TELEKOMUNIKASI');
     cmb_programstudi.Items.Add('TEKNIK ELEKTRONIKA');
     cmb_programstudi.Items.Add('TEKNIK KOMPUTER JARINGAN');
   end
   else if cmb_jurusan.Text='TEKNIK KIMIA' then
   begin
     cmb_programstudi.Items.Add('TEKNIK KIMIA');
     cmb_jurusan.Items.Add('TEKNOLOGI KIMIA INDUSTRI');
     end
   else if cmb_jurusan.Text='TEKNIK MESIN' then
   begin
     cmb_programstudi.Items.Add('TEKNIK MESIN');
     cmb_programstudi.Items.Add('TEKNIK KONVER ENERGI');
  end
  else if cmb_jurusan.Text='ADMINISTRASI NIAGA' then
  begin
     cmb_programstudi.Items.Add('ADMINISTRASI BISNIS');
     cmb_programstudi.Items.Add('BISNIS EKSPOR-IMPOR');
  end
  else if cmb_jurusan.Text='AKUNTANSI' then
 begin
    cmb_programstudi.Items.Add('AKUNTANSI');
    cmb_programstudi.Items.Add('AKUNTASI MANAJERIAL');
  end

end;
procedure Tform8.aktif;
begin
    cmb_kode.Enabled := True;
    cmb_mk.Enabled := True;
    cmb_nmdosen.Enabled := True;
    cmb_jurusan.Enabled := True;
    cmb_programstudi.Enabled := True;
    cmb_hari.Enabled := True;
    txt_ruang.Enabled := True;
    txt_kls.Enabled := True;
    txt_waktu.Enabled := True;
    btn_simpan.Enabled := true;
    btn_edit.Enabled := true;
    btn_hapus.Enabled := true;

end;

procedure Tform8.taktif;
begin
   cmb_kode.Enabled := False;
    cmb_mk.Enabled := False;
    cmb_nmdosen.Enabled := False;
    cmb_jurusan.Enabled := False;
    cmb_programstudi.Enabled := False;
    cmb_hari.Enabled := False;
    txt_ruang.Enabled := False;
    txt_kls.Enabled := False;
    txt_waktu.Enabled := False;
    btn_simpan.Enabled := false;
    btn_edit.Enabled := false;
    btn_hapus.Enabled := false;
end;

end.
