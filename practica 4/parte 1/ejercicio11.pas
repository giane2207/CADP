{11. El colectivo de fotógrafos ArgenPics desea conocer los gustos de sus seguidores en las redes sociales. Para
ello, para cada una de las 200 fotos publicadas en su página de Facebook, cuenta con la siguiente
información: título de la foto, el autor de la foto, cantidad de Me gusta, cantidad de clics y cantidad de
comentarios de usuarios. Realizar un programa que lea y almacene esta información. Una vez finalizada la
lectura, el programa debe procesar los datos e informar:
a) Título de la foto más vista (la que posee mayor cantidad de clics).
b) Cantidad total de Me gusta recibidas a las fotos cuyo autor es el fotógrafo “Art Vandelay”.
c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}


program eje11p4p1;
const
     dimF= 4; //200 fotos;
     
     nombreFotografo = 'Art Vandelay'; //el nombre de el fotografo de los me gustas :)
type
     rango = 1..dimF;
     
     fotos = record
         titulo: string;
         autor: string;
         likes: integer;
         clics: integer;
         coments: integer;
     end;
     
     vectorFotos = array [rango] of fotos;

procedure Leer (var f: fotos);
begin
     write ('Ingrese titulo de la publicacion: ');
     readln (f.titulo);
     write ('Ingrese el autor: ');
     readln (f.autor);
     write ('Ingrese la cantidad de me gusta de la publicacion: ');
     readln (f.likes);
     write ('Ingrese la cantidad de clics: ');
     readln (f.clics);
     write ('Ingrese la cantidad de comentarios: ');
     readln (f.coments);
     writeln ('');
end;

procedure cargaVector (var v: vectorFotos);
var
     i: integer;
begin 
     for i:= 1 to dimF do begin
         Leer (v[i]);
     end;
end;

{a) Título de la foto más vista (la que posee mayor cantidad de clics).}
procedure FotoMasVista (var maxClics: integer; var tituloMax: string; clics: integer; titulo: string);
begin
     if (clics > maxClics) then begin
         maxClics:= clics;
         tituloMax:= titulo;
     end;
end;

function LikesFotografo (autor: string): boolean;
begin
     LikesFotografo:= autor = nombreFotografo;
end;

{c) Cantidad de comentarios recibidos para cada una de las fotos publicadas en esa página.}
procedure cantComents (comentarios: integer; titulo: string);
begin
     writeln ('La cantidad de comentarios para la foto con titulo: ', titulo, ' es de: ', comentarios, ' comentarios');
end;

procedure Informar (tituloMax: string; cantLikes: integer);
begin
    writeln ('El titulo de la foto mas vista es: ', tituloMax);
    writeln ('La cantidad de me gustas recibidas a las fotos cuyo autor es el fotografo ', nombreFotografo,' es de ', cantLikes, ' me gustas');
end;

procedure Procesar (var maxClics: integer; var tituloMax: string; var cantLikesFotografo: integer; v: vectorFotos);
var 
     i: integer;
begin
     maxClics:= 0;
     cantLikesFotografo:= 0;
     for i:= 1 to dimF do begin
         FotoMasVista(maxClics, tituloMax, v[i].clics, v[i].titulo);
         if (LikesFotografo(v[i].autor)) then begin 
            cantLikesFotografo:= cantLikesFotografo + 1;
         end;
         cantComents (v[i].coments, v[i].titulo);
     end;
end;


var
    tituloMax: string;
    maxClics, cantLikes:integer;
    v: vectorFotos;
begin
     cargaVector (v);
     Procesar (maxClics, tituloMax, cantLikes, v);
     Informar (tituloMax, cantLikes);
end.
