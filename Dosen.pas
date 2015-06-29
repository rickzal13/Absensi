unit Dosen;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, pngimage;

type
  TULdosen = class(TForm)
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    Label3: TLabel;
    cmb_mka: TComboBox;
    Label4: TLabel;
    txt_kode: TEdit;
    Label6: TLabel;
    txt_nama: TEdit;
    Label10: TLabel;
    txt_kelas: TEdit;
    cmb_cari: TComboBox;
    txt_cari: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Timer1: TTimer;
    Label15: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Image4: TImage;
    Image3: TImage;
    Label5: TLabel;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure cmb_mkaDropDown(Sender: TObject);
    // procedure Button1Click(Sender: TObject);
    procedure txt_cariChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure Image4Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
    procedure aktif;
    procedure taktif;
    procedure segar1;
    procedure tampil;
    procedure update;
  end;

var
  ULdosen: TULdosen;
  d, h, o, z: string;

implementation

uses Unit12, Dabsensi, lpdosen, Unit10;
{$R *.dfm}

procedure TULdosen.aktif;
begin
  txt_kode.Enabled := true;
  txt_nama.Enabled := true;
  txt_kelas.Enabled := true;

end;

procedure TULdosen.bersih;
begin
  txt_kode.Clear;
  txt_nama.Clear;
  txt_kelas.Clear;
end;

procedure TULdosen.cmb_mkaDropDown(Sender: TObject);
begin
  cmb_mka.Clear;
  with dm.ADO_jadwal do
  begin
    SQL.Clear;
    SQL.Add('select * from tbjadwal');
    Open;
    while not Eof do
    begin
      cmb_mka.Items.Add(FieldByName('matakuliah').Value);
      Next;
    end;
  end;
end;

procedure TULdosen.DBGrid1CellClick(Column: TColumn);
begin
  with dm.ADO_absen_dosen do
  begin
    txt_kode.Text := FieldValues['id_kartu'];
    txt_nama.Text := FieldValues['nama'];
    txt_kelas.Text := FieldValues['kelas'];
  end;
end;

procedure TULdosen.txt_cariChange(Sender: TObject);
begin
  if cmb_cari.Text = 'NAMA' then
  begin
    with dm.ADO_absen_dosen do
    begin
      SQL.Clear;
      SQL.Text := ('select * from tbabsensi_dosen where nama like ' + QuotedStr
          ('%' + txt_cari.Text + '%'));
      Open;
      DBGrid1.DataSource := dm.Data_absen_dosen;
    end;
  end
  else if cmb_cari.Text = 'MATAKULIAH' then
  begin
    with dm.ADO_absen_dosen do
    begin
      SQL.Clear;
      SQL.Text := ('select * from tbabsensi_dosen mk like ' + QuotedStr
          ('%' + txt_cari.Text + '%'));
      Open;
      DBGrid1.DataSource := dm.Data_absen_dosen;
    end;
  end
end;

procedure TULdosen.FormActivate(Sender: TObject);
begin
  { with dm.ADO_tes_lgi do
    begin
    z := cmb_mka.Text;
    SQL.Add(' INSERT INTO tbabsensi_dosen (id_kartu, hari, tgl, nama, mk, kelas, jam_msk, ket) SELECT     a.id_kartu, b.hari, ' +  QuotedStr(Label14.Caption) + ' AS Expr1, b.nama_dosen, b.matakuliah, b.kelas, b.waktu,' +  QuotedStr('TIDAK HADIR') + 'AS Expr2 FROM tbdosen AS a LEFT OUTER JOIN tbmatakuliah AS b ON a.nama = b.nama_dosen ');
    ExecSQL;
    Application.MessageBox('sukses tersimpan', 'pesan',
    MB_ICONINFORMATION);
    segar1;
    end;
    }
  segar1;
end;

procedure TULdosen.FormCreate(Sender: TObject);
begin
  bersih;
  taktif;

end;

procedure TULdosen.Image3Click(Sender: TObject);
begin
  lprdosen.lap_dosen.Preview;
end;

procedure TULdosen.Image4Click(Sender: TObject);
begin
  with dm.ADO_absen_dosen do
  begin
    Edit;
    if RadioButton1.Checked then
    begin
      FieldByName('ket').Value := 'HADIR';
    end
    else if RadioButton2.Checked then
    begin
      FieldByName('ket').Value := 'TIDAK HADIR';
    end;
    post;
    Application.MessageBox('Data Keterangan Sudah Diubah', '::::Pesan::::',
      MB_ICONINFORMATION);
    bersih;
  end;

end;

procedure TULdosen.segar1;
begin
  with dm.ADO_absen_dosen do
  begin
    SQL.Clear;
    SQL.Add('select * from tbabsensi_dosen where tgl = ' + QuotedStr
        (Label14.Caption));
    Open;
  end
end;

procedure TULdosen.taktif;
begin
  // txt_kode.Enabled := False;
  txt_nama.Enabled := False;
  txt_kelas.Enabled := False;
end;

procedure TULdosen.tampil;
begin
  if dm.ADO_absen_dosen.Locate('id_kartu', txt_kode.Text, []) then
  Begin
    With dm.ADO_absen_dosen do
    Begin
      txt_nama.Text := FieldValues['nama'];
      txt_kelas.Text := FieldValues['kelas'];
    End;
    RadioButton1.Checked := true;
    update;
    Timer2.Enabled := true;

  End
  else
  Begin
    Application.MessageBox('Maaf.. Anda tidak terdaftar', 'pesan',
      MB_ICONINFORMATION);
  End;
  // edit1.Clear;

end;

procedure TULdosen.Timer1Timer(Sender: TObject);
begin
  Label8.Caption := Form11.Label15.Caption;
  Label12.Caption := TimeToStr(Time);
  Label14.Caption := DateToStr(Date);
  if Label8.Caption = 'Sunday' then
    i := 'MINGGU'
  else if Label8.Caption = 'Monday' then
    i := 'SENIN'
  else if Label8.Caption = 'Tuesday' then
    i := 'SELASA'
  else if Label8.Caption = 'Wednesday' then
    i := 'RABU'
  else if Label8.Caption = 'Thursday' then
    i := 'KAMIS'
  else if Label8.Caption = 'Friday' then
    i := 'JUMAT'
  else if Label8.Caption = 'Saturday' then
    i := 'SABTU';
  if dm.ADO_umk.RecordCount <> 0 then
  begin
    // if ULdosen.Active = true then
    // begin
    with dm.ADO_umk do
    begin
      o := FieldValues['waktu'];
      h := FieldValues['hari'];
      d := Label8.Caption;
      if ((i = h) and (StrToTime(Label12.Caption) = StrToTime(o))) then
      begin
        cmb_mka.Text := FieldValues['matakuliah'];
        with dm.ADO_tes_lgi do
        begin
          z := cmb_mka.Text;
          SQL.Add(
            'INSERT INTO tbabsensi_dosen (id_kartu, hari, tgl, nama, mk, kelas, jam_msk, ket) SELECT a.id_kartu, b.hari,' + QuotedStr
              (Label14.Caption)
              + ' AS Expr1, b.nama_dosen, b.matakuliah, b.kelas, b.waktu, ' +
              QuotedStr('TIDAK HADIR') +
              'AS Expr2 FROM tbdosen AS a LEFT OUTER JOIN tbmatakuliah AS b ON a.nama = b.nama_dosen where b.matakuliah = ' + QuotedStr(cmb_mka.Text));
          ExecSQL;
          segar1;
          // end;
        end
      end;
    end;

  end;

end;

procedure TULdosen.Timer2Timer(Sender: TObject);
begin
  kehadiran.txt_nim.Caption := '------';
  kehadiran.Label7.Caption :=  txt_nama.Text;
  kehadiran.Label8.Caption :=  '------';
  kehadiran.Label9.Caption :=  '------';
  kehadiran.Label10.Caption := txt_kelas.Text;
  kehadiran.Label12.Caption := 'HADIR';
  kehadiran.Show;
  bersih;
  Timer2.Enabled := false;
end;

procedure TULdosen.update;
begin
  with dm.ADO_absen_dosen do
  begin
    begin
      SQL.Text := ('update tbabsensi_dosen set ket = ' + QuotedStr('HADIR') + ',jam_msk_dosen = ' + QuotedStr(Label12.Caption)
          + '  where nama = ' + QuotedStr(txt_nama.Text)
          + 'and tgl = ' + QuotedStr(Label14.Caption));
      ExecSQL;
      with dm.ADO_tes do
      begin
        SQL.Add(
          'INSERT INTO tbabsensi (idcard,Tanggal,nim, nama, jurusan, program_studi, kelas,mata_kuliah, alfa,sakit,izin,hadir) SELECT idcard,' + QuotedStr(Label14.Caption) + ',nim, nama, jurusan, programstudi,kelas,' + QuotedStr(cmb_mka.Text) + ',2,0,0,0 AS Expr1 FROM tbmahasiswa');
        ExecSQL;
       Form11.segar_lgi;
      end;
   //   Application.MessageBox('sukses tersimpan', 'pesan', MB_ICONINFORMATION);
      // Application.MessageBox('Data Sudah Diubah','::::Pesan::::', MB_ICONINFORMATION);
    end;
    segar1;
  end;

end;

end.
