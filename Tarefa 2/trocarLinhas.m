function A = trocarLinhas (A, linhaAtual, linhaMaior) 
    linhaAux = A(linhaAtual, : );
    A(linhaAtual, : ) = A(linhaMaior, : );
    A(linhaMaior, : ) = linhaAux;
end