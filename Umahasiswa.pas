unit Umahasiswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Grids, DBGrids, ImgList, ComCtrls, jpeg,
  pngimage,
  DB, ADODB;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    GroupBox2: TGroupBox;
    Label11: TLabel;
    Label14: TLabel;
    image: TImageList;
    Label15: TLabel;
    Label2: TLabel;
    txtnim: TEdit;
    txtnama: TEdit;
    cmbjurusan: TComboBox;
    cmbprogramstudi: TComboBox;
    cmbkelas: TComboBox;
    Label7: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label17: TLabel;
    txtlahir: TEdit;
    txttgl: TDateTimePicker;
    txtalmt: TEdit;
    txthp: TEdit;
    DBGrid1: TDBGrid;
    txtcari: TEdit;
    ComboBox7: TComboBox;
    Panel1: TPanel;
    Label16: TLabel;
    Image1: TImage;
    Image2: TImage;
    perempuan: TRadioButton;
    laki: TRadioButton;
    Label3: TLabel;
    Label12: TLabel;
    Label1: TLabel;
    ComboBox1: TComboBox;
    txtidCard: TEdit;
    Label10: TLabel;
    Panel2: TPanel;
    batal: TButton;
    Hapus: TButton;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Label13: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure batalClick(Sender: TObject);
    procedure cmbprogramstudiExit(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure HapusClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure txtcariChange(Sender: TObject);
    procedure cmbkelasDropDown(Sender: TObject);
    procedure txtnimExit(Sender: TObject);
    procedure cmbjurusanChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure bersih;
    procedure pilih_jurusan;
    procedure aktif;
    procedure taktif;
  end;

var
  Form2: TForm2;

implementation

uses Unit12;
{$R *.dfm}

procedure TForm2.bersih;
begin
  txtidCard.Clear;
  txtnim.Clear;
  txtnama.Clear;
  txtlahir.Clear;
  cmbprogramstudi.Clear;
  ComboBox1.Text := '--pilih--';
  cmbjurusan.Text := '--pilih--';
  cmbprogramstudi.Text := '--pilih--';
  cmbkelas.Text := '--pilih--';
  txtalmt.Clear;
  txthp.Clear;
  // cmbkelas.Clear;
  // cmbjurusan.Clear;
  // cmbprogramstudi.Clear;

end;

procedure TForm2.aktif;
begin
  txtidCard.Enabled := true;
  txtnim.Enabled := true;
  txtnama.Enabled := true;
  cmbjurusan.Enabled := true;
  cmbprogramstudi.Enabled := true;
  cmbkelas.Enabled := true;
  txttgl.Enabled := true;
  txtlahir.Enabled := true;
  ComboBox1.Enabled := true;
  laki.Enabled := true;
  perempuan.Enabled := true;
  txtalmt.Enabled := true;
  txthp.Enabled := true;
  Button1.Enabled := true;
  Button2.Enabled := true;
  Hapus.Enabled := true;
  txtnim.SetFocus;
end;

procedure TForm2.taktif;
begin
  txtidCard.Enabled := false;
  txtnim.Enabled := false;
  txtnama.Enabled := false;
  cmbjurusan.Enabled := false;
  cmbprogramstudi.Enabled := false;
  cmbkelas.Enabled := false;
  txttgl.Enabled := false;
  laki.Enabled := false;
  txtlahir.Enabled := false;
  ComboBox1.Enabled := false;
  perempuan.Enabled := false;
  txtalmt.Enabled := false;
  txthp.Enabled := false;
  Button1.Enabled := false;
  Button2.Enabled := false;
  Hapus.Enabled := false;
end;

procedure TForm2.txtcariChange(Sender: TObject);
begin
  if ComboBox7.Text = 'NIM' then
  begin
    with dm.ADO_Mhs do
    begin
      sql.Clear;
      sql.Text := ('select * from tbmahasiswa where nim like ' + QuotedStr
          ('%' + txtcari.Text + '%'));
      Open;
      DBGrid1.DataSource := dm.Data_mhs;
    end;
  end
  else if ComboBox7.Text = 'NAMA' then
  begin
    with dm.ADO_Mhs do
    begin
      sql.Clear;
      sql.Text := ('select * from tbmahasiswa where nama like ' + QuotedStr
          ('%' + txtcari.Text + '%'));
      Open;
      DBGrid1.DataSource := dm.Data_mhs;
    end;
  end
end;

procedure TForm2.txtnimExit(Sender: TObject);
begin
  if txtnim.Text = '' then
  begin
    Application.MessageBox('NIM Tidak boleh kosong', '.::::info::::.',
      MB_ICONINFORMATION);
    txtnim.SetFocus;
  end
  else
    case StrToInt(copy(txtnim.Text, 2, 1)) of
      2:
        BEGIN
          cmbjurusan.Text := 'TEKNIK ELEKTRO';
          case StrToInt(copy(txtnim.Text, 3, 1)) of
            1:
              cmbprogramstudi.Text := 'TEKNIK LISTRIK';
            2:
              cmbprogramstudi.Text := 'TEKNIK TELEKOMUNIKASI';
            3:
              cmbprogramstudi.Text := 'TEKNIK ELEKTRONIKA';
            5:
              cmbprogramstudi.Text := 'TEKNIK KOMPUTER JARINGAN';
          end;

        END;
    end;

end;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if dm.ADO_Mhs.Locate('idcard', txtidCard.Text, []) then
  begin
    Application.MessageBox(
      'Kode Absensi Tidak boleh sama...!!! Silahkan Coba kartu yang lain..!',
      'Warning', MB_ICONWARNING);
    bersih;
  end
  else
  begin
    if (txtnim.Text <> '') and (txtnama.Text <> '') and (txtlahir.Text <> '')
      then // and (txtalmt.Text <>'') and (txthp.Text<>'') then
    begin
      with dm.ADO_Mhs do
      begin
        Append;
        FieldByName('idcard').Value := txtidCard.Text;
        FieldByName('nim').Value := txtnim.Text;
        FieldByName('nama').Value := txtnama.Text;
        FieldByName('jurusan').Value := cmbjurusan.Text;
        FieldByName('programstudi').Value := cmbprogramstudi.Text;
        FieldByName('kelas').Value := cmbkelas.Text;
        FieldByName('tempatlahir').Value := txtlahir.Text;
        FieldByName('tgllahir').Value := txttgl.Date;
        FieldByName('agama').Value := ComboBox1.Text;
        if laki.Checked = true then
          FieldByName('jeniskelamin').Value := 'LAKI-LAKI'
        else if perempuan.Checked = true then
          FieldByName('jeniskelamin').Value := 'PEREMPUAN';
        FieldByName('alamat').Value := txtalmt.Text;
        FieldByName('nohp').Value := txthp.Text;
        Post;
        Application.MessageBox('sukses tersimpan', '.::::pesan::::.',
          MB_ICONINFORMATION);
        bersih;
        taktif;
      end;
    end
    else
      Application.MessageBox('lengkapi datanya', '.::::pesan::::.',MB_ICONWARNING);
  end;

  end;

  procedure TForm2.Button2Click(Sender: TObject);
  begin
    if Button2.Caption = 'Edit' then
    Begin
      Button2.Caption := 'update';
      aktif;
      Button1.Enabled := false;
      Hapus.Enabled := false;
      Button3.Enabled := false;
      txtnim.SetFocus;
    end
    Else
    begin
      with dm.ADO_Mhs do
      begin
        Edit;
        FieldByName('idcard').Value := txtidCard.Text;
        FieldByName('nim').Value := txtnim.Text;
        FieldByName('nama').Value := txtnama.Text;
        FieldByName('jurusan').Value := cmbjurusan.Text;
        FieldByName('programstudi').Value := cmbprogramstudi.Text;
        FieldByName('kelas').Value := cmbkelas.Text;
        FieldByName('tempatlahir').Value := txtlahir.Text;
        FieldByName('tgllahir').Value := txttgl.Date;
        FieldByName('agama').Value := ComboBox1.Text;
        if laki.Checked = true then
          FieldByName('jeniskelamin').Value := 'LAKI-LAKI'
        else if perempuan.Checked = true then
          FieldByName('jeniskelamin').Value := 'PEREMPUAN';
        FieldByName('alamat').Value := txtalmt.Text;
        FieldByName('nohp').Value := txthp.Text;
        Post;
      end;

      Application.MessageBox('Data berhasil diUpdate', '.::::Info Update::::.',
        MB_ICONINFORMATION);
      Button2.Caption := 'Edit';
      bersih;
      taktif;
      Button3.Enabled := true;
    End;
  end;

  procedure TForm2.Button3Click(Sender: TObject);
  begin
    aktif;
    Button2.Enabled := false;
    Hapus.Enabled := false;
  end;

  procedure TForm2.Button4Click(Sender: TObject);
  begin
    close;
    // with dm.ADO_Mhs do
    // begin
    // SQL.Clear;
    // SQL.Add('select * from tbmahasiswa where nim = '+txtcari.Text);
    // Open;
    // end
  end;

  procedure TForm2.cmbjurusanChange(Sender: TObject);
  begin
    cmbprogramstudi.Clear;
    pilih_jurusan;
  end;

  procedure TForm2.cmbkelasDropDown(Sender: TObject);
  begin
    cmbkelas.Clear;
    with dm.ADO_jadwal do
    begin
      sql.Clear;
      sql.Add('select * from tbkelas');
      Open;
      while not Eof do
      begin
        cmbkelas.Items.Add(FieldByName('kelas').Value);
        Next;
      end;
    end;
  end;

  procedure TForm2.cmbprogramstudiExit(Sender: TObject);
  begin
    if cmbjurusan.Text = '' then
      Application.MessageBox('tidak boleh kosong', '.::::info::::.',
        MB_ICONINFORMATION);
  end;

  procedure TForm2.DBGrid1CellClick(Column: TColumn);
  begin
    With dm.ADO_Mhs do
    Begin
      txtidCard.Text := FieldValues['idcard'];
      txtnim.Text := FieldValues['nim'];
      txtnama.Text := FieldValues['nama'];
      cmbjurusan.Text := FieldValues['jurusan'];
      cmbprogramstudi.Text := FieldValues['programstudi'];
      cmbkelas.Text := FieldValues['kelas'];
      txtlahir.Text := FieldValues['tempatlahir'];
      txttgl.Date := FieldValues['tgllahir'];
      ComboBox1.Text := FieldValues['agama'];
      If (FieldValues['jeniskelamin']) = 'LAKI-LAKI' then
        laki.Checked := true
      else
        perempuan.Checked := true;
      txtalmt.Text := FieldValues['alamat'];
      txthp.Text := FieldValues['nohp'];
    End;
    Button2.Enabled := true;
    Hapus.Enabled := true;
    Button3.Enabled := false;
  end;

  procedure TForm2.FormCreate(Sender: TObject);
  begin
    bersih;
    taktif;
  end;

  procedure TForm2.HapusClick(Sender: TObject);
  begin
    with dm.ADO_Mhs do
    begin
      Delete;
    end;
    Application.MessageBox('Data berhasil dihapus', 'Hapus',
      MB_ICONINFORMATION);
    bersih;
    taktif;
    Button3.Enabled := true;

  end;

  procedure TForm2.batalClick(Sender: TObject);
  begin
    bersih;
    taktif;
    Button3.Enabled := true;
  end;

  procedure TForm2.pilih_jurusan;
  begin

    // cmbjurusan.Clear;
    if cmbjurusan.Text = 'TEKNIK SIPIL' then
    begin
      cmbprogramstudi.Items.Add('KONSTRUKSI GEDUNG');
      cmbprogramstudi.Items.Add('KONSTRUKSI SIPIL');

      // cmbprogramstudi.Clear;
    end
    else if cmbjurusan.Text = 'TEKNIK ELEKTRO' then
    begin
      cmbprogramstudi.Items.Add('TEKNIK LISTRIK');
      cmbprogramstudi.Items.Add('TEKNIK TELEKOMUNIKASI');
      cmbprogramstudi.Items.Add('TEKNIK ELEKTRONIKA');
      cmbprogramstudi.Items.Add('TEKNIK KOMPUTER JARINGAN');
    end
    else if cmbjurusan.Text = 'TEKNIK KIMIA' then
    begin
      cmbprogramstudi.Items.Add('TEKNIK KIMIA');
      cmbjurusan.Items.Add('TEKNOLOGI KIMIA INDUSTRI');
    end
    else if cmbjurusan.Text = 'TEKNIK MESIN' then
    begin
      cmbprogramstudi.Items.Add('TEKNIK MESIN');
      cmbprogramstudi.Items.Add('TEKNIK KONVER ENERGI');
    end
    else if cmbjurusan.Text = 'ADMINISTRASI NIAGA' then
    begin
      cmbprogramstudi.Items.Add('ADMINISTRASI BISNIS');
      cmbprogramstudi.Items.Add('BISNIS EKSPOR-IMPOR');
    end
    else if cmbjurusan.Text = 'AKUNTANSI' then
    begin
      cmbprogramstudi.Items.Add('AKUNTANSI');
      cmbprogramstudi.Items.Add('AKUNTASI MANAJERIAL');
    end

  end;

end.
