program pointer_stack;

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
    num_stack : TElement;

procedure ReadInfo(var info : TInfo);
begin
    clrscr;
    write('Insert the info: ');
    read(info);
end;

procedure CreateStack(var stack : TNode);
begin
    stack := nil;
end;

procedure Include(var stack : TNode; info : TInfo);
var aux, aux2 : TNode;
begin
    new(aux);
    
    if aux = nil then
    begin
        write('Memory full!');
        readkey;
    end
    else if stack = nil then
    begin
        aux^.data := info;
        aux^.next := nil;
        
        stack := aux;
    end
    else begin
        aux^.data := info;
        aux^.next := stack;
        
        stack^.next := aux;
    end;
end;

procedure Remove(var stack : TNode);
var aux : TNode;
begin
    if stack = nil then
    begin
        write('Memory full!');
        readkey;
    end else
    begin
        aux := stack;
        
        writeln('Element ', aux^.data, ' removed!');
        
        stack := aux^.next;
        dispose(aux);
        
        readkey;
    end;
end;

function CountElements(var stack : TNode) : byte;
var aux : TNode;
    i : byte;
begin
    i := 0;
    
    if stack <> nil then
    begin
        aux := stack;
        
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
    CreateStack(num_stack);
    
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
            Include(num_stack, num);
        end;
        
        2:
        begin
            Remove(num_stack);
        end;
        
        3:
        begin
            writeln(CountElements(num_stack), ' elements');
            readkey;
        end;
end.
