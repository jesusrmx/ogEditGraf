{                                frameVisCplex
Este Frame será usado para colocar nuestro editor gráfico. Requiere un objeto TPaintBox,
como salida gráfica. Para que funcione como editor de objetos gráficos, debe crearse una
instancia de "TEditionMot" y darle la referencia del PaintBox.
Aquí también se deben poner las rutinas que permiten agregar los diversos objetos
gráficos con los que trabajará nuestra aplicación.

                                              Por Tito Hinostroza  11/05/2014
}
unit frameEditor;
{$mode objfpc}{$H+}
interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, Graphics, GraphType, lclType,
  dialogs, lclProc, ObjGraficos, ogEditionMot;

type

  { TfraEditor }

  TfraEditor = class(TFrame)
  published
    PaintBox1: TPaintBox;
  public
    function AgregaObjeto: TMyGraphObject;
  private
    motEdi: TEditionMot;  //motor de edición
  public
    constructor Create(AOwner: TComponent) ; override;
    destructor Destroy; override;
  end;

implementation
{$R *.lfm}

function TfraEditor.AgregaObjeto: TMyGraphObject;
//Agrega un objeto de tipo TMyGraphObject al editor.
var o: TMyGraphObject;
begin
  o := TMyGraphObject.Create(motEdi.v2d);
  motEdi.AddGraphObject(o);
  Result := o;
end;

constructor TfraEditor.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  motEdi := TEditionMot.Create(PaintBox1);
end;

destructor TfraEditor.Destroy;
begin
  motEdi.Destroy;
  inherited;
end;

end.

