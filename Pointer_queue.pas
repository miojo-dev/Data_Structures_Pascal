program pointer_queue;

uses crt;

type
    TInfo = integer;
    TNode = ^TElement;
    TElement = record
        data : TInfo;
        next : TNode;
    end;

procedure ReadInfo(var info : TInfo);
begin
    clrscr;
    write('Insert the info: ');
    read(info);
end;

procedure CreateQueue(var queue : TNode);
begin
    queue := nil;
end;

procedure Include(var queue : TNode; info : TInfo)
var aux1, aux2 : TNode;
begin
    new(aux);
    
    if aux = nil then
    begin
        write('Memory full!');
        readkey;
    end
    else if queue = nil then
    begin
        aux^.data := info;
        aux^.next := nil;
        queue := aux;
    end
    else begin
        aux2 := queue;
        
        while aux2^.next <> nil do
        begin
            aux2^ := aux2^.next;
        end;
        
        aux^.data := info;
        aux^.next := nil;
        aux2^.next := aux;
    end;
end;

begin
    
end.
