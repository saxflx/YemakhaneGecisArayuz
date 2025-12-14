unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Classes,
  System.JSON, System.IOUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  Vcl.Themes, Vcl.Styles,
  CPort, Unit1;

type
  TForm2 = class(TForm)
    ComPort1: TComPort;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;

    Label1: TLabel;
    Label2: TLabel;
    Label16: TLabel;

    Edit1: TEdit; // Kart ID
    Edit2: TEdit; // İsim
    Edit3: TEdit; // Kişi
    Edit4: TEdit; // Ücret
    Edit5: TEdit; // COM Port

    Button1: TButton;      // Üye ekle
    Button2: TButton;      // Form1 aç
    ButtonTopluSil: TButton;

    TimerJSON: TTimer;
    ListView1: TListView;

    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ButtonTopluSilClick(Sender: TObject);
    procedure TimerJSONTimer(Sender: TObject);
    procedure ComPort1RxChar(Sender: TObject; Count: Integer);
  private
    FLastJsonTime: TDateTime;
    procedure YukleJSON;
    procedure KartIsle(const KartID: string);
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

{ ===================== JSON DOSYA YOLU ===================== }
function JSONDosya: string;
begin
  Result := TPath.Combine(
    ExtractFilePath(ParamStr(0)),
    'veriler.json'
  );
end;

{ ===================== FORM CREATE ===================== }
procedure TForm2.FormCreate(Sender: TObject);
begin
  if TFile.Exists(JSONDosya) then
    FLastJsonTime := TFile.GetLastWriteTime(JSONDosya)
  else
    FLastJsonTime := 0;

  TimerJSON.Interval := 1000;
  TimerJSON.Enabled := True;

  Label16.Caption := 'Karanlık Tema';
  YukleJSON;
end;

{ ===================== COM PORT ===================== }
procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    ComPort1.Port := Edit5.Text;
    ComPort1.BaudRate := br9600;
    ComPort1.Open;
    Label1.Caption := 'Bağlandı';
    Label1.Font.Color := clGreen;
  end
  else
  begin
    ComPort1.Close;
    Label1.Caption := 'Bağlı Değil';
    Label1.Font.Color := clRed;
  end;
end;

{ ===================== TEMA ===================== }
procedure TForm2.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    TStyleManager.TrySetStyle('Windows10 Dark');
    Label16.Caption := 'Aydınlık Tema';
  end
  else
  begin
    TStyleManager.TrySetStyle('Windows10');
    Label16.Caption := 'Karanlık Tema';
  end;
end;

{ ===================== ÜYE EKLE ===================== }
procedure TForm2.Button1Click(Sender: TObject);
var
  Arr: TJSONArray;
  Obj: TJSONObject;
begin
  if TFile.Exists(JSONDosya) then
    Arr := TJSONObject.ParseJSONValue(
      TFile.ReadAllText(JSONDosya, TEncoding.UTF8)
    ) as TJSONArray
  else
    Arr := TJSONArray.Create;

  Obj := TJSONObject.Create;
  Obj.AddPair('ID', TJSONNumber.Create(Arr.Count + 1));
  Obj.AddPair('kart_id', Edit1.Text);
  Obj.AddPair('isim_soyisim', Edit2.Text);
  Obj.AddPair('kisi', Edit3.Text);
  Obj.AddPair('ucret', Edit4.Text);
  Obj.AddPair('bakiye', TJSONNumber.Create(0));
  Obj.AddPair('okutma_miktari', TJSONNumber.Create(0));

  Arr.AddElement(Obj);

  TFile.WriteAllText(JSONDosya, Arr.Format(2), TEncoding.UTF8);
  Arr.Free;

  YukleJSON;
end;

{ ===================== FORM1 AÇ ===================== }
procedure TForm2.Button2Click(Sender: TObject);
begin
  if not Assigned(Form1) then
    Form1 := TForm1.Create(Application);
  Form1.Show;
end;

{ ===================== TOPLU SİL ===================== }
procedure TForm2.ButtonTopluSilClick(Sender: TObject);
var
  Arr: TJSONArray;
  I, J: Integer;
  Obj: TJSONObject;
begin
  if ListView1.SelCount = 0 then Exit;

  Arr := TJSONObject.ParseJSONValue(
    TFile.ReadAllText(JSONDosya, TEncoding.UTF8)
  ) as TJSONArray;

  for I := ListView1.Items.Count - 1 downto 0 do
    if ListView1.Items[I].Selected then
      Arr.Remove(I);

  for J := 0 to Arr.Count - 1 do
  begin
    Obj := Arr.Items[J] as TJSONObject;
    Obj.RemovePair('ID');
    Obj.AddPair('ID', TJSONNumber.Create(J + 1));
  end;

  TFile.WriteAllText(JSONDosya, Arr.Format(2), TEncoding.UTF8);
  Arr.Free;

  YukleJSON;
end;

{ ===================== JSON DEĞİŞİM KONTROL ===================== }
procedure TForm2.TimerJSONTimer(Sender: TObject);
var
  Tm: TDateTime;
begin
  if not TFile.Exists(JSONDosya) then Exit;

  Tm := TFile.GetLastWriteTime(JSONDosya);
  if Tm = FLastJsonTime then Exit;

  FLastJsonTime := Tm;
  YukleJSON;
end;

{ ===================== JSON YÜKLE ===================== }
procedure TForm2.YukleJSON;
var
  Arr: TJSONArray;
  Obj: TJSONObject;
  I: Integer;
  Item: TListItem;
begin
  ListView1.Items.BeginUpdate;
  try
    ListView1.Items.Clear;

    if not TFile.Exists(JSONDosya) then Exit;

    Arr := TJSONObject.ParseJSONValue(
      TFile.ReadAllText(JSONDosya, TEncoding.UTF8)
    ) as TJSONArray;

    for I := 0 to Arr.Count - 1 do
    begin
      Obj := Arr.Items[I] as TJSONObject;
      Item := ListView1.Items.Add;
      Item.Caption := IntToStr(I + 1);
      Item.SubItems.Add(Obj.GetValue('kart_id').Value.Replace('"',''));
      Item.SubItems.Add(Obj.GetValue('isim_soyisim').Value.Replace('"',''));
      Item.SubItems.Add(Obj.GetValue('kisi').Value.Replace('"',''));
      Item.SubItems.Add(Obj.GetValue('ucret').Value.Replace('"',''));
      Item.SubItems.Add(Obj.GetValue('bakiye').Value);
      Item.SubItems.Add(Obj.GetValue('okutma_miktari').Value);
    end;

    Arr.Free;
  finally
    ListView1.Items.EndUpdate;
  end;
end;

{ ===================== SERIAL OKUMA ===================== }
procedure TForm2.ComPort1RxChar(Sender: TObject; Count: Integer);
var
  S: string;
begin
  SetLength(S, Count);
  ComPort1.ReadStr(S, Count);
  S := Trim(S);
  if S <> '' then
    KartIsle(S);
end;

{ ===================== KART İŞLE ===================== }
procedure TForm2.KartIsle(const KartID: string);
var
  Arr: TJSONArray;
  Obj: TJSONObject;
  I: Integer;
begin
  if not TFile.Exists(JSONDosya) then Exit;

  Arr := TJSONObject.ParseJSONValue(
    TFile.ReadAllText(JSONDosya, TEncoding.UTF8)
  ) as TJSONArray;

  for I := 0 to Arr.Count - 1 do
  begin
    Obj := Arr.Items[I] as TJSONObject;
    if Obj.GetValue('kart_id').Value.Replace('"','') <> KartID then Continue;

    Obj.RemovePair('okutma_miktari');
    Obj.AddPair('okutma_miktari',
      TJSONNumber.Create(Obj.GetValue<Integer>('okutma_miktari') + 1));

    ComPort1.WriteStr('ONAY'#10);
    Break;
  end;

  TFile.WriteAllText(JSONDosya, Arr.Format(2), TEncoding.UTF8);
  Arr.Free;
  YukleJSON;
end;

end.

