unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, Forms, Controls, Graphics, ExtCtrls, ogEditionMot, ogDefObjGraf;

type

  { TMyGraphObject }
  //define el tipo de objeto a dibujar
  TMyGraphObject = class(TObjGraf)
    procedure Draw; override;
  end;

  { TForm1 }

  TForm1 = class(TForm)
    PaintBox1: TPaintBox;   //donde se dibujará
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    motEdi: TEditionMot;  //motor de edición
  end;

var
  Form1: TForm1;

implementation
{$R *.lfm}

procedure TMyGraphObject.Draw;
begin
  v2d.SetText(clBlack, 11,'', true);
  v2d.Texto(X + 2, Y -20, 'Objeto');
  v2d.SetPen(psSolid, 1, clBlack);
  v2d.SetBrush(TColor($D5D5D5));
  v2d.RectangR(x, y, x+width, y+height);
  v2d.Arc(x, y, x+width, y+height, 0, 480);
  inherited;
end;

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var og: TMyGraphObject;
begin
  //crea motor de edición
  motEdi := TEditionMot.Create(PaintBox1);
  //agrega objetos
  og := TMyGraphObject.Create(motEdi.v2d);
  motEdi.AddGraphObject(og);
  og := TMyGraphObject.Create(motEdi.v2d);
  motEdi.AddGraphObject(og);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  motEdi.free;
end;

end.

