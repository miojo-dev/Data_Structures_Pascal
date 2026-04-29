program pointer_queue;

uses crt;

type
    TInfo = integer;
    TNode = ^TElement;
    TElement = record
        data : TInfo;
        next : TNode;
    end;

var option : byte;
    num : TInfo;
    num_queue : TElement;

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

procedure Include(var queue : TNode; info : TInfo);
var aux, aux2 : TNode;
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
            aux2 := aux2^.next;
        end;
        
        aux^.data := info;
        aux^.next := nil;
        aux2^.next := aux;
    end;
end;

procedure Remove(var queue : TNode);
var aux : TNode;
begin
    if queue = nil then
    begin
        write('Memory full!');
        readkey;
    end else
    begin
        aux := queue;
        
        writeln('Element ', aux^.data, ' removed!');
        
        queue := aux^.next;
        dispose(aux);
        
        readkey;
    end;
end;

function CountElements(var queue : TNode) : byte;
var aux : TNode;
    i : byte;
begin
    i := 0;
    
    if queue <> nil then
    begin
        aux := queue;
        
        while aux <> nil do
        begin
            i := i + 1;
            writeln(i, ' - ', aux^.data);
            aux := aux^.next;
        end
    end;
    
    CountElements := i;
end;

begin
    option := 1;
    CreateQueue(num_queue);
    
    while option <> 0 do
    begin
       clrscr;
       writeln ('0 - Exit');
       writeln ('1 - Include');
       writeln ('2 - Remove');
       writeln ('3 - Count elements');
       readln (option);
       writeln;
       
       case option of
        1:
        begin
            ReadInfo(num);
            Include(num_queue, num);
        end;
        
        2:
        begin
            Remove(num_queue);
        end;
        
        3:
        begin
            writeln(CountElements(num_queue), ' elements');
            readkey;
        end;
end.
