function coef = getCorrelationCoef(First, Second)

Matrix = corrcoef(First, Second);
coef = Matrix(1,2);